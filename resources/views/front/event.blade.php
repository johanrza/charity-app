@extends('front.layouts.app')

@section('main_content')
    <div class="page-top" style="background-image: url({{ asset('uploads/' . $global_setting_data->banner) }})">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>{{ $event->name }}</h2>
                    <div class="breadcrumb-container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Beranda</a></li>
                            <li class="breadcrumb-item"><a href="{{ route('events') }}">Acara</a></li>
                            <li class="breadcrumb-item active">{{ $event->name }}</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="event-detail pt_50 pb_50">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-md-12">
                    <div class="left-item">
                        <div class="main-photo">
                            <img src="{{ asset('uploads/' . $event->featured_photo) }}" alt="">
                        </div>
                        <h2>
                            Deskripsi
                        </h2>
                        {!! $event->description !!}
                    </div>
                    <div class="left-item">
                        <h2>
                            Photos
                        </h2>
                        <div class="photo-all">
                            <div class="row">
                                @foreach ($event_photos as $item)
                                    <div class="col-md-6 col-lg-4">
                                        <div class="item">
                                            <a href="{{ asset('uploads/' . $item->photo) }}" class="magnific">
                                                <img src="{{ asset('uploads/' . $item->photo) }}" alt="" />
                                                <div class="icon">
                                                    <i class="fas fa-plus"></i>
                                                </div>
                                                <div class="bg"></div>
                                            </a>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                    <div class="left-item">
                        <h2>
                            Video
                        </h2>
                        <div class="video-all">
                            <div class="row">
                                @foreach ($event_videos as $item)
                                    <div class="col-md-6 col-lg-4">
                                        <div class="item">
                                            <a class="video-button"
                                                href="http://www.youtube.com/watch?v={{ $item->youtube_video_id }}">
                                                <img src="http://img.youtube.com/vi/{{ $item->youtube_video_id }}/0.jpg"
                                                    alt="" />
                                                <div class="icon">
                                                    <i class="far fa-play-circle"></i>
                                                </div>
                                                <div class="bg"></div>
                                            </a>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>

                </div>
                <div class="col-lg-4 col-md-12">

                    <div class="right-item">

                        @php
                            $current_timestamp = strtotime(date('Y-m-d H:i'));
                            $event_timestamp = strtotime($event->date . ' ' . $event->time);
                        @endphp

                        @if ($event_timestamp > $current_timestamp)
                            <div class="countdown show" data-Date='{{ $event->date }} {{ $event->time }}'>
                                <div class="boxes running">
                                    <div class="box">
                                        <div class="num">
                                            <timer><span class="days"></span></timer>
                                        </div>
                                        <div class="name">Hari</div>
                                    </div>
                                    <div class="box">
                                        <div class="num">
                                            <timer><span class="hours"></span></timer>
                                        </div>
                                        <div class="name">Jam</div>
                                    </div>
                                    <div class="box">
                                        <div class="num">
                                            <timer><span class="minutes"></span></timer>
                                        </div>
                                        <div class="name">Menit</div>
                                    </div>
                                    <div class="box">
                                        <div class="num">
                                            <timer><span class="seconds"></span></timer>
                                        </div>
                                        <div class="name">Detik</div>
                                    </div>
                                </div>
                            </div>
                        @else
                            <div class="text-danger"><b>Event Telah Selesai!</b></div>
                        @endif

                        <h2 class="mt_30">Informasi Acara</h2>
                        <div class="summary">
                            <div class="table-responsive">
                                <table class="table table-bordered">


                                    @if ($event->price != 0)
                                        <tr>
                                            <td><b>Harga Tiket</b></td>
                                            <td class="price">@rupiah($event->price)</td>
                                        </tr>
                                    @endif

                                    @if ($event->price == 0)
                                        <tr>
                                            <td><b>Harga Tiket</b></td>
                                            <td class="price">Gratis</td>
                                        </tr>
                                    @endif


                                    <tr>
                                        <td><b>Lokasi</b></td>
                                        <td>{{ $event->location }}</td>
                                    </tr>
                                    <tr>
                                        <td><b>Tanggal</b></td>
                                        <td>@dateIndoComplete($event->date)</td>
                                    </tr>
                                    <tr>
                                        <td><b>Waktu</b></td>
                                        <td>@timeIndoComplete($event->time)</td>
                                    </tr>


                                    @if ($event->total_seat != 0)
                                        <tr>
                                            <td><b>Total Kursi</b></td>
                                            <td>{{ $event->total_seat }}</td>
                                        </tr>
                                        <tr>
                                            <td><b>Booked</b></td>
                                            <td>
                                                @if ($event->booked_seat == '')
                                                    0
                                                @else
                                                    {{ $event->booked_seat }}
                                                @endif
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Tersisa</b></td>
                                            <td>
                                                @php
                                                    $remaining = $event->total_seat - $event->booked_seat;
                                                @endphp
                                                {{ $remaining }}
                                            </td>
                                        </tr>
                                        <tr>
                                            <td><b>Di Pesan</b></td>
                                            <td>
                                                @if ($event->booked_seat == '')
                                                    0
                                                @else
                                                    {{ $event->booked_seat }}
                                                @endif
                                            </td>
                                        </tr>
                                    @endif

                                </table>
                            </div>
                        </div>

                        @if ($event_timestamp > $current_timestamp)
                            @if ($event->price != 0)
                                <h2 class="mt_30">Beli Tiket</h2>
                                <div class="pay-sec">
                                    <form action="{{ route('event_ticket_payment') }}" method="POST" id="form-pay-event">
                                        @csrf
                                        <input type="hidden" name="unit_price" value="{{ $event->price }}">
                                        <input type="hidden" name="event_id" value="{{ $event->id }}">
                                        <select name="number_of_tickets" class="form-select mb_15">
                                            <option value="">Beli berapa tiket?</option>
                                            @for ($i = 1; $i <= 5; $i++)
                                                <option value="{{ $i }}">{{ $i }}</option>
                                            @endfor
                                        </select>
                                        <button type="submit" class="btn btn-primary w-100-p pay-now mt-0"
                                            id="pay-button-event">
                                            Bayar Sekarang
                                        </button>
                                        <button class="btn btn-primary w-100-p pay-now d-none mt-0" type="button"
                                            id="btn-loading-event" disabled>
                                            <span class="spinner-border spinner-border-sm" aria-hidden="true"></span>
                                            <span role="status">Loading...</span>
                                        </button>
                                        {{-- <button type="submit" class="btn btn-primary w-100-p pay-now">Bayar</button> --}}
                                    </form>
                                </div>
                            @endif

                            @if ($event->price == 0)
                                <h2 class="mt_30 d-none">Pesan Gratis</h2>
                                <div class="pay-sec d-none">
                                    <form action="{{ route('event_ticket_free_booking') }}" method="post">
                                        @csrf
                                        <input type="hidden" name="unit_price" value="{{ $event->price }}">
                                        <input type="hidden" name="event_id" value="{{ $event->id }}">
                                        <select name="number_of_tickets" class="form-select mb_15">
                                            <option value="number_of_tickets">Beli berapa tiket?</option>
                                            @for ($i = 1; $i <= 5; $i++)
                                                <option value="{{ $i }}">{{ $i }}</option>
                                            @endfor
                                        </select>
                                        <button type="submit" class="btn btn-primary w-100-p pay-now">Bayar
                                            Sekerang</button>
                                    </form>
                                </div>
                            @endif
                        @endif

                        @if ($event->map != null)
                            <h2 class="mt_30">Peta Lokasi Acara</h2>
                            <div class="location-map">
                                {!! $event->map !!}
                            </div>
                        @endif


                        <h2 class="mt_30">Event Terkini</h2>
                        <ul>
                            @foreach ($recent_events as $item)
                                <li><a href="{{ route('event', $item->slug) }}"><i class="fas fa-angle-right"></i>
                                        {{ $item->name }}</a></li>
                            @endforeach
                        </ul>

                        <h2 class="mt_30">Kritik dan Saran</h2>
                        <div class="enquery-form">
                            <form action="{{ route('event_send_message') }}" method="post">
                                @csrf
                                <input type="hidden" name="event_id" value="{{ $event->id }}">
                                <div class="mb-3">
                                    <input name="name" type="text" class="form-control" placeholder="Nama"
                                        required>
                                </div>
                                <div class="mb-3">
                                    <input name="email" type="email" class="form-control" placeholder="Alamat Email"
                                        required>
                                </div>
                                <div class="mb-3">
                                    <input name="phone" type="text" class="form-control"
                                        placeholder="Nomor Telepon (Opsional)">
                                </div>
                                <div class="mb-3">
                                    <textarea name="message" class="form-control h-150" rows="3" placeholder="Pesan" required></textarea>
                                </div>
                                <div class="mb-3">
                                    <button type="submit" class="btn btn-primary">
                                        Kirim Pesan <i class="fas fa-long-arrow-alt-right"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
    <script>
        $(document).ready(function() {
            $('iframe').width(355).height(300);
        })
    </script>
@endsection
