@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Edit Fitur</h1>
                <div>
                    <a href="{{ route('admin_feature_index') }}" class="btn btn-primary"><i class="fas fa-search"></i> Lihat
                        Semua</a>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="{{ route('admin_feature_edit_submit', $feature->id) }}" method="post">
                                    @csrf
                                    <div class="form-group mb-3">
                                        <label>Icon *</label>
                                        <input type="text" class="form-control" name="icon"
                                            value="{{ $feature->icon }}">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Heading *</label>
                                        <input type="text" class="form-control" name="heading"
                                            value="{{ $feature->heading }}">
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Text *</label>
                                        <textarea name="text" class="form-control h_100" cols="30" rows="10">{{ $feature->text }}</textarea>
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
