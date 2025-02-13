<?php

namespace App\Http\Controllers;

use App\Models\zktecoConfig;
use Illuminate\Http\Request;
use Rats\Zkteco\Lib\ZKTeco;

class zktecoConfigController extends Controller
{
    public function zktecoConfig()
    {
        $ips = zktecoConfig::all();
        $zkStatuses = [];
    
        foreach ($ips as $ip) {
            $zk = new ZKTeco($ip->ip_address);
            set_time_limit(120);
            try {
              
                if ($zk->connect()) {
                    $zkStatuses[$ip->ip_address] = 'Connected';
                    $zk->disconnect(); 
                } else {
                    $zkStatuses[$ip->ip_address] = 'Not Connected';
                }
            } catch (\Exception $e) {
                $zkStatuses[$ip->ip_address] = 'Not Connected';
            }
        }
        // return $zkStatuses;
        return view('backend.setting.zktecoConfig', compact('ips', 'zkStatuses'));
    }
    

    public function zkCreate()
    {
        return view('backend.setting.zkCreate');
    }

    public function zkCreatePost(Request $request)
    {
        $request->validate([
            'ip' => 'required|ipv4|unique:zkteco,ip_address',
            'device_name' => 'required',
        ]);

        $action = zktecoConfig::Create(
            [
                'ip_address' => $request->ip,
                'device_name' => $request->device_name,
            ]
        );

        if ($action) {
            $zk = new ZKTeco($action->ip_address);
            set_time_limit(120);

            if($zk->connect()){
                $zk->testVoice();
                Toastr()->success("Device Connected Successfully");
                return redirect()->route('zkteco.config');
            }else{
                Toastr()->success("Device Created But Connection has not been established :(");
                return redirect()->route('zkteco.config');
            }
        }
    }

    public function zkEdit($id)
    {
        $ip = zktecoConfig::find($id);
        return view('backend.setting.zkEdit', compact('ip'));
    }

    public function zkEditPost(Request $request, $id)
    {  
        $zk = zktecoConfig::find($id);

        $newIp = $request->input('ip');

        $rule = [
            'device_name' => 'required',
            'ip' => 'required|ipv4',
        ];

        if ($zk->ip_address !== $newIp) {
            $rule['ip'] .= '|unique:zkteco,ip_address';
        }

        $request->validate($rule);

      
        // return $zk;
        if ($zk) {
            $update = $zk->update([
                'ip_address' => $request->ip,
                'device_name' => $request->device_name,
            ]);

            if ($update) {
                Toastr()->success('Device updated successfully');
                return redirect()->route('zkteco.config');
            }
        }
    }

    public function zkDelete($id)
    {

        $delete = zktecoConfig::find($id);
        if ($delete) {
            $delete->delete();
            Toastr()->success("Device Deleted Successfully");
            return redirect()->route('zkteco.config');
        }

    }
}
