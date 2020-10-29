{extends file='smeq/master.tpl'}
{block name='css'}{/block}
{block name='script'}
    <script type="application/javascript">
        $(document).ready(function() {
            if ({$count_news}/9 > 1)
            {
                $("li#li_{$page}").addClass("active");
            }
        });
        function _go(page) {
            if ({$category_id} == 0) {
                document.location.href = '{$pathRoot}news?page=' + page;
            } else {
                document.location.href = '{$pathRoot}news?id={$category_id}&page=' + page;
            }
        }
        function _back() {
            if ({$category_id} == 0) {
                if({$page} > 1)
                {
                    document.location.href = '{$pathRoot}news?page={$page - 1}';
                }
            } else {
                if({$page} > 1)
                {
                    document.location.href = '{$pathRoot}news?id={$category_id}&page={$page - 1}';
                }
            }
        }
        function _next() {
            if ({$category_id} == 0) {
                if({$count_news}/9 > {$page})
                {
                    document.location.href = '{$pathRoot}news?page={$page + 1}';
                }
            } else {
                if({$count_news}/9 > {$page})
                {
                    document.location.href = '{$pathRoot}news?id={$category_id}&page={$page + 1}';
                }
            }
        }
    </script>
{/block}
{block name='body'}
    <!-- PAGE HEADING-->
    <section class="section page-heading js-parallax-scroll" style="background-image: url('{$settings['news_banner']['value']}'),url('/assets/ext/image/nobanner.png');">
        <div class="container">
            <div class="page-heading-inner">
                <div class="section-heading section-heading-1 section-heading-1--tiny text-left">
                    <h2 class="section-heading__title">Tin tức - Sự kiện</h2>
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
                    <li class="list-breadcrumb__item">
                        <a href="{$pathRoot}{$module}">Tin tức - Sự kiện</a>
                    </li>
                    {if $sub_category}
                        <li class="list-breadcrumb__item">
                            <a href="{$pathRoot}{$module}?id={$category_id}">{$sub_category}</a>
                        </li>
                    {/if}
                </ul>
            </nav>
        </div>
    </section>
    <!-- BLOG MASONRY-->
    <section class="section p-t-125 p-b-80">
        <div class="container">
            <div class="row">
                {if $news}
                    {foreach from=$news item=tintuc}
                        <div class="col-md-6 col-lg-4">
                            <div class="media media-blog-2" style="height: 400px">
                                <div class="media__img">
                                    <a style="height: 260px; text-align: center" href="{$pathRoot}news/detail?id={$tintuc['id']}">
                                        <img style="max-width: 100%; max-height: 100%" src="{$upload_url}{$tintuc['cat_image']}/{$tintuc['src']}" alt="" onerror="this.onerror=null; this.src='{$noimage}'"/>
                                    </a>
                                    <div class="media__date">
                                        <div class="media__date-inner">
                                            <span class="day">{$tintuc['date_create']|date_format:"%d"}</span>
                                            <span class="month">{$tintuc['date_create']|date_format:"%B"}</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="media__body">
                                    <h4 class="media__title title title--black title--md">
                                        <a href="{$pathRoot}news/detail?id={$tintuc['id']}">{$tintuc['name']}</a>
                                    </h4>
                                    <p class="media__text">{$tintuc['intro']}</p>
                                </div>
                            </div>
                        </div>
                    {/foreach}
                {/if}
            </div>
            <div class="row">
                <div class="col-md-12">
                    <nav class="au-pagination p-t-30">
                        {assign var="mun" value={$count_news}/9}
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
    </section>
    <!-- END BLOG MASONRY-->

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
                                        <img style="max-height: 100%; max-width: 100%" src="{$upload_url}{$cus['cat_image']}/{$cus['src']}"  onerror="this.onerror=null; this.src='{$noimage}'">
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
