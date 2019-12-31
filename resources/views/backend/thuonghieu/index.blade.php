<!--Kế thừa cha-->
@extends('backend.master')
<!--Vị trí kế thừa-->
@section('pagename')
Thương hiệu
@endsection
@section('content')
@if (session('msg'))
<div class="alert alert-{{session('type')}}">{{session('msg')}}</div>
@endif
<div class="card table-card">
    <div class="card-header">
        <h3>Danh sách thương hiệu</h3>
        <div class="card-header-right">
            <a name="" id="" class="btn btn-primary" href="{{route('thuonghieu.create')}}" role="button">Thêm thương hiệu</a>
        </div>
    </div>
    <div class="card-block">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Tên thương hiệu</th>
                        <th>Image</th>
                        <th>Trạng thái</th>
                        <th>Tác vụ</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($ds as $key => $item)
                    <tr>
                        <td>{{$key+1}}</td>
                        <td>{{$item->name}}</td>
                        <td>
                            <img src="{{asset($item->image)}}" alt="{{$item->name}}" class="img-fluid img-20">
                        </td>
                        <td>
                            @if ($item->status == 1)
                                <span class="badge badge-pill badge-success mb-1">Active</span>
                            @else
                                <span class="badge badge-pill badge-secondary mb-1">Disable</span>
                            @endif
                        </td>
                        <td>
                            <form class="forms-sample" action="{{route('thuonghieu.destroy',$item->id)}}" method="POST">
                                @method('DELETE')
                                @csrf()
                                <a href="{{route('thuonghieu.show',$item->id)}}" title="Xem"><i class="ik ik-eye f-16 mr-15 text-green"></i></a>
                                <a href="{{route('thuonghieu.edit',$item->id)}}" title="Chỉnh sửa"><i class="ik ik-edit f-16 mr-15 text-green"></i></a>
                                <button type="submit" class="btn_custom"><i class="ik ik-trash-2 f-16 text-red"></i></button>
                            </form>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
{{ $ds->links() }}
@endsection
