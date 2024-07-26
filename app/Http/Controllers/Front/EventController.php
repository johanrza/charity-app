<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Event;
use App\Models\EventPhoto;
use App\Models\EventVideo;
use App\Models\Admin;
use App\Mail\Websitemail;
use Illuminate\Support\Facades\URL;
use Midtrans\Snap;
use Midtrans\Transaction;
use Srmklive\PayPal\Services\PayPal as PayPalClient;
use App\Models\EventTicket;
use App\Models\User;
use Auth;

class EventController extends Controller
{
    public function index()
    {
        $events = Event::all();
        return view('front.events', compact('events'));
    }

    public function detail($slug)
    {
        $event = Event::where('slug', $slug)->first();
        $event_photos = EventPhoto::where('event_id', $event->id)->get();
        $event_videos = EventVideo::where('event_id', $event->id)->get();
        $recent_events = Event::orderBy('id', 'desc')->take(5)->get();
        return view('front.event', compact('event', 'event_photos', 'event_videos', 'recent_events'));
    }

    public function send_message(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'message' => 'required'
        ]);

        $admin_data = Admin::where('id', 1)->first();
        $admin_email = $admin_data->email;

        $event_data = Event::where('id', $request->event_id)->first();

        $subject = "Message from visitor for Event - " . $event_data->name;
        $message = "<b>Visitor Information:</b><br><br>";
        $message .= "Name: " . $request->name . "<br>";
        $message .= "Email: " . $request->email . "<br>";
        $message .= "Phone: " . $request->phone . "<br>";
        $message .= "Message: " . $request->message . "<br><br>";
        $message .= "<b>Event Page URL: </b><br>";
        $message .= "<a href='" . url('/event/' . $event_data->slug) . "'>" . url('/event/' . $event_data->slug) . "</a>";

        \Mail::to($admin_email)->send(new Websitemail($subject, $message));

        return redirect()->back()->with('success', 'Message sent successfully');
    }

    public function payment(Request $request)
    {

        if (!auth()->user()) {
            return redirect()->route('login');
        }

        $request->validate([
            'number_of_tickets' => 'required',
            // 'payment_method' => 'required'
        ]);

        $orderId = 'event' . '-' . uniqid();

        $event_data = Event::where('id', $request->event_id)->first();

        if ($event_data->total_seat > 0) {
            $remaining_seat = $event_data->total_seat - $event_data->booked_seat;
            if ($event_data->booked_seat + $request->number_of_tickets > $event_data->total_seat) {
                return json_encode(['failed' => 'Sorry, only ' . $remaining_seat . ' tickets/seats are available']);
            }
        }

        $total_price = $request->number_of_tickets * $request->unit_price;

        $params = array(
            'transaction_details' => array(
                'order_id' => $orderId,
                'gross_amount' => $total_price,
            ),
            'item_details' => array(
                array(
                    "id" => (string) $event_data->id,
                    "price" => $request->unit_price,
                    "quantity" => $request->number_of_tickets,
                    "name" => (string) $event_data->name,
                    // "brand" => "Midtrans",
                    "category" => "Events",
                    "merchant_name" => "Laskar Amal",
                    "url" => URL::to('/') . "event/$event_data->slug",
                ),
            ),
            'customer_details' => array(
                'first_name' => auth()->user()->name,
                'email' => auth()->user()->email,
            ),
        );

        // return json_encode($params);

        $snapToken = Snap::getSnapToken($params);
        // \Session::flash('snap_token', $snapToken);
        return json_encode(
            [
                "snap_token" => $snapToken,
                'event_id' => $request->event_id,
                'unit_price' => $request->unit_price,
                'number_of_tickets' => $request->number_of_tickets
            ]
        );
    }

    function handle_payment($event_id, $order_id, $unit_price, $number_of_tickets)
    {
        // var_dump($event_id, $order_id, $unit_price, $number_of_tickets);


        $response = (object) Transaction::status($order_id);

        try {
            if (isset($response->status_code) && $response->status_code === '200') {
                EventTicket::create([
                    'event_id' => $event_id,
                    'user_id' => auth()->user()->id,
                    'unit_price' => $unit_price,
                    'number_of_tickets' => $number_of_tickets,
                    'total_price' => $response->gross_amount,
                    'currency' => $response->currency,
                    'payment_id' => $response->order_id,
                    'payment_method' => $response->payment_type,
                    'payment_status' => ($response->transaction_status == 'settlement') ? 'COMPLETED' : $response->transaction_status,
                ]);

                $event_data = Event::where('id', $event_id)->first();
                $event_data->booked_seat = $event_data->booked_seat + $number_of_tickets;
                $event_data->update();
            }
        } catch (\Throwable $th) {
            throw $th;
        }

    }

    public function free_booking(Request $request)
    {
        if (!auth()->user()) {
            return redirect()->route('login');
        }

        $request->validate([
            'number_of_tickets' => 'required'
        ]);

        $event_data = Event::where('id', $request->event_id)->first();

        if ($event_data->total_seat > 0) {
            $remaining_seat = $event_data->total_seat - $event_data->booked_seat;
            if ($event_data->booked_seat + $request->number_of_tickets > $event_data->total_seat) {
                return redirect()->back()->with('error', 'Sorry, only ' . $remaining_seat . ' tickets/seats are available');
            }
        }

        $total_price = $request->number_of_tickets * $request->unit_price;

        // Insert data into database
        $obj = new EventTicket;
        $obj->event_id = $request->event_id;
        $obj->user_id = auth()->user()->id;
        $obj->unit_price = $request->unit_price;
        $obj->number_of_tickets = $request->number_of_tickets;
        $obj->total_price = $total_price;
        $obj->currency = "";
        $obj->payment_id = "Free";
        $obj->payment_method = "Free";
        $obj->payment_status = "COMPLETED";
        $obj->save();

        $event_data = Event::where('id', $request->event_id)->first();
        $event_data->booked_seat = $event_data->booked_seat + $request->number_of_tickets;
        $event_data->update();

        return redirect()->route('event', $event_data->slug)->with('success', 'Booking completed successfully');

    }

    public function cancel(Request $request)
    {
        $order_id = $request->order_id;
        Transaction::cancel($order_id);
    }
}
