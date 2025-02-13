<?php

namespace App\Http\Controllers;

use App\Models\Attendance;
use App\Models\Employee;
use App\Models\HrmSetting;
use App\Models\OutOfShift;
use App\Models\zktecoConfig;
use Carbon\Carbon;
use DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Rats\Zkteco\Lib\ZKTeco;
use Spatie\Permission\Models\Role;

class AttendanceController extends Controller
{
    public function index()
    {
        $role = Role::find(Auth::user()->role_id);
        if ($role->hasPermissionTo('attendance')) {
            $lims_employee_list = Employee::where('is_active', true)->get();
            $lims_hrm_setting_data = HrmSetting::latest()->first();
            $general_setting = DB::table('general_settings')->latest()->first();
            if (Auth::user()->role_id > 2 && $general_setting->staff_access == 'own') {
                $lims_attendance_data = Attendance::leftJoin('employees', 'employees.id', '=', 'attendances.employee_id')
                    ->leftJoin('users', 'users.id', '=', 'attendances.user_id')
                    ->orderBy('attendances.date', 'desc')
                    ->where('attendances.user_id', Auth::id())
                    ->select(['attendances.*', 'employees.name as employee_name', 'users.name as user_name'])
                    ->get()
                    ->groupBy(['date', 'employee_id']);
            } else {
                $lims_attendance_data = Attendance::leftJoin('employees', 'employees.id', '=', 'attendances.employee_id')
                    ->leftJoin('users', 'users.id', '=', 'attendances.user_id')
                    ->orderBy('attendances.date', 'desc')
                    ->select(['attendances.*', 'employees.name as employee_name', 'users.name as user_name'])
                    ->get()
                    ->groupBy(['date', 'employee_id']);
            }

            $lims_attendance_all = [];
         

            foreach ($lims_attendance_data as $attendance_data) {
                foreach ($attendance_data as $data) {
                    $checkin_checkout = '';
                    $status_list = '';
                    foreach ($data as $key => $dt) {
                        $date = $dt->date;
                        $employee_name = $dt->employee_name;
                        $checkin_checkout .= (($dt->checkin != null) ? $dt->checkin : 'N/A') . ' - ' . (($dt->checkout != null) ? $dt->checkout : 'N/A') . '<br>';
                        $status = $dt->status;
                        $status_list .= $status . ' <br> '; 
                        $user_name = $dt->user_name;
                        $employee_id = $dt->employee_id;
                    }
                    $lims_attendance_all[] = ['date' => $date, 'employee_name' => $employee_name,
                        'checkin_checkout' => $checkin_checkout, 'status_list' => $status_list,
                        'user_name' => $user_name, 'employee_id' => $employee_id];
                }
            }

            foreach ($lims_attendance_all as &$attendance) {
                $attendance['status_list'] = array_filter(array_map('trim', explode('<br>', $attendance['status_list'])),
            function($value){
                return $value !== '';
            }
            );
            }

            // return $lims_attendance_all;
            $shifts = HrmSetting::all();
        
            return view('backend.attendance.index', compact('shifts', 'lims_employee_list', 'lims_hrm_setting_data', 'lims_attendance_all'));
        } else {
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
        }

    }

    public function getShiftEmployee($id)
    {
        $employee = Employee::find($id);

        if (!$employee) {
            return response()->json([
                'status' => false,
                'message' => 'Employee does not exist',
            ], 404);
        }
        $shifts = $employee->getShifts();

        if ($shifts->isEmpty()) {
            return response()->json([
                'employee_id' => $employee->id,
                'employee_name' => $employee->name,
                'message' => 'No shift assigned to this employee.',
            ], 404);
        }

        return response()->json([
            'employee_id' => $employee->id,
            'employee_name' => $employee->name,
            'shifts_details' => $shifts,
        ], 200);

    }
    public function create()
    {
        //
    }

    public function pollZkDevice()
    {
        $zktecoIps = zktecoConfig::all();
        foreach($zktecoIps as $zkteco){
            $zk = new ZKTeco($zkteco->ip_address);
            if ($zk->connect()) {
    
                $attendenceRecords = $zk->getAttendance();
                foreach ($attendenceRecords as $record) {
                    // Log::info($record);
                    if ($record['type'] == 1) {
                        $this->checkin($record['id']);
                    } elseif ($record['type'] == 2) {
                        $this->checkout($record['id'], $record['timestamp']);
                    }
                }
    
            } else {
                return "Device Not Connected";
            }
        }
        
    }

    private function checkin($employee_id)
    {
        $zktecoIps = zktecoConfig::all();
    
        foreach ($zktecoIps as $zkteco) {
            $zk = new ZKTeco($zkteco->ip_address);
    
            if ($zk->connect()) {
                $attendance = $zk->getAttendance();
                $parsedTime = [];
                $employeeIds = [];
    
                foreach ($attendance as $record) {
                    $parsedTime[] = Carbon::parse($record['timestamp'])->format('H:i:s');
                    $employeeIds[] = $record['id'];
                    Log::info("EmployeeIds : " . $record['id']);
                }
    
                $employee = Employee::where('id', $employee_id)
                    ->whereNotNull('shift')
                    ->whereNotNull('shift_days')
                    ->first();
    
                if (empty($employee)) {
                    Log::info("No Employee Found Within The Condition");
                    $zk->clearAttendance();
                    exit();
                }
    
                // Get employee shifts
                $shifts = $employee->getShifts();
                $shift_ids = $shifts->pluck('id')->toArray();
                $employeeShifts = HrmSetting::whereIn('id', $shift_ids)->get();
    
                Log::info("Shifts Of Employee: " . json_encode($employeeShifts));
    
                foreach ($parsedTime as $time) {
                    $currentTime = Carbon::parse($time)->format('H:i:s');
                    $status = 0;
    
                    foreach ($employeeShifts as $shift) {
                        if ($shift->checkin && $shift->checkout) {
                            $checkin = Carbon::createFromFormat('h:iA', $shift->checkin)->format('H:i:s');
                                $checkout = Carbon::createFromFormat('h:iA', $shift->checkout)->format('H:i:s');
                                $beginning_in = Carbon::createFromFormat('h:iA', $shift->beginning_in)->format('H:i:s');
                                $ending_out = Carbon::createFromFormat('h:iA', $shift->ending_out)->format('H:i:s');
                            }

    
                            Log::info("CurrentTime; " . $currentTime . ' ' . 'Beginning In Time: ' . $beginning_in);

                        if (Carbon::now()->format('H:i:s') < $beginning_in) {
                            $this->outOfShift($beginning_in, $employee->id, $currentTime, $zk);
                            continue;

                        } elseif (Carbon::now()->format('H:i:s') > $beginning_in ) {
                            $latestAttendance = Attendance::where('employee_id', $employee_id)
                                ->where('date', now()->format('Y-m-d'))
                                ->whereNotNull('checkin')
                                ->whereNull('checkout')
                                ->first();
    
                            if ($latestAttendance) {
                                $zk->clearAttendance();
                                Log::info("Incomplete Attendance Found: " . $latestAttendance);
                                exit();
                            }
    
                            if ($currentTime <= $checkin) {
                                $status = 1;
                                Log::info("STATUS OF EMPLOYEE CHECKIN: PRESENT ");
                            } else if ($currentTime > $checkin && $currentTime <= $checkout) {
                                $status = 0;
                                Log::info("STATUS OF EMPLOYEE CHECKIN: LATE ");
                            } else if ($currentTime > $checkout) {
                                continue;
                            }
    
                            $timeWindowStart = Carbon::now()->subMinutes(5);
                            $timeWindowEnd = Carbon::now()->addMinutes(5);
    
                            foreach ($employeeIds as $id) {
                                $attendanceRecord = Attendance::where('employee_id', $id)
                                    ->first();
    
                                if (!empty($attendanceRecord)) {
                                    Log::info("attendanceRecord " . $attendanceRecord);
                                    $shiftStart = Carbon::createFromFormat('H:i:s', $attendanceRecord->checkin);
                                    $shiftEnd = Carbon::createFromFormat('H:i:s', $attendanceRecord->checkout) ?? NULL;
    
                                    $completedShiftAttendance = Attendance::where('employee_id', $employee_id)
                                        ->where('date', now()->format('Y-m-d'))
                                        ->whereNotNull('checkout')
                                        ->where(function ($query) use ($shiftStart, $shiftEnd) {
                                            $query->whereBetween('checkin', [$shiftStart, $shiftEnd])
                                                ->orWhereBetween('checkout', [$shiftStart, $shiftEnd]);
                                        })
                                        ->first();
    
                                    if ($completedShiftAttendance) {
                                        Log::info("Completed Shift Caught - Going Duplicate");
                                        exit();
                                    }
                                }
    
                                $currentCheckinTime = Carbon::now()->format('H:i:s');
    
                                if ($currentCheckinTime >= $timeWindowStart->format('H:i:s') && $currentCheckinTime <= $timeWindowEnd->format('H:i:s')) {
                                    $existingAttendance = Attendance::where('employee_id', $id)
                                        ->where('date', now()->format('Y-m-d'))
                                        ->where('checkin', $currentCheckinTime)
                                        ->first();
    
                                    Log::info("Checking for Existing Attendance for Employee ID: " . $id . " => " . $existingAttendance);
    
                                    if (!$existingAttendance) {
                                        $create = Attendance::create([
                                            'date' => now()->format('Y-m-d'),
                                            'employee_id' => $id,
                                            'checkin' => $currentCheckinTime,
                                            'checkout' => null,
                                            'status' => $status,
                                            'user_id' => 0,
                                        ]);
    
                                        Log::info("Attendance Created for Employee ID: " . $id . " at " . $currentCheckinTime);
                                    } else {
                                        Log::info("Attendance Already Exists for Employee ID: " . $id);
                                    }
                                } else {
                                    Log::info("Current time is outside the allowed check-in window for Employee ID: " . $id);
                                }
                            }
    
                            if (isset($create) && $create) {
                                Log::info("Attendance Created for Employee ID: " . $id . " at " . $currentTime);
                                $zk->clearAttendance();
                            }
                        }
                    }
                }
            }
        }
    }
    

        private function outOfShift($beginning_in, $employeeId, $currentTime, $zk)
        {
            Log::info("Current Time " . $currentTime);
            Log::info("Beginning In Time " . $beginning_in);
            Log::info("Employee Id " . $employeeId);
        
            $exists = OutOfShift::where('employee_id', $employeeId)
                ->whereDate('created_at', now()->format('Y-m-d'))
                ->where('type', 1)
                ->first();
        
            if ($exists) {
                Log::info("Already Out of Shift");
                return; 
            } else {
                $out = OutOfShift::create([
                    'employee_id' => $employeeId,
                    'type' => 1,
                ]);
        
                if ($out) {
                    Log::info("Out Of Shift Added On Table");
                }
            }
        
    }

 
    
    // private function checkin($employee_id)
    // {
    //     $zkteco = zktecoConfig::first();
    //     $zk = new ZKTeco($zkteco->ip_address);
    //     if ($zk->connect()) {

    //         $attendance = $zk->getAttendance();

    //         $parsedTime[] = [];

    //         foreach ($attendance as $record) {
    //             $time = Carbon::parse($record['timestamp'])->format('H:i:s');
    //             $parsedTime[] = $time;
    //         }

    //         $employee = Employee::where('id', $employee_id)->first();
    //         $shifts = $employee->getShifts();
    //         $shift_ids = $shifts->pluck('id')->toArray();
    //         $employeeShifts = HrmSetting::whereIn('id', $shift_ids)->get();
    //         Log::info("Shifts Of Employee : " . $employeeShifts);

    //         foreach ($parsedTime as $time) {
    //             $currentTime = Carbon::parse($time)->format('H:i:s');
    //             $status = 0; // Default status: Late

    //             // Iterate through shifts to find matching check-in
    //             foreach ($employeeShifts as $shift) {
    //                 // Parse shift times to 24-hour format for comparison
    //                 $checkin = Carbon::createFromFormat('h:iA', $shift->checkin)->format('H:i:s');
    //                 $checkout = Carbon::createFromFormat('h:iA', $shift->checkout)->format('H:i:s');

    //                 Log::info("Current Time: $currentTime, Checkin Time: $checkin, Checkout Time: $checkout");

    //                 // Check if current time is before checkin time
    //                 if ($currentTime < $checkin) {
    //                     // Mark as Present if the employee arrives before their scheduled check-in
    //                     $status = 1; // Present
    //                     Log::info("STATUS OF EMPLOYEE CHECKIN: Present (Arrived Early)");
    //                     break; // Exit shift loop if present
    //                 }
    //                 // Check if current time is between checkin and checkout
    //                 else if ($currentTime >= $checkin && $currentTime <= $checkout) {
    //                     // Mark as Present if they arrive within the shift hours
    //                     $status = 1; // Present
    //                     Log::info("STATUS OF EMPLOYEE CHECKIN: Present (Arrived On Time)");
    //                     break; // Exit shift loop if present
    //                 }
    //                 // If the employee checks in after the current shift's checkout time
    //                 else if ($currentTime > $checkout) {
    //                     // Check for next shifts to determine presence
    //                     continue; // Check next shift
    //                 }
    //             }

    //             $existingAttendance = Attendance::where('employee_id', $employee->id)
    //             ->where('checkin', $currentTime)
    //             ->where('date', now()->format('Y-m-d'))
    //             ->first();

    //         Log::info("Existing Attendance: " . json_encode($existingAttendance));

    //         if (!$existingAttendance) {
    //             // Create attendance record
    //             $create = Attendance::create([
    //                 'date' => now()->format('Y-m-d'),
    //                 'employee_id' => $employee->id,
    //                 'checkin' => $currentTime,
    //                 'checkout' => null,
    //                 'status' => $status,
    //                 'user_id' => 0,
    //                 'shift_id' => $shift->id // Track the shift ID associated with this attendance
    //             ]);

    //             if ($create) {
    //                 $zk->testVoice(); // Trigger test voice if needed
    //                 Log::info("Attendance Created for Employee ID: " . $employee->id . " at " . $currentTime);
    //                 $zk->clearAttendance(); // Clear attendance records from the device to avoid duplicate entries
    //                 $zk->disconnect(); // Disconnect after successful attendance marking
    //             }
    //         } else {
    //             Log::info("Attendance Already Exists for Employee ID: " . $employee->id . " at " . $currentTime);
    //         }
    //     }
    //     }
    // }
    // foreach($employeeShifts as $shift){

    //     $checkin = Carbon::createFromFormat('h:iA',$shift->checkin)->format('H:i:s');
    //     $checkout = Carbon::createFromFormat('h:iA',$shift->checkout)->format('H:i:s');
    //     $currentTime = Carbon::parse($time)->format('H:i:s');

    //     if($currentTime >= $checkin && $currentTime <= $checkout){

    //         $status = ($currentTime <= $checkin) ? 1 : 0;

    //         Log::info("STATUS OF EMPLOYEE CHECKIN : " . ($status) === 1 ? 'Present' : 'Late');

    //         $exitingAttendance = Attendance::where('employee_id',$employee->id)
    //         ->where('checkin',$currentTime)
    //         ->where('date', now()->format('Y-m-d'))->first();

    //         Log::info("Exsiting Attendance : " . $exitingAttendance);

    //         // exit();
    //         if(!$exitingAttendance){
    //           $create =   Attendance::create([
    //                 'date' => now()->format('Y-m-d'),
    //                 'employee_id' => $employee->id,
    //                 'checkin' => $currentTime,
    //                 'checkout' => null,
    //                 'status' => $status,
    //                 'user_id' => 0
    //             ]);

    //             if($create){
    //                 $zk->testVoice();
    //                 Log::info("Attendance Created : " . $create);
    //                 $zk->clearAttendance();
    //                 $zk->disconnect();
    //             }
    //         }
    //     }
    // }

    // foreach($parsedTime as $time){
    //     $lims_hrm_setting_data = HrmSetting::all()->filter(function( $shift ) use ($time){
    //         $checkinTime = Carbon::createFromFormat('h:iA', $shift->checkin)->format('H:i:s');
    //         $checkin = Carbon::parse($shift->checkin)->format('H:i:s');
    //         // Log::info("HRM Time : " . $checkin);
    //         return $time <= $checkin ;
    //     })->first();

    //     Log::info("HRM PREVIEW: " . $lims_hrm_setting_data);
    //     Log::info("Parsed Time::  " .  Carbon::parse($time)->format('H:i:s'));

    //     $parsed = Carbon::parse($time)->format('H:i:s');
    //     Log::info("TIME: " . $parsed);
    //     exit();

    //     $checkin = $lims_hrm_setting_data->checkin;
    //     Log::info("Checkin CHekcing : " . $checkin);

    //     $attendance = Attendance::where('employee_id', $employee_id)->where('checkin',$parsed)->where('date',now()->format('Y-m-d'))->first();
    //     Log::info("Attandences : ". $attendance);
    //     if(!$attendance){
    //         $create = Attendance::create([
    //             'employee_id' => $employee_id,
    //             'user_id' => 0,
    //             'date' => now()->format('Y-m-d'),
    //             'checkin' => $parsed,
    //             'status' => $lims_hrm_setting_data ? 1 : 0
    //         ]);
    //         if($create){
    //             $zk->testVoice();
    //             $zk->disconnect();
    //             $zk->clearAttendance();
    //             Log::info("Checkin Created");
    //         }
    //     }else{
    //         Log::info("attendence Already Exists");
    //     }

    // }

    private function checkout($employee_id, $time)
    {
        $zktecoIps = zktecoConfig::all();
        foreach ($zktecoIps as $zkteco) {
            $zk = new ZKTeco($zkteco->ip_address);
            if ($zk->connect()) {
    
                $employee = Employee::find($employee_id);
                $parsedTime = Carbon::parse($time)->format('H:i:s');
                Log::info("Parsed Checkout Time: " . $parsedTime);

                $shifts = $employee->getShifts();
                $shift_ids = $shifts->pluck('id')->toArray();
                $employeeShifts = HrmSetting::whereIn('id', $shift_ids)->get();
                
                foreach($employeeShifts as $shift){
                    $checkin = Carbon::createFromFormat('h:iA', $shift->checkin)->format('H:i:s');
                    $checkout = Carbon::createFromFormat('h:iA', $shift->checkout)->format('H:i:s');
                    $ending_out = Carbon::createFromFormat('h:iA', $shift->ending_out)->format('H:i:s');

                    Log::info('Shift Of Checkout Employee: ' . $shift);


                    $attendance = Attendance::where('employee_id', $employee_id)
                    ->whereDate('date', now()->format("Y-m-d"))
                    ->whereNull('checkout') 
                    ->first();
    
                Log::info("CHECKOUT DETAILS: " . json_encode($attendance));
    
                if ($attendance) {
                    $defaultEndingOut = $ending_out; 
                    $defaultEndingOut = Carbon::createFromFormat('H:i:s', $defaultEndingOut);
    
                  
                    $attendance->update([
                        'checkout' => $parsedTime,
                    ]);
                    Log::info("Checkout Time Updated: " . $parsedTime);
    
                   
                    if ($defaultEndingOut->isPast() && Carbon::parse($parsedTime)->gt($defaultEndingOut)) {
                        $exists = OutOfShift::where('employee_id', $employee_id)
                            ->whereDate('created_at', now()->format('Y-m-d'))
                            ->where('type', 2) 
                            ->first();
    
                        if (!$exists) {
                            OutOfShift::create([
                                'employee_id' => $employee_id,
                                'type' => 2, 
                            ]);
                            Log::info("Late Checkout Caught And Stored In Table");
                        } else {
                            Log::info("Already Late Checkout Caught And Stored In Table");
                        }
                    }
                    $zk->clearAttendance();
                    Log::info("Check Out Success");
                } else {
                    Log::info("No attendance record found for checkout.");
                }

                }
    
              
            }
        }
    }
    

    public function store(Request $request)
    {
        $data = $request->all();
        // return$data['checkin'];
        // return $request->date;
        $date = Carbon::parse($request->date)->format('Y-m-d');
        $checkinTimee = Carbon::parse($request->checkin)->format('H:i:s');
        $employee_id = $data['employee_id'];
        $lims_hrm_setting_data = HrmSetting::where('checkin',$checkinTimee )->first();
        // return $lims_hrm_setting_data;
        $checkin = $lims_hrm_setting_data->checkin ?? $request->checkin;
        $data['date'] = date('Y-m-d', strtotime(str_replace('/', '-', $data['date'])));
        $data['user_id'] = Auth::id();
        $lims_attendance_data = Attendance::where('checkin', $checkin)->where('employee_id', $employee_id)
        ->where('date',$date)
        ->first();
        //    return $lims_attendance_data;
        if ($lims_attendance_data) {
            Toastr()->error("Duplicate Entry Not Allowed");
            return redirect()->route('attendance.index');
        }
        $data['employee_id'] = $employee_id;
        if (!$lims_attendance_data) {
            $currentTime = Carbon::now()->format('H:i:s');
            $checkinTime = Carbon::parse($request->checkin)->format('H:i:s');

            //    return "Chekin Time: " . $checkinTime . ' ' . " Current Time; " . $currentTime . ' ' . "App Time Zone: " . config('app.timezone');

            $status = null;
            if ($currentTime > $checkinTime) {
                $status = 0;
            } else if($currentTime <= $checkinTime) {
                $status = 1;
            }
                   
            

            $data['status'] = $status;
            Log::info("Status: " . json_encode($data['status']));
            // return $data['status'];

            Attendance::create($data);
        } else {
            $data['status'] = $lims_attendance_data->status;
        }

        return redirect()->back()->with('message', 'Attendance created successfully');
    }

    public function importDeviceCsv(Request $request)
    {
        $upload = $request->file('file');
        if ($request->Attendance_Device_date_format == null || $upload == null) {
            return redirect()->back()->with('not_permitted', 'Please select Attendance Device Date Format and upload a CSV file');
        }

        $ext = pathinfo($upload->getClientOriginalName(), PATHINFO_EXTENSION);
        if ($ext != 'csv') {
            return redirect()->back()->with('not_permitted', 'Please upload a CSV file');
        }

        $filename = $upload->getClientOriginalName();
        $filePath = $upload->getRealPath();
        //open and read
        $file = fopen($filePath, 'r');
        $exclude_header = fgetcsv($file);

        $employee_all = Employee::all();
        $lims_hrm_setting_data = HrmSetting::latest()->first();
        $checkin = $lims_hrm_setting_data->checkin;
        $data = [];
        //looping through other columns
        while ($columns = fgetcsv($file)) {
            if ($columns[0] == "" || $columns[1] == "") {
                continue;
            }

            $staff_id = $columns[0];
            $employee = $employee_all->where('staff_id', $staff_id)->first();
            if (!$employee) {
                return redirect()->back()->with('not_permitted', 'Staff id - ' . $staff_id . ' is not available within the POS system');
            }

            $dt_time = explode(' ', $columns[1], 2);
            $attendance_date = Carbon::createFromFormat($request->Attendance_Device_date_format, $dt_time[0])->format('Y-m-d');
            $attendance_time = str_replace(' ', '', $dt_time[1]);
            $i = 0;
            $status = 0;
            foreach ($data as $key => $dt) {
                if ($dt['date'] == $attendance_date && $dt['employee_id'] == $employee->id) {
                    $status = $dt['status'];
                    $i++;
                    if ($dt['checkout'] == null) {
                        $data[$key]['checkout'] = $attendance_time;
                        $i = -1;
                        break;
                    }
                }
            }
            //checkout update
            if ($i == -1) {
                continue;
            }
            //create attendance at first time for the employee and date
            elseif ($i == 0) {
                $diff = strtotime($checkin) - strtotime($attendance_time);
                if ($diff >= 0) {
                    $status = 1;
                } else {
                    $status = 0;
                }

                $data[] = ['date' => $attendance_date, 'employee_id' => $employee->id, 'user_id' => Auth::id(),
                    'checkin' => $attendance_time, 'checkout' => null, 'status' => $status];
            }
            //create attendance after first time
            else {
                $data[] = ['date' => $attendance_date, 'employee_id' => $employee->id, 'user_id' => Auth::id(),
                    'checkin' => $attendance_time, 'checkout' => null, 'status' => $status];
            }
        }
        //create composite via migration with this 2nd array parameter
        Attendance::upsert($data, ['date', 'employee_id', 'checkin'], ['checkout']);
        return redirect()->back()->with('message', 'Attendance created successfully');
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function deleteBySelection(Request $request)
    {
        $attendance_selected = $request['attendanceSelectedArray'];
        foreach ($attendance_selected as $att_selected) {
            Attendance::wheredate('date', $att_selected[0])->where('employee_id', $att_selected[1])->delete();
        }
        return 'Attendance deleted successfully!';
    }

    public function delete($date, $employee_id)
    {
        Attendance::wheredate('date', $date)->where('employee_id', $employee_id)->delete();
        return redirect()->back()->with('not_permitted', 'Attendance deleted successfully');
    }
}
