@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Edit Postingan</h1>
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
                                <form action="{{ route('admin_post_edit_submit', $post->id) }}" method="post"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group mb-3">
                                        <label>Foto saat ini</label>
                                        <div>
                                            <img src="{{ asset('uploads/' . $post->photo) }}" alt="" class="w_200">
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Ganti Foto</label>
                                        <div>
                                            <input type="file" name="photo">
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Judul *</label>
                                        <input type="text" name="title" class="form-control"
                                            value="{{ $post->title }}">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Slug *</label>
                                        <input type="text" name="slug" class="form-control"
                                            value="{{ $post->slug }}">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Deskripsi Singkat *</label>
                                        <textarea name="short_description" class="form-control h_100" cols="30" rows="10">{{ $post->short_description }}</textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Deskripsi *</label>
                                        <textarea name="description" class="form-control editor" cols="30" rows="10">{{ $post->description }}</textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Pilih Kategori *</label>
                                        <select name="post_category_id" class="form-select">
                                            @foreach ($post_categories as $item)
                                                <option value="{{ $item->id }}"
                                                    @if ($item->id == $post->post_category_id) selected @endif>{{ $item->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Tags</label>
                                        <select name="tags[]" class="form-select select2_tags" multiple="multiple">
                                            @for ($i = 0; $i < count($post_tags); $i++)
                                                <option value="{{ $post_tags[$i] }}" selected>{{ $post_tags[$i] }}</option>
                                            @endfor
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <button type="submit" class="btn btn-primary">Update</button>
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
