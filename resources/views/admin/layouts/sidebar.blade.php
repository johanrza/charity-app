<!-- CSS untuk dropdown submenu -->
<style>
    .dropdown-menu {
        display: none;
    }

    .dropdown-menu.show {
        display: block;
    }
</style>

<!-- HTML untuk sidebar -->
<div class="main-sidebar">
    <aside id="sidebar-wrapper">
        <div class="sidebar-brand">
            <a href="{{ route('admin_dashboard') }}">Admin Panel</a>
        </div>
        <div class="sidebar-brand sidebar-brand-sm">
            <a href="{{ route('admin_dashboard') }}"></a>
        </div>

        <ul class="sidebar-menu">
            <li class="{{ Request::is('admin/dashboard') ? 'active' : '' }}">
                <a class="nav-link" href="{{ route('admin_dashboard') }}">
                    <i class="fas fa-hand-point-right"></i><span>Dashboard</span>
                </a>
            </li>
            <li class="{{ Request::is('admin/event/*') ? 'active' : '' }}">
                <a class="nav-link" href="{{ route('admin_event_index') }}">
                    <i class="fas fa-hand-point-right"></i><span>Events</span>
                </a>
            </li>
            <li class="{{ Request::is('admin/cause/*') ? 'active' : '' }}">
                <a class="nav-link" href="{{ route('admin_cause_index') }}">
                    <i class="fas fa-hand-point-right"></i><span>Campaign Donasi</span>
                </a>
            </li>

            <!-- Subscriber Dropdown -->
            <li class="nav-item dropdown{{ Request::is('admin/subscriber/*') ? 'active' : '' }}">
                <a href="#" class="nav-link dropdown-toggle">
                    <i class="fas fa-hand-point-right"></i><span>Subscriber</span>
                </a>
                <ul class="main-dropdown dropdown-menu">
                    <li class="{{ Request::is('admin/subscriber/index') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin_subscriber_index') }}">
                            <i class="fas fa-angle-right"></i> Semua Subscribers
                        </a>
                    </li>
                    <li class="{{ Request::is('admin/subscriber/send-message') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin_subscriber_send_message') }}">
                            <i class="fas fa-angle-right"></i> Kirim Pesan ke Subscribers
                        </a>
                    </li>
                </ul>
            </li>

            <!-- Manajemen Konten Dropdown -->
            <li class="nav-item dropdown {{ Request::is('admin/*') && !Request::is('admin/dashboard') && !Request::is('admin/event/*') && !Request::is('admin/cause/*') && !Request::is('admin/subscriber/*') ? 'active' : '' }}">
                <a href="#" class="nav-link dropdown-toggle">
                    <i class="fas fa-hand-point-right"></i><span>Manajemen Konten</span>
                </a>
                <ul class="main-dropdown dropdown-menu">
                    <li class="{{ Request::is('admin/settings/*') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin_settings_index') }}">
                            <i class="fas fa-angle-right"></i> Settings
                        </a>
                    </li>
                    <li class="{{ Request::is('admin/slider/*') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin_slider_index') }}">
                            <i class="fas fa-angle-right"></i> Sliders
                        </a>
                    </li>
                    <li class="{{ Request::is('admin/special/*') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin_special_edit') }}">
                            <i class="fas fa-angle-right"></i> Introduction (Special)
                        </a>
                    </li>
                    <li class="{{ Request::is('admin/feature/*') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin_feature_index') }}">
                            <i class="fas fa-angle-right"></i> Fitur
                        </a>
                    </li>
                    <li class="{{ Request::is('admin/testimonial/*') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin_testimonial_index') }}">
                            <i class="fas fa-angle-right"></i> Testimonial
                        </a>
                    </li>
                    <li class="{{ Request::is('admin/counter/*') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin_counter_edit') }}">
                            <i class="fas fa-angle-right"></i> Counters (Penghitung)
                        </a>
                    </li>
                    <li class="{{ Request::is('admin/faq/*') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin_faq_index') }}">
                            <i class="fas fa-angle-right"></i> FAQs
                        </a>
                    </li>
                    <li class="{{ Request::is('admin/volunteer/*') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin_volunteer_index') }}">
                            <i class="fas fa-angle-right"></i> Relawan
                        </a>
                    </li>
                    <li class="{{ Request::is('admin/home-page/*') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin_home_page_index') }}">
                            <i class="fas fa-angle-right"></i> Home Page Items
                        </a>
                    </li>
                    <!-- Galeri Foto Dropdown -->
                    <li class="nav-item dropdown {{ Request::is('admin/photo-category/*') || Request::is('admin/photo/*') ? 'active' : '' }}">
                        <a href="#" class="nav-link dropdown-toggle">
                            <i class="fas fa-angle-right"></i><span>Galeri Foto</span>
                        </a>
                        <ul class="dropdown-submenu dropdown-menu">
                            <li class="{{ Request::is('admin/photo-category/*') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ route('admin_photo_category_index') }}">
                                    <i class="fas fa-angle-right"></i> Kategori
                                </a>
                            </li>
                            <li class="{{ Request::is('admin/photo/*') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ route('admin_photo_index') }}">
                                    <i class="fas fa-angle-right"></i> Foto
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- Galeri Video Dropdown -->
                    <li class="nav-item dropdown {{ Request::is('admin/video-category/*') || Request::is('admin/video/*') ? 'active' : '' }}">
                        <a href="#" class="nav-link dropdown-toggle">
                            <i class="fas fa-angle-right"></i><span>Galeri Video</span>
                        </a>
                        <ul class="dropdown-submenu dropdown-menu">
                            <li class="{{ Request::is('admin/video-category/*') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ route('admin_video_category_index') }}">
                                    <i class="fas fa-angle-right"></i> Kategori
                                </a>
                            </li>
                            <li class="{{ Request::is('admin/video/*') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ route('admin_video_index') }}">
                                    <i class="fas fa-angle-right"></i> Video
                                </a>
                            </li>
                        </ul>
                    </li>
                    <!-- Blog Dropdown -->
                    <li class="nav-item dropdown {{ Request::is('admin/post-category/*') || Request::is('admin/post/*') || Request::is('admin/comments') || Request::is('admin/replies') ? 'active' : '' }}">
                        <a href="#" class="nav-link dropdown-toggle">
                            <i class="fas fa-angle-right"></i><span>Artikel</span>
                        </a>
                        <ul class="dropdown-submenu dropdown-menu">
                            <li class="{{ Request::is('admin/post-category/*') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ route('admin_post_category_index') }}">
                                    <i class="fas fa-angle-right"></i> Kategori
                                </a>
                            </li>
                            <li class="{{ Request::is('admin/post/*') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ route('admin_post_index') }}">
                                    <i class="fas fa-angle-right"></i> Postingan
                                </a>
                            </li>
                            <li class="{{ Request::is('admin/comments') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ route('admin_comment') }}">
                                    <i class="fas fa-angle-right"></i> Komentar
                                </a>
                            </li>
                            <li class="{{ Request::is('admin/replies') ? 'active' : '' }}">
                                <a class="nav-link" href="{{ route('admin_reply') }}">
                                    <i class="fas fa-angle-right"></i> Balasan
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li class="{{ Request::is('admin/other-pages/terms') ? 'active' : '' }}">
                        <a class="nav-link" href="{{ route('admin_terms_page') }}">
                            <i class="fas fa-angle-right"></i> Terms Page
                        </a>
                    </li>
                    <li class="{{ Request::is('admin/other-pages/privacy') ? 'active' : '' }} pb-5">
                        <a class="nav-link" href="{{ route('admin_privacy_page') }}">
                            <i class="fas fa-angle-right"></i> Privacy Page
                        </a>
                    </li>
                </ul>
            </li>
        </ul>
    </aside>
</div>
<script>
    $(document).ready(function() {
        // Menangani klik pada menu dropdown utama
        $('.nav-link.dropdown-toggle').on('click', function(e) {
            e.preventDefault();
            e.stopPropagation();
            const submenu = $(this).next('.dropdown-menu');
            // Menutup submenu lain jika ada
            $('.dropdown-submenu.dropdown-menu').not(submenu).removeClass('show').getNiceScroll().remove();
            submenu.toggleClass('show');
            if (submenu.hasClass('show')) {
                submenu.niceScroll({
                    cursorcolor: "#343a40",
                    cursorwidth: "5px",
                    cursorborder: "1px solid #343a40",
                    autohidemode: false
                });
            } else {
                submenu.getNiceScroll().remove();
            }
        });

        // Menutup dropdown saat klik di luar
        $(document).on('click', function() {
            $('.dropdown-menu').removeClass('show').getNiceScroll().remove();
        });
    });
</script>
