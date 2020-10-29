{extends file='jobby/master.tpl'}
{block name='css'}{/block}
{block name='script'}{/block}
{block name='body'}
    <!-- PAGE HEADING-->
    <section class="section page-heading js-parallax-scroll" style="background-image: url('/assets/jobby/images/bg-heading-03.jpg');">
        <div class="container">
            <div class="page-heading-inner">
                <div class="section-heading section-heading-1 section-heading-1--tiny text-left">
                    <h2 class="section-heading__title">Classes</h2>
                    <div class="section-heading__line">
                        <img src="/assets/jobby/images/icon/line-blue-small.png" alt="Line" />
                    </div>
                </div>
                <nav class="au-breadcrumb">
                    <ul class="list-unstyled list-breadcrumb">
                        <li class="list-breadcrumb__item">
                            <a href="index.html">Home</a>
                        </li>
                        <li class="list-breadcrumb__item">Classes</li>
                    </ul>
                </nav>
            </div>
        </div>
    </section>
    <!-- END PAGE HEADING-->

    <!-- CLASSES-->
    <section class="section js-isotope-wrapper p-t-125 p-b-80">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav class="au-tab-2 m-b-50">
                        <ul class="list-unstyled au-tab__nav au-tab__nav--sspace iostope-filter">
                            <li class="active au-tab__nav-item" data-filter="*">
                                <span class="au-tab__nav-item-inner">All classes</span>
                            </li>
                            <li class="au-tab__nav-item" data-filter=".play">
                                <span class="au-tab__nav-item-inner">Play Group</span>
                            </li>
                            <li class="au-tab__nav-item" data-filter=".pri">
                                <span class="au-tab__nav-item-inner">Primary</span>
                            </li>
                            <li class="au-tab__nav-item" data-filter=".sto">
                                <span class="au-tab__nav-item-inner">Story</span>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="row isotope-content">
                <div class="col-md-6 col-lg-4 isotope-item isotope-item-sizer play">
                    <div class="media media-our-class-3">
                        <div class="media__img">
                            <a href="classes-single.html">
                                <img src="/assets/jobby/images/our-class-07.jpg" alt="Color Matching Class" />
                            </a>
                            <span class="media-our-class__price">
                                        <span class="inner">$22</span>
                                    </span>
                        </div>
                        <div class="media__body">
                            <h3 class="media__title">
                                <a href="classes-single.html">Color Matching Class</a>
                            </h3>
                            <span class="date-time m-r-15">08:00 am - 05:00 pm</span>
                            <span class="date-time">April 29, 2020</span>
                            <div class="media-our-class__info">
                                <div class="row no-gutters">
                                    <div class="col-6">
                                        <div class="item has-seprator">
                                            <span class="name">age</span>
                                            <span class="value">1 - 2 years</span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="item">
                                            <span class="name">size</span>
                                            <span class="value">12 seats</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 isotope-item isotope-item-sizer pri">
                    <div class="media media-our-class-3">
                        <div class="media__img">
                            <a href="classes-single.html">
                                <img src="/assets/jobby/images/our-class-08.jpg" alt="Letter Math Class" />
                            </a>
                            <span class="media-our-class__price">
                                        <span class="inner">$25</span>
                                    </span>
                        </div>
                        <div class="media__body">
                            <h3 class="media__title">
                                <a href="classes-single.html">Letter Math Class</a>
                            </h3>
                            <span class="date-time m-r-15">08:00 am - 05:00 pm</span>
                            <span class="date-time">April 29, 2020</span>
                            <div class="media-our-class__info">
                                <div class="row no-gutters">
                                    <div class="col-6">
                                        <div class="item has-seprator">
                                            <span class="name">age</span>
                                            <span class="value">2 - 3 years</span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="item">
                                            <span class="name">size</span>
                                            <span class="value">20 seats</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 isotope-item isotope-item-sizer play">
                    <div class="media media-our-class-3">
                        <div class="media__img">
                            <a href="classes-single.html">
                                <img src="/assets/jobby/images/our-class-09.jpg" alt="Sand Play Class" />
                            </a>
                            <span class="media-our-class__price">
                                        <span class="inner">$38</span>
                                    </span>
                        </div>
                        <div class="media__body">
                            <h3 class="media__title">
                                <a href="classes-single.html">Sand Play Class</a>
                            </h3>
                            <span class="date-time m-r-15">08:00 am - 05:00 pm</span>
                            <span class="date-time">April 29, 2020</span>
                            <div class="media-our-class__info">
                                <div class="row no-gutters">
                                    <div class="col-6">
                                        <div class="item has-seprator">
                                            <span class="name">age</span>
                                            <span class="value">4 - 5 years</span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="item">
                                            <span class="name">size</span>
                                            <span class="value">25 seats</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 isotope-item isotope-item-sizer play">
                    <div class="media media-our-class-3">
                        <div class="media__img">
                            <a href="classes-single.html">
                                <img src="/assets/jobby/images/our-class-10.jpg" alt="Painting Class" />
                            </a>
                            <span class="media-our-class__price">
                                        <span class="inner">$36</span>
                                    </span>
                        </div>
                        <div class="media__body">
                            <h3 class="media__title">
                                <a href="classes-single.html">Painting Class</a>
                            </h3>
                            <span class="date-time m-r-15">08:00 am - 05:00 pm</span>
                            <span class="date-time">April 29, 2020</span>
                            <div class="media-our-class__info">
                                <div class="row no-gutters">
                                    <div class="col-6">
                                        <div class="item has-seprator">
                                            <span class="name">age</span>
                                            <span class="value">3- 5 years</span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="item">
                                            <span class="name">size</span>
                                            <span class="value">18 seats</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 isotope-item isotope-item-sizer sto">
                    <div class="media media-our-class-3">
                        <div class="media__img">
                            <a href="classes-single.html">
                                <img src="/assets/jobby/images/our-class-11.jpg" alt="Table/Floor Toys Class" />
                            </a>
                            <span class="media-our-class__price">
                                        <span class="inner">$41</span>
                                    </span>
                        </div>
                        <div class="media__body">
                            <h3 class="media__title">
                                <a href="classes-single.html">Table/Floor Toys Class</a>
                            </h3>
                            <span class="date-time m-r-15">08:00 am - 05:00 pm</span>
                            <span class="date-time">April 29, 2020</span>
                            <div class="media-our-class__info">
                                <div class="row no-gutters">
                                    <div class="col-6">
                                        <div class="item has-seprator">
                                            <span class="name">age</span>
                                            <span class="value">2.5 - 4 years</span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="item">
                                            <span class="name">size</span>
                                            <span class="value">22 seats</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 isotope-item isotope-item-sizer sto">
                    <div class="media media-our-class-3">
                        <div class="media__img">
                            <a href="classes-single.html">
                                <img src="/assets/jobby/images/our-class-12.jpg" alt="Storytime Class" />
                            </a>
                            <span class="media-our-class__price">
                                        <span class="inner">$35</span>
                                    </span>
                        </div>
                        <div class="media__body">
                            <h3 class="media__title">
                                <a href="classes-single.html">Storytime Class</a>
                            </h3>
                            <span class="date-time m-r-15">08:00 am - 05:00 pm</span>
                            <span class="date-time">April 29, 2020</span>
                            <div class="media-our-class__info">
                                <div class="row no-gutters">
                                    <div class="col-6">
                                        <div class="item has-seprator">
                                            <span class="name">age</span>
                                            <span class="value">5 - 6 years</span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="item">
                                            <span class="name">size</span>
                                            <span class="value">27 seats</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 isotope-item isotope-item-sizer pri">
                    <div class="media media-our-class-3">
                        <div class="media__img">
                            <a href="classes-single.html">
                                <img src="/assets/jobby/images/our-class-24.jpg" alt="Shapes Match" />
                            </a>
                            <span class="media-our-class__price">
                                        <span class="inner">$34</span>
                                    </span>
                        </div>
                        <div class="media__body">
                            <h3 class="media__title">
                                <a href="classes-single.html">Shapes Match</a>
                            </h3>
                            <span class="date-time m-r-15">08:00 am - 05:00 pm</span>
                            <span class="date-time">April 29, 2020</span>
                            <div class="media-our-class__info">
                                <div class="row no-gutters">
                                    <div class="col-6">
                                        <div class="item has-seprator">
                                            <span class="name">age</span>
                                            <span class="value">3 - 5 years</span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="item">
                                            <span class="name">size</span>
                                            <span class="value">18 seats</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 isotope-item isotope-item-sizer play">
                    <div class="media media-our-class-3">
                        <div class="media__img">
                            <a href="classes-single.html">
                                <img src="/assets/jobby/images/our-class-25.jpg" alt="Smart Turtles" />
                            </a>
                            <span class="media-our-class__price">
                                        <span class="inner">$29</span>
                                    </span>
                        </div>
                        <div class="media__body">
                            <h3 class="media__title">
                                <a href="classes-single.html">Smart Turtles</a>
                            </h3>
                            <span class="date-time m-r-15">08:00 am - 05:00 pm</span>
                            <span class="date-time">April 29, 2020</span>
                            <div class="media-our-class__info">
                                <div class="row no-gutters">
                                    <div class="col-6">
                                        <div class="item has-seprator">
                                            <span class="name">age</span>
                                            <span class="value">2.5 - 4 years</span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="item">
                                            <span class="name">size</span>
                                            <span class="value">22 seats</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 isotope-item isotope-item-sizer privv">
                    <div class="media media-our-class-3">
                        <div class="media__img">
                            <a href="classes-single.html">
                                <img src="/assets/jobby/images/our-class-26.jpg" alt="Letter Match" />
                            </a>
                            <span class="media-our-class__price">
                                        <span class="inner">$30</span>
                                    </span>
                        </div>
                        <div class="media__body">
                            <h3 class="media__title">
                                <a href="classes-single.html">Letter Match</a>
                            </h3>
                            <span class="date-time m-r-15">08:00 am - 05:00 pm</span>
                            <span class="date-time">April 29, 2020</span>
                            <div class="media-our-class__info">
                                <div class="row no-gutters">
                                    <div class="col-6">
                                        <div class="item has-seprator">
                                            <span class="name">age</span>
                                            <span class="value">5 - 6 years</span>
                                        </div>
                                    </div>
                                    <div class="col-6">
                                        <div class="item">
                                            <span class="name">size</span>
                                            <span class="value">27 seats</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <nav class="au-pagination p-t-30">
                        <ul class="list-unstyled list-pagination">
                            <li class="list-pagination__item arrow">
                                <i class="zmdi zmdi-chevron-left"></i>
                            </li>
                            <li class="list-pagination__item active">
                                <span class="number">1</span>
                            </li>
                            <li class="list-pagination__item">
                                <span class="number">2</span>
                            </li>
                            <li class="list-pagination__item arrow">
                                <i class="zmdi zmdi-chevron-right"></i>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- END CLASSES-->

    <!-- TEACHER-->
    <section class="section bg-pink-2 p-t-120 p-md-t-60 p-b-80">
        <div class="bg-cloud-2">
            <img src="/assets/jobby/images/icon/bg-cloud-06.png" alt="Cloud 1">
        </div>
        <div class="bg-cloud-3">
            <img src="/assets/jobby/images/icon/bg-cloud-07.png" alt="Cloud 2">
        </div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading section-heading-2">
                        <h2 class="section-heading__title">Our Teacher</h2>
                        <div class="section-heading__line">
                            <img src="/assets/jobby/images/icon/line-white.png" alt="Line 2">
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">
                    <div class="media media-teacher-2">
                        <div class="media__img">
                            <a href="teacher-single.html">
                                <img src="/assets/jobby/images/teacher-06.jpg" alt="Rose Alexander" />
                            </a>
                        </div>
                        <div class="media__body">
                            <h4 class="media__title title title--sm title--black">
                                <a href="teacher-single.html">Rose Alexander</a>
                            </h4>
                            <span class="media__desc">Managing Director</span>
                            <p class="media__text">Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe</p>
                            <div class="media__tool">
                                <a class="au-icon au-icon-2" href="#">
                                    <i class="zmdi zmdi-facebook-box"></i>
                                </a>
                                <a class="au-icon au-icon-2" href="#">
                                    <i class="zmdi zmdi-twitter"></i>
                                </a>
                                <a class="au-icon au-icon-2" href="#">
                                    <i class="zmdi zmdi-instagram"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="media media-teacher-2">
                        <div class="media__img">
                            <a href="teacher-single.html">
                                <img src="/assets/jobby/images/teacher-07.jpg" alt="Catherine Wade" />
                            </a>
                        </div>
                        <div class="media__body">
                            <h4 class="media__title title title--sm title--black">
                                <a href="teacher-single.html">Catherine Wade</a>
                            </h4>
                            <span class="media__desc">Music Teacher</span>
                            <p class="media__text">Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus</p>
                            <div class="media__tool">
                                <a class="au-icon au-icon-2" href="#">
                                    <i class="zmdi zmdi-facebook-box"></i>
                                </a>
                                <a class="au-icon au-icon-2" href="#">
                                    <i class="zmdi zmdi-twitter"></i>
                                </a>
                                <a class="au-icon au-icon-2" href="#">
                                    <i class="zmdi zmdi-instagram"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="media media-teacher-2">
                        <div class="media__img">
                            <a href="teacher-single.html">
                                <img src="/assets/jobby/images/teacher-08.jpg" alt="Victoria Lawson" />
                            </a>
                        </div>
                        <div class="media__body">
                            <h4 class="media__title title title--sm title--black">
                                <a href="teacher-single.html">Victoria Lawson</a>
                            </h4>
                            <span class="media__desc">Drawing Teacher</span>
                            <p class="media__text">On the other hand, we denounce with righteous indignation and dislike men beguiled</p>
                            <div class="media__tool">
                                <a class="au-icon au-icon-2" href="#">
                                    <i class="zmdi zmdi-facebook-box"></i>
                                </a>
                                <a class="au-icon au-icon-2" href="#">
                                    <i class="zmdi zmdi-twitter"></i>
                                </a>
                                <a class="au-icon au-icon-2" href="#">
                                    <i class="zmdi zmdi-instagram"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="media media-teacher-2">
                        <div class="media__img">
                            <a href="teacher-single.html">
                                <img src="/assets/jobby/images/teacher-09.jpg" alt="Stephanie Arnold" />
                            </a>
                        </div>
                        <div class="media__body">
                            <h4 class="media__title title title--sm title--black">
                                <a href="teacher-single.html">Stephanie Arnold</a>
                            </h4>
                            <span class="media__desc">Language Teacher</span>
                            <p class="media__text">These cases are perfectly simple and easy to distinguish. In a free hour, when our power</p>
                            <div class="media__tool">
                                <a class="au-icon au-icon-2" href="#">
                                    <i class="zmdi zmdi-facebook-box"></i>
                                </a>
                                <a class="au-icon au-icon-2" href="#">
                                    <i class="zmdi zmdi-twitter"></i>
                                </a>
                                <a class="au-icon au-icon-2" href="#">
                                    <i class="zmdi zmdi-instagram"></i>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END TEACHER-->
{/block}
