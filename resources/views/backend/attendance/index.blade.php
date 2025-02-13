@extends('backend.layout.main') @section('content')
@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{!! session()->get('message') !!}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif

<section>
    <div class="container-fluid">
        <div class="md-12">
            <button class="btn btn-info" data-toggle="modal" data-target="#createModal"><i class="dripicons-plus"></i> {{trans('file.Add Attendance')}} </button>
        </div>
        <div class="md-12">
            <!-- Import CSV File (Device) -->
            <div class="card">
                <div class="card-header">
                    <h3 class="card-title">{{trans('file.Import CSV file (Device)')}}</h3>
                </div>
                <div class="card-body">
                    <form action="{{ route('attendances.importDeviceCsv') }}" autocomplete="off" enctype="multipart/form-data"
                          method="post" accept-charset="utf-8">
                        @csrf
                        <div class="form-group">
                            <fieldset class="form-group">
                                <div class="row">
                                    <div class="col-md-4">
                                        <label>{{trans('file.Attendance Device Date Format')}}</label>
                                        <select name="Attendance_Device_date_format" class="selectpicker form-control">
                                            <option value="">Select</option>
                                            <option value="d/m/Y">dd/mm/yyyy(23/05/2022)</option>
                                            <option value="m/d/Y">mm/dd/yyyy(05/23/2022)</option>
                                            <option value="Y/m/d">yyyy/mm/dd(2022/05/23)</option>
                                        </select>
                                    </div>
                                    <div class="md-4">
                                        <label for="logo">{{trans('file.Upload File')}}</label>
                                        <input type="file" class="form-control-file" name="file"
                                                accept=".xlsx, .xls, .csv">
                                    </div>
                                    <div class="md-4">
                                        <button name="import_form" type="submit" class="btn btn-primary"><i
                                                class="fa fa fa-check-square-o"></i> {{trans('file.Save')}}
                                        </button>
                                    </div>
                                 </div>
                                <small>* Please take a note of the date format you get in the CSV file downloaded/exported from your attendance device(CSV).
                                    Now select the same date format from dropdown for the option named- 'Attendance device date format'
                                    <br>* The first line in downloaded file should remain as it is. Please do not change
                                    the order of columns in file.
                                    <br>* Please select csv/excel file (allowed file size 2MB)
                                </small>
                            </fieldset>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <div class="table-responsive">
        <table id="attendance-table" class="table">
            <thead>
                <tr>
                    <th class="not-exported"></th>
                    <th>{{trans('file.date')}}</th>
                    <th>{{trans('file.Employee')}}</th>
                    <th>{{trans('file.CheckIn')}} - {{trans('file.CheckOut')}}</th>
                    <th>{{trans('file.Status')}}</th>
                    <th class="not-exported">{{trans('file.action')}}</th>
                </tr>
            </thead>
            <tbody>
                @foreach($lims_attendance_all as $key=>$attendance)
                <tr data-date="{{$attendance['date']}}" data-employee_id="{{$attendance['employee_id']}}">
                    <td>{{$key}}</td>
                    <td>{{ date($general_setting->date_format, strtotime($attendance['date'])) }}</td>
                    <td>{{ $attendance['employee_name'] }}</td>
                    <td>{!! $attendance['checkin_checkout'] !!}</td>
              
                    <td style="height: 50px; vertical-align: top;">
                        @if(!empty($attendance['status_list']) && is_array($attendance['status_list']))
                            @foreach ($attendance['status_list'] as $status)
                                <div class="badge {{ $status === '1' ? 'badge-success' : 'badge-danger' }}" style="margin-bottom: 5px;">
                                    {!! $status === '1' ? 'Present' : 'Late'  !!}
                                </div>
                                <br>
                            @endforeach
                        @else
                            <div class="badge badge-danger">Late</div>
                        @endif
                    </td>

                    <td>
                        <div class="btn-group">
                            {{ Form::open(['route' => ['attendances.delete', [$attendance['date'], $attendance['employee_id']]], 'method' => 'post'] ) }}
                            <button type="submit" class="btn btn-sm btn-danger" onclick="return confirmDelete()" title="{{trans('file.delete')}}"><i class="dripicons-trash"></i></button>
                            {{ Form::close() }}
                        </div>
                    </td>
                </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</section>

<div id="createModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true" class="modal fade text-left">
    <div role="document" class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 id="exampleModalLabel" class="modal-title">{{trans('file.Add Attendance')}}</h5>
                <button type="button" data-dismiss="modal" aria-label="Close" class="close"><span aria-hidden="true"><i class="dripicons-cross"></i></span></button>
            </div>
            <div class="modal-body">
              <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p>
                {!! Form::open(['route' => 'attendance.store', 'method' => 'post', 'files' => true]) !!}
                <div class="row">
                    <div class="col-md-6 form-group">
                        <label>{{trans('file.Employee')}} *</label>
                        <select class="form-control selectpicker" id="select" name="employee_id" required data-live-search="true" data-live-search-style="begins" title="Select Employee...">
                            @foreach($lims_employee_list as $employee)
                            <option value="{{$employee->id}}">{{$employee->name}}</option>
                            @endforeach
                        </select>
                    </div>

                    <div class="col-md-6 form-group">
                        <label>{{trans('file.date')}} *</label>
                        <input type="text" name="date" class="form-control date" value="{{date($general_setting->date_format)}}" required>
                    </div>
                </div>
                    
                 
                <div class="row">
                    <div class="col-md-12 form-group">
                        <select class="form-control selectpicker" id="my_shifts_select" required data-live-search="true" data-live-search-style="begins" name="shift">
                            <option value="" id="option">Select Shift</option>
                        </select>
                      </div>
                </div>
                
                    <div class="row">
                    <div class="col-md-6 form-group">
                        <label>{{trans('file.CheckIn')}}*</label>
                        <input type="text" id="checkin" name="checkin" class="form-control" value="" required>
                    </div>
                    <div class="col-md-6 form-group">
                        <label>{{trans('file.CheckOut')}} *</label>
                        <input type="text" id="checkout" name="checkout" class="form-control">
                    </div>
                </div>
                <div class="row">

                
                    <div class="col-md-12 form-group">
                        <label>{{trans('file.Note')}}</label>
                        <textarea name="note" rows="3" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">{{trans('file.submit')}}</button>
                </div>
                {{ Form::close() }}
            </div>
        </div>
    </div>
</div>

@endsection

@push('scripts')
<script type="text/javascript">

	$("ul#hrm").siblings('a').attr('aria-expanded','true');
    $("ul#hrm").addClass("show");
    $("ul#hrm #attendance-menu").addClass("active");

    function confirmDelete() {
        if (confirm("Are you sure want to delete?")) {
            return true;
        }
        return false;
    }

    var attendance_selected = [];
    var user_verified = <?php echo json_encode(env('USER_VERIFIED')) ?>;

    $.ajaxSetup({
        headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
        }
    });

	var date = $('.date');
    date.datepicker({
     format: "dd-mm-yyyy",
     autoclose: true,
     todayHighlight: true
     });

    $('#checkin, #checkout').timepicker({
    	'step': 15,
    });

    var table = $('#attendance-table').DataTable( {
        "order": [],
        'language': {
            'lengthMenu': '_MENU_ {{trans("file.records per page")}}',
             "info":      '<small>{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)</small>',
            "search":  '{{trans("file.Search")}}',
            'paginate': {
                    'previous': '<i class="dripicons-chevron-left"></i>',
                    'next': '<i class="dripicons-chevron-right"></i>'
            }
        },
        'columnDefs': [
            {
                "orderable": false,
                'targets': [0]
            },
            {
                'render': function(data, type, row, meta){
                    if(type === 'display'){
                        data = '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>';
                    }

                   return data;
                },
                'checkboxes': {
                   'selectRow': true,
                   'selectAllRender': '<div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div>'
                },
                'targets': [0]
            }
        ],
        'select': { style: 'multi',  selector: 'td:first-child'},
        'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
        dom: '<"row"lfB>rtip',
        buttons: [
            {
                extend: 'pdf',
                text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible',
                }
            },
            {
                extend: 'excel',
                text: '<i title="export to excel" class="dripicons-document-new"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible',
                },
            },
            {
                extend: 'csv',
                text: '<i title="export to csv" class="fa fa-file-text-o"></i>',
                exportOptions: {
                    columns: ':visible:Not(.not-exported)',
                    rows: ':visible',
                },
            },
            {
                text: '<i title="delete" class="dripicons-cross"></i>',
                className: 'buttons-delete',
                action: function ( e, dt, node, config ) {
                    if(user_verified == '1') {
                        attendance_selected.length = 0;
                        var rows_selected = dt.column(0).checkboxes.selected();
                        $.each(rows_selected, function(index, rowId){
                            var row_single = dt.row( rowId ).nodes()[0];
                            attendance_selected[index] = [$(row_single).data('date'),
                                                    $(row_single).data('employee_id')];
                        });

                        if(attendance_selected.length && confirm("Are you sure want to delete?")) {
                            $.ajax({
                                type:'POST',
                                url:'attendance/deletebyselection',
                                data:{
                                    attendanceSelectedArray: attendance_selected
                                },
                                success:function(data){
                                    alert(data);
                                    dt.rows(rows_selected).remove().draw();
                                }
                            });
                        }
                        else if(!attendance_selected.length)
                            alert('Nothing is selected!');
                    }
                    else
                        alert('This feature is disable for demo!');
                }
            },
            {
                extend: 'colvis',
                text: '<i title="column visibility" class="fa fa-eye"></i>',
                columns: ':gt(0)'
            },
        ],
    } );


    // document.getElementById('select').addEventListener( 'change', function(){
    //     const employeeID = this.value;
    //     console.log(employeeID);

    //     fetch(`employee/shifts/${employeeID}`)
    //     .then(response => response.json())
    //     .then(data =>{
    //         document.getElementById('checkin').value = data['checkin'];
    //         document.getElementById('checkout').value = data['checkout'];
    //     });
    // })

    document.getElementById('select').addEventListener( 'change', function(){
        const employeeId = this.value;
        fetch(`employee/shifts/${employeeId}`)
        .then(response => response.json())
        .then(data => {
            console.log(data); // Check the full data structure

        let defaultSelect = document.getElementById('my_shifts_select');
        defaultSelect.innerHTML = ''; 
        console.log(defaultSelect);
        // Check if shifts_details is an array and not empty
        if (Array.isArray(data.shifts_details) && data.shifts_details.length > 0) {
            data.shifts_details.forEach(shift => {
                
                let defaultOption  = document.createElement('option');
                defaultOption .value = shift.id; 
                defaultOption .name = 'shift'; 
                defaultOption .textContent = shift.shift; 
                console.log(defaultOption)
                $(defaultSelect).selectpicker('refresh');
                document.getElementById('my_shifts_select').appendChild(defaultOption);
                
            });
            
            $(defaultSelect).selectpicker('refresh');

            const firstShift = data.shifts_details[0];
                if (firstShift) {
                    document.getElementById('checkin').value = firstShift.checkin || ''; 
                    document.getElementById('checkout').value = firstShift.checkout || ''; 
                }
           
            document.getElementById('my_shifts_select').addEventListener('change', function(){
            
            const selectedShiftId = this.value; 
            const selectedShift = data.shifts_details.find(shift => shift.id == selectedShiftId); 
            console.log(selectedShift); 

            document.getElementById('checkin').value = selectedShift.checkin;
            document.getElementById('checkout').value = selectedShift.checkout;
          
           
        });
            
        } else {
            // Handle case when no shifts are available
            let defaultOption = document.createElement('option');
            defaultOption.textContent = 'No shifts available';
            document.getElementById('my_shifts_select').appendChild(defaultOption);
            $(defaultSelect).selectpicker('refresh');
        }
        
        });

       
        
     });


    
   
</script>
@endpush
