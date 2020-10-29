{extends file='smeq/master.tpl'}
{block name='css'}{/block}
{block name='script'}
    <script type="application/javascript">
        $(document).ready(function() {
            if ({$output['count_result']}/5 > 1)
            {
                $("li#li_{$output['page']}").addClass("active");
            }
        });
        function _go(page) {
            var key = '{$output['key']}'
            document.location.href = '{$pathRoot}{$module}search?input_key='+key+'&page=' + page;
        }
        function _back() {
            var key = '{$output['key']}';
            if({$output['page']} > 1)
            {
                document.location.href = '{$pathRoot}{$module}search?input_key='+key+'&page={$output['page'] - 1}';
            }
        }
        function _next() {
            var key = '{$output['key']}';
            if ({$output['count_result']}/5 > {$output['page']})
            {
                document.location.href = '{$pathRoot}{$module}search?input_key='+key+'&page={$output['page'] + 1}';
            }
        }
    </script>
{/block}
{block name='body'}
    <!-- PAGE HEADING-->
    <section class="section page-heading js-parallax-scroll" style="background-image: url('{$settings[$setting_banner]['value']}'),url('/assets/ext/image/nobanner.png');">
        <div class="container">
            <div class="page-heading-inner">
                <div class="section-heading section-heading-1 section-heading-1--tiny text-left">
                    <h2 class="section-heading__title">{$output['model']}</h2>
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
                            {$output['model']}
                        </li>
                    {else}
                        <li class="list-breadcrumb__item">
                            <a href="{$pathRoot}{$module}">{$output['model']}</a>
                        </li>
                    {/if}
                </ul>
            </nav>
        </div>
    </section>
    <!-- BLOG RIGHT SIDEBAR-->
    <section class="section p-t-125 p-b-80">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-lg-9">
                    <div class="p-r-10 p-sm-r-0">
                        {if $output['result']}
                            {foreach from=$output['result'] item=res}
                                <div class="media media-blog-4">
                                    <div class="media__img">
                                        <a class="img-radius" style="text-align: center; height: 500px" href="{$pathRoot}{$module}detail?id={$res['id']}">
                                            <img style="max-height: 100%; max-width: 100%" src="{$upload_url}{$res['cat_image']}/{$res['src']}"  onerror="this.onerror=null; this.src='{$noimage}'" />
                                        </a>
                                        {if $res['date_create']}
                                            <div class="media__date">
                                                <div class="media__date-inner">
                                                    <span class="day">{$res['date_create']|date_format:"%d"}</span>
                                                    <span class="month">{$res['date_create']|date_format:"%B"}</span>
                                                </div>
                                            </div>
                                        {/if}
                                    </div>
                                    <div class="media__body">
                                        <h4 class="media__title title title--black title--s35">
                                            <a href="{$pathRoot}{$module}detail?id={$res['id']}">{$res['name']}</a>
                                        </h4>
                                        <p class="media__text">{$res['intro']}</p>
                                    </div>
                                    <div class="media__footer">
                                        <a class="link-learn-more" href="{$pathRoot}{$module}detail?id={$res['id']}">learn more
                                            <i class="zmdi zmdi-chevron-right"></i>
                                            <i class="zmdi zmdi-chevron-right"></i>
                                        </a>
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
                            {/foreach}
                        {else}
                            <div class="media media-blog-4">Không có bài viết </div>
                        {/if}
                        <nav class="au-pagination p-t-10">
                            {assign var="mun" value= $output['count_result']/5}
                            {if $mun > 1}
                                <ul class="list-unstyled list-pagination">
                                    <li class="list-pagination__item arrow" onclick="_back()">
                                        <i class="zmdi zmdi-chevron-left"></i>
                                    </li>
                                    {for $i=1 to $mun}
                                        <li id="li_{$i}" class="list-pagination__item li_page" onclick="_go({$i})">
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
                <!-- Recent Posts -->
                <div class="col-md-4 col-lg-3">
                    <div class="page-sidebar p-sm-t-50">
                        {if $output['category']}
                            <div class="widget p-b-30 p-t-45">
                                <div class="section-heading section-heading-1 section-heading-1--tiny2 text-left">
                                    <h2 class="section-heading__title">Danh mục</h2>
                                    <div class="section-heading__line">
                                        <img src="/assets/jobby/images/icon/line-blue-tiny.png" alt="Line">
                                    </div>
                                </div>
                                <ul class="list-bare list-unstyled">
                                    {foreach from=$output['category'] item=cat}
                                        <li class="list-bare__item">
                                            <span class="dot"></span>
                                            <a class="list-bare__link" href="{$pathRoot}{$module}?id={$cat['id']}">{$cat['name']}</a>
                                        </li>
                                    {/foreach}
                                </ul>
                            </div>
                        {/if}
                        {if $output['articlenew']}
                            <div class="widget p-b-30">
                                <div class="section-heading section-heading-1 section-heading-1--tiny2 text-left">
                                    <h2 class="section-heading__title">Bài viết mới</h2>
                                    <div class="section-heading__line">
                                        <img src="/assets/jobby/images/icon/line-blue-tiny.png" alt="Line">
                                    </div>
                                    <div class="m-b-20"></div>
                                </div>
                                {foreach from=$output['articlenew'] item=actnew}
                                    <div class="media media-blog-5">
                                        <div class="media__img">
                                            <a class="img-radius" href="{$pathRoot}{$module}detail?id={$actnew['id']}">
                                                <img src="{$upload_url}{$actnew['cat_image']}/{$actnew['thumbnail']}" alt=""  onerror="this.onerror=null; this.src='{$noimage}'" />
                                            </a>
                                        </div>
                                        <div class="media__body">
                                            <p class="media__time">{$actnew['date_create']|date_format:"%B %d, %Y"}</p>
                                            <h5 class="title title--black media__title">
                                                <a href="{$pathRoot}{$module}detail?id={$actnew['id']}">{$actnew['name']}</a>
                                            </h5>
                                        </div>
                                    </div>
                                {/foreach}
                            </div>
                        {/if}
                        {if $output['list_servie']}
                            <div class="widget p-b-30">
                                <div class="section-heading section-heading-1 section-heading-1--tiny2 text-left">
                                    <h2 class="section-heading__title">Dịch Vụ</h2>
                                    <div class="section-heading__line">
                                        <img src="/assets/jobby/images/icon/line-blue-tiny.png" alt="Line">
                                    </div>
                                    <div class="m-b-20"></div>
                                </div>
                                <ul class="list-bare list-unstyled">
                                    {foreach from=$output['list_servie'] item=ser}
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
                                <input class="input-border-3" name="input_key" type="text" type="text" placeholder="Search...">
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
    <!-- END BLOG RIGHT SIDEBAR   -->
{/block}

