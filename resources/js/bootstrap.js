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
        console.log("Event Fired for " + current_user_id);
        console.log(e.product);


        let productcode = String(e.product[1]); // Convert to string if necessary

        let existingItem = $(".item[data-product-id='" + productcode + "']");
        if (existingItem.length === 0) {
            $(".items-container").append(`
                    <div class="item" data-product-id="${productcode}">
                       <span class="item-name">${e.product[0]} </br> ${productcode} </span>
                       <span class="item-quantity">${e.product[5]}</span>
                       <span class="item-price">${currency} ${e.product[2]}</span>
                       <span class="item-subtotal">${currency} ${e.product[2]}</span>
                   </div>
               `);
        } else {
            let currentQuantity = parseInt(existingItem.find(".item-quantity").text()) || 0;
            console.log(currentQuantity);

            let newQuantity = currentQuantity + parseInt(e.product[5]);
            console.log("Updated Quantity:", newQuantity);

            existingItem.find(".item-quantity").text(newQuantity);
            existingItem.find(".item-price").text(`${currency} ${e.product[2]}`);

            let totalPrice = newQuantity * parseInt(e.product[2]);
            existingItem.find(".item-subtotal").text(`${currency} ${totalPrice}`);

        }

        var total = 0;
        $(".items-container .item-subtotal").each(function () {
            var value = parseFloat($(this).text().replace(/[^0-9.]/g, ''));
            if (!isNaN(value)) {
                total += value;
            }
        });

        $(".total-row.grand-total span:last-child").text(currency + " " + total);
    });


window.Echo.private(`SaleCustomerDisplayProductUpdate.${current_user_id}`)
    .listen("SaleCustomerDisplayProductUpdate", (e) => {
        console.log("Received Product Data:", e.product);

        let productCode = e.product["product_code"];
        let productName = e.product["product_name"];
        let productQty = parseInt(e.product["product_qty"]);
        let productUnitPrice = parseInt(e.product["product_unit_price"]);
        let productSubtotal = parseInt(e.product["product_subtotal"]);
        let product_discount = parseInt(e.product["product_discount"]);
        let taxName = e.product["tax_name"];
        let taxRate = parseInt(e.product["tax_rate"]);
        let orderTaxRate = parseInt(e.product["order_tax_rate"]);
        let order_discount_type = e.product["order_discount_type"];
        let order_discount_value = e.product["order_discount_value"] !== null && e.product["order_discount_value"] !== undefined
            ? parseInt(e.product["order_discount_value"])
            : 0;

        let existingItem = $(".item[data-product-id='" + productCode + "']");

        if (existingItem.length === 0) {
            // If product does not exist, add it to the list
            $(".items-container").append(`
                <div class="item" data-product-id="${productCode}">
                   <span class="item-name">${productName} </br> ${productCode} </span>
                   <span class="item-quantity">${productQty}</span>
                   <span class="item-price">${currency} ${productUnitPrice}</span>
                   <span class="item-subtotal">${currency} ${productSubtotal}</span>
               </div>
           `);
        } else {
            existingItem.find(".item-name").html(`${productName} </br> ${productCode}`);
            existingItem.find(".item-quantity").text(productQty);
            existingItem.find(".item-price").text(`${currency} ${productUnitPrice}`);
            existingItem.find(".item-subtotal").text(`${currency} ${productSubtotal}`);
        }

        // Recalculate Grand Total
        let Total = 0;
        $(".items-container .item-subtotal").each(function () {
            let value = parseFloat($(this).text().replace(/[^0-9.]/g, ''));
            if (!isNaN(value)) {
                Total += value;
            }
        });



        if (
            e.product["copoun_type"] !== null && e.product["copoun_type"] !== undefined &&
            e.product["copoun_grand_total"] !== null && e.product["copoun_grand_total"] !== undefined &&
            e.product["copoun_grand_total"] >= 0
        ) {


            let DiscountedAmount = 0;

            // 🔹 Fixed Coupon Logic
            if (e.product["copoun_type"] === "fixed") {
                DiscountedAmount = e.product["copoun_amount"];
            }
            // 🔹 Percentage Coupon Logic
            else if (e.product["copoun_type"] === "percentage") {
                DiscountedAmount = (Total * e.product["copoun_amount"]) / 100;
            }

            Total -= DiscountedAmount;

            $(".summary .total-row .coupon-discount").closest(".total-row").remove();
            $(".summary").prepend(`
                <div class="total-row">
                    <span class="coupon-discount">Coupon Discount</span>
                    <span>(${e.product["copoun_type"]} ${e.product["copoun_amount"]})</span>
                </div> 
            `);


            console.log("🟢 Coupon Applied: " + e.product["copoun_type"]);
            console.log("🟡 Discounted Amount: " + DiscountedAmount);
            console.log("🔴 Total After Coupon: " + Total);
        }




        if (taxName !== "No Tax" && $(".summary .total-row span[data-productName='" + productName + "']").length === 0) {
            $(".summary").prepend(`
                <div class="total-row">
                    <span data-productName="${productName}">Product Tax (${productName})</span>
                    <span>(%${taxRate})</span>
                </div> 
            `);
        }


        $(".summary .total-row .order-tax, .summary .total-row .order-discount").closest(".total-row").remove();

        let discountAmount = 0;
        if (order_discount_value > 0) {
            discountAmount = order_discount_type === "Flat"
                ? order_discount_value
                : (Total * order_discount_value) / 100;

            let discountLabel = order_discount_type === "Flat"
                ? `${currency} (${order_discount_value})`
                : `(% ${order_discount_value})`;

            $(".summary").prepend(`
        <div class="total-row">
            <span class="order-discount">Order Discount</span>
            <span data-order-discount-type="${order_discount_type}">${discountLabel}</span>
        </div> 
    `);

            Total -= discountAmount;
        }

        let taxAmount = (Total * orderTaxRate) / 100;
        Total += taxAmount;

        if (orderTaxRate !== 0) {
            $(".summary").prepend(`
        <div class="total-row">
            <span class="order-tax">Order Tax </span>
            <span>(%${orderTaxRate})</span>
        </div> 
    `);
        }



        Total = parseFloat(Total.toFixed(2));






        $(".total-row.grand-total span:last-child").text(currency + " " + Total);
    });



window.Echo.private(`ClearCustomerDisplay.${current_user_id}`)
    .listen("ClearCustomerDisplay", (e) => {
        console.log(e.message);
        localStorage.clear();
        sessionStorage.clear();
        $(".items-container").html("");
        $(".total-row").not(".grand-total").remove();
        $(".total-row.grand-total span:last-child").text("00,00");

    })