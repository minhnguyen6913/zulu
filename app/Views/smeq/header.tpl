<section class="top-contact">
    <div class="container">
        <div class="top-contact-inner">
            <div class="top-contact__left">
                <div class="top-contact__item">
                    <span class="lnr lnr-map"></span>{$settings['address']['value']}</div>
                <div class="top-contact__item">
                    <span class="lnr lnr-phone-handset"></span>{$settings['phone']['value']}</div>
            </div>
            <div class="top-contact__right">
                <ul class="list-unstyled list-inline list-social">
                    {if $settings['facebook']['value'] }
                        <li class="list-inline-item">
                            <a class="ic-fb" href="{$settings['facebook']['value']}">
                                <i class="zmdi zmdi-facebook-box"></i>
                            </a>
                        </li>
                    {/if}
                    {if $settings['twitter']['value'] }
                        <li class="list-inline-item">
                            <a class="ic-twi" href="{$settings['twitter']['value']}">
                                <i class="zmdi zmdi-twitter"></i>
                            </a>
                        </li>
                    {/if}
                    {if $settings['instagram']['value'] }
                    <li class="list-inline-item">
                        <a class="ic-insta" href="{$settings['instagram']['value']}">
                            <i class="zmdi zmdi-instagram"></i>
                        </a>
                    </li>
                    {/if}
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
                    <a href="{$pathRoot}home">
                        <img src="/assets/smeq/logo.png" alt="SMEQ" />
                    </a>
                </div>
                <nav class="header-navbar">
                    <ul class="list-unstyled">
                        <li class="header-navbar__item">
                            <a href="{$pathRoot}about">
                                <span class="bg-link">Giới thiệu</span>
                            </a>
                        </li>
                        <li class="header-navbar__item">
                            <a href="{$pathRoot}news">
                                <span class="bg-link">Tin tức</span>
                            </a>
                        </li>
                        <li class="header-navbar__item">
                            <a href="{$pathRoot}document">
                                <span class="bg-link">Văn bản pháp quy</span>
                            </a>
                        </li>
                        <li class="header-navbar__item">
                            <a href="{$pathRoot}contact">
                                <span class="bg-link">Liên hệ</span>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>
<div class="header-mobile js-header-mobile d-block d-lg-none">
    <div class="header-mobile__bar">
        <div class="container-fluid clearfix">
            <a class="logo" href="{$pathRoot}home">
                <img src="/assets/smeq/logo.png" alt="SMEQ" />
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
            <li><a href="{$pathRoot}about">Giới thiệu</a></li>
            <li><a href="{$pathRoot}about">Giới thiệu</a></li>
            <li><a href="{$pathRoot}document">Văn bản pháp quy</a></li>
            <li><a href="{$pathRoot}contact">Liên hệ</a></li>
        </ul>
    </nav>
</div>
