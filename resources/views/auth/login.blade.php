@extends('front.layouts.app')

@section('main_content')
    <div class="page-top" style="background-image: url('uploads/banner.jpg')">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h2>Login</h2>
                    <div class="breadcrumb-container">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="{{ route('home') }}">Beranda</a></li>
                            <li class="breadcrumb-item active">Login</li>
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
                    <form action="{{ route('login') }}" method="post">
                        @csrf
                        <div class="login-form">
                            <div class="mb-3">
                                <label for="" class="form-label">Alamat Email</label>
                                <input type="text" class="form-control" name="email" autocomplete="off">
                            </div>
                            <div class="mb-3">
                                <label for="" class="form-label">Password</label>
                                <input type="password" class="form-control" name="password">
                            </div>
                            <div class="mb-3">
                                <button type="submit" class="btn btn-primary bg-website">
                                    Login
                                </button>
                                <a href="{{ route('password.request') }}" class="primary-color">Lupa Password?</a>
                            </div>
                            <div class="mb-3">
                                <a href="{{ route('register') }}" class="primary-color">Belum punya akun? Daftar
                                    Sekarang</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
