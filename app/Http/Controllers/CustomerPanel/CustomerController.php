<?php

namespace App\Http\Controllers\CustomerPanel;

use App\Http\Controllers\Controller;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class CustomerController extends Controller
{
    public function dashboard(): View|RedirectResponse
    {
        if (Auth::user()->roles === 'admin') {
            return redirect()->route('admin.dashboard');
        } elseif (Auth::user()->roles === 'vendor') {
            return redirect()->route('vendor.dashboard');
        }
        return view('dashboard');
    }
}
