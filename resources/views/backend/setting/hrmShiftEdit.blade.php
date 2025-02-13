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
                        <h4>{{trans('HRM Shift Update')}}</h4>
                       
                    </div>
                    <div class="card-body">
             
                        <form action="{{ route('setting.hrmupdate',$data) }}" method="POST">
                            @csrf
                            @method("PUT")
                       
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="shift">Shift Name</label>
                                        <input type="text" class="form-control"  value="{{$data['shift'] }}" name="shift">
                                        @error('shift')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Check-In">Check-In</label>
                                        <input type="text" name="checkin" value="{{ $data['checkin'] }}" class="form-control" id="checkin">
                                        @error('checkin')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Check-In">Check-Out</label>
                                        <input type="text" name="checkout" value="{{ $data['checkout'] }}"  class="form-control" id="checkout">
                                        @error('checkout')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Check-In">Beginning In</label>
                                        <input type="text" name="beginning_in"  class="form-control" id="checkin"  value="{{ $data['beginning_in'] }}">
                                        @error('beginning_in')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="Check-In">Ending Out</label>
                                        <input type="text" name="ending_out"  class="form-control" id="checkin" value="{{ $data['ending_out'] }}">
                                        @error('ending_out')
                                            <span class="text-danger">{{ $message }}</span>
                                        @enderror
                                    </div>
                                </div>
                            </div>
               
                          

                              <div class="row">
                                <div class="col-md-6 form-group">
                                    <button type="submit" class="btn btn-primary">{{trans('file.submit')}}</button>
                                </div>
                              </div>
                           
                        </form>

                          
                 
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
