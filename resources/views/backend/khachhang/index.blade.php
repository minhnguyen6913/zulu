<!--Kế thừa cha-->
@extends('backend.master')
<!--Vị trí kế thừa-->
@section('pagename')
    Khách hàng
@endsection
@section('content')
<div class="card table-card">
    <div class="card-header">
        <h3>Danh sách khách hàng</h3>
    </div>
    <div class="card-block">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên khách hàng</th>
                        <th>Email</th>
                        <th>SĐT</th>
                        <th>Địa chỉ</th>
                        <th>Trạng thái</th>
                        <th>Tác vụ</th>
                    </tr>
                </thead>
                <tbody>
                    @if (count($ds) > 0)
                        @foreach ($ds as $key => $item)
                        <tr>
                            <td>{{$key+1}}</td>
                            <td>
                                <div class="d-inline-block align-middle">
                                    <img src="{{asset($item->image)}}" alt="{{$item->customer_name}}" class="rounded-circle img-40 align-top mr-15">
                                    
                                    <div class="d-inline-block">
                                        <h6>{{$item->customer_name}}</h6>
                                    </div>
                                </div>
                            </td>
                            <td>{{$item->customer_email}}</td>
                            <td>{{$item->customer_sdt}}</td>
                            <td>{{$item->customer_dia_chi}}</td>
                            <td>
                                @if ($item->status == 1)
                                    <span class="badge badge-pill badge-success mb-1">Active</span>
                                @else
                                    <span class="badge badge-pill badge-secondary mb-1">Disable</span>
                                @endif
                            </td>
                            <td>
                                <form class="forms-sample" action="{{route('user.destroy',$item->id)}}" method="POST">
                                    @method('DELETE')
                                    @csrf()
                                    <a href="{{route('khachhang.show',$item->id)}}" title="Xem"><i class="ik ik-eye f-16 mr-15 text-green"></i></a>
                                    <button type="submit" class="btn_custom"><i class="ik ik-trash-2 f-16 text-red"></i></button>
                                </form>
                            </td>
                        </tr>
                        @endforeach  
                    @else
                    <tr><th colspan="4" style="text-align:center;">Không có dữ liệu</th></tr>
                    @endif
                    
                </tbody>
            </table>
        </div>
    </div>
</div>
{{ $ds->links() }}
@endsection

