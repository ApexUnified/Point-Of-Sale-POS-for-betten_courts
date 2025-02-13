<?php

namespace App\Http\Controllers;

use App\Models\Biller;
use App\Models\Department;
use App\Models\Employee;
use App\Models\HrmSetting;
use App\Models\ShiftDay;
use App\Models\User;
use App\Models\Warehouse;
use App\Models\zktecoConfig;
use App\Traits\TenantInfo;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\Rule;
use Rats\Zkteco\Lib\ZKTeco;
use Spatie\Permission\Models\Role;

class EmployeeController extends Controller
{
    use TenantInfo;

    public function index()
    {
        // $employee = Employee::find(1);
        // return $employee->getShifts();
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('employees-index')){
            $permissions = Role::findByName($role->name)->permissions;
            foreach ($permissions as $permission)
                $all_permission[] = $permission->name;
            if(empty($all_permission))
                $all_permission[] = 'dummy text';
            $lims_employee_all = Employee::where('is_active', true)->get();
            $lims_department_list = Department::where('is_active', true)->get();
            $numberOfEmployee = Employee::where('is_active', true)->count();          
            $allShifts = HrmSetting::all();
            $shift_days = ShiftDay::all();
           

            return view('backend.employee.index', compact('allShifts','shift_days','lims_employee_all', 'lims_department_list', 'all_permission', 'numberOfEmployee'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }



    // This function is just for to check device is Connected or Not
    public function zkdeviceCheck(){
        $zktecoIps = zktecoConfig::all();
        $allUsers = [];
        $allAttendances = [];
        foreach($zktecoIps as $zkteco){
            $zk  = new ZKTeco($zkteco->ip_address);
            // return $zktecoIps;
            if($zk->connect()){
                // $zk->removeUser(104); 
                // $zk->testVoice();
                // $uid = 3; // Unique ID on the device
                // $userid = 3; // Employee ID from your system
                // $name = 'abdullah';
                // $password = '';
                // $role = 14; 
                // $cardno = 2239054;
                
                // $zk->setUser($uid, $userid, $name, $password, $role);
               
    
                // return    $zk->getAttendance(); 
                //   $zk->clearAttendance(); 
    
                // foreach($users as $user){
                //     if($user['userid']== 2){
                //         $fingerprint = enrollUser($user['userid']);
                //         return $user;
                //     }
                // }
                // // $fingerPrint = enrollUser
                // return $users;
                // $zk->setUser($uid, $userid, $name, $password,$role, $cardno);
                // $users = $zk->getUser();
                // return$users;
                $users = $zk->getUser();
                $allUsers[] = $users; 
                // $zk->clearAttendance();
                $allAttendances[] = $zk->getAttendance();
                // return $users;
                // return "Device Connected";
            }else{
                return "Device Not Connected";
            }
        }   
        // return $zk->devicename();
        // return $allUsers;
        return $allAttendances;
       
    }


    public function pollzkEmployee()
    {
        $zktecoIps = zktecoConfig::all();
        $employees = [];
    
        foreach ($zktecoIps as $zkteco) {
            $zk = new ZKTeco($zkteco->ip_address);
            if ($zk->connect()) {
                $users = $zk->getUser();

                foreach ($users as $user) {
                    // Log::info($user['name'] . ' ' . $user['userid']);
                    $employee =  Employee::where('id', '=' ,$user['userid'])->first();
                    // Log::info("USER : "  . $employee);
                    
                    if(!$employee){
                        $create = Employee::create([
                            'id' => $user['userid'],
                            'name' => $user['name'],
                            'department_id' => 1,
                            'is_active' => 1
                        ]);
                        Log::info("Employee Created " . $create->zk_employee_id . ' ' .  'User Name' . $create->name);
                    }
                }
            } else {
                Log::error('Failed to connect to device with IP: ' . $zkteco->ip_address);
            }
        }
    }
    
      
   

    public function create()
    {
        $role = Role::find(Auth::user()->role_id);
        if($role->hasPermissionTo('employees-add')){
            $lims_role_list = Role::where('is_active', true)->get();
            $lims_warehouse_list = Warehouse::where('is_active', true)->get();
            $lims_biller_list = Biller::where('is_active', true)->get();
            $lims_department_list = Department::where('is_active', true)->get();
            $numberOfEmployee = Employee::where('is_active', true)->count();
            $numberOfUserAccount = User::where('is_active', true)->count();
            $shifts = HrmSetting::all();
            $devices = zktecoConfig::all();
            $shift_days = ShiftDay::all();
            // return $shift_days;
            return view('backend.employee.create', compact('shifts','shift_days','devices','lims_role_list', 'lims_warehouse_list', 'lims_biller_list', 'lims_department_list', 'numberOfEmployee', 'numberOfUserAccount'));
        }
        else
            return redirect()->back()->with('not_permitted', 'Sorry! You are not allowed to access this module');
    }

    public function store(Request $request)
    {
        // return $request->device_id;
        $role = Role::find(Auth::user()->role_id);
        $data = $request->except('image');
        $message = 'Employee created successfully';
        if(isset($data['user'])){
            $this->validate($request, [
                'name' => [
                    'max:255',
                        Rule::unique('users')->where(function ($query) {
                        return $query->where('is_deleted', false);
                    }),
                ],
                'email' => [
                    'email',
                    'max:255',
                        Rule::unique('users')->where(function ($query) {
                        return $query->where('is_deleted', false);
                    }),
                ],
            ]);

            $data['is_active'] = true;
            $data['is_deleted'] = false;
            $data['password'] = bcrypt($data['password']);
            $data['phone'] = $data['phone_number'];
            User::create($data);
            $user = User::latest()->first();
            $data['user_id'] = $user->id;
        }
        //validation in employee table
        $this->validate($request, [
            'email' => [
                'max:255',
                    Rule::unique('employees')->where(function ($query) {
                    return $query->where('is_active', true);
                }),
            ],
            'image' => 'image|mimes:jpg,jpeg,png,gif|max:100000',
            'shift' => 'required'
        ]);

        $image = $request->image;
        if ($image) {
            $ext = pathinfo($image->getClientOriginalName(), PATHINFO_EXTENSION);
            $imageName = date("Ymdhis");
            if(!config('database.connections.saleprosaas_landlord')) {
                $imageName = $imageName . '.' . $ext;
                $image->move('public/images/employee', $imageName);
            }
            else {
                $imageName = $this->getTenantId() . '_' . $imageName . '.' . $ext;
                $image->move('public/images/employee', $imageName);
            }
            $data['image'] = $imageName;
        }
        $data['name'] = $data['employee_name'];
        $data['is_active'] = true;
        $data['shift'] = [];
        foreach($request->shift as $shift){
            $data['shift'][] = $shift;
        }
       $data['implodedShift'] =  implode(' ,',$data['shift']);
       $data['shift'] = $data['implodedShift'];
       $device_ids = $request->device_id;
       $device_ids_str =  implode(',',$device_ids);
       $data['device_id'] = $device_ids_str;

       $shift_days = $request->shift_days;
       $shift_days_str = implode(',',$shift_days);
       $data['shift_days'] = $shift_days_str;

        $employee  = Employee::create($data);
       
        $devices = zktecoConfig::find($request->device_id);

        $this->createUserOnZk($employee,$devices);
        $message = 'Employee created successfully and added to user list';
        return redirect('employees')->with('message', $message);
    }

    // This Function is For Adding User To ZK Device

    private function createUserOnZk($employee, $devices){
        foreach($devices as $device){
            $zk  = new ZKTeco($device->ip_address);
            if($zk->connect()){
                $uid = $employee->id;
                $userid = $employee->id; 
                $name = $employee->name;
                $password = '';
                $role = 0; 
                $set =    $zk->setUser($uid,$userid, $name, $password, $role);
                Log::info("User Created: " . $set);
             
            }
        }
            
        
       

    }


    public function update(Request $request, $id)
    {
        // return $request->device_id;
        $lims_employee_data = Employee::find($request['employee_id']);
        if($lims_employee_data->user_id){
            $this->validate($request, [
                'name' => [
                    'max:255',
                    Rule::unique('users')->ignore($lims_employee_data->user_id)->where(function ($query) {
                        return $query->where('is_deleted', false);
                    }),
                ],
                'email' => [
                    'email',
                    'max:255',
                        Rule::unique('users')->ignore($lims_employee_data->user_id)->where(function ($query) {
                        return $query->where('is_deleted', false);
                    }),
                ],
            ]);
        }
        //validation in employee table
        $this->validate($request, [
            'email' => [
                'email',
                'max:255',
                    Rule::unique('employees')->ignore($lims_employee_data->id)->where(function ($query) {
                    return $query->where('is_active', true);
                }),
            ],
            'image' => 'image|mimes:jpg,jpeg,png,gif|max:100000',
        ]);

        $data = $request->except('image');
        $image = $request->image;
        if ($image) {
            $this->fileDelete('images/employee/', $lims_employee_data->image);
            $ext = pathinfo($image->getClientOriginalName(), PATHINFO_EXTENSION);
            $imageName = date("Ymdhis");
            if(!config('database.connections.saleprosaas_landlord')) {
                $imageName = $imageName . '.' . $ext;
                $image->move('public/images/employee', $imageName);
            }
            else {
                $imageName = $this->getTenantId() . '_' . $imageName . '.' . $ext;
                $image->move('public/images/employee', $imageName);
            }
            $data['image'] = $imageName;
        }
        // return $data;
        $data['shift'] = [];
        foreach($request->shift as $shift){
            $data['shift'][] = $shift;
        }
        $data['shift_to_string'] = implode(', ', $data['shift']);
        $data['shift'] = $data['shift_to_string'];

        $shift_days = $request->shift_days;
        $shift_days_str = implode(',', $shift_days);
        $data['shift_days'] = $shift_days_str;
        $lims_employee_data->update($data);
        $this->zkEmployeeUpdate($data);
        return redirect('employees')->with('message', 'Employee updated successfully');
    }

    private function zkEmployeeUpdate($data){
        $zktecoIps = zktecoConfig::all();
        foreach($zktecoIps as $zkteco){
            $zk  = new ZKTeco($zkteco->ip_address);
            if($zk->connect()){
                $uid = $data['employee_id'];
                $userid = $data['employee_id']; 
                $name = $data['name'];
                $password = '';
                $role = 0; 
                $result = $zk->setUser($uid, $userid, $name, $password, $role);
                
            }
        }
       
    }

    public function deleteBySelection(Request $request)
    {
        $employee_id = $request['employeeIdArray'];
        foreach ($employee_id as $id) {
            $lims_employee_data = Employee::find($id);
            if($lims_employee_data->user_id){
                $lims_user_data = User::find($lims_employee_data->user_id);
                $lims_user_data->is_deleted = true;
                $lims_user_data->delete();
            }
            $lims_employee_data->is_active = false;
            
            $zktecoIps = zktecoConfig::all();
            foreach($zktecoIps as $zkteco){
                $zk  = new ZKTeco($zkteco->ip_address);
                if($zk->connect()){
                    $zk->removeUser($id); 
                }else{
                    Toastr()->error("Employee Has Been Deleted But ZkTeco Employee Is Not Because Of Connection");
                }
            }
            Log::info("Selected User Id : " . $id);
            $lims_employee_data->delete();
            $this->fileDelete('images/employee/', $lims_employee_data->image);
        }

        return 'Employee deleted successfully!';
    }


    
    public function destroy($id)
    {
        $lims_employee_data = Employee::find($id);
        if($lims_employee_data->user_id){
            $lims_user_data = User::find($lims_employee_data->user_id);
            $lims_user_data->is_deleted = true;
            $lims_user_data->save();
        }

        $this->fileDelete('images/employee/', $lims_employee_data->image);

        // if($lims_employee_data->image && !config('database.connections.saleprosaas_landlord')) {
        //     unlink('public/images/employee/'.$lims_employee_data->image);
        // }
        // elseif($lims_employee_data->image) {
        //     unlink('images/employee/'.$lims_employee_data->image);
        // }

        $lims_employee_data->is_active = false;
        $lims_employee_data->delete();

        $zktecoIps = zktecoConfig::all();
        foreach($zktecoIps as $zkteco){
            $zk  = new ZKTeco($zkteco->ip_address);
            if($zk->connect()){
                $zk->removeUser($id); 
            }else{
                Toastr()->error("Employee Has Been Deleted But ZkTeco Employee Is Not Because Of Connection");
            }
        }
      
        return redirect('employees')->with('not_permitted', 'Employee deleted successfully');
    }
}
