@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Tambah Campaign Donasi</h1>
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
                                <form action="{{ route('admin_cause_create_submit') }}" method="post"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group mb-3">
                                        <label>Foto Unggulan *</label>
                                        <div>
                                            <input type="file" name="featured_photo">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Nama *</label>
                                                <input type="text" class="form-control" name="name"
                                                    value="{{ old('name') }}">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Slug *</label>
                                                <input type="text" class="form-control" name="slug"
                                                    value="{{ old('slug') }}">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Target *</label>
                                                <input type="text" class="form-control" name="goal"
                                                    value="{{ old('goal') }}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Deskripsi Singkat *</label>
                                        <textarea name="short_description" class="form-control h_100" cols="30" rows="10">{{ old('short_description') }}</textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Deskripsi *</label>
                                        <textarea name="description" class="form-control editor" cols="30" rows="10">{{ old('description') }}</textarea>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Apakah Diunggulkan? *</label>
                                                <select name="is_featured" class="form-select">
                                                    <option value="Yes">Ya</option>
                                                    <option value="No">Tidak</option>
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
