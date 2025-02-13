@extends('backend.layout.main') @section('content')

<section>
   
    <div class="table-responsive">
        <table id="table" class="table">
            <thead>
                <tr>
                    <th></th>
                    <th>{{ trans('Name') }}</th>
                    <th>{{ trans('Type') }}</th>
                    <th>{{ trans('Created Date') }}</th>
                    <th>{{ trans('Created Time') }}</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($outOfShiftsEmployees as $shift )
                @php
                    $employee = \App\Models\Employee::find($shift->employee_id);
                    $Date = \Carbon\Carbon::parse($shift->created_at)->format('Y-m-d');
                    $Time = \Carbon\Carbon::parse($shift->created_at)->format('H:i:s');

                @endphp
                <tr>
                    <td><div class="checkbox"><input type="checkbox" class="dt-checkboxes"><label></label></div></td>
                    <td>{{ $employee->name }}</td>
                    @if($shift->type == 1)
                    <td> <span class="badge badge-primary"> Check-In </span> </td>
                    @elseif($shift->type == 2)
                    <td> <span class="badge badge-danger"> Check-Out </span> </td>
                    @endif
                    <td>{{ $Date }}</td>
                    <td>{{ $Time }}</td>
             
                </tr>
                @endforeach
               
            </tbody>
        </table>
        
    </div>
</section>



@endsection

@push('scripts')
<script type="text/javascript">
    $("ul#hrm").siblings('a').attr('aria-expanded','true');
    $("ul#hrm").addClass("show");
    $("ul#hrm #out-of-shifts-menu").addClass("active");



    $('#table').DataTable({
    "order": [],
    'language': {
        'lengthMenu': '_MENU_ {{trans("file.records per page")}}',
        "info": '<small>{{trans("file.Showing")}} _START_ - _END_ (_TOTAL_)</small>',
        "search": '{{trans("file.Search")}}',
        'paginate': {
            'previous': '<i class="dripicons-chevron-left"></i>',
            'next': '<i class="dripicons-chevron-right"></i>'
        }
    },
    'columnDefs': [
        { "orderable": false, 'targets': [0] }, 
        {
            'render': function(data, type, row, meta) {
                if (type === 'display') {
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
    'select': { style: 'multi', selector: 'td:first-child' },
    'lengthMenu': [[10, 25, 50, -1], [10, 25, 50, "All"]],
    dom: '<"row"lfB>rtip',
    buttons: [
        { extend: 'pdf', text: '<i title="export to pdf" class="fa fa-file-pdf-o"></i>', exportOptions: { columns: ':visible:Not(.not-exported)', rows: ':visible' }},
        { extend: 'excel', text: '<i title="export to excel" class="dripicons-document-new"></i>', exportOptions: { columns: ':visible:Not(.not-exported)', rows: ':visible' }},
        { extend: 'csv', text: '<i title="export to csv" class="fa fa-file-text-o"></i>', exportOptions: { columns: ':visible:Not(.not-exported)', rows: ':visible' }},
        { extend: 'colvis', text: '<i title="column visibility" class="fa fa-eye"></i>', columns: ':gt(0)' }
    ]
});


</script>
@endpush