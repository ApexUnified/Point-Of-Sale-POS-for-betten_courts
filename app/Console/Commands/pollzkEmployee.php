<?php

namespace App\Console\Commands;

use App\Http\Controllers\EmployeeController;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Log;

class pollzkEmployee extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'app:pollzkEmployee';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'zkpollEmployee';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $employee = app(EmployeeController::class);
        $employee->pollzkEmployee();
        // Log::info("Employees Added From Device");
    }
}
