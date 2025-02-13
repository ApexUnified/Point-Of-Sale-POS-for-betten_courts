@extends('backend.layout.main') @section('content')
    @if (session()->has('not_permitted'))
        <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert"
                aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
    @endif
    <section class="forms">
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center">
                            <h4>{{ trans('Transfer Stock') }}</h4>
                        </div>


                        <div class="card-body my-3">

                            <div class="d-flex justify-content-between">
                                @php
                                    $from_warehouse = \App\Models\Warehouse::find($from_warehouse_id);
                                    $to_warehouse = \App\Models\Warehouse::find($to_warehouse_id);
                                @endphp

                                @if (!empty($from_warehouse))
                                    <div class="form-group">
                                        <label for="from_warehouse">Stock Transfer From Branch</label>
                                        <input type="text" id="from_warehouse" disabled
                                            value="{{ $from_warehouse->name }}" class="form-control">
                                    </div>
                                @endif


                                @if (!empty($to_warehouse))
                                    <div class="form-group">
                                        <label for="to_warehouse">Stock Transfer To Branch</label>
                                        <input type="text" id="to_warehouse" disabled value="{{ $to_warehouse->name }}"
                                            class="form-control">
                                    </div>
                                @endif




                            </div>

                        </div>



                        <div class="card-body">
                            <div class="table-responsive mt-3">
                                {!! Form::open(['route' => 'stock_transfer_to_warehouse', 'method' => 'post']) !!}
                                <table id="myTable" class="table table-hover order-list">
                                    <thead>
                                        <tr>
                                            <th>Product Name</th>
                                            <th>Product Code</th>
                                            <th>Quantity</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($products as $product)
                                            <tr>
                                                <td>{{ $product->name }}<button type="button"
                                                        class="edit-product btn btn-link"></button></td>
                                                <td>{{ $product->code }}</td>
                                                <input type="number" hidden name="product_id[]"
                                                    value="{{ $product->id }}">
                                                <input type="number" hidden name="from_warehouse"
                                                    value="{{ $from_warehouse_id }}">
                                                <input type="number" hidden name="to_warehouse"
                                                    value="{{ $to_warehouse_id }}">


                                                @php
                                                    $product_qty_in_warehouse = \App\Models\Product_Warehouse::where(
                                                        'warehouse_id',
                                                        $from_warehouse_id,
                                                    )
                                                        ->where('product_id', $product->id)
                                                        ->first();

                                                @endphp

                                                <td><input type="number" class="form-control qty"
                                                        name="qty[{{ $product->id }}]"
                                                        value="{{ $product_qty_in_warehouse->qty ?? 0 }}" required="">
                                                </td>
                                            </tr>
                                        @endforeach

                                    </tbody>

                                </table>
                                <button class="btn btn-primary" type="submit">Transfer Stock</button>
                                {!! Form::close() !!}
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection
