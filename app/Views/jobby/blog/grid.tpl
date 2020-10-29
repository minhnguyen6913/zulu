{extends file='jobby/master.tpl'}
{block name='css'}{/block}
{block name='script'}{/block}
{block name='body'}
    <!-- PAGE HEADING-->
    <section class="section page-heading js-parallax-scroll" style="background-image: url('/assets/jobby/images/bg-heading-04.jpg');">
        <div class="container">
            <div class="page-heading-inner">
                <div class="section-heading section-heading-1 section-heading-1--tiny text-left">
                    <h2 class="section-heading__title">Blog Masonry</h2>
                    <div class="section-heading__line">
                        <img src="/assets/jobby/images/icon/line-blue-small.png" alt="Line" />
                    </div>
                </div>
                <nav class="au-breadcrumb">
                    <ul class="list-unstyled list-breadcrumb">
                        <li class="list-breadcrumb__item">
                            <a href="index.html">Home</a>
                        </li>
                        <li class="list-breadcrumb__item">Blog</li>
                    </ul>
                </nav>
            </div>
        </div>
    </section>
    <!-- END PAGE HEADING-->

    <!-- BLOG MASONRY-->
    <section class="section p-t-125 p-b-80">
        <div class="container">
            <div class="row">
                <div class="col-md-6 col-lg-4">
                    <div class="media media-blog-2">
                        <div class="media__img">
                            <a href="{site_url()}jobby/blog/detail">
                                <img src="/assets/jobby/images/blog-04.jpg" alt="How to coax children" />
                            </a>
                            <div class="media__date">
                                <div class="media__date-inner">
                                    <span class="day">18</span>
                                    <span class="month">June</span>
                                </div>
                            </div>
                        </div>
                        <div class="media__body">
                            <h4 class="media__title title title--black title--md">
                                <a href="{site_url()}jobby/blog/detail">How to coax children</a>
                            </h4>
                            <div class="media__info">
                                        <span class="author">
                                            <a href="#">John Doe</a>
                                        </span>
                                <a class="cmt" href="#">0</a>
                            </div>
                            <p class="media__text">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="media media-blog-2">
                        <div class="media__img">
                            <a href="{site_url()}jobby/blog/detail">
                                <img src="/assets/jobby/images/blog-05.jpg" alt="If you are going to use" />
                            </a>
                            <div class="media__date">
                                <div class="media__date-inner">
                                    <span class="day">20</span>
                                    <span class="month">June</span>
                                </div>
                            </div>
                        </div>
                        <div class="media__body">
                            <h4 class="media__title title title--black title--md">
                                <a href="{site_url()}jobby/blog/detail">If you are going to use</a>
                            </h4>
                            <div class="media__info">
                                        <span class="author">
                                            <a href="#">John Doe</a>
                                        </span>
                                <a class="cmt" href="#">0</a>
                            </div>
                            <p class="media__text">Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="media media-blog-2">
                        <div class="media__img">
                            <a href="{site_url()}jobby/blog/detail">
                                <img src="/assets/jobby/images/blog-06.jpg" alt="Neque porro quisquam" />
                            </a>
                            <div class="media__date">
                                <div class="media__date-inner">
                                    <span class="day">25</span>
                                    <span class="month">June</span>
                                </div>
                            </div>
                        </div>
                        <div class="media__body">
                            <h4 class="media__title title title--black title--md">
                                <a href="{site_url()}jobby/blog/detail">Neque porro quisquam</a>
                            </h4>
                            <div class="media__info">
                                        <span class="author">
                                            <a href="#">John Hart</a>
                                        </span>
                                <a class="cmt" href="#">0</a>
                            </div>
                            <p class="media__text">Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="media media-blog-2">
                        <div class="media__img">
                            <a href="{site_url()}jobby/blog/detail">
                                <img src="/assets/jobby/images/blog-10.jpg" alt="On the other hand" />
                            </a>
                            <div class="media__date">
                                <div class="media__date-inner">
                                    <span class="day">27</span>
                                    <span class="month">June</span>
                                </div>
                            </div>
                        </div>
                        <div class="media__body">
                            <h4 class="media__title title title--black title--md">
                                <a href="{site_url()}jobby/blog/detail">On the other hand</a>
                            </h4>
                            <div class="media__info">
                                        <span class="author">
                                            <a href="#">John Doe</a>
                                        </span>
                                <a class="cmt" href="#">0</a>
                            </div>
                            <p class="media__text">The obligations of business it will frequently occur that pleasures</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="media media-blog-2">
                        <div class="media__img">
                            <a href="{site_url()}jobby/blog/detail">
                                <img src="/assets/jobby/images/blog-11.jpg" alt="Righteous indignation" />
                            </a>
                            <div class="media__date">
                                <div class="media__date-inner">
                                    <span class="day">28</span>
                                    <span class="month">June</span>
                                </div>
                            </div>
                        </div>
                        <div class="media__body">
                            <h4 class="media__title title title--black title--md">
                                <a href="{site_url()}jobby/blog/detail">Righteous indignation</a>
                            </h4>
                            <div class="media__info">
                                        <span class="author">
                                            <a href="#">John Doe</a>
                                        </span>
                                <a class="cmt" href="#">0</a>
                            </div>
                            <p class="media__text">But in certain circumstances and owing to the claims</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="media media-blog-2">
                        <div class="media__img">
                            <a href="{site_url()}jobby/blog/detail">
                                <img src="/assets/jobby/images/blog-12.jpg" alt="Demoralized charms" />
                            </a>
                            <div class="media__date">
                                <div class="media__date-inner">
                                    <span class="day">30</span>
                                    <span class="month">June</span>
                                </div>
                            </div>
                        </div>
                        <div class="media__body">
                            <h4 class="media__title title title--black title--md">
                                <a href="{site_url()}jobby/blog/detail">Demoralized charms</a>
                            </h4>
                            <div class="media__info">
                                        <span class="author">
                                            <a href="#">John Hart</a>
                                        </span>
                                <a class="cmt" href="#">0</a>
                            </div>
                            <p class="media__text">Every pleasure is to be welcomed and every pain avoided</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="media media-blog-2">
                        <div class="media__img">
                            <a href="{site_url()}jobby/blog/detail">
                                <img src="/assets/jobby/images/blog-13.jpg" alt="So blinded by desire" />
                            </a>
                            <div class="media__date">
                                <div class="media__date-inner">
                                    <span class="day">02</span>
                                    <span class="month">May</span>
                                </div>
                            </div>
                        </div>
                        <div class="media__body">
                            <h4 class="media__title title title--black title--md">
                                <a href="{site_url()}jobby/blog/detail">So blinded by desire</a>
                            </h4>
                            <div class="media__info">
                                        <span class="author">
                                            <a href="#">John Doe</a>
                                        </span>
                                <a class="cmt" href="#">0</a>
                            </div>
                            <p class="media__text">In a free hour, when our power of choice is untrammelled and when nothing</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="media media-blog-2">
                        <div class="media__img">
                            <a href="{site_url()}jobby/blog/detail">
                                <img src="/assets/jobby/images/blog-14.jpg" alt="Cannot foresee pain" />
                            </a>
                            <div class="media__date">
                                <div class="media__date-inner">
                                    <span class="day">07</span>
                                    <span class="month">May</span>
                                </div>
                            </div>
                        </div>
                        <div class="media__body">
                            <h4 class="media__title title title--black title--md">
                                <a href="{site_url()}jobby/blog/detail">Cannot foresee pain</a>
                            </h4>
                            <div class="media__info">
                                        <span class="author">
                                            <a href="#">John Doe</a>
                                        </span>
                                <a class="cmt" href="#">0</a>
                            </div>
                            <p class="media__text">These cases are perfectly simple and easy to distinguish</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="media media-blog-2">
                        <div class="media__img">
                            <a href="{site_url()}jobby/blog/detail">
                                <img src="/assets/jobby/images/blog-15.jpg" alt="Equal blame belongs" />
                            </a>
                            <div class="media__date">
                                <div class="media__date-inner">
                                    <span class="day">10</span>
                                    <span class="month">May</span>
                                </div>
                            </div>
                        </div>
                        <div class="media__body">
                            <h4 class="media__title title title--black title--md">
                                <a href="{site_url()}jobby/blog/detail">Equal blame belongs</a>
                            </h4>
                            <div class="media__info">
                                        <span class="author">
                                            <a href="#">John Hart</a>
                                        </span>
                                <a class="cmt" href="#">0</a>
                            </div>
                            <p class="media__text">Which is the same as saying through shrinking from toil and pain</p>
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
    <!-- END BLOG MASONRY-->

    <!-- CTA-->
    <section class="section cta-1 bg-pink p-t-80 p-b-55">
        <div class="container">
            <div class="cta-wrap">
                <div class="cta__img wow fadeInUp" data-wow-delay=".2s">
                    <img src="/assets/jobby/images/cta-item-01.png" alt="CTA">
                </div>
                <div class="row">
                    <div class="col-md-7 offset-md-5">
                        <div class="wrap--w625">
                            <div class="cta">
                                <div class="cta__body">
                                    <h2 class="title cta__title">How to Enroll Your Child to a Class?</h2>
                                    <p class="cta__text">Interested in good preschool education for your child? Our kindergarten is the right decision!</p>
                                    <a class="au-btn au-btn--blue" href="#">find our more
                                        <i class="zmdi zmdi-chevron-right"></i>
                                        <i class="zmdi zmdi-chevron-right"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END CTA-->
{/block}
