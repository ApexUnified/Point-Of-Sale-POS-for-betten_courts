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
            min-height: 100vh;
        }

        .container {
            max-width: 800px;
            margin: 0 auto;
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .header {
            background: #2563eb !important;
            color: white !important;
            padding: 20px !important;
            text-align: center !important;
        }

        .header h1 {
            font-size: 24px;
            margin-bottom: 5px;
        }

        .transaction-info {
            font-size: 14px;
            opacity: 0.9;
        }

        .items-container {
            padding: 20px;
            min-height: 300px;
            max-height: 500px;
            overflow-y: auto;
        }

        .item {
            display: grid;
            grid-template-columns: 1fr auto auto auto;
            gap: 20px;
            padding: 15px;
            border-bottom: 1px solid #eee;
            animation: fadeIn 0.3s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
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
            padding: 20px;
            border-top: 2px solid #eee;
        }

        .total-row {
            display: grid;
            grid-template-columns: 1fr auto;
            gap: 20px;
            padding: 10px 0;
            font-size: 18px;
        }

        .total-row.grand-total {
            font-size: 24px;
            font-weight: 600;
            color: #2563eb;
            border-top: 2px solid #eee;
            margin-top: 10px;
            padding-top: 20px;
        }

        .status-bar {
            background: #10b981;
            color: white;
            text-align: center;
            padding: 10px;
            font-size: 14px;
        }
    </style>
@endpush

@section('content')
    @php
        $sidebar = false;
    @endphp

    <section>
        <div class="container m-auto">
            <div class="header">
                <h1>Customer Display</h1>
                <div class="transaction-info">Transaction #<span id="transaction-id">12345</span></div>
            </div>

            <div class="items-container" id="items-list">
                <!-- Items will be added here dynamically -->
            </div>

            <div class="summary">
                <div class="total-row">
                    <span>Subtotal</span>
                    <span id="subtotal">$0.00</span>
                </div>
                <div class="total-row">
                    <span>Tax (10%)</span>
                    <span id="tax">$0.00</span>
                </div>
                <div class="total-row grand-total">
                    <span>Total</span>
                    <span id="total">$0.00</span>
                </div>
            </div>

            <div class="status-bar">
                Transaction in progress...
            </div>
        </div>


    </section>
@endsection

@push('scripts')
    <script>
        // Sample data structure for a product
        class Product {

            constructor(name, price) {
                this.name = name;
                this.price = price;
            }
        }

        // Sample products database
        const products = {
            'P001': new Product('Organic Banana', 0.99),
            'P002': new Product('Whole Grain Bread', 3.49),
            'P003': new Product('Fresh Milk 1L', 2.99),
            'P004': new Product('Free Range Eggs', 4.99),
            'P005': new Product('Chocolate Bar', 1.99)
        };

        // Shopping cart to store current items
        let cart = [];

        // Function to add item to cart
        function addItem(productId, quantity = 1) {
            const product = products[productId];
            if (product) {
                cart.push({
                    name: product.name,
                    quantity: quantity,
                    price: product.price,
                    total: product.price * quantity
                });
                updateDisplay();
            }
        }

        // Function to update the display
        function updateDisplay() {
            const itemsList = document.getElementById('items-list');
            itemsList.innerHTML = '';

            let subtotal = 0;

            cart.forEach(item => {
                const itemElement = document.createElement('div');
                itemElement.className = 'item';
                itemElement.innerHTML = `
                <span class="item-name">${item.name}</span>
                <span class="item-quantity">×${item.quantity}</span>
                <span class="item-price">$${item.price.toFixed(2)}</span>
                <span class="item-total">$${item.total.toFixed(2)}</span>
            `;
                itemsList.appendChild(itemElement);
                subtotal += item.total;
            });

            const tax = subtotal * 0.1;
            const total = subtotal + tax;

            document.getElementById('subtotal').textContent = `$${subtotal.toFixed(2)}`;
            document.getElementById('tax').textContent = `$${tax.toFixed(2)}`;
            document.getElementById('total').textContent = `$${total.toFixed(2)}`;
        }

        // Demo: Add some items automatically
        setTimeout(() => addItem('P001', 3), 1000);
        setTimeout(() => addItem('P003', 2), 2000);
        setTimeout(() => addItem('P004', 1), 3000);
    </script>
@endpush
