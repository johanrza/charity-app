<?php

namespace App\Http\Controllers\Front;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cause;
use App\Models\CausePhoto;
use App\Models\CauseVideo;
use App\Models\CauseFaq;
use App\Models\CauseDonation;
use App\Models\Admin;
use App\Mail\Websitemail;
use App\Models\User;
use Auth;
use Illuminate\Support\Facades\URL;
use Midtrans\Config;
use Midtrans\Snap;
use Midtrans\Transaction;
use Srmklive\PayPal\Services\PayPal as PayPalClient;

class CauseController extends Controller
{
    public function index()
    {
        $causes = Cause::get();
        return view('front.causes', compact('causes'));
    }

    public function detail($slug)
    {
        $cause = Cause::where('slug', $slug)->first();
        $cause_photos = CausePhoto::where('cause_id', $cause->id)->get();
        $cause_videos = CauseVideo::where('cause_id', $cause->id)->get();
        // $cause_donation = CauseDonation::where('cause_id', $cause->id)->get();
        $cause_faqs = CauseFaq::where('cause_id', $cause->id)->get();
        $recent_causes = Cause::orderBy('id', 'desc')->take(5)->get();
        return view('front.cause', compact('cause', 'cause_photos', 'cause_videos', 'cause_faqs', 'recent_causes'));
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

        $cause_data = Cause::where('id', $request->cause_id)->first();

        $subject = "Message from visitor for Cause - " . $cause_data->name;
        $message = "<b>Visitor Information:</b><br><br>";
        $message .= "Name: " . $request->name . "<br>";
        $message .= "Email: " . $request->email . "<br>";
        $message .= "Phone: " . $request->phone . "<br>";
        $message .= "Message: " . $request->message . "<br><br>";
        $message .= "<b>Cause Page URL: </b><br>";
        $message .= "<a href='" . url('/cause/' . $cause_data->slug) . "'>" . url('/cause/' . $cause_data->slug) . "</a>";

        \Mail::to($admin_email)->send(new Websitemail($subject, $message));

        return redirect()->back()->with('success', 'Message sent successfully');
    }

    public function payment(Request $request)
    {
        // dd($request->all());
        if (!auth()->user()) {
            return redirect()->route('login');
        }

        $request->validate([
            'price' => ['required', 'numeric', 'min:1'],
            // 'payment_method' => 'required'
        ]);

        $orderId = 'cause' . '-' . uniqid();

        $cause_data = Cause::where('id', $request->cause_id)->first();
        $needed_amount = $cause_data->goal - $cause_data->raised;

        if ($request->price > $needed_amount) {
            return json_encode(['failed' => 'You can not donate more than needed amount']);
        }

        $params = array(
            'transaction_details' => array(
                'order_id' => $orderId,
                'gross_amount' => $request->price,
            ),
            'item_details' => array(
                array(
                    "id" => (string) $cause_data->id,
                    "price" => $request->price,
                    "quantity" => 1,
                    "name" => (string) $cause_data->name,
                    // "brand" => "Midtrans",
                    "category" => "Donations",
                    "merchant_name" => "Laskar Amal",
                    "url" => URL::to('/') . "cause/$cause_data->slug",
                ),
            ),
            'customer_details' => array(
                'first_name' => auth()->user()->name,
                'email' => auth()->user()->email,
            ),
        );

        $snapToken = Snap::getSnapToken($params);
        // \Session::flash('snap_token', $snapToken);
        return json_encode(["snap_token" => $snapToken, 'cause_id' => $request->cause_id]);
    }

    public function handle_payment($cause_id, $order_id)
    {
        // TODO: notif handler (baca di notion)

        $response = (object) Transaction::status($order_id);
        try {
            if (isset($response->status_code) && $response->status_code === '200') {
                CauseDonation::create([
                    'user_id' => auth()->user()->id,
                    'cause_id' => $cause_id,
                    'price' => $response->gross_amount,
                    'currency' => $response->currency,
                    'payment_id' => $response->order_id,
                    'payment_method' => $response->payment_type,
                    'payment_status' => ($response->transaction_status == 'settlement') ? 'COMPLETED' : $response->transaction_status,
                ]);

                $cause_data = Cause::where('id', $cause_id)->first();
                $cause_data->raised = $cause_data->raised + $response->gross_amount;
                $cause_data->update();
            }

            $subject = "PEMBAYARAN DONASI BERHASIL";
            $message = "Pembayaran senilai " . $response->gross_amount . " diterima, tanggal " . $response->transaction_time . ". Pada Campaign " . '<a href="' . url('/cause/' . $cause_data->slug) . '">' . $cause_data->name . '</a>' . ". Terima kasih";
            \Mail::to(auth()->user()->email)->send(new Websitemail($subject, $message));

            // if (isset($response->status_code) && $response->status_code === '200') {
            // }
        } catch (\Throwable $th) {
            throw $th;
        }
    }

    public function cancel(Request $request)
    {
        $order_id = $request->order_id;
        Transaction::cancel($order_id);
    }
}
