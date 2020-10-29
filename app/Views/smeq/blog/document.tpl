{extends file='smeq/master.tpl'}
{block name='css'}{/block}
{block name='script'}
    <script type="application/javascript">
        $(document).ready(function() {
            if ({$count_document}/5 > 1)
            {
                $("li#li_{$page}").addClass("active");
            }
        });
        function _go(page) {
            if ({$category_id} == 0) {
                document.location.href = '{$pathRoot}document?page=' + page;
            } else {
                document.location.href = '{$pathRoot}document?id={$category_id}&page=' + page;
            }
        }
        function _back() {
            if ({$category_id} == 0) {
                if({$page} > 1)
                {
                    document.location.href = '{$pathRoot}document?page={$page - 1}';
                }
            } else {
                if({$page} > 1)
                {
                    document.location.href = '{$pathRoot}document?id={$category_id}&page={$page - 1}';
                }
            }
        }
        function _next() {
            if ({$category_id} == 0) {
                if({$count_document}/5 > {$page})
                {
                    document.location.href = '{$pathRoot}document?page={$page + 1}';
                }
            } else {
                if({$count_document}/5 > {$page})
                {
                    document.location.href = '{$pathRoot}document?id={$category_id}&page={$page + 1}';
                }
            }
        }
    </script>
{/block}
{block name='body'}
    <!-- PAGE HEADING-->
    <section class="section page-heading js-parallax-scroll" style="background-image: url('{$settings['document_banner']['value']}'),url('/assets/ext/image/nobanner.png');">
        <div class="container">
            <div class="page-heading-inner">
                <div class="section-heading section-heading-1 section-heading-1--tiny text-left">
                    <h2 class="section-heading__title">Văn bản pháp quy</h2>
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
                        <a href="{$pathRoot}{$module}">Văn bản pháp quy</a>
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
    <!-- BLOG RIGHT SIDEBAR-->
    <section class="section p-t-125 p-b-80">
        <div class="container">
            <div class="row">
                <div class="col-md-8 col-lg-9">
                    <div class="p-r-10 p-sm-r-0">
                        {if $document}
                            {foreach from=$document item=doc}
                                <div class="media media-blog-4">
                                    <div class="media__img">
                                        <a class="img-radius" style="text-align: center; height: 500px" href="{$pathRoot}document/detail?id={$doc['id']}">
                                            <img style="max-height: 100%; max-width: 100%" src="{$upload_url}{$doc['cat_image']}/{$doc['src']}"  onerror="this.onerror=null; this.src='{$noimage}'"/>
                                        </a>
                                        <div class="media__date">
                                            <div class="media__date-inner">
                                                <span class="day">{$doc['date_create']|date_format:"%d"}</span>
                                                <span class="month">{$doc['date_create']|date_format:"%B"}</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="media__body">
                                        <h4 class="media__title title title--black title--s35">
                                            <a href="{$pathRoot}document/detail?id={$doc['id']}">{$doc['name']}</a>
                                        </h4>
                                        <p class="media__text">{$doc['intro']}</p>
                                    </div>
                                    <div class="media__footer">
                                        <a class="link-learn-more" href="{$pathRoot}document/detail?id={$doc['id']}">Xem thêm
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
                        {/if}
                        <nav class="au-pagination p-t-10">
                            {assign var="mun" value= $count_document/5}
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
                        <div class="widget p-b-30">
                            <div class="section-heading section-heading-1 section-heading-1--tiny2 text-left">
                                <h2 class="section-heading__title">Danh mục</h2>
                                <div class="section-heading__line">
                                    <img src="/assets/jobby/images/icon/line-blue-tiny.png" alt="Line">
                                </div>
                            </div>
                            <ul class="list-bare list-unstyled">
                                {if $category}
                                    {foreach from=$category item=cat}
                                        <li class="list-bare__item">
                                            <span class="dot"></span>
                                            <a class="list-bare__link" href="{$pathRoot}document?id={$cat['id']}">{$cat['name']}</a>
                                        </li>
                                    {/foreach}
                                {/if}
                            </ul>
                        </div>
                        <div class="widget p-b-30">
                            <div class="section-heading section-heading-1 section-heading-1--tiny2 text-left">
                                <h2 class="section-heading__title">Bài viết mới</h2>
                                <div class="section-heading__line">
                                    <img src="/assets/jobby/images/icon/line-blue-tiny.png" alt="Line">
                                </div>
                                <div class="m-b-20"></div>
                            </div>
                            {if $documentnew}
                                {foreach from=$documentnew item=docnew}
                                    <div class="media media-blog-5">
                                        <div class="media__img">
                                            <a class="img-radius" href="{$pathRoot}document/detail?id={$docnew['id']}">
                                                <img src="{$upload_url}{$docnew['cat_image']}/{$docnew['thumbnail']}" alt=""  onerror="this.onerror=null; this.src='{$noimage}'"/>
                                            </a>
                                        </div>
                                        <div class="media__body">
                                            <p class="media__time">{$docnew['date_create']|date_format:"%B %d, %Y"}</p>
                                            <h5 class="title title--black media__title">
                                                <a href="{$pathRoot}document/detail?id={$docnew['id']}">{$docnew['name']}</a>
                                            </h5>
                                        </div>
                                    </div>
                                {/foreach}
                            {/if}
                        </div>
                        <div class="widget p-t-50">
                            <form class="form form--icon" method="post" action="{$pathRoot}document/search">
                                <input class="input-border-3" id="input_key" name="input_key" type="text" placeholder="Search...">
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

