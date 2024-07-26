@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Edit Testimonial</h1>
                <div>
                    <a href="{{ route('admin_testimonial_index') }}" class="btn btn-primary"><i class="fas fa-table"></i> Lihat
                        Semua</a>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="{{ route('admin_testimonial_edit_submit', $testimonial->id) }}" method="post"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group mb-3">
                                        <label>Nama *</label>
                                        <input type="text" class="form-control" name="name"
                                            value="{{ $testimonial->name }}">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Sebutan atau Profesi *</label>
                                        <input type="text" class="form-control" name="designation"
                                            value="{{ $testimonial->designation }}">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Komentar *</label>
                                        <textarea name="comment" class="form-control h_100" cols="30" rows="10">{{ $testimonial->comment }}</textarea>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Foto saat ini</label>
                                        <div>
                                            <img src="{{ asset('uploads/' . $testimonial->photo) }}" alt=""
                                                class="w_200">
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Ganti Foto *</label>
                                        <div>
                                            <input type="file" name="photo">
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
