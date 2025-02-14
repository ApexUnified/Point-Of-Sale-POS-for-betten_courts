<?php

/*
|--------------------------------------------------------------------------
| Broadcast Channels
|--------------------------------------------------------------------------
|
| Here you may register all of the event broadcasting channels that your
| application supports. The given channel authorization callbacks are
| used to check if an authenticated user can listen to the channel.
|
*/

use Illuminate\Support\Facades\Broadcast;

Broadcast::channel("SaleProductUpdateCD.{user_id}", function ($user, $user_id) {
    return (int) $user->id === (int) $user_id;
});
Broadcast::channel("SaleCustomerDisplayProductUpdate.{user_id}", function ($user, $user_id) {
    return (int) $user->id === (int) $user_id;
});
Broadcast::channel("ClearCustomerDisplay.{user_id}", function ($user, $user_id) {
    return (int) $user->id === (int) $user_id;
});
