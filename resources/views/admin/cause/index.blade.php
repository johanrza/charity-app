@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Campaign Donasi</h1>
                <div>
                    <a href="{{ route('admin_cause_create') }}" class="btn btn-primary"><i class="fas fa-table"></i> Tambah
                        Donasi</a>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="example1">
                                        <thead>
                                            <tr>
                                                <th>No</th>
                                                <th>Foto Unggulan</th>
                                                <th>Nama</th>
                                                <th>Target</th>
                                                <th>Terkumpul</th>
                                                <th>Apakah Diunggulkan?</th>
                                                <th>Opsi</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($causes as $item)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>
                                                        <img src="{{ asset('uploads/' . $item->featured_photo) }}"
                                                            alt="" class="w_150">
                                                    </td>
                                                    <td>
                                                        {{ $item->name }}
                                                    </td>
                                                    <td>
                                                        @rupiah($item->goal)
                                                    </td>
                                                    <td>
                                                        @rupiah($item->raised)
                                                    </td>
                                                    <td>
                                                        {{ $item->is_featured }}
                                                    </td>
                                                    <td>
                                                        <a href="{{ route('admin_cause_photo', $item->id) }}"
                                                            class="btn btn-primary btn-sm w_100_p mb_5">Galeri Foto</a>
                                                        <a href="{{ route('admin_cause_video', $item->id) }}"
                                                            class="btn btn-success btn-sm w_100_p mb_5">Galeri Video</a>
                                                        <a href="{{ route('admin_cause_faq', $item->id) }}"
                                                            class="btn btn-info btn-sm w_100_p mb_5">FAQ</a>
                                                        <a href="{{ route('admin_cause_donors', $item->id) }}"
                                                            class="btn btn-warning btn-sm w_100_p">Donasi</a>
                                                    </td>
                                                    <td class="pt_10 pb_10">
                                                        <a href="{{ route('admin_cause_edit', $item->id) }}"
                                                            class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>
                                                        <a href="{{ route('admin_cause_delete', $item->id) }}"
                                                            class="btn btn-danger btn-sm"
                                                            onClick="return confirm('Apakah Anda yakin?');"><i
                                                                class="fas fa-trash"></i></a>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
