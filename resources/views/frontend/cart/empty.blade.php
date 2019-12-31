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

                    <div class="alert alert-danger">gio hang rong mua hang di <a href="{{route('homepage.index')}}">Trang chu</a></div>

            </div>
        </div>
    </div>
</div>
<!-- cart-main-area end -->
@endsection
