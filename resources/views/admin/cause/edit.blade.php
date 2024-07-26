@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Edit Campaign Donasi</h1>
                <div>
                    <a href="{{ route('admin_cause_index') }}" class="btn btn-primary"><i class="fas fa-table"></i> Lihat
                        Semua</a>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="{{ route('admin_cause_edit_submit', $cause->id) }}" method="post"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group mb-3">
                                        <label>Foto saat ini</label>
                                        <div>
                                            <img src="{{ asset('uploads/' . $cause->featured_photo) }}" alt=""
                                                class="w_200">
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Ganti Foto</label>
                                        <div>
                                            <input type="file" name="featured_photo">
                                        </div>
                                    </div>

                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Nama *</label>
                                                <input type="text" class="form-control" name="name"
                                                    value="{{ $cause->name }}">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Slug *</label>
                                                <input type="text" class="form-control" name="slug"
                                                    value="{{ $cause->slug }}">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Target *</label>
                                                <input type="text" class="form-control" name="goal"
                                                    value="{{ $cause->goal }}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Deskripsi Singkat *</label>
                                        <textarea name="short_description" class="form-control h_100" cols="30" rows="10">{{ $cause->short_description }}</textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Deskripsi *</label>
                                        <textarea name="description" class="form-control editor" cols="30" rows="10">{{ $cause->description }}</textarea>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Apakah Diunggulkan? *</label>
                                                <select name="is_featured" class="form-select">
                                                    <option value="Yes"
                                                        @if ($cause->is_featured == 'Yes') selected @endif>Ya</option>
                                                    <option value="No"
                                                        @if ($cause->is_featured == 'No') selected @endif>Tidak</option>
                                                </select>
                                            </div>
                                        </div>
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
