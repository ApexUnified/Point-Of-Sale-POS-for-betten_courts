@extends('backend.layout.main') @section('content')

@if(session()->has('message'))
  <div class="alert alert-success alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('message') }}</div>
@endif
@if(session()->has('not_permitted'))
  <div class="alert alert-danger alert-dismissible text-center"><button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>{{ session()->get('not_permitted') }}</div>
@endif
<section class="forms">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header d-flex align-items-center justify-content-between">
                        <h4>{{trans('file.HRM Setting')}}</h4>
                        <a href="{{ route('setting.hrm.shift') }}" class="btn btn-primary">Create Shift</a>
                    </div>
                    <div class="card-body">
                        @if($lims_hrm_setting_data->isEmpty())
                        <div class="row">
                            <div class="col-md-12 text-center align-conten-center">
                                <p class="align-content-center text-dark" >No Shifts Found</p>
                            </div>
                        </div>
                        @endif

                        {{-- <p class="italic"><small>{{trans('file.The field labels marked with * are required input fields')}}.</small></p> --}}
                     {{-- {!! Form::open(['route' => 'setting.hrmupdate', 'files' => true, 'method' => 'post']) !!} --}}
                            <div class="row">
                                @foreach($lims_hrm_setting_data as $data)
                                <div class="col-md-12 text-left mt-4 d-flex justify-content-between align-items-center">
                                   <a href="{{ route('setting.hrm.edit',$data) }}">  <h3>{{ $data['shift'] }}</h3> </a>
                                   <a href="{{ route('setting.hrm.shift.delete',$data) }}" onclick="return confirm('Are You Sure To Delete Shift?')" class="text-danger">  
                                    <h3>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2" viewBox="0 0 24 24">
                                        <polyline points="3 6 5 6 21 6"></polyline>
                                        <path d="M19 6l-2 14H7L5 6"></path>
                                        <path d="M10 11v6"></path>
                                        <path d="M14 11v6"></path>
                                        <path d="M18 6L15.5 3h-7L6 6"></path>
                                  </svg>
                                  </h3>
                                 </a>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Check-In">Check-In</label>
                                        <input type="text" name="checkin" readonly class="form-control" value="{{ $data['checkin'] }}">
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Check-In">Check-Out</label>
                                        <input type="text" name="checkout" value="{{ $data['checkout'] }}" class="form-control" readonly>
                                    </div>
                                </div>

                       
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="Check-In">Beginning In</label>
                                            <input type="text" name="beginning_in" value="{{ $data['beginning_in'] }}" class="form-control" readonly>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <label for="Check-In">Ending Out</label>
                                            <input type="text" name="ending_out" value="{{ $data['ending_out'] }}" class="form-control" readonly>
                                        </div>
                                    </div>
                             
                                @endforeach   

                                {{-- <div class="col-md-6  mt-3 form-group">
                                    <button type="submit" class="btn btn-primary">{{trans('file.submit')}}</button>
                                </div> --}}
                            </div>

 
                        {{-- {!! Form::close() !!} --}}
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

@endsection

@push('scripts')
<script type="text/javascript">
    $("ul#setting").siblings('a').attr('aria-expanded','true');
    $("ul#setting").addClass("show");
    $("ul#setting #hrm-setting-menu").addClass("active");

    $('#checkin, #checkout').timepicker({
        'step': 15,

    });
</script>
@endpush
