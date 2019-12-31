@extends('frontend.master')
@section('pagename')
Trang chủ
@endsection
<!-- Start Slider area -->
@include('frontend.slider.slider')
<!-- End Slider area -->
@section('content')
<!-- Start BEst Seller Area -->
<section class="wn__product__area brown--color pt--80  pb--30">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section__title text-center">
                    <h2 class="title__be--2">New <span class="color--theme">Products</span></h2>
                    <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered
                        lebmid alteration in some ledmid form</p>
                </div>
            </div>
        </div>
        <!-- Start Single Tab Content -->
        <div class="furniture--4 border--round arrows_style owl-carousel owl-theme row mt--50">
            <!-- Start Single Product -->
            @foreach ($newproducts as $item)
            <div class="product product__style--3">
                <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                    <div class="product__thumb">
                        <a class="first__img" href="{{route('pro.detail',[
                            'alias' => $item->alias ,
                            'id' => $item->id
                         ])}}">
                            <img src="{{$item->image}}" alt="{{$item->name}}" height="340">
                        </a>
                        <a class="second__img animation1" href="{{route('pro.detail',[$item->alias,$item->id])}}">
                            <img src="{{$item->image}}" alt="{{$item->name}}" height="340">
                        </a>
                        <div class="hot__box">
                            <span class="hot-label">BEST SALLER</span>
                        </div>
                    </div>
                    <div class="product__content content--center">
                        <h4><a href="{{$item->url}}">{{$item->name}}</a></h4>
                        <ul class="prize d-flex">
                            <li>{{$item->price}}</li>
                            {{-- <li class="old_prize">$35.00</li> --}}
                        </ul>
                        <div class="action">
                            <div class="actions_inner">
                                <ul class="add_to_links">
                                    <li><a class="cart" href="{{route('cart.add',$item->id)}}"><i class="bi bi-shopping-bag4"></i></a></li>
                                    {{-- <li><a class="wishlist" href="wishlist.html"><i
                                                class="bi bi-shopping-cart-full"></i></a></li>
                                    <li><a class="compare" href="#"><i class="bi bi-heart-beat"></i></a></li> --}}
                                    <li><a data-toggle="modal" title="Quick View"
                                            class="quickview modal-view detail-link" href="#productmodal"><i
                                                class="bi bi-search"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="product__hover--content">
                            <ul class="rating d-flex">
                                <li class="on"><i class="fa fa-star-o"></i></li>
                                <li class="on"><i class="fa fa-star-o"></i></li>
                                <li class="on"><i class="fa fa-star-o"></i></li>
                                <li><i class="fa fa-star-o"></i></li>
                                <li><i class="fa fa-star-o"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
            <!-- Start Single Product -->

        </div>
        <!-- End Single Tab Content -->
    </div>
</section>
<!-- Start BEst Seller Area -->
<!-- Start NEwsletter Area -->
@include('frontend.widgets.newsletter')
<!-- End NEwsletter Area -->
<!-- Start Best Seller Area -->
<section class="wn__bestseller__area bg--white pt--80  pb--30">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section__title text-center">
                    <h2 class="title__be--2">All <span class="color--theme">Products</span></h2>
                    <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered
                        lebmid alteration in some ledmid form</p>
                </div>
            </div>
        </div>
        <div class="row mt--50">
            <div class="col-md-12 col-lg-12 col-sm-12">
                <div class="product__nav nav justify-content-center" role="tablist">
                    @foreach ($procategory as $key => $listcate)
                        <a class="nav-item nav-link {{$key == 0 ? 'active' : '' }}" data-toggle="tab" href="#nav-{{$listcate->id}}" role="tab">{{$listcate->name}}</a>
                    @endforeach
                </div>
            </div>
        </div>
        <div class="tab__container mt--60">
            <!-- Start Single Tab Content -->
            @foreach ($procategory as $key => $listcate)
            <div class="row single__tab tab-pane fade show {{$key == 0 ? 'active' : '' }}" id="nav-{{$listcate->id}}" role="tabpanel">
                <div class="product__indicator--4 arrows_style owl-carousel owl-theme">
                    <div class="single__product">
                        <!-- Start Single Product -->
                        @foreach ($allproducts as $item)
                            @if ($item->id_category == $listcate->id)
                                <div class="col-lg-3 col-md-4 col-sm-6 col-12">
                                    <div class="product product__style--3">
                                        <div class="product__thumb">
                                            <a class="first__img" href="{{$item->url}}">
                                                <img src="{{$item->image}}" alt="{{$item->name}}" height="340">
                                            </a>
                                            <a class="second__img animation1" href="{{$item->url}}">
                                                <img src="{{$item->image}}" alt="{{$item->name}}" height="340">
                                            </a>
                                            <div class="hot__box">
                                                <span class="hot-label">BEST SALER</span>
                                            </div>
                                        </div>
                                        <div class="product__content content--center content--center">
                                            <h4><a href="single-product.html">{{$item->name}}</a></h4>
                                            <ul class="prize d-flex">
                                                <li>{{number_format($item->price)}}</li>
                                                {{-- <li class="old_prize">$35.00</li> --}}
                                            </ul>
                                            <div class="action">
                                                <div class="actions_inner">
                                                    <ul class="add_to_links">
                                                        <li><a class="cart" href="{{route('cart.index')}}"><i
                                                                    class="bi bi-shopping-bag4"></i></a></li>
                                                        {{-- <li><a class="wishlist" href="wishlist.html"><i
                                                                    class="bi bi-shopping-cart-full"></i></a></li>
                                                        <li><a class="compare" href="#"><i class="bi bi-heart-beat"></i></a>
                                                        </li> --}}
                                                        <li><a data-toggle="modal" title="Quick View"
                                                                class="quickview modal-view detail-link" href="#productmodal"><i
                                                                    class="bi bi-search"></i></a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <div class="product__hover--content">
                                                <ul class="rating d-flex">
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li class="on"><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                    <li><i class="fa fa-star-o"></i></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endif
                        @endforeach
                        <!-- Start Single Product -->
                    </div>
                </div>
            </div>
            <!-- End Single Tab Content -->
            @endforeach
        </div>
    </div>
</section>
<!-- Start BEst Seller Area -->
<!-- Start Recent Post Area -->
{{-- <section class="wn__recent__post bg--gray ptb--80">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section__title text-center">
                    <h2 class="title__be--2">Our <span class="color--theme">Blog</span></h2>
                    <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered
                        lebmid alteration in some ledmid form</p>
                </div>
            </div>
        </div>
        <div class="row mt--50">
            <div class="col-md-6 col-lg-4 col-sm-12">
                <div class="post__itam">
                    <div class="content">
                        <h3><a href="blog-details.html">International activities of the Frankfurt Book </a></h3>
                        <p>We are proud to announce the very first the edition of the frankfurt news.We are proud to
                            announce the very first of edition of the fault frankfurt news for us.</p>
                        <div class="post__time">
                            <span class="day">Dec 06, 18</span>
                            <div class="post-meta">
                                <ul>
                                    <li><a href="#"><i class="bi bi-love"></i>72</a></li>
                                    <li><a href="#"><i class="bi bi-chat-bubble"></i>27</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4 col-sm-12">
                <div class="post__itam">
                    <div class="content">
                        <h3><a href="blog-details.html">Reading has a signficant info number of benefits</a></h3>
                        <p>Find all the information you need to ensure your experience.Find all the information you need
                            to ensure your experience . Find all the information you of.</p>
                        <div class="post__time">
                            <span class="day">Mar 08, 18</span>
                            <div class="post-meta">
                                <ul>
                                    <li><a href="#"><i class="bi bi-love"></i>72</a></li>
                                    <li><a href="#"><i class="bi bi-chat-bubble"></i>27</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-6 col-lg-4 col-sm-12">
                <div class="post__itam">
                    <div class="content">
                        <h3><a href="blog-details.html">The London Book Fair is to be packed with exciting </a></h3>
                        <p>The London Book Fair is the global area inon marketplace for rights negotiation.The year
                            London Book Fair is the global area inon forg marketplace for rights.</p>
                        <div class="post__time">
                            <span class="day">Nov 11, 18</span>
                            <div class="post-meta">
                                <ul>
                                    <li><a href="#"><i class="bi bi-love"></i>72</a></li>
                                    <li><a href="#"><i class="bi bi-chat-bubble"></i>27</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section> --}}
<!-- End Recent Post Area -->
<!-- Best Sale Area -->
{{-- <section class="best-seel-area pt--80 pb--60">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section__title text-center pb--50">
                    <h2 class="title__be--2">Best <span class="color--theme">Seller </span></h2>
                    <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered
                        lebmid alteration in some ledmid form</p>
                </div>
            </div>
        </div>
    </div>
    <div class="slider center">
        <!-- Single product start -->
        <div class="product product__style--3">
            <div class="product__thumb">
                <a class="first__img" href="single-product.html"><img
                        src="{{asset('/public/frontend')}}/images/best-sell-product/1.jpg"
                        alt="product image"></a>
            </div>
            <div class="product__content content--center">
                <div class="action">
                    <div class="actions_inner">
                        <ul class="add_to_links">
                            <li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
                            <li><a class="wishlist" href="wishlist.html"><i class="bi bi-shopping-cart-full"></i></a>
                            </li>
                            <li><a class="compare" href="#"><i class="bi bi-heart-beat"></i></a></li>
                            <li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link"
                                    href="#productmodal"><i class="bi bi-search"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="product__hover--content">
                    <ul class="rating d-flex">
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Single product end -->
        <!-- Single product start -->
        <div class="product product__style--3">
            <div class="product__thumb">
                <a class="first__img" href="single-product.html"><img
                        src="{{asset('/public/frontend')}}/images/best-sell-product/2.jpg"
                        alt="product image"></a>
            </div>
            <div class="product__content content--center">
                <div class="action">
                    <div class="actions_inner">
                        <ul class="add_to_links">
                            <li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
                            <li><a class="wishlist" href="wishlist.html"><i class="bi bi-shopping-cart-full"></i></a>
                            </li>
                            <li><a class="compare" href="#"><i class="bi bi-heart-beat"></i></a></li>
                            <li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link"
                                    href="#productmodal"><i class="bi bi-search"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="product__hover--content">
                    <ul class="rating d-flex">
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Single product end -->
        <!-- Single product start -->
        <div class="product product__style--3">
            <div class="product__thumb">
                <a class="first__img" href="single-product.html"><img
                        src="{{asset('/public/frontend')}}/images/best-sell-product/3.jpg"
                        alt="product image"></a>
            </div>
            <div class="product__content content--center">
                <div class="action">
                    <div class="actions_inner">
                        <ul class="add_to_links">
                            <li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
                            <li><a class="wishlist" href="wishlist.html"><i class="bi bi-shopping-cart-full"></i></a>
                            </li>
                            <li><a class="compare" href="#"><i class="bi bi-heart-beat"></i></a></li>
                            <li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link"
                                    href="#productmodal"><i class="bi bi-search"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="product__hover--content">
                    <ul class="rating d-flex">
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Single product end -->
        <!-- Single product start -->
        <div class="product product__style--3">
            <div class="product__thumb">
                <a class="first__img" href="single-product.html"><img
                        src="{{asset('/public/frontend')}}/images/best-sell-product/4.jpg"
                        alt="product image"></a>
            </div>
            <div class="product__content content--center">
                <div class="action">
                    <div class="actions_inner">
                        <ul class="add_to_links">
                            <li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
                            <li><a class="wishlist" href="wishlist.html"><i class="bi bi-shopping-cart-full"></i></a>
                            </li>
                            <li><a class="compare" href="#"><i class="bi bi-heart-beat"></i></a></li>
                            <li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link"
                                    href="#productmodal"><i class="bi bi-search"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="product__hover--content">
                    <ul class="rating d-flex">
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Single product end -->
        <!-- Single product start -->
        <div class="product product__style--3">
            <div class="product__thumb">
                <a class="first__img" href="single-product.html"><img
                        src="{{asset('/public/frontend')}}/images/best-sell-product/5.jpg"
                        alt="product image"></a>
            </div>
            <div class="product__content content--center">
                <div class="action">
                    <div class="actions_inner">
                        <ul class="add_to_links">
                            <li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
                            <li><a class="wishlist" href="wishlist.html"><i class="bi bi-shopping-cart-full"></i></a>
                            </li>
                            <li><a class="compare" href="#"><i class="bi bi-heart-beat"></i></a></li>
                            <li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link"
                                    href="#productmodal"><i class="bi bi-search"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="product__hover--content">
                    <ul class="rating d-flex">
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Single product end -->
        <!-- Single product start -->
        <div class="product product__style--3">
            <div class="product__thumb">
                <a class="first__img" href="single-product.html"><img
                        src="{{asset('/public/frontend')}}/images/best-sell-product/6.jpg"
                        alt="product image"></a>
            </div>
            <div class="product__content content--center">
                <div class="action">
                    <div class="actions_inner">
                        <ul class="add_to_links">
                            <li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
                            <li><a class="wishlist" href="wishlist.html"><i class="bi bi-shopping-cart-full"></i></a>
                            </li>
                            <li><a class="compare" href="#"><i class="bi bi-heart-beat"></i></a></li>
                            <li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link"
                                    href="#productmodal"><i class="bi bi-search"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="product__hover--content">
                    <ul class="rating d-flex">
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Single product end -->
        <!-- Single product start -->
        <div class="product product__style--3">
            <div class="product__thumb">
                <a class="first__img" href="single-product.html"><img
                        src="{{asset('/public/frontend')}}/images/best-sell-product/7.jpg"
                        alt="product image"></a>
            </div>
            <div class="product__content content--center">
                <div class="action">
                    <div class="actions_inner">
                        <ul class="add_to_links">
                            <li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
                            <li><a class="wishlist" href="wishlist.html"><i class="bi bi-shopping-cart-full"></i></a>
                            </li>
                            <li><a class="compare" href="#"><i class="bi bi-heart-beat"></i></a></li>
                            <li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link"
                                    href="#productmodal"><i class="bi bi-search"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="product__hover--content">
                    <ul class="rating d-flex">
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Single product end -->
        <!-- Single product start -->
        <div class="product product__style--3">
            <div class="product__thumb">
                <a class="first__img" href="single-product.html"><img
                        src="{{asset('/public/frontend')}}/images/best-sell-product/8.jpg"
                        alt="product image"></a>
            </div>
            <div class="product__content content--center">
                <div class="action">
                    <div class="actions_inner">
                        <ul class="add_to_links">
                            <li><a class="cart" href="cart.html"><i class="bi bi-shopping-bag4"></i></a></li>
                            <li><a class="wishlist" href="wishlist.html"><i class="bi bi-shopping-cart-full"></i></a>
                            </li>
                            <li><a class="compare" href="#"><i class="bi bi-heart-beat"></i></a></li>
                            <li><a data-toggle="modal" title="Quick View" class="quickview modal-view detail-link"
                                    href="#productmodal"><i class="bi bi-search"></i></a></li>
                        </ul>
                    </div>
                </div>
                <div class="product__hover--content">
                    <ul class="rating d-flex">
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li class="on"><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                        <li><i class="fa fa-star-o"></i></li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- Single product end -->
    </div>
</section> --}}
<!-- Best Sale Area Area -->
@endsection
