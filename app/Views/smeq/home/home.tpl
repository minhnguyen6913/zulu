{extends file='smeq/master.tpl'}
{block name='css'}
	<style>
	</style>
{/block}
{block name='script'}{/block}
{block name='body'}
	<!-- SLIDER-->
	{literal}
	<div class="rev_slider_wrapper">
		<div class="rev_slider fullwidthabanner js-rev" data-version="5.4.4" style="display:none" data-rev-height="550" data-rev-layout="fullwidth" data-rev-stylearrow="au-rev-arrow-1" data-rev-bullets="false" >
			<ul>
	{/literal}
		{for $i= 0 to $count_slide - 1}
			{literal}
				<li class="rev-item rev-item-1" data-transition="fade" >
					<img class="rev-slidebg" {/literal} src="{$upload_url}{$list_slides[$i]['cat_image']}/{$list_slides[$i]['src']}" {literal} onerror="this.onerror=null; this.src='{$noimage}'" />
					<div class="tp-caption tp-resizeme rev-text-2"
						 data-frames="[{&quot;delay&quot;:900,&quot;split&quot;:&quot;chars&quot;,&quot;splitdelay&quot;:0.05,&quot;speed&quot;:1600,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;y:[-100%];z:0;rZ:35deg;sX:1;sY:1;skX:0;skY:0;&quot;,&quot;mask&quot;:&quot;x:0px;y:0px;s:inherit;e:inherit;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power4.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;auto:auto;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]"
						 data-x="[center,center,center,left,center]" data-y="[center]" data-hoffset="[365, 255, -10, -20, 10]" data-voffset="[-10, -20, 0, 0, -10]" data-paddingleft="[0, 0, 0, 0, 15]" data-paddingright="[0, 0, 0, 0, 15]" data-width="[680,680,960,576,500]"
						 data-height="[&quot;auto&quot;]" data-lineheight="[70, 60, 50, 50, 45]" data-whitespace="normal" data-color="#fff" data-fontweight="400" data-fontsize="[55, 42, 45, 42, 46]" data-textalign="[left, left, center, center, center]">
						{/literal}
							{$list_slides[$i]['name']}
						{literal}
					</div>
					<a class="tp-caption tp-resizeme" {/literal}href="{$list_slides[$i]['link']}" {literal} target="_blank" data-frames="[{&quot;delay&quot;:3200,&quot;speed&quot;:1000,&quot;frame&quot;:&quot;0&quot;,&quot;from&quot;:&quot;x:-50px;opacity:0;&quot;,&quot;to&quot;:&quot;o:1;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;},{&quot;delay&quot;:&quot;wait&quot;,&quot;speed&quot;:300,&quot;frame&quot;:&quot;999&quot;,&quot;to&quot;:&quot;auto:auto;&quot;,&quot;ease&quot;:&quot;Power3.easeInOut&quot;}]"
					   data-x="[center,center,center,center,center]" data-y="[center,center,center,center,center]" data-hoffset="[105, 5, -20, 10, 10]" data-voffset="[162, 120, 120, 120, 165]" data-width="['auto']" data-height="[&quot;auto&quot;]"
					   data-responsive_offset="on" data-responsive="off" data-whitespace="[nowrap, nowrap, nowrap, nowrap, nowrap]">
						<span class="rev-btn-1">Xem thêm
							<span class="arrow" data-paddingleft="10">
								<i class="zmdi zmdi-chevron-right"></i>
								<i class="zmdi zmdi-chevron-right"></i>
							</span>
						</span>
					</a>
				</li>
			{/literal}
		{/for}
	{literal}
			</ul>
		</div>
	</div>
	{/literal}
	<!-- END SLIDER-->
	<!-- WELCOME-->
	<!-- END WELCOME-->
	<!-- BLOG-->
	{if $list_documents}
	<section class="section bg-f7 p-t-125 p-b-90">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-heading section-heading-1">
						<h2 class="section-heading__title">Tài Liệu</h2>
						<div class="section-heading__line">
							<img src="/assets/jobby/images/icon/line-blue.png" alt="Line">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="slick-blog" >
						<div class="slick__wrap-content js-slick-wrapper" data-slick-xs="1" data-slick-sm="1" data-slick-md="3" data-slick-lg="3" data-slick-xl="3" data-slick-dots="true" data-slick-customnav="true" data-slick-autoplay="true">
							<div class="slick__content js-slick-content">
									{foreach from=$list_documents item=doc}
										<div class="slick__item">
											<div style="height: 500px" class="media media-blog">
												<div class="media__img">
													<a style="height: 240px; text-align: center" href="{$pathRoot}document/detail?id={$doc['id']}">
														<img style="max-height: 100%; max-width: 100%" src="{$upload_url}{$doc['cat_image']}/{$doc['src']}" onerror="this.onerror=null; this.src='{$noimage}'"  />
													</a>
													<div class="media__date">
														<div class="media__date-inner">
															<span class="day">{$doc['date_create']|date_format:"%d"}</span>
															<span class="month">{$doc['date_create']|date_format:"%B"}</span>
														</div>
													</div>
												</div>
												<div class="media__body">
													<h4 class="media__title title title--black title--md">
														<a href="{$pathRoot}document/detail?id={$doc['id']}">{$doc['name']}</a>
													</h4>
													<p class="media__text">{$doc['intro']}</p>
												</div>
											</div>
										</div>
									{/foreach}

							</div>
							<div class="slick__dots dots-style1"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
{/if}
	<!-- END BLOG-->
	<!-- ACTIVITIES-->
{if $list_activitys}
	<section class="section p-t-125 p-b-105">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-heading section-heading-1">
						<h2 class="section-heading__title">Hoạt động</h2>
						<div class="section-heading__line">
							<img src="/assets/jobby/images/icon/line-blue.png" alt="Line">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="p-r-55 p-md-r-0">
						<div class="slick-class m-t-25">
							<div class="slick__wrap-content js-slick-wrapper" data-slick-xs="1" data-slick-sm="1" data-slick-md="3" data-slick-lg="3" data-slick-xl="3" data-slick-customnav="true" data-slick-autoplay="true">
								<div class="slick__content js-slick-content">

										{foreach from=$list_activitys item=activity}
											<div class="slick__item">
												<div style="height: 250px; width: 100%" class="media media-our-class-2">
													<div class="media__img">
														<a style="height: 250px; text-align: center" href="#">
															<img style="max-height: 100%; max-width: 100%" src="{$upload_url}{$activity['cat_image']}{$activity['src']}" onerror="this.onerror=null; this.src='{$noimage}'" >
														</a>
													</div>
													<div class="media__body">
														<h4 class="media__title">
															<a href="#">{$activity['name']}</a>
														</h4>
														<span class="date-time">{$activity['open']|date_format:"%H : %M"}</span>
														<span class="date-time">{$activity['open']|date_format:"%B %d, %Y"}</span>
													</div>
												</div>
											</div>
										{/foreach}

								</div>
								<div class="slick__nav arrows-1">
									<i class="slick-prev slick-arrow js-slick-prev lnr lnr-chevron-left"></i>
									<i class="slick-next slick-arrow js-slick-next lnr lnr-chevron-right"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
{/if}
	<!-- END ACTIVITIES-->
	<!-- EVENT-->
{if $list_news}
	<section class="section p-t-140 p-b-80 p-md-t-90">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-heading section-heading-1">
						<h2 class="section-heading__title">Tin tức - Sự kiện</h2>
						<div class="section-heading__line">
							<img src="/assets/jobby/images/icon/line-blue.png" alt="Line">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				{foreach from=$list_news item=news}
					<div class="col-md-6 col-lg-4">
						<div class="media media-blog-2">
							<div class="media__img">
								<a style="height: 240px; text-align: center" href="{$pathRoot}news/detail?id={$news['id']}">
									<img style="max-width: 100%; max-height: 100%" src="{$upload_url}{$news['cat_image']}/{$news['src']}" onerror="this.onerror=null; this.src='{$noimage}'"  />
								</a>
								<div class="media__date">
									<div class="media__date-inner">
										<span class="day">{$news['date_create']|date_format:"%d"}</span>
										<span class="month">{$news['date_create']|date_format:"%B"}</span>
									</div>
								</div>
							</div>
							<div class="media__body">
								<h4 class="media__title title title--black title--md">
									<a href="{$pathRoot}news/detail?id={$news['id']}">{$news['name']}</a>
								</h4>
								<p class="media__text">{$news['intro']}</p>
							</div>
						</div>
					</div>
				{/foreach}
			</div>
		</div>

	</section>
{/if}
	<!-- END EVENT-->
	<!-- PROGRAM-->
{if $list_programs}
	<section class="section p-t-140 p-md-t-50 p-b-25">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="section-heading section-heading-1 m-b-110 m-md-b-60">
						<h2 class="section-heading__title">Dịch vụ</h2>
						<div class="section-heading__line">
							<img src="/assets/jobby/images/icon/line-blue.png" alt="Line">
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="slick-blog">
						<div class="slick__wrap-content js-slick-wrapper" data-slick-xs="1" data-slick-sm="1" data-slick-md="3" data-slick-lg="3" data-slick-xl="3" data-slick-dots="true" data-slick-customnav="true" data-slick-autoplay="true">
							<div class="slick__content js-slick-content">

									{foreach from=$list_programs item=pro}
										<div class="slick__item">
											<div style="height: 400px" class="media media-blog">
												<div class="media__img">
													<a style="height: 240px; text-align: center" href="{$pathRoot}service/detail?id={$pro['id']}">
														<img style="" src="{$upload_url}{$pro['cat_image']}/{$pro['src']}" alt="" onerror="this.onerror=null; this.src='{$noimage}'" />
													</a>
												</div>
												<div class="media__body">
													<h4 class="media__title title title--black title--md">
														<a href="{$pathRoot}service/detail?id={$pro['id']}">{$pro['name']}</a>
													</h4>
													<p class="media__text">{$pro['intro']}</p>
												</div>
											</div>
										</div>
									{/foreach}

							</div>
							<div class="slick__dots dots-style1"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
{/if}
	<!-- END PROGRAM-->
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
										<img style="max-height: 100%; max-width: 100%" src="{$upload_url}{$cus['cat_image']}/{$cus['src']}" onerror="this.onerror=null; this.src='{$noimage}'" >
									</a>
								</div>
							{/foreach}
						{/if}
					</div>
				</div>
			</div>
		</div>
	</section>

{/block}
