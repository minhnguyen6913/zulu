{extends file='smeq/master.tpl'}
{block name='css'}{/block}
{block name='script'}
    <script type="application/javascript">

    </script>
{/block}
{block name='body'}
    <!-- PAGE HEADING-->
    <section class="section page-heading js-parallax-scroll" style="background-image: url('{$settings['contact_banner']['value']}'),url('/assets/ext/image/nobanner.png');" >

        <div class="container">
            <div class="page-heading-inner">
                <div class="section-heading section-heading-1 section-heading-1--tiny text-left">
                    <h2 class="section-heading__title">Liên hệ</h2>
                    <div class="section-heading__line">
                        <img src="/assets/jobby/images/icon/line-blue-small.png" alt="Line" />
                    </div>
                </div>
            </div>
        </div>
    </section>
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
                            <h3 class="title title--xl">Điện thoại</h3>
                            <br>
                            <span>{$settings['phone']['value']}</span>
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
                            <h3 class="title title--xl">Địa chỉ</h3>
                            <br>
                            <span>{$settings['address']['value']}</span>
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
                            <br>
                            <span>{$settings['email']['value']}</span>
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
                            <h3 class="title title--xl">Thời gian <br>làm việc</h3>
                            <span>{$settings['address']['value']}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <section class="section p-t-125">
        <div class="container">
            <div class="row">
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3919.3961181853383!2d106.68615921382253!3d10.780942762060638!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31752f30289e83e7%3A0x37e40e4ad86a026a!2zVHJ1bmcgdMOibSBL4bu5IFRodeG6rXQgVGnDqnUgQ2h14bqpbiDEkG8gTMaw4budbmcgQ2jhuqV0IEzGsOG7o25nIFRow6BuaCBwaOG7kSBI4buTIENow60gTWluaA!5e0!3m2!1svi!2s!4v1603806300505!5m2!1svi!2s" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            </div>
        </div>
    </section>

{/block}
