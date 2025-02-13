@extends('backend.layout.main') @section('content')
    @if (session()->has('message'))
        <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close"
                data-dismiss="alert" aria-label="Close"><span
                    aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
    @endif
    @if (session()->has('not_permitted'))
        <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert"
                aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}
        </div>
    @endif

    <section>
        <div class="container-fluid">
            <div class="d-flex justify-content-center">
                <select id="stock_transfer_warehouse_id_to" class="form-control w-25">
                    <option value="" hidden>Select Branch</option>
                    @php
                        $warehouse_product = \App\Models\Product_Warehouse::where('warehouse_id', $id)->first();
                    @endphp


                    @if (!empty($warehouse_product))
                        @php
                            $warehouses = \App\Models\Warehouse::where('id', '!=', $warehouse_product->warehouse_id)
                                ->where('is_active', true)
                                ->get();

                        @endphp


                        @foreach ($warehouses as $warehouse)
                            <option value="{{ $warehouse->id }}">{{ $warehouse->name }}</option>
                        @endforeach
                    @endif

                </select>


                <button class="btn btn-primary mx-2" id="add-stock-btn">Add Stock </button>
            </div>
        </div>
        <div class="table-responsive">
            <table id="stock-transfer-table" class="table stock-count-list">
                <thead>
                    <tr>
                        <th class="not-exported"></th>
                        <th><input type="checkbox" id="select_all"></th>
                        <th>{{ trans('file.Date') }}</th>
                        <th>{{ trans('Product') }}</th>
                        <th>{{ trans('file.Warehouse') }}</th>
                        <th>{{ trans('Qty') }}</th>
                    </tr>
                </thead>
                <tbody>

                    @foreach ($warehouse_products as $w_product)
                        <tr>
                            <td></td>
                            <td>
                                <input type="checkbox" class="each_select" value="{{ $w_product->product_id }}">
                            </td>
                            <td>{{ $w_product->created_at->format('Y-m-d') }}</td>
                            <td>
                                @php
                                    $product = \App\Models\Product::where('id', $w_product->product_id)
                                        ->where('is_active', true)
                                        ->first();
                                @endphp

                                {{ $product->name }}
                            </td>
                            <td>
                                @php
                                    $warehouse = \App\Models\Warehouse::where('id', $w_product->warehouse_id)
                                        ->where('is_active', true)
                                        ->first();
                                @endphp

                                {{ $warehouse->name }}
                            </td>
                            <td>{{ $w_product->qty }}</td>
                        </tr>
                    @endforeach

                </tbody>
                <tfoot class="tfoot active">
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                    <th></th>
                </tfoot>
            </table>
        </div>
    </section>



    <div id="finalizeModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true"
        class="modal fade text-left">
        <div role="document" class="modal-dialog">
            <div class="modal-content">
                {{ Form::open(['route' => 'stock-count.finalize', 'method' => 'POST', 'files' => true]) }}
                <div class="modal-header">
                    <h5 id="exampleModalLabel" class="modal-title"> {{ trans('file.Finalize Stock Count') }}</h5>
                    <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span
                            aria-hidden="true"><i class="dripicons-cross"></i></span></button>
                </div>
                <div class="modal-body">
                    <p class="italic">
                        <small>{{ trans('file.The field labels marked with * are required input fields') }}.<strong>{{ trans('file.You just need to update the Counted column in the initial file') }}</strong>
                        </small>
                    </p>

                    <div class="form-group">
                        <input type="submit" value="{{ trans('file.submit') }}" class="btn btn-primary">
                    </div>
                </div>
                {{ Form::close() }}
            </div>
        </div>
    </div>
@endsection
@push('scripts')
    <script type="text/javascript">
        $("ul#product").siblings('a').attr('aria-expanded', 'true');
        $("ul#product").addClass("show");
        $("ul#product #stock-transfer-menu").addClass("active");

        $("#category, #brand").hide();

        $('select[name=type]').on('change', function() {
            if ($(this).val() == 'partial')
                $("#category, #brand").show(500);
            else
                $("#category, #brand").hide(500);
        });

        $(document).on('click', '.finalize', function() {
            $('input[name="stock_count_id"]').val($(this).data('id'));
            $('#finalizeModal').modal('show');
        });

        $(document).on('click', '.final-report', function() {
            var stock_count = $(this).data('stock_count');
            var htmltext = '<strong>{{ trans('file.Date') }}: </strong>' + stock_count[0] +
                '<br><strong>{{ trans('file.reference') }}: </strong>' + stock_count[1] +
                '<br><strong>{{ trans('file.Warehouse') }}: </strong>' + stock_count[2] +
                '<br><strong>{{ trans('file.Type') }}: </strong>' + stock_count[3];
            if (stock_count[4])
                htmltext += '<br><strong>{{ trans('file.category') }}: </strong>' + stock_count[4];
            if (stock_count[5])
                htmltext += '<br><strong>{{ trans('file.Brand') }}: </strong>' + stock_count[5];
            htmltext +=
                '<br><span class="d-print-none mt-1"><strong>{{ trans('file.Files') }}: </strong>&nbsp;&nbsp;<a href="' +
                stock_count[6] +
                '" class="btn btn-sm btn-primary"><i class="dripicons-download"></i> {{ trans('file.Initial File') }}</a>&nbsp;&nbsp;<a href="' +
                stock_count[7] +
                '" class="btn btn-sm btn-info"><i class="dripicons-download"></i> {{ trans('file.Final File') }}</a></span>';
            $.get('stock-count/stockdif/' + stock_count[8], function(data) {
                $(".stockdif-list tbody").remove();
                var name_code = data[0];
                var expected = data[1];
                var counted = data[2];
                var dif = data[3];
                var cost = data[4];
                var newBody = $("<tbody>");
                if (name_code) {
                    $('.stockdif-list').removeClass('d-none')
                    $.each(name_code, function(index) {
                        var newRow = $("<tr>");
                        var cols = '';
                        cols += '<td><strong>' + (index + 1) + '</strong></td>';
                        cols += '<td>' + name_code[index] + '</td>';
                        cols += '<td>' + parseFloat(expected[index]).toFixed(
                            {{ $general_setting->decimal }}) + '</td>';
                        cols += '<td>' + parseFloat(counted[index]).toFixed(
                            {{ $general_setting->decimal }}) + '</td>';
                        cols += '<td>' + parseFloat(dif[index]).toFixed(
                            {{ $general_setting->decimal }}) + '</td>';
                        cols += '<td>' + parseFloat(cost[index]).toFixed(
                            {{ $general_setting->decimal }}) + '</td>';
                        newRow.append(cols);
                        newBody.append(newRow);
                    });

                    if (!parseInt(data[5])) {
                        htmlFooter = '<a class="btn btn-primary d-print-none" href="stock-count/' +
                            stock_count[8] +
                            '/qty_adjustment"><i class="dripicons-plus"></i> {{ trans('file.Add Adjustment') }}</a>';
                        $('#stock-count-footer').html(htmlFooter);
                    }
                } else {
                    $('.stockdif-list').addClass('d-none');
                    $('#stock-count-footer').html('');
                }

                /*var newRow = $("<tr>");
                cols = '';
                cols += '<td colspan=6><strong>{{ trans('file.Order Discount') }}:</strong></td>';
                cols += '<td>' + sale[19] + '</td>';
                newRow.append(cols);
                newBody.append(newRow);


                newRow.append(cols);
                newBody.append(newRow);*/

                $("table.stockdif-list").append(newBody);
            });

            $('#stock-count-content').html(htmltext);
            $('#stock-count-details').modal('show');
        });

        $(document).on("click", "#print-btn", function() {
            var divToPrint = document.getElementById('stock-count-details');
            var newWin = window.open('', 'Print-Window');
            newWin.document.open();
            newWin.document.write(
                '<link rel="stylesheet" href="<?php echo asset('vendor/bootstrap/css/bootstrap.min.css'); ?>" type="text/css"><style type="text/css">@media print {.modal-dialog { max-width: 1000px;} }</style><body onload="window.print()">' +
                divToPrint.innerHTML + '</body>');
            newWin.document.close();
            setTimeout(function() {
                newWin.close();
            }, 10);
        });

        $('#stock-transfer-table').DataTable({
            "order": [],
            'language': {
                'lengthMenu': '_MENU_ {{ trans('file.records per page') }}',
                "info": '<small>{{ trans('file.Showing') }} _START_ - _END_ (_TOTAL_)</small>',
                "search": '{{ trans('file.Search') }}',
                'paginate': {
                    'previous': '<i class="dripicons-chevron-left"></i>',
                    'next': '<i class="dripicons-chevron-right"></i>'
                }
            },
            'columnDefs': [{
                "orderable": false,
                'targets': [0, 1]
            }, ],
            'select': {
                style: 'multi',
                selector: 'td:first-child'
            },
            'lengthMenu': [
                [10, 25, 50, -1],
                [10, 25, 50, "All"]
            ],
            dom: '<"row"lfB>rtip',
            buttons: [{
                    extend: 'pdf',
                    text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                    exportOptions: {
                        columns: ':visible:Not(.not-exported)',
                        rows: ':visible',
                    },
                },
                {
                    extend: 'excel',
                    text: '<i title="export to excel" class="dripicons-document-new"></i>',
                    exportOptions: {
                        columns: ':visible:Not(.not-exported)',
                        rows: ':visible',
                    },
                },
                {
                    extend: 'csv',
                    text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                    exportOptions: {
                        columns: ':visible:Not(.not-exported)',
                        rows: ':visible',
                    },
                },

                {
                    extend: 'colvis',
                    text: '<i title="column visibility" class="fa fa-eye"></i>',
                    columns: ':gt(0)'
                },
            ],
        });





        $(document).ready(function() {
            $("#select_all").on("change", function() {
                const isChecked = $(this).is(":checked");
                $(".each_select").prop("checked", isChecked);
            });
            var to_warehouse_id = null;
            $("#stock_transfer_warehouse_id_to").on("change", function() {
                to_warehouse_id = $(this).val();
                console.log($(this).val());
            });
            $("#add-stock-btn").on("click", function() {
                var from_warehouse_id = <?php echo $id; ?>

                const selected_ids = [];
                $(".each_select:checked").each(function() {
                    selected_ids.push($(this).val());
                    console.log(selected_ids);
                });

                if (selected_ids.length < 1) {
                    alert("Please select any Product");
                    return;
                }
                if (to_warehouse_id < 1) {
                    alert("Please select a Branch");
                    return;
                } else {
                    $.ajax({
                        url: `/betten_courts/stock-transfer/ids/${from_warehouse_id}/${to_warehouse_id}/${selected_ids}`,
                        type: 'GET',
                        success: function(response) {
                            window.location.href =
                                `/betten_courts/stock-transfer/ids/${from_warehouse_id}/${to_warehouse_id}/${selected_ids}`;
                        },
                        error: function(xhr, status, error) {
                            alert("Error Occured While Transfering Stock");
                        }
                    });

                }


            });
        });
    </script>
@endpush
