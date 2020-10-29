{extends file='jobby/master.tpl'}
{block name='css'}{/block}
{block name='script'}{/block}
{block name='body'}
    <!-- PAGE HEADING-->
    <section class="section page-heading js-parallax-scroll" style="background-image: url('/assets/jobby/images/bg-heading-02.jpg');">
        <div class="container">
            <div class="page-heading-inner">
                <div class="section-heading section-heading-1 section-heading-1--tiny text-left">
                    <h2 class="section-heading__title">teacher</h2>
                    <div class="section-heading__line">
                        <img src="/assets/jobby/images/icon/line-blue-small.png" alt="Line" />
                    </div>
                </div>
                <nav class="au-breadcrumb">
                    <ul class="list-unstyled list-breadcrumb">
                        <li class="list-breadcrumb__item">
                            <a href="index.html">Home</a>
                        </li>
                        <li class="list-breadcrumb__item">teacher</li>
                    </ul>
                </nav>
            </div>
        </div>
    </section>
    <!-- END PAGE HEADING-->

    <!-- TEACHER SINGLE-->
    <section class="section p-t-125 p-b-50">
        <div class="container">
            <div class="row no-gutters">
                <div class="col-md-5 col-lg-4">
                    <div class="media media-teacher-4">
                        <div class="media__head">
                            <div class="media__img">
                                <img src="/assets/jobby/images/teacher-12.jpg" alt="Teacher">
                            </div>
                        </div>
                        <div class="media__body">
                            <h3 class="title title--md">Victoria Lawson</h3>
                            <span class="d-block">Drawing Teacher</span>
                            <ul class="list-unstyled list-teacher-info-2">
                                <li>
                                    <span class="lnr lnr-linearicons"></span>8 years experience</li>
                                <li>
                                    <span class="lnr lnr-phone"></span>(202) 275 6225</li>
                                <li>
                                    <span class="lnr lnr-envelope"></span>diana.wong@example.com</li>
                            </ul>
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
                <div class="col-md-7 col-lg-8">
                    <div class="p-l-55 p-sm-l-0">
                        <h2 class="title title--s35 m-b-20">Teacher Victoria Lawson</h2>
                        <p class="m-b-20">
                            At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia
                            animi, id est laborum et dolorum fuga.
                        </p>
                        <ul class="list-unstyled list-teacher-info-3 m-b-20">
                            <li>
                                <i class="zmdi zmdi-check-circle"></i>Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit</li>
                            <li>
                                <i class="zmdi zmdi-check-circle"></i>Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet</li>
                            <li>
                                <i class="zmdi zmdi-check-circle"></i>Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.
                            </li>
                            <li>
                                <i class="zmdi zmdi-check-circle"></i>On the other hand, we denounce with righteous indignation</li>
                        </ul>
                        <p>
                            These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain
                            circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters
                            to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END TEACHER SINGLE-->

    <!-- ENDROLL-->
    <section class="section bg-pink p-t-125 p-b-100">
        <div class="bg-cloud-6"></div>
        <img class="cloud-1 wow fadeInLeft" src="/assets/jobby/images/icon/cloud-01.png" alt="Cloud 1" data-wow-delay=".3s">
        <img class="cloud-2 wow fadeInRight" src="/assets/jobby/images/icon/cloud-02.png" alt="Cloud 2" data-wow-delay=".2s">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="section-heading section-heading-2">
                        <h2 class="section-heading__title">How to enroll your child</h2>
                        <div class="section-heading__line">
                            <img src="/assets/jobby/images/icon/line-white.png" alt="Line 2">
                        </div>
                    </div>
                </div>
            </div>
            <form class="js-contact-form" action="includes/contact-form.php" method="post">
                <div class="row">
                    <div class="col-md-6 p-r-10 p-md-r-15">
                        <input class="input-border-trans" type="text" placeholder="Parent's name" name="name" required>
                    </div>
                    <div class="col-md-6 p-l-10 p-md-l-15">
                        <input class="input-border-trans" type="text" placeholder="Add us to the waiting list" name="wait">
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-6 p-r-10 p-md-r-15">
                        <input class="input-border-trans" type="email" placeholder="Email" name="email" required pattern="[^@]+@[^@]+\.[a-zA-Z]{ldelim}2,6{rdelim}">
                    </div>
                    <div class="col-md-6 p-l-10 p-md-l-15">
                        <input class="input-border-trans" type="text" placeholder="Phone" name="phone" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <textarea class="textarea-border-trans" name="message" placeholder="Your message..." required></textarea>
                        <div class="text-center">
                            <button class="au-btn au-btn--blue" type="submit">submit
                                <i class="zmdi zmdi-chevron-right"></i>
                                <i class="zmdi zmdi-chevron-right"></i>
                            </button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>
    <!-- END ENDROLL-->
{/block}
