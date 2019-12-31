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
                    <h2 class="bradcaump-title">Don hang</h2>
                    <nav class="bradcaump-content">
                      <a class="breadcrumb_item" href="index.html">Trang chủ</a>
                      <span class="brd-separetor">/</span>
                      <span class="breadcrumb_item active">don hang</span>
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

                    <div class="alert alert-success">
                    <h1>MA DON DAT HANG: {{session('code')}}</h1>
                    <p>
                        ban da dat hang thanh cong, vui long kiem tra inbox email hoac spam de xem thong tin chi tiet
                    </p>
                    </div>

            </div>
        </div>
    </div>
</div>
<!-- cart-main-area end -->
@endsection
