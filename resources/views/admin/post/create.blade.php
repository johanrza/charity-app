@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Tambah Postingan</h1>
                <div>
                    <a href="{{ route('admin_post_index') }}" class="btn btn-primary"><i class="fas fa-table"></i> Lihat
                        Semua</a>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="{{ route('admin_post_create_submit') }}" method="post"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group mb-3">
                                        <label>Foto *</label>
                                        <div>
                                            <input type="file" name="photo">
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Judul *</label>
                                        <input type="text" name="title" class="form-control">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Slug *</label>
                                        <input type="text" name="slug" class="form-control">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Deskripsi Singkat *</label>
                                        <textarea name="short_description" class="form-control h_100" cols="30" rows="10"></textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Deskripsi *</label>
                                        <textarea name="description" class="form-control editor" cols="30" rows="10"></textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Pilih Kategori *</label>
                                        <select name="post_category_id" class="form-select">
                                            @foreach ($post_categories as $item)
                                                <option value="{{ $item->id }}">{{ $item->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Tags</label>
                                        <select name="tags[]" class="form-select select2_tags"></select>
                                    </div>
                                    <div class="row">
                                        <div class="col-lg-3">
                                            <div class="form-group mb-3">
                                                <label>Kirim Email ke Subscribers?</label>
                                                <select name="email_send" class="form-select">
                                                    <option value="0">Tidak</option>
                                                    <option value="1">Ya</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
@endsection
