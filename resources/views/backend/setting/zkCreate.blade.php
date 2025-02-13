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
                        <h4>{{trans('Create ZkTeco Device ')}}</h4>
                    </div>
                    <div class="card-body">
                    <form action="{{ route('zk.create.post') }}" method="POST">
                        @csrf

                        <div class="row">

                            <div class="col-md-4 form-group">
                                <label>{{trans('Device Name')}} *</label>
                                <input type="text" name="device_name" class="form-control" required />
                                @error('device_name')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>  

                            <div class="col-md-4 form-group">
                                <label>{{trans('IP Address')}} *</label>
                                <input type="text" name="ip" class="form-control" required />
                                @error('ip')
                                    <span class="text-danger">{{ $message }}</span>
                                @enderror
                            </div>  
                        </div>

                        <div class="form-group">
                            <button class="btn btn-primary" type="submit">Submit</button>
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
    $("ul#setting #zkteco-config").addClass("active");
</script>
@endpush
