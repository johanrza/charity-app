@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Postingan</h1>
                <div>
                    <a href="{{ route('admin_post_create') }}" class="btn btn-primary"><i class="fas fa-plus"></i> Tambah
                        Postingan</a>
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
                                                <th>Foto</th>
                                                <th>Judul</th>
                                                <th>Kategori</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($posts as $item)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>
                                                        <img src="{{ asset('uploads/' . $item->photo) }}" alt=""
                                                            class="w_200">
                                                    </td>
                                                    <td>
                                                        {{ $item->title }}
                                                    <td>
                                                        {{ $item->rPostCategory->name }}
                                                    </td>
                                                    <td class="pt_10 pb_10">
                                                        <a href="{{ route('admin_post_edit', $item->id) }}"
                                                            class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>
                                                        <a href="{{ route('admin_post_delete', $item->id) }}"
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
