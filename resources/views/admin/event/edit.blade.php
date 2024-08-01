@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Edit Acara</h1>
                <div>
                    <a href="{{ route('admin_event_index') }}" class="btn btn-primary"><i class="fas fa-table"></i> Lihat
                        Semua</a>
                </div>
            </div>
            <div class="section-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-body">
                                <form action="{{ route('admin_event_edit_submit', $event->id) }}" method="post"
                                    enctype="multipart/form-data">
                                    @csrf
                                    <div class="form-group mb-3">
                                        <label>Foto saat ini</label>
                                        <div>
                                            <img src="{{ asset('uploads/' . $event->featured_photo) }}" alt=""
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
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label>Nama *</label>
                                                <input type="text" class="form-control" name="name"
                                                    value="{{ $event->name }}">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label>Slug *</label>
                                                <input type="text" class="form-control" name="slug"
                                                    value="{{ $event->slug }}">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Lokasi *</label>
                                                <input type="text" class="form-control" name="location"
                                                    value="{{ $event->location }}">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Tanggal *</label>
                                                <input id="datepicker" type="text" class="form-control" name="date"
                                                    value="{{ $event->date }}" autocomplete="off">
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-group mb-3">
                                                <label>Waktu *</label>
                                                <input id="timepicker" type="text" class="form-control" name="time"
                                                    value="{{ $event->time }}" autocomplete="off">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label>Harga *</label>
                                                <input type="text" class="form-control" name="price"
                                                    value="{{ $event->price }}" onkeyup="onKeyUpPriceInput()">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label>Total Kursi</label>
                                                <input type="text" class="form-control" name="total_seat"
                                                    value="{{ $event->total_seat }}" onkeyup="onKeyUpTotalSeatInput()">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label>Peta</label>
                                                <textarea name="map" class="form-control h_100" cols="30" rows="10">{{ $event->map }}</textarea>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group mb-3">
                                                <label>Deskripsi Singkat *</label>
                                                <textarea name="short_description" class="form-control h_100" cols="30" rows="10">{{ $event->short_description }}</textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group mb-3">
                                        <label>Deskripsi *</label>
                                        <textarea name="description" class="form-control editor" cols="30" rows="10">{{ $event->description }}</textarea>
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
    <script>
        function onKeyUpPriceInput() {
            const priceInput = document.querySelector('input[name="price"]').value;
            if (priceInput == 0 || priceInput == '0' || priceInput == '-') {
                document.querySelector('input[name="total_seat"]').disabled = true;
                document.querySelector('input[name="total_seat"]').value = 0;
            } else {
                document.querySelector('input[name="total_seat"]').disabled = false;
                document.querySelector('input[name="total_seat"]').value = '';
            }
        }
    </script>
@endsection
