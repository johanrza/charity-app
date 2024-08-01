@extends('front.layouts.app')

@section('main_content')
    <div class="page-top" style="background-image: url({{ asset('uploads/' . $global_setting_data->banner) }})">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Acara</h2>
                    <div class="breadcrumb-container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Beranda</a></li>
                            <li class="breadcrumb-item active">Acara</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="event pt_70">
        <div class="container">
            <div class="row">

                @foreach ($events as $item)
                    <div class="col-lg-4 col-md-6">
                        <div class="item pb_70">
                            <div class="photo">
                                <img src="{{ asset('uploads/' . $item->featured_photo) }}" alt="">
                            </div>
                            <div class="text">
                                <h2>
                                    <a href="{{ route('event', $item->slug) }}">{{ $item->name }}</a>
                                </h2>
                                <div class="date-time">
                                    <i class="fas fa-calendar-alt"></i>
                                    {{-- @php
                                        $date = \Carbon\Carbon::parse($item->date)->format('j M Y');
                                        $time = \Carbon\Carbon::parse($item->time)->format('H:i');
                                    @endphp
                                    {{ $date }}, {{ $time }} WIB --}}
                                    @dateIndoComplete($item->date), @timeIndoComplete($item->time) WIB
                                </div>
                                <div class="short-des">
                                    <p>
                                        {!! nl2br($item->short_description) !!}
                                    </p>
                                </div>
                                <div class="button-style-2">
                                    <a href="{{ route('event', $item->slug) }}">Selengkapnya <i
                                            class="fas fa-long-arrow-alt-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach

            </div>
        </div>
    </div>
@endsection
