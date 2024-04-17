<script src="{{ asset('dist/js/scripts.js') }}"></script>
<script src="{{ asset('dist/js/custom.js') }}"></script>

@if ($errors->any())
    @foreach ($errors->all() as $error)
        <script>
            iziToast.error({
                // title: 'Error',
                message: '{{ $error }}',
                position: 'topRight',
            });
        </script>
    @endforeach
@endif

@if (session()->get('error'))
    <script>
        iziToast.error({
            title: 'Error',
            message: '{{ session()->get('error') }} ',
            position: 'topRight',
        });
    </script>
@endif

@if (session()->has('success'))
    <script>
        iziToast.success({
            // title: 'Sukses',
            message: '{{ session()->get('success') }} ',
            position: 'topRight',
        });
    </script>
@endif
