<!--Kế thừa cha-->
@extends('backend.master')
<!--Vị trí kế thừa-->
@section('pagename')
Sản phẩm
@endsection
@section('content')
@if (session('msg'))
<div class="alert alert-{{session('type')}}">{{session('msg')}}</div>
@endif
<div class="card table-card">
    <div class="card-header">
        <h3>Danh sách sản phẩm</h3>
        <div class="card-header-right">
            <a name="" id="" class="btn btn-primary" href="{{route('sanpham.create')}}" role="button">Thêm sản phẩm</a>
        </div>
    </div>
    <div class="card-block">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Mã sản phẩm</th>
                        <th>Tên sản phẩm</th>
                        <th>Hình</th>
                        <th>Loại</th>
                        <th>Trạng thái</th>
                        <th style="text-align:center;">Tồn kho</th>
                        <th style="text-align:center;">Giá bán</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    @if (count($ds) > 0)
                        @foreach ($ds as $key => $item)
                        <tr>
                            <td>{{$key+1}}</td>
                            <td>{{$item->id}}</td>
                            <td>{{$item->name}}</td>
                            <td>
                                <img src="{{asset($item->image)}}" alt="{{$item->name}}" class="img-fluid img-20">
                            </td>
                            <td>{{$item->loaisp}}</td>
                            <td>
                                @if ($item->status == 1)
                                    <span class="badge badge-pill badge-success mb-1">Active</span>
                                @else
                                    <span class="badge badge-pill badge-secondary mb-1">Disable</span>
                                @endif
                            </td>
                            <td style="text-align:center;">{{number_format($item->qty)}}</td>
                            <td style="text-align:center;">{{number_format($item->price)}}</td>
                            <td>
                                <form class="forms-sample" action="{{route('sanpham.destroy',$item->id)}}" method="POST">
                                    @method('DELETE')
                                    @csrf()
                                    <a href="{{route('sanpham.show',$item->id)}}" title="Xem"><i class="ik ik-eye f-16 mr-15 text-green"></i></a>
                                    <a href="{{route('sanpham.edit',$item->id)}}" title="Chỉnh sửa"><i class="ik ik-edit f-16 mr-15 text-green"></i></a>
                                    <button type="submit" class="btn_custom"><i class="ik ik-trash-2 f-16 text-red"></i></button>
                                </form>
                            </td>
                        </tr>
                        @endforeach
                    @else
                        <tr><th colspan="10" style="text-align:center;">Không có dữ liệu</th></tr>
                    @endif
                    
                </tbody>
            </table>
        </div>
    </div>
</div>
{{ $ds->links() }}
@endsection
