@extends('backend.layout.main')



@push('css')
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
        }

        body {
            background-color: #f0f2f5;
            padding: 20px;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            background: linear-gradient(135deg, #2563eb, #1e40af);
            color: white;
            padding: 25px;
            text-align: center;
        }

        .header h1 {
            font-size: 28px;
        }

        .column-headers {
            display: grid;
            grid-template-columns: 1fr auto auto auto;
            gap: 20px;
            padding: 15px 20px;
            background: #f1f5f9;
            border-bottom: 2px solid #e2e8f0;
            font-weight: 600;
            color: #334155;
        }

        .column-header {
            text-align: right;
        }

        .column-header:first-child {
            text-align: left;
        }

        .items-container {
            padding: 10px 20px;
            min-height: 300px;
            max-height: 500px;
            overflow-y: auto;
        }

        .item {
            display: grid;
            grid-template-columns: 1fr auto auto auto;
            gap: 20px;
            padding: 15px 0;
            border-bottom: 1px solid #e2e8f0;
        }

        .item:last-child {
            border-bottom: none;
        }

        .item-name {
            font-weight: 500;
        }

        .item-quantity,
        .item-price,
        .item-total {
            text-align: right;
            font-family: monospace;
            font-size: 16px;
        }

        .summary {
            background: #f8fafc;
            padding: 25px;
            border-top: 2px solid #e2e8f0;
        }

        .total-row {
            display: grid;
            grid-template-columns: 1fr auto;
            gap: 20px;
            padding: 10px 0;
            font-size: 18px;
        }

        .total-row.grand-total {
            font-size: 28px;
            font-weight: 600;
            color: #2563eb;
            border-top: 2px solid #e2e8f0;
            margin-top: 10px;
            padding-top: 20px;
        }
    </style>
@endpush

@section('content')
    @php
        $sidebar = false;
    @endphp

    <div class="container my-3">
        <div class="header">
            <h1>Customer Display</h1>
        </div>

        <div class="column-headers">
            <div class="column-header">Product Name</div>
            <div class="column-header">Quantity</div>
            <div class="column-header">Price</div>
            <div class="column-header">SubTotal</div>
        </div>

        <div class="items-container">
        </div>

        <div class="summary">

            {{-- <div class="total-row">
                <span>Tax (10%)</span>
                <span>$1.24</span>
            </div> --}}
            <div class="total-row grand-total">
                <span>Total</span>
                <span>00,00</span>
            </div>
        </div>
    </div>
@endsection
