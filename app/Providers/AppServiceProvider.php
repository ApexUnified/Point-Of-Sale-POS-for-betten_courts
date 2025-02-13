<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\View;
use DB;
use Illuminate\Support\Facades\URL;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap any application services.
     *
     * @return void
     */

    /**
     * Register any application services.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    public function boot()
    {
        if(env("APP_PROTOCOL") === "https"){
            URL::forceScheme('https');
        }else if(env("APP_PROTOCOL") === "http"){
            URL::forceScheme('http');
        }

        // Schema::defaultStringLength(191);
        $this->app->bind(\App\ViewModels\ISmsModel::class,\App\ViewModels\SmsModel::class);
    }
}
