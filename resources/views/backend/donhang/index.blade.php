<!--Kế thừa cha-->
@extends('backend.master')
<!--Vị trí kế thừa-->
@section('pagename')
đơn hàng
@endsection
@section('content')
@if (session('msg'))
<div class="alert alert-{{session('type')}}">{{session('msg')}}</div>
@endif
<div class="card table-card">
    <div class="card-header">
        <h3>Danh sách đơn hàng</h3>
        <div class="card-header-right">
            <a name="" id="" class="btn btn-primary" href="{{route('cart.create')}}" role="button">Thêm đơn hàng</a>
        </div>
    </div>
    <div class="card-block">
        <div class="table-responsive">
            <table class="table table-hover mb-0">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>Mã đơn hàng</th>
                        <th>Tên đơn hàng</th>
                        <th>Hình</th>
                        <th>Loại</th>
                        <th>Trạng thái</th>
                        <th>Giá</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    
                </tbody>
            </table>
        </div>
    </div>
</div>
@endsection
