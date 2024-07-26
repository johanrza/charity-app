@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Tiket Event ({{ $event_single->name }})</h1>
                <div>
                    <a href="{{ route('admin_event_index') }}" class="btn btn-primary"><i class="fas fa-table"></i> Lihat
                        Semua</a>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>User</th>
                                                <th>Id Pembayaran</th>
                                                <th>Harga</th>
                                                <th>Jumlah Tiket</th>
                                                <th>Total Harga</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @php
                                                $total_tickets = 0;
                                                $total_price = 0;
                                            @endphp
                                            @foreach ($event_tickets as $item)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>
                                                        @php
                                                            $user = App\Models\User::find($item->user_id);
                                                        @endphp
                                                        {{ $user->name }}<br>
                                                        {{ $user->email }}
                                                    </td>
                                                    <td>
                                                        @php
                                                            $original_text = $item->payment_id;
                                                            $max_length = 40;
                                                            if (strlen($original_text) > $max_length) {
                                                                $line1 = substr($original_text, 0, $max_length);
                                                                $line2 = substr($original_text, $max_length);
                                                            } else {
                                                                $line1 = $original_text;
                                                                $line2 = '';
                                                            }
                                                            echo $line1 . '<br>' . $line2;
                                                        @endphp
                                                    </td>
                                                    <td>
                                                        Rp{{ $item->unit_price }}
                                                    </td>
                                                    <td>
                                                        {{ $item->number_of_tickets }}
                                                    </td>
                                                    <td>
                                                        Rp{{ $item->total_price }}
                                                    </td>
                                                    <td style="width:140px;">
                                                        <a href="{{ route('admin_event_ticket_invoice', $item->id) }}"
                                                            class="btn btn-primary btn-sm">Lihat Invoice</a>
                                                    </td>
                                                </tr>
                                                @php
                                                    $total_tickets += $item->number_of_tickets;
                                                    $total_price += $item->total_price;
                                                @endphp
                                            @endforeach
                                            <tr>
                                                <td colspan="4" style="text-align:right">
                                                    <h5>Total Tickets</h5>
                                                </td>
                                                <td>
                                                    <h5>{{ $total_tickets }}</h5>
                                                </td>
                                                <td>
                                                    <h5>Rp{{ $total_price }}</h5>
                                                </td>
                                                <td></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
