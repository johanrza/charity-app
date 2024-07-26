<?php

namespace App\Providers;

use Carbon\Carbon;
use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;
use App\Models\Setting;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        if (\Schema::hasTable('settings')) {
            Paginator::useBootstrap();

            $setting_data = Setting::where('id', 1)->first();

            view()->share('global_setting_data', $setting_data);
        }
        config(['app.locale' => 'id']);
        Carbon::setLocale('id');
    }
}
