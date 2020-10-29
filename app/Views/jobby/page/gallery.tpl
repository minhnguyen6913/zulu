{extends file='jobby/master.tpl'}
{block name='css'}{/block}
{block name='script'}{/block}
{block name='body'}
    <!-- PAGE HEADING-->
    <section class="section page-heading js-parallax-scroll" style="background-image: url('/assets/jobby/images/bg-heading-01.jpg')">
        <div class="container">
            <div class="page-heading-inner">
                <div class="section-heading section-heading-1 section-heading-1--tiny text-left">
                    <h2 class="section-heading__title">Gallery</h2>
                    <div class="section-heading__line">
                        <img src="/assets/jobby/images/icon/line-blue-small.png" alt="Line" />
                    </div>
                </div>
                <nav class="au-breadcrumb">
                    <ul class="list-unstyled list-breadcrumb">
                        <li class="list-breadcrumb__item">
                            <a href="index.html">Home</a>
                        </li>
                        <li class="list-breadcrumb__item">Gallery</li>
                    </ul>
                </nav>
            </div>
        </div>
    </section>
    <!-- END PAGE HEADING-->

    <!-- GALLERY COBBLES-->
    <section class="section js-isotope-wrapper p-t-125 p-b-80">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <nav class="au-tab-2 m-b-50">
                        <ul class="list-unstyled au-tab__nav iostope-filter">
                            <li class="active au-tab__nav-item" data-filter="*">
                                <span class="au-tab__nav-item-inner">All</span>
                            </li>
                            <li class="au-tab__nav-item" data-filter=".classes">
                                <span class="au-tab__nav-item-inner">Classes</span>
                            </li>
                            <li class="au-tab__nav-item" data-filter=".fund">
                                <span class="au-tab__nav-item-inner">Funding</span>
                            </li>
                            <li class="au-tab__nav-item" data-filter=".faci">
                                <span class="au-tab__nav-item-inner">Facilities</span>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <div class="row isotope-content">
                <div class="col-md-6 col-lg-4 isotope-item isotope-item-sizer faci">
                    <div class="media media-gradu-3">
                        <div class="media__overlay">
                            <div class="media__overlay-inner"></div>
                        </div>
                        <div class="media__img">
                            <img src="/assets/jobby/images/gradu-13.jpg" alt="Cute Girl" />
                        </div>
                        <div class="media__body">
                            <div class="media__tool">
                                <a class="au-icon" href="/assets/jobby/images/gradu-13.jpg" data-lightbox="gradu">
                                    <i class="fas fa-expand-arrows-alt"></i>
                                </a>
                                <a class="au-icon" href="#">
                                    <i class="fas fa-link"></i>
                                </a>
                            </div>
                            <h4 class="media__title title title--white">
                                <a href="#">Cute Girl</a>
                            </h4>
                            <span class="date-time">April 12, 2020</span>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 isotope-item classes">
                    <div class="media media-gradu-3">
                        <div class="media__overlay">
                            <div class="media__overlay-inner"></div>
                        </div>
                        <div class="media__img">
                            <img src="/assets/jobby/images/gradu-22.jpg" alt="Two Girl" />
                        </div>
                        <div class="media__body">
                            <div class="media__tool">
                                <a class="au-icon" href="/assets/jobby/images/gradu-22.jpg" data-lightbox="gradu">
                                    <i class="fas fa-expand-arrows-alt"></i>
                                </a>
                                <a class="au-icon" href="#">
                                    <i class="fas fa-link"></i>
                                </a>
                            </div>
                            <h4 class="media__title title title--white">
                                <a href="#">Two Girl</a>
                            </h4>
                            <span class="date-time">April 18, 2020</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 isotope-item faci">
                    <div class="media media-gradu-3">
                        <div class="media__overlay">
                            <div class="media__overlay-inner"></div>
                        </div>
                        <div class="media__img">
                            <img src="/assets/jobby/images/gradu-16.jpg" alt="Pink Girl" />
                        </div>
                        <div class="media__body">
                            <div class="media__tool">
                                <a class="au-icon" href="/assets/jobby/images/gradu-16.jpg" data-lightbox="gradu">
                                    <i class="fas fa-expand-arrows-alt"></i>
                                </a>
                                <a class="au-icon" href="#">
                                    <i class="fas fa-link"></i>
                                </a>
                            </div>
                            <h4 class="media__title title title--white">
                                <a href="#">Pink Girl</a>
                            </h4>
                            <span class="date-time">April 20, 2020</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 isotope-item classes">
                    <div class="media media-gradu-3">
                        <div class="media__overlay">
                            <div class="media__overlay-inner"></div>
                        </div>
                        <div class="media__img">
                            <img src="/assets/jobby/images/gradu-19.jpg" alt="Writing" />
                        </div>
                        <div class="media__body">
                            <div class="media__tool">
                                <a class="au-icon" href="/assets/jobby/images/gradu-19.jpg" data-lightbox="gradu">
                                    <i class="fas fa-expand-arrows-alt"></i>
                                </a>
                                <a class="au-icon" href="#">
                                    <i class="fas fa-link"></i>
                                </a>
                            </div>
                            <h4 class="media__title title title--white">
                                <a href="#">Writing</a>
                            </h4>
                            <span class="date-time">April 20, 2020</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 isotope-item faci">
                    <div class="media media-gradu-3">
                        <div class="media__overlay">
                            <div class="media__overlay-inner"></div>
                        </div>
                        <div class="media__img">
                            <img src="/assets/jobby/images/gradu-20.jpg" alt="Grand &amp; Kid" />
                        </div>
                        <div class="media__body">
                            <div class="media__tool">
                                <a class="au-icon" href="/assets/jobby/images/gradu-20.jpg" data-lightbox="gradu">
                                    <i class="fas fa-expand-arrows-alt"></i>
                                </a>
                                <a class="au-icon" href="#">
                                    <i class="fas fa-link"></i>
                                </a>
                            </div>
                            <h4 class="media__title title title--white">
                                <a href="#">Grand &amp; Kid</a>
                            </h4>
                            <span class="date-time">April 17, 2020</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 isotope-item fund">
                    <div class="media media-gradu-3">
                        <div class="media__overlay">
                            <div class="media__overlay-inner"></div>
                        </div>
                        <div class="media__img">
                            <img src="/assets/jobby/images/gradu-21.jpg" alt="Color" />
                        </div>
                        <div class="media__body">
                            <div class="media__tool">
                                <a class="au-icon" href="/assets/jobby/images/gradu-21.jpg" data-lightbox="gradu">
                                    <i class="fas fa-expand-arrows-alt"></i>
                                </a>
                                <a class="au-icon" href="#">
                                    <i class="fas fa-link"></i>
                                </a>
                            </div>
                            <h4 class="media__title title title--white">
                                <a href="#">Color</a>
                            </h4>
                            <span class="date-time">July 26, 2020</span>
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
    <!-- END GALLERY COBBLES-->
{/block}
