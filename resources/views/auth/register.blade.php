@extends('front.layouts.app')

@section('main_content')
    <div class="page-top" style="background-image: url('uploads/banner.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Buat Akun</h2>
                    <div class="breadcrumb-container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Beranda</a></li>
                            <li class="breadcrumb-item active">Buat Akun</li>
                        </ol>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="page-content pt_70 pb_70">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-xl-4 col-lg-5 col-md-6 col-sm-12">
                    <form method="POST" action="{{ route('register') }}">
                        @csrf
                        <div class="login-form">
                            <div class="mb-3">
                                <label for="" class="form-label">Nama *</label>
                                <input type="text" class="form-control" name="name" autocomplete="off">
                            </div>
                            <div class="mb-3">
                                <label for="" class="form-label">Alamat Email *</label>
                                <input type="text" class="form-control" name="email" autocomplete="off">
                            </div>
                            <div class="mb-3">
                                <label for="" class="form-label">Password *</label>
                                <input type="password" class="form-control" name="password">
                            </div>
                            <div class="mb-3">
                                <label for="" class="form-label">Konfirmasi Password *</label>
                                <input type="password" class="form-control" name="password_confirmation">
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary bg-website">
                                    Buat Akun
                                </button>
                            </div>
                            <div class="mb-3">
                                <a href="{{ route('login') }}" class="primary-color">Sudah punya akun? Login Sekarang</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
