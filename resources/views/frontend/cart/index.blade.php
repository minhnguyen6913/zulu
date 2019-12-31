@extends('frontend.master')
@section('pagename')
Giỏ hàng
@endsection
@section('content')
<!-- Start Bradcaump area -->
<div class="ht__bradcaump__area bg-image--3">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="bradcaump__inner text-center">
                    <h2 class="bradcaump-title">Giỏ hàng</h2>
                    <nav class="bradcaump-content">
                      <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                      <span class="brd-separetor">/</span>
                      <span class="breadcrumb_item active">Giỏ hàng</span>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Bradcaump area -->
<!-- cart-main-area start -->
<div class="cart-main-area section-padding--lg bg--white">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12 ol-lg-12">
                @if(session('msg'))
                    <div class="alert alert-{{session('type')}}">{{session('msg')}}</div>
                @endif
            <form action="{{route('cart.update')}}" method="POST">
                @csrf
                    <div class="table-content wnro__table table-responsive">
                        <table>
                            <thead>
                                <tr class="title-top">
                                    <th class="product-thumbnail">Hình</th>
                                    <th class="product-name">Tên</th>
                                    <th class="product-price">Giá</th>
                                    <th class="product-quantity">Số lượng</th>
                                    <th class="product-subtotal">Thành tiền</th>
                                    <th class="product-remove">Xóa</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $tong = 0;
                                @endphp
                                @foreach (session('giohang') as $item)
                                @php
                                    $tt = $item['price']*$item['qty'];
                                    $tong += $tt;
                                @endphp
                                <tr>
                                <td class="product-thumbnail"><a href="#"><img src="{{$item['img']}}" alt="{{$item['name']}}"></a></td>
                                        <td class="product-name"><a href="#">{{$item['name']}}</a></td>
                                        <td class="product-price"><span class="amount">{{$item['price']}}</span></td>
                                        <td class="product-quantity"><input name="qty[{{$item['id']}}]" type="number" value="{{$item['qty']}}"></td>
                                        <td class="product-subtotal">{{$tt}}</td>
                                <td class="product-remove"><a onclick="return confirm('ban muon xoa san pham nay?')" href="{{route('cart.delete',$item['id'])}}">X</a></td>
                                    </tr>
                                @endforeach

                            </tbody>
                        </table>
                    </div>

                <div class="cartbox__btn">
                    <ul class="cart__btn__list d-flex flex-wrap flex-md-nowrap flex-lg-nowrap justify-content-between">
                        {{-- <li><a href="#">Coupon Code</a></li> --}}
                    <li><a href="{{route('homepage.index')}}">Mua tiếp</a></li>
                        <li><button >Cập nhật số lượng</button></li>
                    <li><a href="{{route('cart.checkout')}}">Thanh toan</a></li>
                    </ul>
                </div>
            </form>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-6 offset-lg-6">
                <div class="cartbox__total__area">
                    <div class="cartbox-total d-flex justify-content-between">
                        <ul class="cart__total__list">
                            <li>Tam tinh</li>
                        </ul>
                        <ul class="cart__total__tk">
                            <li>{{$tong}}</li>
                        </ul>
                    </div>
                    <div class="cart__total__amount">
                        <span>Tong tien</span>
                        <span>{{$tong}}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- cart-main-area end -->
@endsection
