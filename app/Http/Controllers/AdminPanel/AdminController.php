<?php

namespace App\Http\Controllers\AdminPanel;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;
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
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'email', Rule::unique('users')->ignore($user->id)],
            'password' => ['nullable', 'min:8', 'confirmed'],
            'photo' => ['nullable', 'file', 'image', 'mimes:jpg,bmp,png'],
        ]);

        $updateData = [
            'name' => $request->name,
            'email' => $request->email,
        ];

        if ($request->has('password')) {
            $updateData['password'] = Hash::make($request->password);
        }

        if ($request->hasFile('photo')) {
            $photoPath = $request->file('photo')->store('uploads', 'public');
            if (!empty($user->photo)) {
                Storage::disk('public')->delete($user->photo);
            }
            $updateData['photo'] = $photoPath;
        }

        $user->update($updateData);

        return redirect()->back()->with('success', 'Profile berhasil di update!');
    }
}
