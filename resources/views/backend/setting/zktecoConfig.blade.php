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
                        <h4>{{trans('ZkTeco Device IP Configuration')}}</h4>
                        <a href="{{ route('zk.create') }}" class="btn btn-primary">Create Device</a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                          @foreach($ips as $ip)

                        <div class="col-md-6 form-group my-3 card p-5">
                           <div class="d-flex justify-content-between">
                            <h5> {{ $ip->device_name }}</h5>
                            @if($zkStatuses[$ip->ip_address] === 'Connected')
                            <span class="badge badge-success align-content-center text-dark ">Connected</span>
                            @else
                            <span class="badge badge-danger align-content-center ">Not Connected</span>
                            @endif
                           </div>
                            <label>{{trans('IP Address')}} *</label>
                            <input type="text" name="ip" class="form-control" value="{{ $ip->ip_address }}" required />

                            <div class="row mt-3 ">
                                <div class="col-md-4">
                                    <a href="{{ route('zk.edit',$ip) }}">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 1 1 3 3L12 15.5l-4 1 1-4 9.5-9.5z"></path>
                                          </svg>
                                          
                                    </a>
                              
                                    <a href="{{ route('zk.delete',$ip) }}" onclick="return confirm('Are You Sure You Want to Delete this Device?')" >
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-trash-2">
                                            <polyline points="3 6 5 6 21 6"></polyline>
                                            <path d="M19 6l-2 14a2 2 0 0 1-2 2H9a2 2 0 0 1-2-2L5 6"></path>
                                            <path d="M10 11v6"></path>
                                            <path d="M14 11v6"></path>
                                            <path d="M19 6l-1-4H6L5 6"></path>
                                          </svg>
                                          
                                    </a>
                                </div>
                            </div>

                        </div>  
                        @endforeach
                    </div>
                   
                      

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
