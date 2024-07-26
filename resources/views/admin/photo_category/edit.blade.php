@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Edit Foto Kategori</h1>
                <div>
                    <a href="{{ route('admin_photo_category_index') }}" class="btn btn-primary"><i class="fas fa-table"></i>
                        Lihat Semua</a>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="{{ route('admin_photo_category_edit_submit', $photo_category->id) }}"
                                    method="post">
                                    @csrf
                                    <div class="form-group mb-3">
                                        <label>Nama *</label>
                                        <input type="text" class="form-control" name="name"
                                            value="{{ $photo_category->name }}">
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
