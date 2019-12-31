<header id="wn__header" class="header__area header__absolute sticky__header">
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-6 col-sm-6 col-6 col-lg-2">
                <div class="logo">
                    <a href="{{route('homepage.index')}}">
                        <img src="{{asset('/public/frontend')}}/images/logo/3.jpg" alt="logo images" class="img-40 align-top mr-15">
                    </a>
                </div>
            </div>
            <div class="col-lg-8 d-none d-lg-block">
                <nav class="mainmenu__nav">
                    <ul class="meninmenu d-flex justify-content-start">
                        <li class="drop with--one--item"><a href="{{route('homepage.index')}}">Trang chủ</a></li>
                        <li class="drop"><a href="#">Sản phẩm</a>
                            <div class="megamenu mega03">
                                <ul class="item item03">
                                    <li class="title">Shop Layout</li>
                                    <li><a href="shop-grid.html">Shop Grid</a></li>
                                    <li><a href="single-product.html">Single Product</a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="{{route('homepage.contact')}}">Liên hệ</a></li>
                    </ul>
                </nav>
            </div>
            <div class="col-md-6 col-sm-6 col-6 col-lg-2">
                <ul class="header__sidebar__right d-flex justify-content-end align-items-center">
                    <li class="shop_search mr-4"><a class="search__active" href="#"></a></li>
                    <li class="shopcart"><a class="cartbox_active" href="{{route('cart.index')}}"><span class="product_qun">3</span></a>
                        <!-- Start Shopping Cart -->
                        <div class="block-minicart minicart__active">
                            <div class="minicart-content-wrapper">
                                <div class="micart__close">
                                    <span>Đóng</span>
                                </div>
                                <div class="items-total d-flex justify-content-between">
                                    <span>3 sản phẩm</span>
                                    <span>Tạm tính</span>
                                </div>
                                <div class="total_amount text-right">
                                    <span>$66.00</span>
                                </div>
                                <div class="mini_action checkout">
                                    <a class="checkout__btn" href="{{route('cart.checkout')}}">Thanh toán</a>
                                </div>
                                <div class="single__items">
                                    <div class="miniproduct">
                                        <div class="item01 d-flex">
                                            <div class="thumb">
                                                <a href="product-details.html"><img src="{{asset('/public/frontend')}}/images/product/sm-img/1.jpg"
                                                        alt="product images"></a>
                                            </div>
                                            <div class="content">
                                                <h6><a href="product-details.html">Voyage Yoga Bag</a></h6>
                                                <span class="prize">$30.00</span>
                                                <div class="product_prize d-flex justify-content-between">
                                                    <span class="qun">Qty: 01</span>
                                                    <ul class="d-flex justify-content-end">
                                                        <li><a href="#"><i class="zmdi zmdi-settings"></i></a></li>
                                                        <li><a href="#"><i class="zmdi zmdi-delete"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="mini_action cart">
                                    <a class="cart__btn" href="{{route('cart.index')}}">Xem giỏ hàng</a>
                                </div>
                            </div>
                        </div>
                        <!-- End Shopping Cart -->
                    </li>
                    <li class="setting__bar__icon"><a class="setting__active" href="#"></a>
                        <div class="searchbar__content setting__block">
                            <div class="content-inner">
                                <div class="switcher-currency">
                                    <strong class="label switcher-label">
                                        <span>Quản lý tài khoản</span>
                                    </strong>
                                    <div class="switcher-options">
                                        <div class="switcher-currency-trigger">
                                            <div class="setting__menu">
                                                <span><a href="#">Đăng nhập</a></span>
                                                <span><a href="#">Đăng ký</a></span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Start Mobile Menu -->
        <div class="row d-none">
            <div class="col-lg-12 d-none">
                <nav class="mobilemenu__nav">
                    <ul class="meninmenu">
                        <li><a href="{{route('homepage.index')}}">Trang chủ</a></li>
                        <li><a href="shop-grid.html">Sản phẩm</a>
                            <ul>
                                <li><a href="shop-grid.html">Shop Grid</a></li>
                                <li><a href="single-product.html">Single Product</a></li>
                            </ul>
                        </li>
                        <li><a href="{{route('homepage.contact')}}">Liên hệ</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <!-- End Mobile Menu -->
        <div class="mobile-menu d-block d-lg-none">
        </div>
        <!-- Mobile Menu -->
    </div>
</header>
