<div class="navbar-bg"></div>
<nav class="navbar d-flex navbar-expand-lg main-navbar">
    <div class="navbar-nav justify-content-start">
        <form class="form-inline mr-auto">
            <ul class="navbar-nav mr-3">
                <li><a href="#" data-toggle="sidebar" class="nav-link nav-link-lg"><i class="fas fa-bars"></i></a>
                </li>
            </ul>
        </form>
        <a href="#" target="_blank" class="btn btn-warning text-nowrap mx-3">Front End</a>
    </div>
    <ul class="navbar-nav navbar-right justify-content-end rightsidetop">
        <div class="d-flex justify-content-center align-items-center">
            <div class="text-light h-auto">{{ Auth::user()->name }}</div>
            <div class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                    aria-expanded="false">
                    @if (Auth::user()->photo === null)
                        <img alt="image" src="{{ asset('storage/uploads/default.png') }}"
                            class="rounded-circle-custom">
                    @else
                        <img alt="image" src="{{ asset('storage/' . Auth::user()->photo) }}"
                            class="rounded-circle-custom">
                    @endif
                </a>
                <ul class="dropdown-menu dropdown-menu-end">
                    <li><a class="dropdown-item" href="{{ route('admin.profile') }}"><i class="far fa-user"></i> Edit
                            Profile</a></li>
                    <li>
                        <form method="POST" action="{{ route('logout') }}">
                            @csrf
                            <a class="dropdown-item" href="{{ route('logout') }}"
                                onclick="event.preventDefault(); this.closest('form').submit();">
                                <i class="fas fa-sign-out-alt"></i>
                                Logout
                            </a>
                        </form>
                    </li>
                </ul>
            </div>
        </div>
    </ul>
</nav>
