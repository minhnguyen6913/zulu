<!--Kế thừa cha-->
@extends('backend.master')
<!--Vị trí kế thừa-->
@section('pagename')
    Phân quyền
@endsection
@section('content')
<div class="card table-card">
    <div class="card-header">
        <h3>Danh sách quyền</h3>
        {{-- <div class="card-header-right">
            <a name="" id="" class="btn btn-primary" href="{{route('role.create')}}" role="button">Thêm quyền</a>
        </div> --}}
    </div>
    <div class="card-block">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead>
                    <tr>
                        <th>STT</th>
                        <th>Username</th>
                        <th>Tên người dùng</th>
                        <th>Tác vụ</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($user as $key => $item)
                    <tr>
                        <td>{{$key+1}}</td>
                        <td>{{$item->fullname}}</td>
                        <td>{{$item->username}}</td>
                        <td>
                            <a href="{{route('role.edit',$item->id)}}" title="Phân quyền"><i class="ik ik-edit f-16 mr-15 text-green"></i></a>
                        </td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection

