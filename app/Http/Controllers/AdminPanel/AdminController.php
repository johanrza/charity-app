<?php

namespace App\Http\Controllers\AdminPanel;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Illuminate\View\View;

class AdminController extends Controller
{
    public function index(): View
    {
        return view('admin.dashboard');
    }

    // TODO: the method name should be 'edit' and return the view with the user data in parameter 2
    public function create(): View
    {
        return view('admin.profile');
    }

    public function update(Request $request): RedirectResponse
    {
        $user = User::findOrFail(Auth::user()->id);

        // TODO: add custom error messages
        $request->validate([
            'name' => ['required'],
            'email' => ['required', 'email', Rule::unique('users')->ignore($user->id)],
        ]);

        $user->update([
            'name' => $request->name,
            'email' => $request->email,
        ]);

        return redirect()->back()->with('success', 'Profile berhasil di update!');
    }
}
