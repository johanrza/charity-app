<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class RoleMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next, $role /* get value 'admin' | 'vendor' from route */): Response
    {
        // get the user information if a user comes
        if ($request->user()->roles /* role value from user login */ !== $role /* role value accessed via url (routes)  */) {
            abort(404);
        }
        return $next($request);
    }
}
