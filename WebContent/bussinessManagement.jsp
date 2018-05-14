<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>企业资料表单页-雇佣君</title>
<link
	href="${basePath}resources/css/jianzhi/web/b/b_base_v3.__1522055385__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_business_manage.__1522055385__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_form.__1512563581__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_global.__1524650377__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_online.__1517826784__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_pop.__1520327087__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_pub.__1524650377__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_pub_companyInfo.__1525349146__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/global.__1512563581__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/ui_kit.__1525771022__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_certification.__1524736962__.css"
	type="text/css" rel="stylesheet">

<script src="${basePath}resources/js/jquery.min.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/jquery-form.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/jquery.min.js"></script>
<script type="text/javascript" src="${basePath}resources/js/hm.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/protobuf-2.1.1.min.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/RongIMLib-2.1.3.min.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/panel/panel.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/ganji/ganji.js"></script>
<link rel="stylesheet"
	href="${basePath}resources/js/util/panel/panel.css" type="text/css">
<script type="text/javascript"
	src="${basePath}resources/js/util/iframe/rpc3.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/iframe/iframe.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/dragdrop/dragdrop.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/datepicker/datepicker.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/app/pub/ajax_helper.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/event/event_emitter.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/jquery/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/string/string.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/jquery/ui/jquery.ui.datepicker.js"></script>
<link rel="stylesheet"
	href="${basePath}resources/js/util/jquery/themes/base/jquery.ui.all.css"
	type="text/css">
<script type="text/javascript"
	src="${basePath}resources/js/util/jquery/ui/jquery.ui.core.js"></script>
<script>
	var _hmt = _hmt || [];
	(function() {
		var hm = document.createElement("script");
		hm.src = "//hm.baidu.com/hm.js?7c0a2fe029631e2d7436151fab071753";
		var s = document.getElementsByTagName("script")[0];
		s.parentNode.insertBefore(hm, s);
	})();
</script>
<link
	href="${basePath}resources/css/jianzhi/web/b/b_base_v3.__1522055385__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_business_manage.__1522055385__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_form.__1512563581__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_global.__1524650377__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_online.__1517826784__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_pop.__1520327087__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_pub.__1524650377__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_pub_companyInfo.__1525349146__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/global.__1512563581__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/ui_kit.__1525771022__.css"
	type="text/css" rel="stylesheet">
</head>
<body class="b-companyInfo">
	<div class="header fixed-header">
		<div>
			<div class="jz-logo">
				<a href="#" title="雇佣君"></a>
			</div>
			<div class="b-version">商家版</div>
			<ul class="nav">
				<li><a href="business_index.jsp">首页</a></li>
				<li class="line"></li>
				<li><a href="recruitManagement.jsp">招聘管理</a></li>
				<li class="line"></li>
				<li>企业管理</li>
			</ul>

			<div class="header-r clearfix">
				<div class="fl fc-4b h-userName">
					<span class="userName"><span> 王佳薇 </span><i class="ar"></i></span>
					<ul class="h-userName-menu">
						<li><a href="#">退出</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="${basePath}resources/js/biz/outer_b_im.js"></script>
	<script type="text/javascript"
		src="${basePath}resources/js/RongIMLib-2.1.3.min.js"></script>
	<script type="text/javascript">
		GJ.use('jquery,app/common/widget/widget.js', function(Modal, widget) {

			widget.initWidgets();
			$(".h-userName").mouseover(function() {
				$(this).addClass('hover');
				return true;
			}).mouseout(function() {
				$(this).removeClass('hover');
				return true;
			});

			$("#h_phone-qrcode").mouseover(function() {
				$("#h_qrcode").show();
				return true;
			}).mouseout(function() {
				$("#h_qrcode").hide();
				return true;
			});
			if (window.innerHeight < 760) {
				$(".phone-preview-close").addClass("pos-ab");
			} else {
				$(".phone-preview-close").removeClass("pos-ab");
			}

			var this_id = "13348554";
			//获取底部新消息和沟通职位信息的回调函数
			var imFooterNewsNum = function(newsNum, postsNum) {
				if (newsNum > 99) {
					newsNum = '(99<sup>+</sup>)';
				} else {
					newsNum = '(' + newsNum + ')';
				}
				$('.b-webim-txt > .fc-fa').html(newsNum);
			}

			//获取职位新消息回调函数
			var impostlistnewsnum = function(postid, num) {
				if (num > 99) {
					num = '';
					$('#news_num_' + postid).addclass("b-webim-morenum");
				} else {
					$('#news_num_' + postid).removeclass("b-webim-morenum");
				}
				$('#news_num_' + postId).html(num);
			}
			//保存postid数组
			var postids = [];
			$('.b-webim-news').each(function() {
				postids.push($(this).attr('postId'));
			});
			window.dm = {
				beApiRootPath : "//vip.doumi.com/",
				debug : true
			};
			seajs.use("/js/biz/outer_b_im.js", function(im) {
				if (!this_id) {
					$('.b-webim').hide();
					return false;
				}
				im.connect(13348554, function(data) {
					imFooterNewsNum(data.totalMsgNum, data.totalJobNum);

					$.each(postids, function() {
						if (data.msg[this]) {
							imPostListNewsNum(this, data.msg[this]);
							$('#news_num_' + this).css('display', 'block');
						} else {
							$('#news_num_' + this).css('display', 'none');
						}
					})
				});
			});
		});
	</script>
	<div class="mod-container">
		<div class="mod-sidebar">
			<div class="menu">
				<dl>
					<dt class="active">
						<a href="bussinessManagement.jsp"><i class="icon-companyInfo"></i>企业信息</a>
					</dt>
					<dd>
						<a class="active" href="bussinessManagement.jsp">企业资料</a>
					</dd>
					<dd>
						<a href="businessAuthorize.jsp">资质认证</a>
					</dd>
				</dl>
				<dl>
					<dt>
						<a href="businessWallet.jsp"><i class="icon-wallet"></i>企业钱包</a>
					</dt>
				</dl>
				<dl>
					<dt>
						<a href="businessContract.jsp"><i class="icon-hetong"></i>合同管理</a>
					</dt>
				</dl>
			</div>
		</div>
		<div class="mod-content pub-v3 mt20">

			<!-- content-box statr-->
			<div class="content-box">
				<form action="busManage.action" method="post">
					<div class="pub-form-v3">
						<div class="pub-area-v3">
							<div class="pub-t-v3">
								<h2>企业基本信息</h2>
							</div>
							<div class="pub-area-v3-con">

								<dl>
									<dt>
										商家名称 <b>*</b>
									</dt>
									<dd>
										<div class="ui-input-wrap">
											<input name="company_name" type="text" class="ui-input-text"
												value="" placeholder="请输入商家名称，15字以内">
											<div class="ui-select-tip" id="jz-info-tips_corp_name"></div>
										</div>
									</dd>
								</dl>

								<dl>
									<dt>
										商家地址 <b>*</b>
									</dt>
									<dd class="clearfix">
										<div class="col-5">
											<div class="ui-select-wrap mr-20">
												<select class="ui-select form-block" name="job_type">
													<option value="0">请选择</option>
													<option value="1">清浦区</option>
													<option value="9">淮安区</option>
													<option value="11">清河区</option>
													<option value="13">楚州区</option>
												</select>
												<div class="ui-select-tip" id="jz-info-tips_province"></div>
											</div>
										</div>



									</dd>
								</dl>
								<dl>
									<dt class="content-empty"></dt>
									<dd>
										<div class="ui-input-wrap">
											<input type="text" name="address" class="ui-input-text"
												value="" placeholder="请输入详细地址">
											<div class="ui-select-tip" id="jz-info-tips_address"></div>
										</div>
										<!--<div class="ui-input-wrap">
                                <input type="text" class="ui-input-text" placeholder="详细地址" name="title">
                                <div class="ui-select-tip" id="jz-info-tips_title"></div>
                            </div>-->
									</dd>
								</dl>
								<dl class="clearfix">
									<dt>企业简介</dt>
									<dd>
										<textarea name="brief" class="ui-input-text form-block"
											rows="3" placeholder="20-1000字，请输入企业简介内容"></textarea>
										<div class="ui-select-tip" id="jz-info-tips_brief"></div>
									</dd>
								</dl>
							</div>
						</div>

						<div class="pub-area-v3">
							<div class="pub-t-v3">
								<h2>联系方式</h2>
							</div>
							<div class="pub-area-v3-con">
								<dl>
									<dt>
										负责人姓名 <b>*</b>
									</dt>
									<dd>
										<div class="ui-input-wrap">
											<input type="text" value="" name="person"
												class="ui-input-text" placeholder="请确认为招聘业务合作的联系人">
											<div class="ui-select-tip" id="jz-info-tips_person"></div>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>
										负责人电话 <b>*</b>
									</dt>
									<dd>
										<div class="ui-input-wrap">
											<input value="15195357855" type="text" name="mobile"
												class="ui-input-text" placeholder="请输入电话">
											<div class="ui-select-tip" id="jz-info-tips_mobile"></div>
										</div>
									</dd>
								</dl>
								<dl class="question-field-item">
									<dt>座机号</dt>
									<dd>

										<div class="clearfix">
											<div class="col-10">
												<div class="ui-input-wrap">
													<input value="" name="telephone" type="text"
														class="ui-input-text" placeholder="请输入座机号">
												</div>
												<div class="ui-select-tip" id="jz-info-tips_telephone"></div>
											</div>
										</div>
									</dd>
								</dl>
								<dl>
									<dt>企业邮箱</dt>
									<dd>
										<div class="ui-input-wrap">
											<input value="" type="text" name="mail" class="ui-input-text"
												placeholder="请输入邮箱">
											<div class="ui-select-tip" id="jz-info-tips_mail"></div>
										</div>
									</dd>
								</dl>
							</div>
						</div>
						<div class="form-optBtn">
							<input type="submit" id="submit_button_id"
								class="btn-yellow l-btn" value="更新"
								dmbalog="/jianzhi/vip/company/info@atype=click@ca_source=pc@ca_from=change">
						</div>
					</div>
				</form>
				<!-- pub-form-v3 end-->
			</div>
			<!-- content-box end-->
		</div>
	</div>
</body>
</html>
