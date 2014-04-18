<!DOCTYPE html>
<html lang="{$config.lang}">
<head>
	<meta charset="{$config.charset}">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="generator" content="Subrion CMS &middot; {$config.version}">

	<base href="{$url}">

	<title>{ia_print_title title=$gTitle}</title>

	<!--[if lt IE 9]>
		<script src="../../../js/utils/shiv.js"></script>
		<script src="../../../js/utils/respond.min.js"></script>
	<![endif]-->

	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="{$img}ico/apple-touch-icon-144-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="{$img}ico/apple-touch-icon-114-precomposed.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="{$img}ico/apple-touch-icon-72-precomposed.png">
	<link rel="apple-touch-icon-precomposed" href="{$img}ico/apple-touch-icon-57-precomposed.png">
	<link rel="shortcut icon" href="{$img}ico/favicon.ico">

	{ia_hooker name='smartyAdminAfterHeadSection'}

	{if isset($config.sap_style)}
		{ia_print_css files="bootstrap-{$config.sap_style}" order=0}
	{else}
		{ia_print_css files='bootstrap' order=0}
	{/if}

	{ia_add_media files='jquery, extjs, subrion' order=0}

	{ia_print_css display='on'}

	{ia_add_js order=0}
		{foreach $customConfig as $key => $item}
			intelli.config.{$key} = '{$item}';
		{/foreach}
	{/ia_add_js}
</head>
<body id="page--{$pageName}">
	<div class="overall-wrapper">
	<div class="panels-wrapper">
		<section id="panel-left">
			<a class="brand" href="{$smarty.const.IA_ADMIN_URL}">
				<img src="{$img}logo.png" alt="Subrion CMS &middot; {$config.version}">
			</a>
			<ul class="nav-main">
				<li{if 0 == $page.group} class="current active"{/if}>
					<a href="{$smarty.const.IA_ADMIN_URL}" class="dashboard" data-toggle="nav-sub-dashboard"><i class="i-gauge"></i>{lang key='dashboard'}</a>
				</li>
				{foreach $menu as $item}
					<li{if $page.group == $item.id} class="current active"{/if} id="menu-section-{$item.name}">
						<a href="#"{if isset($item.items) && $item.items} data-toggle="nav-sub-{$item.name}"{/if}><i class="i-cogs i-{$item.name}"></i>{$item.title}</a>
					</li>
				{/foreach}
			</ul>
			<div class="system-info">
				Subrion CMS
				<br>
				<span class="version">v {$config.version}</span>
			</div>
			<div class="social-links">
				<a href="https://twitter.com/IntelliantsLLC" target="_blank" class="social-links__twitter"><i class="i-twitter-2"></i></a>
				<a href="https://www.facebook.com/Intelliants" target="_blank" class="social-links__facebook"><i class="i-facebook-2"></i></a> 
				<a href="https://plus.google.com/102500660503219569194/posts" target="_blank" class="social-links__googleplus"><i class="i-googleplus"></i></a>
			</div>
		</section>

		<section id="panel-center">
			{if isset($dashboard)}
				<ul id="nav-sub-dashboard" class="nav-sub{if 0 == $page.group} active{/if}">
					<li class="single">
						<ul class="list-unstyled quick-links clearfix">
							{foreach $dashboard as $item}
								<li><a href="{$item.url}"><span class="link-icon"><i class="i-{$item.icon}"></i></span>{$item.text}</a></li>
							{/foreach}
							<li class="link-add">
								<a href="#" id="js-cmd-add-quicklink">
									<span class="link-icon"><i class="i-plus"></i></span>{lang key='add_quick_link'}
								</a>
							</li>
						</ul>
					</li>
				</ul>
			{/if}
			{include file='menu.tpl'}
		</section>
		
		<section id="panel-content">
			<div class="navbar navbar-static-top navbar-inverse">
				<ul class="nav navbar-nav navbar-right">
					<li>
						<a href="{$smarty.const.IA_URL}" title="{lang key='site_home'}" target="_blank"><i class="i-screen"></i><span> {lang key='site_home'}</span></a>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="{lang key='quick_access'}">
							<i class="i-fire"></i><span> {lang key='quick_access'}</span>
						</a>
						<ul class="dropdown-menu">
						{foreach $header_menu as $item}
							{if empty($item.name)}
								<li class="divider"></li>
							{else}
								<li{if $page.name == $item.name} class="active"{/if}><a href="{$item.url}"{if isset($item.attr)} {$item.attr}{/if}>{$item.title}</a></li>
							{/if}
						{/foreach}
						</ul>
					</li>
					{if isset($notifications.system)}
					<li class="dropdown notifications alerts">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="{lang key='system_notifications'}">
							<i class="i-flag"></i>
							<span class="label label-info">{$notifications.system|count}</span>
							<span> {lang key='system_notifications'}</span>
						</a>
						<ul class="dropdown-menu pull-right">
							<li class="dropdown-block">
								{foreach $notifications.system as $message}
									<div class="alert alert-danger">{$message}</div>
								{/foreach}
							</li>
						</ul>
					</li>
					{/if}

					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#" title="Help and Support">
							<i class="i-support"></i>
							<span> Help and Support</span>
						</a>
						<ul class="dropdown-menu pull-right">
							{if isset($config.display_feedbacks) && $config.display_feedbacks}
								<li>
									<a data-toggle="modal" href="#feedback-modal">Submit feedback</a>
								</li>
							{/if}
							<li><a href="http://www.subrion.com/desk/" target="_blank">Helpdesk</a></li>
							<li><a href="http://www.subrion.com/forums/" target="_blank">User forums</a></li>
							<li><a href="http://dev.subrion.org/projects/subrion-cms/wiki" target="_blank">Wiki</a></li>
						</ul>
					</li>
					<li>
						<a href="{$smarty.const.IA_ADMIN_URL}logout/" title="{lang key='logout'}" id="user-logout">
							<i class="i-switch"></i>
							<span> {lang key='logout'}</span>
						</a>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-left">
					<li class="panel-toggle">
						<a href="#"><i class="i-menu"></i></a>
					</li>
					<li id="user-info">
						<a href="{$url}members/edit/?id={$member.id}">
							{if $member.avatar}
								{assign var='avatar' value=$member.avatar|unserialize}
								{if $avatar}
									{printImage imgfile=$avatar.path title=$member.fullname|default:$member.username}
								{else}
									<img src="{$img}no-avatar.png" alt="{$member.fullname}">
								{/if}
							{else}
								<img src="{$img}no-avatar.png" alt="{$member.fullname}">
							{/if}
							{$member.fullname}
						</a>
					</li>

					{*
					KEEP THIS FOR FUTURE IMPLEMENTATION

					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">{$member.fullname}</a>
						<ul class="dropdown-menu pull-right">
							<li><a href="{$url}members/edit/?id={$member.id}">{lang key='edit'}</a></li>
						</ul>
					</li> 
					*}
				</ul>
		
				<form id="quick-search" class="navbar-form navbar-right" action="{$smarty.const.IA_ADMIN_URL}members/">
					<input type="text" name="q" style="width: 200px;" class="form-control" placeholder="{lang key='type_here_to_search'}"{if isset($smarty.get.q)} value="{$smarty.get.q|escape:'html'}"{/if}>
					<div class="btn-group">
						<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
							{$quick_search[$quick_search_item].title} <span class="caret"></span>
						</button>
						<ul class="dropdown-menu pull-right">
							{foreach $quick_search as $itemName => $entry}
								<li{if $quick_search_item == $itemName} class="active"{/if}><a href="{$smarty.const.IA_ADMIN_URL}{$entry.url}">{$entry.title}</a></li>
							{/foreach}
							{if count($quick_search) > 1}
								<li class="divider"></li>
								<li><a href="#" rel="reset">{lang key='reset'}</a></li>
							{/if}
						</ul>
					</div>
					<button type="submit" class="btn btn-primary"><i class="i-search"></i></button>
				</form>
			</div>
		
			<div class="content-wrapper">
				<div class="block">
					<div class="block-heading">
						<ul class="nav nav-pills pull-right">
							{if 'index' == $pageName}
								{if isset($customization_mode)}
									<li><a href="?reset"><i class="i-loop"></i> {lang key='reset'}</a></li>
									<li><a href="?save" id="js-cmd-save"><i class="i-checkmark"></i> {lang key='save'}</a></li>
									<li><a href=""><i class="i-close"></i> {lang key='discard'}</a></li>
								{else}
									<li><a href="?customize"><i class="i-equalizer"></i> {lang key='customize'}</a></li>
								{/if}
							{/if}

							{foreach $admin_actions as $action}
								<li><a href="{$action.url}" {$action.attributes}>{if $action.icon}<i class="{$action.icon}"></i> {/if}{$action.title}</a></li>
							{/foreach}
						</ul>
						<h3>{$gTitle}</h3>

						{include file='breadcrumb.tpl'}

					</div>

					{include file='notification.tpl'}

					<div class="block-content">{$_content_}</div>
				</div>
			</div>
		</section>
	</div>

	<!-- Feedback modal -->
	<div class="modal fade" id="feedback-modal">
		<div class="modal-dialog">
			<div class="modal-content">
				<form action="" method="post" class="sap-form form-horizontal">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
						<h4 class="modal-title"><i class="i-bubbles-2"></i> {lang key='submit_feedback'}</h4>
					</div>
					<div class="modal-body">
						<div class="row">
							<div class="col col-lg-12">
								<p class="text-muted">{lang key='feedback_terms'}</p>
							</div>
						</div>
						<div class="row">
							<div class="col col-lg-6">
								<label for="username">{lang key='fullname'}</label>
								<input type="text" name="feedback_fullname" id="feedback_fullname" data-def="{$member.fullname}" value="{$member.fullname}">
							</div>
							<div class="col col-lg-6">
								<label for="email">{lang key='email'}</label>
								<input type="text" name="feedback_email" id="feedback_email" data-def="{$member.email}" value="{$member.email}">
							</div>
						</div>
						<div class="row">
							<div class="col col-lg-12">
								<label for="feedback_subject" id="feedback_subject_label">{lang key='subject'}</label>
								<select name="subject" id="feedback_subject">
									<option>{lang key='_select_'}</option>
									<option value="bug_report">{lang key='bug_report'}</option>
									<option value="feature_request">{lang key='feature_request'}</option>
									<option value="custom_modification">{lang key='custom_modification'}</option>
								</select>
							</div>
						</div>
						<div class="row">
							<div class="col col-lg-12">
								<label for="message">{lang key='message_body'}</label>
								<textarea name="feedback_body" id="feedback_body" cols="30" rows="5"></textarea>
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">{lang key='close'}</button>
						<button type="button" id="clearFeedback" class="btn btn-default">{lang key='clear'}</button>
						<button type="button" id="js-cmd-send-feedback" class="btn btn-primary">{lang key='send'}</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	</div>

	{if !isset($smarty.cookies.loader) || 'loaded' != $smarty.cookies.loader}
		<div id="js-ajax-loader">
			<div class="spinner"><i class="i-spinner"></i></div>
			<p id="js-ajax-loader-status"></p>
		</div>
	{/if}

	{ia_hooker name='smartyAdminFooterBeforeJsDisplay'}
	{ia_print_js display='on'}
	{ia_hooker name='smartyAdminFooterAfterJsDisplay'}
</body>
</html>