@extends('admin.layouts.app')

@section('main_content')
    <div class="main-content">
        <section class="section">
            <div class="section-header d-flex justify-content-between">
                <h1>Video</h1>
                <div>
                    <a href="{{ route('admin_video_create') }}" class="btn btn-primary"><i class="fas fa-plus"></i> Tambah
                        Video</a>
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
                                                <th>Video Preview</th>
                                                <th>YouTube Video Id</th>
                                                <th>Kategori</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($videos as $item)
                                                <tr>
                                                    <td>{{ $loop->iteration }}</td>
                                                    <td>
                                                        <iframe class="i1" width="200" height="100"
                                                            src="https://www.youtube.com/embed/{{ $item->youtube_video_id }}"
                                                            frameborder="0"
                                                            allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                                                            allowfullscreen></iframe>
                                                    </td>
                                                    <td>
                                                        {{ $item->youtube_video_id }}
                                                    </td>
                                                    <td>
                                                        {{ $item->rVideoCategory->name }}
                                                    </td>
                                                    <td class="pt_10 pb_10">
                                                        <a href="{{ route('admin_video_edit', $item->id) }}"
                                                            class="btn btn-primary btn-sm"><i class="fas fa-edit"></i></a>
                                                        <a href="{{ route('admin_video_delete', $item->id) }}"
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
