{extends file='jobby/master.tpl'}
{block name='css'}{/block}
{block name='script'}{/block}
{block name='body'}
    <!-- PAGE HEADING-->
    <section class="section page-heading js-parallax-scroll" style="background-image: url('/assets/jobby/images/bg-heading-01.jpg')">
        <div class="container">
            <div class="page-heading-inner">
                <div class="section-heading section-heading-1 section-heading-1--tiny text-left">
                    <h2 class="section-heading__title">Contact Us</h2>
                    <div class="section-heading__line">
                        <img src="/assets/jobby/images/icon/line-blue-small.png" alt="Line" />
                    </div>
                </div>
                <nav class="au-breadcrumb">
                    <ul class="list-unstyled list-breadcrumb">
                        <li class="list-breadcrumb__item">
                            <a href="index.html">Home</a>
                        </li>
                        <li class="list-breadcrumb__item">Contact Us</li>
                    </ul>
                </nav>
            </div>
        </div>
    </section>
    <!-- END PAGE HEADING-->
    <!-- INFO-->
    <section class="section p-t-125">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-lg-3">
                    <div class="box box-info">
                        <div class="box__head">
                            <div class="box__icon au-icon-4 blue">
                                <span class="lnr lnr-phone-handset"></span>
                            </div>
                        </div>
                        <div class="box__body">
                            <h3 class="title title--xl">Phone</h3>
                            <span>(363) 287 6443</span>
                            <span>(996) 406 3959</span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="box box-info">
                        <div class="box__head">
                            <div class="box__icon au-icon-4 yellow">
                                <span class="lnr lnr-map"></span>
                            </div>
                        </div>
                        <div class="box__body">
                            <h3 class="title title--xl">Address</h3>
                            <span>No 40 Baria Sreet 133/2</span>
                            <span>NewYork 13589</span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="box box-info">
                        <div class="box__head">
                            <div class="box__icon au-icon-4 pink">
                                <span class="lnr lnr-envelope"></span>
                            </div>
                        </div>
                        <div class="box__body">
                            <h3 class="title title--xl">Email</h3>
                            <span>cheryl-hart@example.com</span>
                            <span>sandraburns@example.com</span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6 col-lg-3">
                    <div class="box box-info">
                        <div class="box__head">
                            <div class="box__icon au-icon-4 green">
                                <span class="lnr lnr-clock"></span>
                            </div>
                        </div>
                        <div class="box__body">
                            <h3 class="title title--xl">Open Time</h3>
                            <span>Monday-Saturday: 6AM – 9PM</span>
                            <span>Sunday: Closed</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END INFO-->
    <!-- MESSAGE-->
    <section class="section p-t-30 p-b-85">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading section-heading-1">
                        <h2 class="section-heading__title">Send Message</h2>
                        <div class="section-heading__line">
                            <img src="/assets/jobby/images/icon/line-blue.png" alt="Line">
                        </div>
                    </div>
                    <form class="js-contact-form" action="" method="post">
                        <div class="row">
                            <div class="col-md-6 p-r-10 p-md-r-15">
                                <input class="input-border" type="text" name="name" required placeholder="Your name">
                            </div>
                            <div class="col-md-6 p-l-10 p-md-l-15">
                                <input class="input-border" type="email" name="email" required pattern="[^@]+@[^@]+\.[a-zA-Z]{ldelim}2,6{rdelim}" placeholder="Your e-mail">
                            </div>
                        </div>
                        <textarea class="textarea-border" name="message" placeholder="Your message..." required></textarea>
                        <div class="text-center">
                            <button class="au-btn au-btn--blue" type="submit">submit
                                <i class="zmdi zmdi-chevron-right"></i>
                                <i class="zmdi zmdi-chevron-right"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </section>
    <!-- END MESSAGE-->
{/block}
