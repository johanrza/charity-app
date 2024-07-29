@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Campaign Donasi ({{ $cause_single->name }})</h1>
                <div>
                    <a href="{{ route('admin_cause_index') }}" class="btn btn-primary"><i class="fas fa-table"></i> Lihat
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
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @php
                                                $total_price = 0;
                                            @endphp
                                            @foreach ($donations as $item)
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
                                                        @rupiah($item->price)
                                                    </td>
                                                    <td style="width:140px;">
                                                        <a href="{{ route('admin_cause_donor_invoice', $item->id) }}"
                                                            class="btn btn-primary btn-sm">Lihat Invoice</a>
                                                    </td>
                                                </tr>
                                                @php
                                                    $total_price += $item->price;
                                                @endphp
                                            @endforeach
                                            <tr>
                                                <td colspan="3" style="text-align:right;">
                                                    <h5>Total Donasi:</h5>
                                                </td>
                                                <td>
                                                    <h5>@rupiah($total_price)</h5>
                                                </td>
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
