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
                'password' => Hash::make('1234'),
                'roles' => 'admin'
            ],
            [
                'name' => 'Vendor',
                'email' => 'vendor@gmail.com',
                'password' => Hash::make('1234'),
                'roles' => 'vendor'
            ],
            [
                'name' => 'Customer',
                'email' => 'customer@gmail.com',
                'password' => Hash::make('1234'),
                'roles' => 'customer'
            ]
        ]);
    }
}
