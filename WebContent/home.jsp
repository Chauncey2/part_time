<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>雇佣君大学生网上兼职平台</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0" />
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<link rel="icon"
	href="//oss.aliyuncs.com/jianzhimao/web-res/icon/jianzhimao-logo-min.png?version=2.25.5"
	type="image/x-icon" />
<link resl="shortcut icon"
	href="//oss.aliyuncs.com/jianzhimao/web-res/icon/jianzhimao-logo-min.png?version=2.25.5"
	type="image/x-icon" />
<link rel="stylesheet" href="${basePath}resources/css/reset.css">
<link rel="stylesheet" href="${basePath}resources/css/header.css">
<link rel="stylesheet"
	href="${basePath}resources/css/container_header.css">
<link rel="stylesheet" href="${basePath}resources/css/index.css">
<link rel="stylesheet"
	href="${basePath}resources/css/container_footer.css">
<link rel="stylesheet" href="${basePath}resources/css/footer.css">
<link rel="stylesheet"
	href="${basePath}resources/css/side_navigation_box.css">
<link rel="stylesheet"
	href="${basePath}resources/css/content_ad_box.css">
<link rel="stylesheet"
	href="${basePath}resources/css/alt.css?version=2.25.5">
<!--  font-awesome图标集  -->
<link rel="stylesheet"
	href="${basePath}resources/css/font-awesome.min.css">
	<script type="text/javascript"
		src="${basePath}resources/js/jquery.min.js"></script>
</head>
<body>
	<script src="${basePath}resources/js/sea.js"></script>
	<header class="header"> 
	<nav class="w_main navigation_box">
	<div class="city_wrap">
		<span class="city">淮安</span>
	</div>
	<div class="channel_box">
		<a rel="nofollow" href="">首页</a> <a
			rel="nofollow" href="javascript:;" id="cooperation"
			onclick="document.getElementById('cooperation_box_alt').style.display='block';">申请合作</a>
		<a rel="nofollow" href="">企业服务</a>  
		<div class="channel_box">
		 <a href="login.jsp" class="selected" id="login" href="javascript:;">登录</a>
		</div>
	</div >
	<div>
	<%
	if(session.getAttribute("nickName")!=null){
		out.print("欢迎你！"+session.getAttribute("nickName"));
		}	
	%>	
	</div>
	</nav> 
	</header>

	<section class="container"> <header class="w_main">
	<div class="logo_box clearfix">
		<a href="/" class="logo left"><img
			src="${basePath}resources/indexImg/logo2.png" width="180px"
			height="58px" alt=""></a>
		<div class="search_wrap left">

			<input name="k" growing-track='true' type="text"
				placeholder="请输入搜索的内容" class="search" id="search" value=""><input
				type="button" value="搜索" class="submit" id="submit">
		</div>
		<a href="#"
			id="j-wrzbtn22" class="public right">进入招聘管理</a> <a rel="nofollow"
			href="#"
			class="public u-kjjz_btn right">发布兼职</a>
	</div>
	<div class="bread-crumb_box">

		<a rel="#" href="#">淮安兼雇佣君</a> <i class="icon-angle-right"></i>
		<span>淮安兼职</span>
	</div>
	</header> <article class="w_main"> <aside class="option_box">
	<div class="tabs clearfix">
		<a>最新兼职</a>
	</div>
	<div class="cnts">
		<ul class="box">
			<li><span>区&nbsp;&nbsp;域:</span> <a href="#" rel="nofollow"
				class="selected">不限</a> <a href="#" class="tab">清浦区</a>
				<a href="#" class="tab">清河区</a> <a href="#"
				class="tab">淮阴区</a> <a href="#" class="tab">淮安区</a></li>
		</ul>
	</div>
	</aside>
	<div class="order_box">
		<ul class="order_tab">
			<a href="#">
				<li class="cur">最新发布</li>
			</a>			
			<!--  <a href="#"><li class="">最高薪资</li></a>
			<a href="#"><li class="">最多人看</li></a>-->		
		</ul>
	</div>
	<div class="content_box clearfix">
		<div class="content_list_box">
			<ul class="content_list_wrap" id="content_list_wrap">
			<!-- EL表达式，批量显示兼职信息 -->
			
			<c:forEach items="${messageList}" var="message"	varStatus="status">
				<li>
					<div class="left type_wrap">
						<i class="type qt"></i>
					</div> <a href="#" title="${message.cname}" class="left title hot">${message.cname}</a>
					
					<div class="left area">
						<span title="${message.jlocal}"><i class="icon-map-marker"></i>&nbsp;${message.jlocal}</span>
					</div>
					<div class="left visited">
						<span title="175655"><i class="icon-user"></i>&nbsp;${message.jsalary}</span>
					</div>s
					<div class="left date" title="${message.jtime}">
						<i class="icon-time"></i> ${message.jtime}
					</div>
				</li>
			</c:forEach>	
								
			</ul>
			
			<div class="content_page_box">
				<ul class="content_page_wrap" id="content_page_wrap">
					<li><a class="selected" rel="nofollow" href="#">1</a></li>
					<li class="next"><a rel="nofollow"
						href="#">下一页</a></li>
				</ul>
			</div>

		</div>
		<div style="float: right;">
			<a target="_blank" class="content_ad_pic"
				href="#"> <!--<img src="/web/assets/img/miaotask/pic_money.jpg">-->
			</a>
			<div class="content_ad_box"
				style="border: 1px solid #dddddd; margin-bottom: 20px;">
				<div class="p1">校园兼职网站简介</div>

				<div class="p2">
					想提高招聘效果，发兼职？<a rel="nofollow"
						href="#">马上发布</a>
				</div>
				<ul class="rcm_text">
					<li>
						<h2>一个真实可靠的兼职招聘平台</h2>
						<p>兼职信息经过多重核查，更加真实可靠。</p>
					</li>
					<li>
						<h2>为在校大学生筛选出更加符合其需要的工作</h2>
						<p>我们希望未来能够为每一位用雇佣君的 同学都买一份保险。</p>
					</li>
					<li>
						<h2>共同打造绿色的兼职平台</h2>
						<p>雇佣君已成为中国绿色兼职平台的领头羊。</p>
					</li>
					<li>
						<h2>给学生提供靠谱的兼职，给企业提 供靠谱的好员工</h2>
						<p>来雇佣君发布优质的兼职，让高质的学生 投身于你们的工作之中。</p>
					</li>
				</ul>
			</div>
		</div>
	</div>
	</article>
	<div class="m-qrcode_wrap" id="m-qrcode_wrap">
		<div class="ban_code_box">
			<div class="qr_title">开学季专场</div>
			<p>
				扫码快速参与活动<br> 丰厚奖品等你来拿
			</p>
			<div class="qrcode" id="m-qrcode"></div>
			<div class="bottom">我知道了</div>
		</div>
	</div>
	</section>
	
	<section class="w_main side_navigation_box">
	
	<div class="personal-center_box">
		<div class="hd">
			<i class="icon-user"></i> <a href="#">管理中心</a>
		</div>
		<ul class="cnt">
			<li><a rel="nofollow"
				href="login.jsp" class="selected">登录</a></li>
			<li><a rel="nofollow"
				href="sign-up.jsp">注册</a></li>
		</ul>
	</div>
	
	<div id="j-hint3" style="display: none" >
		<div class="m-hint">
			<ul class="m-sqrz_list">
				<li class="rz_last"><a href="">
					<span>实名认证</span></a>
					<h6>通过线上或线下进行资料提交，通过雇佣君信息审核，完成认证享受特权</h6></li>
				<li class="vip_disabled"><a href="#"><span>VIP申请</span></a>
					</li>
			</ul>
		</div>
	</div>

	<div id="j-hint2" style="display: none">
		<div class="m-hint">
			<h3>请先完成企业认证</h3>
			<p class="fb_tit">
				快结兼职仅限于认证企业发布，<br>具有确保招聘 效果和质量的兼职类型
			</p>
			<br /> <br />
			<p class="btn">
				<a class="btn u-bg_78b31a"
					href="/ctrlenterpriseAuthen/onlineAuthFirstRequest">线上认证（提交资料）</a>
			</p>
			<hr />
			<p class="rz">
				提交资料前，请先完成一次发布，便于快速通过审核<br> 线上认证：在线完成资料填写与提交，雇佣君运营审核通过后，获得认证特权。<br />
				实地认证：提交基本的信息资料，雇佣君业务人员负责对接，上门拜访完成认证。
			</p>
		</div>
	</div>

	<div id="j-hint" style="display: none">
		<div class="m-hint">
			<h3>
				请先完成企业认证<br />
			</h3>
			<p class="ts">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</b>（快结兼职仅限于认证企业发布，具有招聘</br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;效果和质量保证的兼职类型）</b>
			</p>
			<p class="btn">
				<a class="btn u-bg_78b31a" id="j-accbtn" href="javascript:">我要申请认证</a>
			</p>
		</div>
	</div>

	<div id="j-gxhint" style="display: none">
		<div class="m-hint">
			<h3>
				请稍等管理员开通权限<br />
			</h3>
			<p class="ts">可联系电话：XXX-XXX-XXXX</p>
			<p class="btn">
				<a class="btn u-bg_78b31a" id="j-gxaccbtn" href="javascript:">确定</a>
			</p>
		</div>
	</div>
	<!-- 20150817 当企业未认证时，这里输出 true 前端判断流程 -->
	<div class="info_hidden" id="a" style="display: none">{ 'a': }</div>
	<input type="hidden" id="account_status" value="0" />
	
	<footer class="footer">	
	<div class="w_main channel">
		<a target="_blank" rel="nofollow"
			href="#"
			style="padding-left: 0;">关于我们</a>| <a target="_blank" rel="nofollow"
			href="#">加入我们</a>| <a
			target="_blank" rel="nofollow"
			href="#">企业推广</a>|
		<a target="_blank" rel="nofollow"
			href="#">帮助中心</a>|
		&nbsp; &nbsp; &nbsp; 企业服务热线：000000000 &nbsp; &nbsp;| &nbsp;
		&nbsp;业务电话：020-0000000 <a class="qq" target="_blank" rel="nofollow"
			href=""><img
			src="" /></a> <a class="qq" target="_blank"
			rel="nofollow"
			href=""><img
			src="" /></a>
	</div>	
	</footer> 
	
<script type='text/javascript'>
	var document=$('#login')
</script>
</body>
</html>
