<?php

namespace App\Console\Commands;

use App\Http\Controllers\AttendanceController;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class pollzkdevice extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:pollzkdevice';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Polling Zk Device';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $attendence = app(AttendanceController::class);
        $attendence->pollZkDevice();
        // Log::info("Polling Zk Device");
    }
}
