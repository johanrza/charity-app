<?php

namespace App\Providers;

use Illuminate\Support\Facades\Blade;
use Illuminate\Support\ServiceProvider;

class BladeDirectiveServiceProvider extends ServiceProvider
{
    /**
     * Register services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap services.
     */
    public function boot(): void
    {
        Blade::directive('rupiah', function ($expression) {
            return "<?= 'Rp' . number_format($expression, 0, ',', '.'); ?>";
        });

        Blade::directive('dateIndoComplete', function ($expression) {
            return "<?= \Carbon\Carbon::parse($expression)->translatedFormat('d F Y')?>";
        });

        Blade::directive('timeIndoComplete', function ($expression) {
            return "<?= \Carbon\Carbon::parse($expression)->translatedFormat('H:i')?>";
        });
        
        Blade::directive('dateIndoNumber', function ($expression) {
            return "<?= \Carbon\Carbon::parse($expression)->translatedFormat('d-m-Y') ?>";
        });
    }
}
