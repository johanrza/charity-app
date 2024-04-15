<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use DB;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            [
                'name' => 'Admin',
                'email' => 'admin@gmail.com',
                'email_verified_at' => date("Y-m-d H:i:s"),
                'password' => Hash::make('12345678'),
                'roles' => 'admin',
                'status' => 'active',
            ],
            [
                'name' => 'Vendor',
                'email' => 'vendor@gmail.com',
                'email_verified_at' => date("Y-m-d H:i:s"),
                'password' => Hash::make('12345678'),
                'roles' => 'vendor',
                'status' => 'active',
            ],
            [
                'name' => 'Customer',
                'email' => 'customer@gmail.com',
                'email_verified_at' => date("Y-m-d H:i:s"),
                'password' => Hash::make('12345678'),
                'roles' => 'customer',
                'status' => 'active',
            ],
        ]);
    }
}
