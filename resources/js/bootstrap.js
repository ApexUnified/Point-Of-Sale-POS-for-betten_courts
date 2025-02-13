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


        let totalprice = null;
        let productId = String(e.product[1]); // Convert to string if necessary

        let existingItem = $(".item[data-product-id='" + productId + "']");
        if (existingItem.length === 0) {
            $(".items-container").append(`
                    <div class="item" data-product-id="${productId}">
                       <span class="item-name">${e.product[0]} </br> ${productId} </span>
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

            let totalPrice = newQuantity * parseFloat(e.product[2]);
            existingItem.find(".item-subtotal").text(`${currency} ${totalPrice.toFixed(2)}`);

        }

        var total = 0;
        $(".items-container .item-subtotal").each(function () {
            var value = parseFloat($(this).text().replace(/[^0-9.]/g, ''));
            if (!isNaN(value)) {
                total += value;
            }
        });

        $(".total-row.grand-total span:last-child").text(currency + " " + total.toFixed(2));







    });
