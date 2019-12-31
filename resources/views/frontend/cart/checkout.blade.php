@extends('frontend.master')
@section('pagename')
Thanh toán
@endsection
@section('content')
<!-- Start Bradcaump area -->
<div class="ht__bradcaump__area bg-image--4">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="bradcaump__inner text-center">
                    <h2 class="bradcaump-title">Thanh toán</h2>
                    <nav class="bradcaump-content">
                      <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                      <span class="brd-separetor">/</span>
                      <span class="breadcrumb_item active">Checkout</span>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Bradcaump area -->
<!-- Start Checkout Area -->
<section class="wn__checkout__area section-padding--lg bg__white">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="wn_checkout_wrap">
                    <div class="checkout_info d-none">
                        <span>Returning customer ?</span>
                        <a class="showlogin" href="#">Click here to login</a>
                    </div>
                    <div class="checkout_login">
                        <form class="wn__checkout__form" action="#">
                            <p>If you have shopped with us before, please enter your details in the boxes below. If you are a new customer please proceed to the Billing & Shipping section.</p>

                            <div class="input__box">
                                <label>Username or email <span>*</span></label>
                                <input type="text">
                            </div>

                            <div class="input__box">
                                <label>password <span>*</span></label>
                                <input type="password">
                            </div>
                            <div class="form__btn">
                                <button>Login</button>
                                <label class="label-for-checkbox">
                                    <input id="rememberme" name="rememberme" value="forever" type="checkbox">
                                    <span>Remember me</span>
                                </label>
                                <a href="#">Lost your password?</a>
                            </div>
                        </form>
                    </div>
                    <div class="checkout_info d-none">
                        <span>Have a coupon? </span>
                        <a class="showcoupon" href="#">Click here to enter your code</a>
                    </div>
                    <div class="checkout_coupon">
                        <form action="#">
                            <div class="form__coupon">
                                <input type="text" placeholder="Coupon code">
                                <button>Apply coupon</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
        <div class="col-lg-6 col-12">
            <form action="{{route('cart.checkoutP')}}" method="post">
            @csrf
                <div class="customer_details">

                    <h3>Thong tin nguoi mua</h3>
                    <div class="customar__field">
                        <div class="margin_between">
                            <div class="input_box space_between">
                                <label>Ho va ten <span>*</span></label>
                                <input type="text" name="info_name">
                            </div>
                            <div class="input_box space_between">
                                <label>Email<span>*</span></label>
                                <input type="email" name="info_email">
                            </div>
                            <div class="input_box space_between">
                                    <label>Dien thoai<span>*</span></label>
                                    <input type="text" name="info_phone">
                                </div>
                        </div>
                        <div class="input_box">
                            <label>Dia chi<span>*</span></label>
                            <textarea name="info_address" class="form-control"></textarea>
                        </div>
                    </div>

                </div>
                <div class="customer_details mt--20">
                    <div class="differt__address">
                        <input value="1" name="nguoimua" type="checkbox">
                        <span>Thong tin nguoi nhan ?</span>
                    </div>
                    <div class="customar__field differt__form mt--40">
                            <div class="margin_between">
                                    <div class="input_box space_between">
                                        <label>Ho va ten <span>*</span></label>
                                        <input type="text" name="info_name2">
                                    </div>
                                    <div class="input_box space_between">
                                        <label>Email<span>*</span></label>
                                        <input type="email" name="info_email2">
                                    </div>
                                    <div class="input_box space_between">
                                            <label>Dien thoai<span>*</span></label>
                                            <input type="text" name="info_phone2">
                                        </div>
                                </div>
                                <div class="input_box">
                                    <label>Dia chi<span>*</span></label>
                                    <textarea name="info_address2" class="form-control"></textarea>
                                </div>
                    </div>
                </div>
                <div class=" mt--20">
                        <div class="">
                            <span>Phuong thuc thanh toan</span>
                        </div>
                        <div class="  mt--40">
                                <label>
                                <input name="thanhtoan" type="radio" value="tienmat"/>Tien mat khi nhan hang</label>

                                            <label>
                                            <input name="thanhtoan" type="radio" value="chuyen khoan"/>chuyen khoan</label>

                                                <label>
                                                <input name="thanhtoan" type="radio" value="atm"/>ATM online</label>

                        </div>
                    </div>
                <div> <button>Hoan tat</button></div>
                </form>
                </div>

            <div class="col-lg-6 col-12 md-mt-40 sm-mt-40">
                <div class="wn__order__box">
                    <h3 class="onder__title">Don hang cua ban</h3>
                    <ul class="order__total">
                        <li>San pham</li>
                        <li>thanh tien</li>
                    </ul>
                    <ul class="order_product">
                            @php
                            $tong = 0;
                            $ship = 0;
                        @endphp
                        @foreach (session('giohang') as $item)
                        @php
                            $tt = $item['price']*$item['qty'];
                            $tong += $tt;
                        @endphp
                        <li>{{$item['name']}} × {{$item['qty']}}<span>{{$tt}}</span></li>
                        @endforeach
                    </ul>
                    <ul class="shipping__method">
                        <li>Tam tinh <span>{{$tong}}</span></li>
                        <li>Phi van chuyen
                            <ul>
                                @if ($tong>5000000)
                                <li>
                                        <input name="feeshipping"  value="0" checked="checked" type="radio">
                                        <label>Mien phi</label>
                                    </li>
                                @else
                                @php
                                    $ship=500000;
                                @endphp
                                <li>
                                        <input name="feeshipping"  value="500000" checked="checked" type="radio">
                                        <label>50 k</label>
                                    </li>
                                @endif
                            </ul>
                        </li>
                    </ul>
                    <ul class="total__amount">
                        @php
                            session(['feeship'=>$ship]);
                            session(['total'=>$tong+$ship]);
                        @endphp
                    <li>tong thanh toan<span>{{$tong+$ship}}</span></li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
</section>
<!-- End Checkout Area -->
@endsection
