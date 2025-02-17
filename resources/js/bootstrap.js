window._ = await import('lodash');

/**
 * We'll load jQuery and the Bootstrap jQuery plugin which provides support
 * for JavaScript based Bootstrap features such as modals and tabs. This
 * code may be modified to fit the specific needs of your application.
 */

try {
    window.Popper = require('popper.js').default;
    window.$ = window.jQuery = require('jquery');

    require('bootstrap');
} catch (e) { }

/**
 * We'll load the axios HTTP library which allows us to easily issue requests
 * to our Laravel back-end. This library automatically handles sending the
 * CSRF token as a header based on the value of the "XSRF" token cookie.
 */

import axios from 'axios';
window.axios = axios;
window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';
/**
 * Next we will register the CSRF Token as a common header with Axios so that
 * all outgoing HTTP requests automatically have it attached. This is just
 * a simple convenience so we don't have to attach every token manually.
 */

let token = document.head.querySelector('meta[name="csrf-token"]');

if (token) {
    window.axios.defaults.headers.common['X-CSRF-TOKEN'] = token.content;

} else {
    console.error('CSRF token not found: https://laravel.com/docs/csrf#csrf-x-csrf-token');
}

/**
 * Echo exposes an expressive API for subscribing to channels and listening
 * for events that are broadcast by Laravel. Echo and event broadcasting
 * allows your team to easily build robust real-time web applications.
 */

import Echo from 'laravel-echo';
import Pusher from 'pusher-js';

window.Echo = new Echo({
    broadcaster: 'reverb',
    key: import.meta.env.VITE_REVERB_APP_KEY,
    wsHost: import.meta.env.VITE_REVERB_HOST,
    wsPort: import.meta.env.VITE_REVERB_PORT ?? 80,
    wssPort: import.meta.env.VITE_REVERB_PORT ?? 443,
    forceTLS: (import.meta.env.VITE_REVERB_SCHEME ?? 'https') === 'https',
    enabledTransports: ['ws', 'wss'],
});



const current_user_id = $("meta[name='current_user_id']").attr("content");
const currency = $("meta[name='currency']").attr("content");
window.Echo.private(`SaleProductUpdateCD.${current_user_id}`)
    .listen("SaleProductUpdateCD", (e) => {
        // console.log("Event Fired for " + current_user_id);
        // console.log(e.product);


        let productcode = String(e.product[1]); // Convert to string if necessary

        let existingItem = $(".item[data-product-id='" + productcode + "']");
        if (existingItem.length === 0) {
            $(".items-container").append(`
                    <div class="item" data-product-id="${productcode}">
                       <span class="item-name" data-original-name=${e.product[0]}>${e.product[0]} </br> ${productcode} </span>
                       <span class="item-quantity">${e.product[5]}</span>
                       <span class="item-price">${currency} ${e.product[2]}</span>
                       <span class="item-subtotal">${currency} ${e.product[2]}</span>
                   </div>
               `);
        } else {
            let currentQuantity = parseInt(existingItem.find(".item-quantity").text()) || 0;
            // console.log(currentQuantity);

            let newQuantity = currentQuantity + parseInt(e.product[5]);
            // console.log("Updated Quantity:", newQuantity);

            existingItem.find(".item-quantity").text(newQuantity);
            existingItem.find(".item-price").text(`${currency} ${e.product[2]}`);

            let totalPrice = newQuantity * parseInt(e.product[2]);
            existingItem.find(".item-subtotal").text(`${currency} ${totalPrice}`);

        }

    });


window.Echo.private(`SaleCustomerDisplayProductUpdate.${current_user_id}`)
    .listen("SaleCustomerDisplayProductUpdate", (e) => {
        // console.log("Received Product Data:", e.product);

        let productCodes = e.product["product_code"];
        let productQtys = e.product["product_qty"];
        let productUnitPrices = e.product["product_unit_price"];
        let productSubtotals = e.product["product_subtotal"];
        let productDiscounts = e.product["product_discount"];
        let taxNames = e.product["tax_name"];
        let taxRates = e.product["tax_rate"];

        let orderTaxRate = parseInt(e.product["order_tax_rate"]);
        let orderDiscountType = e.product["order_discount_type"];
        let orderDiscountValue = e.product["order_discount_value"] !== null && e.product["order_discount_value"] !== undefined
            ? parseInt(e.product["order_discount_value"])
            : 0;

        let copounType = e.product["copoun_type"];
        let copounAmount = e.product["copoun_amount"];
        let copounGrandTotal = e.product["copoun_grand_total"];

        for (let i = 0; i < productCodes.length; i++) {
            let productCode = productCodes[i];
            let productQty = parseInt(productQtys[i]) || 0;
            let productUnitPrice = parseFloat(productUnitPrices[i]) || 0;
            let productSubtotal = parseFloat(productSubtotals[i]) || 0;
            let productDiscount = parseFloat(productDiscounts[i]) || 0;
            let taxName = taxNames[i] || "No Tax";
            let taxRate = parseFloat(taxRates[i]) || 0;

            // Check if product name is available, otherwise keep the existing name
            let productName = e.product["product_name"] && e.product["product_name"][i]
                ? e.product["product_name"][i]
                : $(".item[data-product-id='" + productCode + "'] .item-name").data("original-name") || "Unknown Product";

            let existingItem = $(".item[data-product-id='" + productCode + "']");

            if (existingItem.length === 0) {
                $(".items-container").append(`
                    <div class="item" data-product-id="${productCode}">
                       <span class="item-name" data-original-name="${productName}">${productName} </br> ${productCode}</span>
                       <span class="item-quantity">${productQty}</span>
                       <span class="item-price">${currency} ${productUnitPrice}</span>
                       <span class="item-subtotal">${currency} ${productSubtotal}</span>
                    </div>
                `);
            } else {
                existingItem.find(".item-quantity").text(productQty);
                existingItem.find(".item-price").text(`${currency} ${productUnitPrice}`);
                existingItem.find(".item-subtotal").text(`${currency} ${productSubtotal}`);
            }
        }

        // Handle Coupon
        $(".summary .total-row .coupon-discount").closest(".total-row").remove();
        if (copounType !== null && copounType !== undefined && copounGrandTotal >= 0) {
            $(".summary").prepend(`
                <div class="total-row">
                    <span class="coupon-discount">Coupon Discount</span>
                    <span>(${copounType} ${copounAmount})</span>
                </div> 
            `);
        }

        // Handle Taxes
        $(".summary .total-row .order-tax, .summary .total-row .order-discount").closest(".total-row").remove();
        for (let i = 0; i < productCodes.length; i++) {
            let taxName = taxNames[i];
            let taxRate = parseFloat(taxRates[i]) || 0;
            let productName = $(".item[data-product-id='" + productCodes[i] + "'] .item-name").data("original-name");

            if (taxName !== "No Tax" && $(".summary .total-row span[data-productName='" + productName + "']").length === 0) {
                $(".summary").prepend(`
                    <div class="total-row">
                        <span data-productName="${productName}">Product Tax (${productName})</span>
                        <span>(%${taxRate})</span>
                    </div> 
                `);
            }
        }




        $(".summary .total-row .order-tax, .summary .total-row .order-discount").closest(".total-row").remove();

        if (orderDiscountValue > 0) {
            let discountLabel = orderDiscountType === "Flat"
                ? `${currency} (${orderDiscountValue})`
                : `(% ${orderDiscountValue})`;

            $(".summary").prepend(`
            <div class="total-row">
                <span class="order-discount">Order Discount</span>
                <span data-order-discount-type="${orderDiscountType}">${discountLabel}</span>
            </div> 
        `);

        }


        if (orderTaxRate !== 0) {
            $(".summary").prepend(`
            <div class="total-row">
                <span class="order-tax">Order Tax </span>
                <span>(%${orderTaxRate})</span>
            </div> 
        `);
        }



        // Total = parseFloat(Total.toFixed(2));
        // $(".total-row.grand-total span:last-child").text(currency + " " + Total);
    });



window.Echo.private(`ClearCustomerDisplay.${current_user_id}`)
    .listen("ClearCustomerDisplay", (e) => {
        // console.log(e.message);
        localStorage.clear();
        sessionStorage.clear();
        $(".items-container").html("");
        $(".total-row").not(".grand-total").remove();
        $(".total-row.grand-total span:last-child").text("0.00");

    });



window.Echo.private(`ProductDeleteFromCD.${current_user_id}`)
    .listen(".ProductDeleteFromCD", (e) => {
        // console.log("Deleting Product:", e);
        let priceElement = $(".total-row.grand-total span:last-child").text();
        let Total = parseFloat(priceElement.replace(currency, "").trim())

        let productCodes = e.product["product_code"];
        // console.log(productCodes);

        const items = document.querySelectorAll(".items-container .item");

        items.forEach(item => {
            const productId = item.getAttribute("data-product-id");

            if (!productCodes.includes(productId)) {
                let productAmount = item.querySelector(".item-subtotal").textContent;
                productAmount = parseFloat(productAmount.replace(currency, "").trim());
                Total -= productAmount;
                item.remove();
                $(".total-row.grand-total span:last-child").text(currency + " " + Total);
            }
        });

        const remainingItems = document.querySelectorAll(".items-container .item");

        if (remainingItems.length === 0) {
            $(".total-row").not(".grand-total").remove();
            $(".total-row.grand-total span:last-child").text("0.00");
        }

    });
window.Echo.private(`AddProductCD.${current_user_id}`)
    .listen("AddProductCD", (e) => {
        // console.log("Adding Product " + e.product_code);

        const items = document.querySelectorAll(".items-container .item");

        items.forEach(item => {
            const productid = item.getAttribute("data-product-id");

            if (e.product_code.includes(productid)) {
                // Get current quantity and price
                let qtyElement = item.querySelector(".item-quantity");
                let priceElement = item.querySelector(".item-price");
                let subtotalElement = item.querySelector(".item-subtotal");

                let qty = parseInt(qtyElement.textContent);
                let price = parseFloat(priceElement.textContent.replace(currency, "").trim());

                qty += 1;

                let newSubtotal = qty * price;

                qtyElement.textContent = qty;
                subtotalElement.textContent = `${currency} ${newSubtotal}`;

                // console.log(`Updated Product ${productid}: Qty = ${qty}, Subtotal = ${currency} ${newSubtotal}`);
            }
        });


    });


window.Echo.private(`SubtractProductCD.${current_user_id}`)
    .listen("SubtractProductCD", (e) => {
        // console.log("Subtracting Product " + e.product_code);

        const items = document.querySelectorAll(".items-container .item");

        items.forEach(item => {
            const productid = item.getAttribute("data-product-id");

            if (e.product_code.includes(productid)) {
                // Get current quantity and price
                let qtyElement = item.querySelector(".item-quantity");
                let priceElement = item.querySelector(".item-price");
                let subtotalElement = item.querySelector(".item-subtotal");

                let qty = parseInt(qtyElement.textContent);
                let price = parseFloat(priceElement.textContent.replace(currency, "").trim());

                qty -= 1;

                let newSubtotal = qty * price;

                qtyElement.textContent = qty;
                subtotalElement.textContent = `${currency} ${newSubtotal}`;

                // console.log(`Updated Product ${productid}: Qty = ${qty}, Subtotal = ${currency} ${newSubtotal}`);
            }
        });


    });



window.Echo.private(`CDUpdateGrandTotal.${current_user_id}`)
    .listen("CDUpdateGrandTotal", (e) => {
        // console.log("Updating GrandTOtal ");
        // console.log("GrandTOtal is: " + e.grand_total);
        $(".total-row.grand-total span:last-child").text(currency + " " + e.grand_total);
    })