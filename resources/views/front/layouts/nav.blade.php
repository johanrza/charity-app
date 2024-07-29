<div class="navbar-area" id="stickymenu">
    <!-- Menu For Mobile Device -->
    <div class="mobile-nav">
        <a href="{{ route('home') }}" class="logo">
            <img src="{{ asset('uploads/' . $global_setting_data->logo) }}" alt="">
        </a>
    </div>

    <!-- Menu For Desktop Device -->
    <div class="main-nav">
        <div class="container">
            <nav class="navbar navbar-expand-md navbar-light">
                <a class="navbar-brand" href="{{ route('home') }}">
                    <img src="{{ asset('uploads/' . $global_setting_data->logo) }}" alt="">
                </a>
                <div class="collapse navbar-collapse mean-menu" id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item {{ Request::is('/') ? 'active' : '' }}">
                            <a href="{{ route('home') }}" class="nav-link">Beranda</a>
                        </li>
                        <li class="nav-item {{ Request::is('about') ? 'active' : '' }}">
                            <a href="{{ route('about') }}" class="nav-link">Tentang</a>
                        </li>
                        <li class="nav-item {{ Request::is('causes') ? 'active' : '' }}">
                            <a href="{{ route('causes') }}" class="nav-link">Donasi</a>
                        </li>
                        <li class="nav-item {{ Request::is('events') ? 'active' : '' }}">
                            <a href="{{ route('events') }}" class="nav-link">Acara</a>
                        </li>
                        <li class="nav-item {{ Request::is('volunteers') ? 'active' : '' }}">
                            <a href="{{ route('volunteers') }}" class="nav-link">Relawan</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="javascript:void;" id="galleryDropdown"
                                role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                Galeri
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="galleryDropdown">
                                <li><a class="dropdown-item" href="{{ route('photo_gallery') }}">Galeri Foto</a></li>
                                <li><a class="dropdown-item" href="{{ route('video_gallery') }}">Galeri Video</a></li>
                            </ul>
                        </li>
                        <li class="nav-item {{ Request::is('faqs') ? 'active' : '' }}">
                            <a href="{{ route('faqs') }}" class="nav-link">FAQ</a>
                        </li>
                        <li class="nav-item {{ Request::is('blog') ? 'active' : '' }}">
                            <a href="{{ route('blog') }}" class="nav-link">Artikel</a>
                        </li>
                        <li class="nav-item {{ Request::is('contact') ? 'active' : '' }}">
                            <a href="{{ route('contact') }}" class="nav-link">Kontak</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>
