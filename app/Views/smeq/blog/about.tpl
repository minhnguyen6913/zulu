{extends file='smeq/master.tpl'}
{block name='css'}{/block}
{block name='script'}
    <script type="application/javascript">
        $(document).ready(function() {
            if ({$count_about}/10 > 1)
            {
                $("li#li_{$page}").addClass("active");
            }
        });
        function _go(page) {
            document.location.href = '{$pathRoot}{$module}?page=' + page;
        }
        function _back() {
            if({$page} > 1)
            {
                document.location.href = '{$pathRoot}{$module}?page={$page - 1}';
            }
        }
        function _next() {
            if({$count_about}/10 > {$page})
            {
                document.location.href = '{$pathRoot}{$module}?page={$page + 1}';
            }
        }
    </script>
{/block}
{block name='body'}
    <!-- PAGE HEADING-->
    <section class="section page-heading js-parallax-scroll" style="background-image: url('{$settings['about_banner']['value']}'),url('/assets/ext/image/nobanner.png');" >

        <div class="container">
            <div class="page-heading-inner">
                <div class="section-heading section-heading-1 section-heading-1--tiny text-left">
                    <h2 class="section-heading__title">Giới thiệu</h2>
                    <div class="section-heading__line">
                        <img src="/assets/jobby/images/icon/line-blue-small.png" alt="Line" />
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END PAGE HEADING-->
    <section class="selector p-t-30 p-b-50">
        <div class="container">
        <nav class="au-breadcrumb">
            <ul class="list-unstyled list-breadcrumb">
                <li class="list-breadcrumb__item">
                    <a href="{$pathRoot}home">Trang chủ</a>
                </li>
                <li class="list-breadcrumb__item">Giới thiệu</li>
            </ul>
        </nav>
        </div>
    </section>
    <!-- BLOG RIGHT SIDEBAR-->
    <section class="section p-t-125 p-b-80">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-lg-3">
                    <div class="page-sidebar p-sm-b-70">
                        <div class="widget p-b-30">
                            <div class="section-heading section-heading-1 section-heading-1--tiny2 text-left">
                                <h2 class="section-heading__title">Bài viết</h2>
                                <div class="section-heading__line">
                                    <img src="/assets/jobby/images/icon/line-blue-tiny.png" alt="Line">
                                </div>
                            </div>
                            <ul class="list-bare list-unstyled">
                                {if $about}
                                    {foreach from=$list_about item=act}
                                        <li class="list-bare__item">
                                            <span class="dot"></span>
                                            <a style="display: initial" class="list-bare__link" href="{$pathRoot}{$module}detail?id={$act['id']}">{$act['name']}</a>
                                        </li>
                                    {/foreach}
                                {/if}
                            </ul>
                        </div>
                        <div class="widget p-t-50">
                            <form class="form form--icon" method="post" action="{$pathRoot}{$module}search">
                                <input class="input-border-3" id="input_key" name="input_key" type="text" placeholder="Nhập từ khóa...">
                                <button class="btn-submit-2" type="submit">
                                    <span class="lnr lnr-magnifier"></span>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-md-8 col-lg-9">
                    <div class="p-l-10 p-sm-l-0">
                        {if $about}
                            {foreach from=$about item=acticle}
                                <div class="media media-blog-4">
                                    <div class="media__img">
                                        <a style="height: 500px; text-align: center" class="img-radius" href="{$pathRoot}{$module}detail?id={$acticle['id']}">
                                            <img style="max-width: 100%; max-height: 100%" src="{$upload_url}{$acticle['cat_image']}/{$acticle['src']}" alt="How to coax children" />
                                        </a>
                                        <div class="media__date">
                                            <div class="media__date-inner">
                                                <span class="day">{$acticle['date_create']|date_format:"%d"}</span>
                                                <span class="month">{$acticle['date_create']|date_format:"%B"}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="media__body">
                                        <h4 class="media__title title title--black title--s35">
                                            <a href="{$pathRoot}{$module}detail?id={$acticle['id']}">{$acticle['name']}</a>
                                        </h4>
                                        <p class="media__text"></p>
                                    </div>
                                    <div class="media__footer">
                                        <a class="link-learn-more" href="{$pathRoot}{$module}detail?id={$acticle['id']}">Xem thêm
                                            <i class="zmdi zmdi-chevron-right"></i>
                                            <i class="zmdi zmdi-chevron-right"></i>
                                        </a>

                                    </div>
                                </div>
                            {/foreach}
                        {/if}
                        <nav class="au-pagination p-t-10">
                            {assign var="mun" value={$count_about}/10}
                            {if $mun > 1}
                                <ul class="list-unstyled list-pagination">
                                    <li class="list-pagination__item arrow" onclick="_back()">
                                        <i class="zmdi zmdi-chevron-left"></i>
                                    </li>
                                    {for $i=1 to $mun}
                                        <li id="li_{$i}" class="list-pagination__item" onclick="_go({$i})">
                                            <span class="number">{$i}</span>
                                        </li>
                                    {/for}
                                    <li class="list-pagination__item arrow" onclick="_next()">
                                        <i class="zmdi zmdi-chevron-right"></i>
                                    </li>
                                </ul>
                            {/if}
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END BLOG RIGHT SIDEBAR   -->

    <!-- PARTNER-->
    <section class="section bg-f7 p-t-60 p-b-60">
        <div class="wrap wrap--w1760">
            <div class="slick-partner">
                <div class="slick__wrap-content js-slick-wrapper" data-slick-xs="1" data-slick-sm="2" data-slick-md="4" data-slick-lg="4" data-slick-xl="6" data-slick-autoplay="true">
                    <div class="slick__content js-slick-content">
                        {if $list_customers}
                            {foreach from=$list_customers item=cus}
                                <div class="slick__item">
                                    <a style="height: 125px; text-align: center" class="img-partner" href="{$cus['link']}">
                                        <img style="max-height: 100%; max-width: 100%" src="{if $cus['src'] != ''}{$upload_url}{$cus['cat_image']}/{$cus['src']}{else}{$upload_url}no-image.jpg{/if}" alt="Partner 1">
                                    </a>
                                </div>
                            {/foreach}
                        {/if}
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END PARTNER-->
{/block}
