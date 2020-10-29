{extends file='smeq/master.tpl'}
{block name='css'}{/block}
{block name='script'}{/block}
{block name='body'}
    <!-- PAGE HEADING-->
    <section class="section page-heading js-parallax-scroll" style="background-image: url('{$settings[$setting_banner]['value']}'),url('/assets/ext/image/nobanner.png');">
        <div class="container">
            <div class="page-heading-inner">
                <div class="section-heading section-heading-1 section-heading-1--tiny text-left">
                    <h2 class="section-heading__title">{$model}</h2>
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
                    {if $module == 'service/'}
                        <li class="list-breadcrumb__item">
                            {$model}
                        </li>
                    {else}
                        <li class="list-breadcrumb__item">
                            <a href="{$pathRoot}{$module}">{$model}</a>
                        </li>
                    {/if}
                    {if $sub_category}
                        <li class="list-breadcrumb__item">
                            <a href="{$pathRoot}{$module}?id={$category_id}">{$sub_category}</a>
                        </li>
                    {/if}
                </ul>
            </nav>
        </div>
    </section>
    <!-- BLOG SINGLE-->
    <section class="section p-t-125 p-b-80">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-lg-9">
                    <div class="blog-single">
                        <div class="media media-blog-4 m-b-10">
                            <div class="media__img">
                                <img style="max-height: 100%; max-width: 100%" src="{$upload_url}{$article['cat_image']}/{$article['src']}" onerror="this.onerror=null; this.src='{$noimage}'">

                                {if $article['date_create']}
                                    <div class="media__date">
                                        <div class="media__date-inner">
                                            <span class="day">{$article['date_create']|date_format:"%d"}</span>
                                            <span class="month">{$article['date_create']|date_format:"%B"}</span>
                                        </div>
                                    </div>
                                {/if}
                            </div>
                            <div class="media__body">
                                <h4 class="media__title title title--black title--s35">{$article['name']}</h4>
                            </div>
                        </div>
                        <div class="blockqoute-blog m-b-30">
                        </div>
                        <p class="m-b-25">
                            {$article['content']}
                        </p>
                        <div class="blog-single__info m-b-40">
                            <ul class="list-tags list-unstyled">

                            </ul>
                            <ul class="list-unstyled list-inline list-social list-social-3">
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
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-lg-3">
                    <div class="page-sidebar p-sm-t-50">
                        {if $category}
                            <div class="widget p-b-30">
                                <div class="section-heading section-heading-1 section-heading-1--tiny2 text-left">
                                    <h2 class="section-heading__title">Danh mục</h2>
                                    <div class="section-heading__line">
                                        <img src="/assets/jobby/images/icon/line-blue-tiny.png" alt="Line">
                                    </div>
                                </div>
                                <ul class="list-bare list-unstyled">
                                    {foreach from=$category item=cat}
                                        <li class="list-bare__item">
                                            <span class="dot"></span>
                                            <a class="list-bare__link" href="{$pathRoot}{$module}?id={$cat['id']}">{$cat['name']}</a>
                                        </li>
                                    {/foreach}
                                </ul>
                            </div>
                        {/if}
                        {if $articlenew}
                            <div class="widget p-b-30">
                                <div class="section-heading section-heading-1 section-heading-1--tiny2 text-left">
                                    <h2 class="section-heading__title">Bài viết mới</h2>
                                    <div class="section-heading__line">
                                        <img src="/assets/jobby/images/icon/line-blue-tiny.png" alt="Line">
                                    </div>
                                    <div class="m-b-20"></div>
                                </div>
                                {foreach from=$articlenew item=docnew}
                                    <div class="media media-blog-5">
                                        <div class="media__img">
                                            <a class="img-radius" href="{$pathRoot}{$module}detail?id={$docnew['id']}">
                                                <img src="{$upload_url}{$docnew['cat_image']}/{$docnew['thumbnail']}" onerror="this.onerror=null; this.src='{$noimage}'" />
                                            </a>
                                        </div>
                                        <div class="media__body">
                                            <p class="media__time">{$docnew['date_create']|date_format:"%B %d, %Y"}</p>
                                            <h5 class="title title--black media__title">
                                                <a href="{$pathRoot}{$module}detail?id={$docnew['id']}">{$docnew['name']}</a>
                                            </h5>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        {/if}
                        {if $list_service}
                            <div class="widget p-b-30">
                                <div class="section-heading section-heading-1 section-heading-1--tiny2 text-left">
                                    <h2 class="section-heading__title">Dịch Vụ</h2>
                                    <div class="section-heading__line">
                                        <img src="/assets/jobby/images/icon/line-blue-tiny.png" alt="Line">
                                    </div>
                                    <div class="m-b-20"></div>
                                </div>
                                <ul class="list-bare list-unstyled">
                                    {foreach from=$list_service item=ser}
                                        <li class="list-bare__item">
                                            <span class="dot"></span>
                                            <a style="display: initial" class="list-bare__link" href="{$pathRoot}{$module}detail?id={$ser['id']}">{$ser['name']}</a>
                                        </li>
                                    {/foreach}
                                </ul>
                            </div>
                        {/if}
                        <div class="widget p-t-50">
                            <form class="form form--icon" method="post" action="{$pathRoot}{$module}search">
                                <input class="input-border-3" type="text" id="input_key" name="input_key" placeholder="Điền từ khóa ...">
                                <button class="btn-submit-2" type="submit">
                                    <span class="lnr lnr-magnifier"></span>
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- END BLOG SINGLE  -->
{/block}
