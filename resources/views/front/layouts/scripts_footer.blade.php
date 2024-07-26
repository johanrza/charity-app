<script src="{{ asset('dist-front/js/custom.js') }}"></script>
{{-- Donasi Sekarang submit --}}
@if (Route::currentRouteName() === 'cause')
    <script src="https://app{{ '.' . config('midtrans.snapMode') . '.' }}midtrans.com/snap/snap.js"
        data-client-key="{{ config('midtrans.clientKey') }}"></script>
    <script type="text/javascript">
        async function resultPaymentDonation(response, result) {
            let url =
                '{{ route('donation_handle', ['cause_id' => 'cause_id_placeholder', 'order_id' => 'order_id_placeholder']) }}';
            url = url.replace('cause_id_placeholder', response.cause_id);
            url = url.replace('order_id_placeholder', result.order_id);
            await fetch(url);
        }

        async function cancelPaymentDonation(order_id) {
            await fetch('{{ route('donation_cancel') }}', {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    order_id: order_id
                })
            });
        }

        const form = document.getElementById('form-pay-donation');
        const btnDonate = document.getElementById('pay-button-donation');
        const btnLoading = document.getElementById('btn-loading-donation');
        form.addEventListener('submit', async function(event) {
            event.preventDefault();
            btnDonate.classList.toggle('d-none');
            btnLoading.classList.toggle('d-none');
            const data = new FormData(form);

            try {
                const response = await fetch('{{ route('donation_payment') }}', {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    body: data
                });

                btnDonate.classList.toggle('d-none');
                btnLoading.classList.toggle('d-none');

                if (response.url === '{{ route('login') }}') {
                    iziToast.error({
                        message: 'Anda belum login!',
                        position: 'topRight'
                    });
                    setTimeout(() => {
                        window.location.href = response.url;
                    }, 2000);
                    return;
                }

                const responseJson = await response.json();

                if (responseJson.snap_token) {
                    snap.pay(responseJson.snap_token, {
                        onSuccess: function(result) {
                            iziToast.success({
                                message: 'Pembayaran berhasil!',
                                position: 'topRight'
                            });
                            resultPaymentDonation(responseJson, result);
                            window.location.reload();
                        },
                        onPending: function(result) {
                            // TODO: notif handler (baca di notion)

                            // resultPaymentDonation(responseJson, result);
                            cancelPaymentDonation(result.order_id);
                            iziToast.warning({
                                message: 'Pembayaran dibatalkan',
                                position: 'topRight'
                            });
                        },
                        onError: function(result) {
                            iziToast.error({
                                message: result.status_message,
                                position: 'topRight'
                            });
                        },
                        onClose: function(result) {
                            iziToast.warning({
                                message: 'Pembayaran dibatalkan',
                                position: 'topRight',
                            });
                        },
                    });
                }

                if (responseJson.failed) {
                    iziToast.error({
                        message: responseJson.failed,
                        position: 'topRight'
                    });
                }
            } catch (error) {
                iziToast.error({
                    title: 'Sorry',
                    message: 'System Error',
                    position: 'topRight'
                });
                console.error(error.message);
            }
        });
    </script>
@endif

@if (Route::currentRouteName() === 'event')
    <script src="https://app{{ '.' . config('midtrans.snapMode') . '.' }}midtrans.com/snap/snap.js"
        data-client-key="{{ config('midtrans.clientKey') }}"></script>
    <script type="text/javascript">
        async function resultPaymentEvent(response, result) {
            let url =
                '{{ route('event_ticket_handle', ['event_id' => 'event_id_placeholder', 'order_id' => 'order_id_placeholder', 'unit_price' => 'unit_price_placeholder', 'number_of_tickets' => 'number_of_tickets_placeholder']) }}';
            url = url.replace('event_id_placeholder', response.event_id);
            url = url.replace('order_id_placeholder', result.order_id);
            url = url.replace('unit_price_placeholder', response.unit_price);
            url = url.replace('number_of_tickets_placeholder', response.number_of_tickets);
            await fetch(url);
        }

        async function cancelPaymentEvent(order_id) {
            await fetch('{{ route('event_ticket_cancel') }}', {
                method: 'POST',
                headers: {
                    'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    order_id: order_id
                })
            });
        }

        const formEvent = document.getElementById('form-pay-event');
        const btnEvent = document.getElementById('pay-button-event');
        const btnLoading = document.getElementById('btn-loading-event');
        formEvent.addEventListener('submit', async function(event) {
            event.preventDefault();
            btnEvent.classList.toggle('d-none');
            btnLoading.classList.toggle('d-none');
            const data = new FormData(formEvent);
            try {
                const response = await fetch('{{ route('event_ticket_payment') }}', {
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}'
                    },
                    body: data
                });

                btnEvent.classList.toggle('d-none');
                btnLoading.classList.toggle('d-none');

                if (response.url === '{{ route('login') }}') {
                    iziToast.error({
                        message: 'Anda belum login!',
                        position: 'topRight'
                    });
                    setTimeout(() => {
                        window.location.href = response.url;
                    }, 2000);
                    return;
                }

                const responseJson = await response.json();

                if (responseJson.snap_token) {
                    snap.pay(responseJson.snap_token, {
                        onSuccess: function(result) {
                            iziToast.success({
                                message: 'Pembayaran berhasil!',
                                position: 'topRight'
                            });
                            resultPaymentEvent(responseJson, result);
                            window.location.reload();
                        },
                        onPending: function(result) {
                            cancelPaymentEvent(result.order_id);
                            iziToast.warning({
                                message: 'Pembayaran dibatalkan',
                                position: 'topRight'
                            });
                        },
                        onError: function(result) {
                            iziToast.error({
                                message: result.status_message,
                                position: 'topRight'
                            });
                        },
                        onClose: function(result) {
                            iziToast.warning({
                                message: 'Pembayaran dibatalkan',
                                position: 'topRight'
                            });
                        },
                    });
                }

                if (responseJson.failed) {
                    iziToast.error({
                        message: responseJson.failed,
                        position: 'topRight'
                    });
                    // console.log(responseJson.failed);
                }
            } catch (error) {
                iziToast.error({
                    title: 'Sorry',
                    message: 'System Error',
                    position: 'topRight'
                });
                console.error(error.message);
            }
        });
    </script>
@endif
<script>
    if ('serviceWorker' in navigator) {
        window.addEventListener('load', () => {
            navigator.serviceWorker.register('/service-worker.js').then(registration => {
                console.log('Service Worker registered:', registration);
            }).catch(registrationError => {
                console.log('Service Worker registration failed:', registrationError);
            });
        });
    }
</script>

@if ($errors->any())
    @foreach ($errors->all() as $error)
        <script>
            iziToast.error({
                message: '{{ $error }}',
                position: 'topRight'
            });
        </script>
    @endforeach
@endif
@if (Session::has('error'))
    <script>
        iziToast.error({
            message: '{{ Session::get('error') }}',
            position: 'topRight'
        });
    </script>
@endif
@if (Session::has('success'))
    <script>
        iziToast.success({
            message: '{{ Session::get('success') }}',
            position: 'topRight'
        });
    </script>
@endif
