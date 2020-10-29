<section class="top-contact">
    <div class="container">
        <div class="top-contact-inner">
            <div class="top-contact__left">
                <div class="top-contact__item">
                    <span class="lnr lnr-map"></span>68 Hoàng Quốc Việt, Phú Mỹ, Q7</div>
                <div class="top-contact__item">
                    <span class="lnr lnr-phone-handset"></span>(+84) 090 333 4221</div>
            </div>
            <div class="top-contact__right">
                <ul class="list-unstyled list-inline list-social">
                    <li class="list-inline-item">
                        <a class="ic-fb" href="#">
                            <i class="zmdi zmdi-facebook-box"></i>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a class="ic-twi" href="#">
                            <i class="zmdi zmdi-twitter"></i>
                        </a>
                    </li>
                    <li class="list-inline-item">
                        <a class="ic-insta" href="#">
                            <i class="zmdi zmdi-instagram"></i>
                        </a>
                    </li>
                    <li class="list-inline-item seprator">
                        <span></span>
                    </li>
                    <li class="list-inline-item">
                        <a href="#" data-toggle="modal" data-target="#modal-search">
                            <i class="fas fa-search"></i>
                        </a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</section>
<div class="header header-1 d-none d-lg-block js-header-1">
    <div class="header__bar">
        <div class="container">
            <div class="header__content">
                <div class="logo">
                    <a href="#">
                        <img src="/assets/jobby/images/icon/logo.png" alt="Jobby" />
                    </a>
                </div>
                <nav class="header-navbar">
                    <ul class="list-unstyled">
                        <li class="header-navbar__item">
                            <a href="{site_url()}jobby/home">
                                <span class="bg-link">Home</span>
                            </a>
                        </li>
                        <li class="header-navbar__item has-sub">
                            <a href="{site_url()}jobby/page">
                                <span class="bg-link">page</span>
                            </a>
                            <ul class="list-unstyled header-navbar-child first">
                                <li>
                                    <a href="{site_url()}jobby/page/aboutus">About Us</a>
                                </li>
                                <li>
                                    <a href="{site_url()}jobby/page/program">Programs</a>
                                </li>
                                <li>
                                    <a href="{site_url()}jobby/page/gallery">Gallery</a>
                                </li>
                                <li>
                                    <a href="{site_url()}jobby/page/event">Event</a>
                                </li>
                                <li>
                                    <a href="{site_url()}jobby/page/coming">Coming Soon</a>
                                </li>
                                <li>
                                    <a href="{site_url()}jobby/page/error">404 Error</a>
                                </li>
                                <li>
                                    <a href="{site_url()}jobby/page/contact">Contact Us</a>
                                </li>
                            </ul>
                        </li>
                        <li class="header-navbar__item has-sub">
                            <a href="{site_url()}jobby/classes">
                                <span class="bg-link">Classes</span>
                            </a>
                            <ul class="list-unstyled header-navbar-child first">
                                <li>
                                    <a href="{site_url()}jobby/classes/detail">Classes detail</a>
                                </li>
                                <li>
                                    <a href="{site_url()}jobby/classes/schedule">classes schedule</a>
                                </li>
                            </ul>
                        </li>
                        <li class="header-navbar__item has-sub">
                            <a href="{site_url()}jobby/teacher">
                                <span class="bg-link">teacher</span>
                            </a>
                            <ul class="list-unstyled header-navbar-child first">
                                <li>
                                    <a href="{site_url()}jobby/teacher/detail">teacher detal</a>
                                </li>
                            </ul>
                        </li>
                        <li class="header-navbar__item has-sub">
                            <a href="{site_url()}jobby/blog"">
                                <span class="bg-link">blog</span>
                            </a>
                            <ul class="list-unstyled header-navbar-child first">
                                <li>
                                    <a href="{site_url()}jobby/blog/grid">grid</a>
                                </li>
                                <li class="has-sub">
                                    <a href="#">standard</a>
                                    <ul class="list-unstyled header-navbar-child second is-left">
                                        <li>
                                            <a href="{site_url()}jobby/blog/rightbar">right sidebar</a>
                                        </li>
                                        <li>
                                            <a href="{site_url()}jobby/blog/leftbar">left sidebar</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                        <li class="header-navbar__item has-sub">
                            <a class="p-r-0" href="product-list.html">
                                <span class="bg-link">shop</span>
                            </a>
                            <ul class="list-unstyled header-navbar-child first is-left">
                                <li>
                                    <a href="product-list.html">product list</a>
                                </li>
                                <li>
                                    <a href="product-single.html">product single</a>
                                </li>
                                <li class="has-sub">
                                    <a href="#">shop page</a>
                                    <ul class="list-unstyled header-navbar-child second is-left">
                                        <li>
                                            <a href="my-account.html">my account</a>
                                        </li>
                                        <li>
                                            <a href="cart.html">cart</a>
                                        </li>
                                        <li>
                                            <a href="checkout.html">checkout</a>
                                        </li>
                                    </ul>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modal-search" role="dialog">
    <button class="close" type="button" data-dismiss="modal">
        <i class="zmdi zmdi-close"></i>
    </button>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-body">
                <form class="form form--icon" method="POST">
                    <input type="text" name="search" placeholder="Search here..." />
                    <button class="btn-submit-1" type="submit">
                        <i class="fa fa-search"></i>
                    </button>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="header-mobile js-header-mobile d-block d-lg-none">
    <div class="header-mobile__bar">
        <div class="container-fluid clearfix">
            <a class="logo" href="index1.html">
                <img src="/assets/jobby/images/icon/logo.png" alt="Jooby" />
            </a>
            <button class="hamburger hamburger--slider float-right" type="button">
                            <span class="hamburger-box">
                                <span class="hamburger-inner"></span>
                            </span>
            </button>
        </div>
    </div>
    <nav class="navbar-mobile">
        <ul class="navbar-mobile__list list-unstyled">
            <li class="has-sub">
                <a href="index1.html">Home</a>
                <ul class="navbar-mobile__child list-unstyled">
                    <li>
                        <a href="index1.html">HomePage 1</a>
                    </li>
                    <li>
                        <a href="index2.html">HomePage 2</a>
                    </li>
                    <li>
                        <a href="index3.html">HomePage 3</a>
                    </li>
                    <li>
                        <a href="index4.html">HomePage 4</a>
                    </li>
                    <li>
                        <a href="index5.html">HomePage 5</a>
                    </li>
                    <li>
                        <a href="index6.html">HomePage 6</a>
                    </li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="about-us.html">page</a>
                <ul class="list-unstyled navbar-mobile__child first">
                    <li>
                        <a href="about-us.html">About us</a>
                    </li>
                    <li>
                        <a href="programs.html">Programs</a>
                    </li>
                    <li class="has-sub">
                        <a href="gallery-grid.html">Gallery</a>
                        <ul class="list-unstyled navbar-mobile__child second">
                            <li>
                                <a href="gallery-grid.html">Gallery Grid</a>
                            </li>
                            <li>
                                <a href="gallery-cobbles.html">Gallery Cobbles</a>
                            </li>
                            <li>
                                <a href="gallery-masonry.html">Gallery Masonry</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="event.html">Event</a>
                    </li>
                    <li>
                        <a href="coming-soon.html">Coming soon</a>
                    </li>
                    <li>
                        <a href="404error.html">404 error</a>
                    </li>
                    <li>
                        <a href="contact-us.html">Contact us</a>
                    </li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="classes.html">classes</a>
                <ul class="list-unstyled navbar-mobile__child first">
                    <li>
                        <a href="classes.html">Classes</a>
                    </li>
                    <li>
                        <a href="classes-single.html">Classes single</a>
                    </li>
                    <li>
                        <a href="classes-schedule.html">classes schedule</a>
                    </li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="teachers.html">teacher</a>
                <ul class="list-unstyled navbar-mobile__child first">
                    <li>
                        <a href="teachers.html">teacher</a>
                    </li>
                    <li>
                        <a href="teacher-single.html">teacher single</a>
                    </li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="blog-masonry.html">blog</a>
                <ul class="list-unstyled navbar-mobile__child first">
                    <li>
                        <a href="blog-masonry.html">masonry</a>
                    </li>
                    <li class="has-sub">
                        <a href="blog-right-sidebar.html">standard</a>
                        <ul class="list-unstyled navbar-mobile__child second">
                            <li>
                                <a href="blog-right-sidebar.html">right sidebar</a>
                            </li>
                            <li>
                                <a href="blog-left-sidebar.html">left sidebar</a>
                            </li>
                            <li>
                                <a href="blog-no-sidebar.html">no sidebar</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="blog-single.html">single</a>
                    </li>
                </ul>
            </li>
            <li class="has-sub">
                <a href="product-list.html">shop</a>
                <ul class="list-unstyled navbar-mobile__child first">
                    <li>
                        <a href="product-list.html">product list</a>
                    </li>
                    <li>
                        <a href="product-single.html">product single</a>
                    </li>
                    <li class="has-sub">
                        <a href="#">shop page</a>
                        <ul class="list-unstyled navbar-mobile__child secon">
                            <li>
                                <a href="my-account.html">my account</a>
                            </li>
                            <li>
                                <a href="cart.html">cart</a>
                            </li>
                            <li>
                                <a href="checkout.html">checkout</a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </nav>
</div>
