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
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<title>登录界面</title>
<link href="${basePath}resources/css/default.css" rel="stylesheet"
	type="text/css" />
<!--必要样式-->
<link href="${basePath}resources/css/styles.css" rel="stylesheet"
	type="text/css" />
<link href="${basePath}resources/css/demoLogin.css" rel="stylesheet"
	type="text/css" />
<link href="${basePath}resources/css/loaders.css" rel="stylesheet"
	type="text/css" />
<link href="${basePath}resources/layui/css/layui.css" rel="stylesheet"
	type="text/css" />

</head>
<body>
	
	<!-- 登录界面 -->
	<div class='login'>
		<div class='login_title'>
			<span>用户登录</span>
		</div>

		<div class='login_fields'>
			<div class='login_fields__user'>
				<div class='icon'>
					<img alt="" src='${basePath}resources/LoginImg/user_icon_copy.png'>
				</div>
				<input name="login" placeholder='用户名' maxlength="16" type='text'
					autocomplete="off" value="123456" />
				<div class='validation'>
					<img alt="" src='${basePath}resources/LoginImg/tick.png'>
				</div>
			</div>
			<div class='login_fields__password'>
				<div class='icon'>
					<img alt="" src='${basePath}resources/LoginImg/lock_icon_copy.png'>
				</div>
				<input name="pwd" placeholder='密码' maxlength="16" type='text'
					autocomplete="off">
				<div class='validation'>
					<img alt="" src='${basePath}resources/LoginImg/tick.png'>
				</div>
			</div>
			<div class='login_fields__password'>
				<div class='icon'>
					<img alt="" src='${basePath}resources/LoginImg/key.png'>
				</div>
				<input name="code" placeholder='验证码' maxlength="4" type='text'
					name="ValidateNum" autocomplete="off">

				<div class='validation' style="opacity: 1; right: -5px; top: -3px;">
					<canvas class="J_codeimg" id="myCanvas" onclick="Code();">对不起，您的浏览器不支持canvas，请下载最新版浏览器!</canvas>
				</div>
			</div>
			<div class='login_fields__submit'>
				<input type='button' value='登录' name="sign_in">
				<input type='button' value='注册' name="sign_up">
			</div>	
		</div>
		

		<div class='success'></div>
	</div>

	<!-- 认证界面 -->
	<div class='authent'>
		<div class="loader"
			style="height: 44px; width: 44px; margin-left: 28px;">
			<div class="loader-inner ball-clip-rotate-multiple">
				<div></div>
				<div></div>
				<div></div>
			</div>
		</div>
		<p>认证中...</p>
	</div>


	<%
	out.print("jsp中session的值"+session.getAttribute("user"));
	%>

	<div class="OverWindows"></div>
	<script type="text/javascript"
		src="${basePath}resources/js/jquery.min.js"></script>
	<script type="text/javascript"
		src="${basePath}resources/js/jquery-ui.min.js"></script>
	<script type="text/javascript"
		src='${basePath}resources/js/stopExecutionOnTimeout.js?t=1'></script>
	<script type="text/javascript"
		src="${basePath}resources/layui/layui.js"></script>
	<script type="text/javascript"
		src="${basePath}resources/js/Particleground.js"></script>
	<script type="text/javascript"
		src="${basePath}resources/js/Treatment.js"></script>
	<script type="text/javascript"
		src="${basePath}resources/js/jquery.mockjax.js"></script>

	<script type="text/javascript">
		var canGetCookie = 0;//是否支持存储Cookie 0 不支持 1 支持
		var ajaxmockjax = 0;//是否启用虚拟Ajax的请求响 0 不启用  1 启用
		//默认账号密码
		var truelogin = "123456";
		var truepwd = "123456";

		var CodeVal = 0;
		Code();
		function Code() {
			if (canGetCookie == 1) {
				createCode("AdminCode");
				var AdminCode = getCookieValue("AdminCode");
				showCheck(AdminCode);
			} else {
				showCheck(createCode(""));
			}
		}
		function showCheck(a) {
			CodeVal = a;
			var c = document.getElementById("myCanvas");
			var ctx = c.getContext("2d");
			ctx.clearRect(0, 0, 1000, 1000);
			ctx.font = "80px 'Hiragino Sans GB'";
			ctx.fillStyle = "#E8DFE8";
			ctx.fillText(a, 0, 100);
		}
		$(document).keypress(function(e) {
			// 回车键事件  
			if (e.which == 13) {
				$('input[name="sign_in"]').click();
			}
		});
		//粒子背景特效
		$('body').particleground({
			dotColor : '#E8DFE8',
			lineColor : '#133b88'
		});
		$('input[name="pwd"]').focus(function() {
			$(this).attr('type', 'password');
		});
		$('input[type="text"]').focus(function() {
			$(this).prev().animate({
				'opacity' : '1'
			}, 200);
		});
		$('input[type="text"],input[type="password"]').blur(function() {
			$(this).prev().animate({
				'opacity' : '.5'
			}, 200);
		});

		//账号密码验证
		$('input[name="login"],input[name="pwd"]').keyup(function() {
			var Len = $(this).val().length;
			if (!$(this).val() == '' && Len >= 5) {
				$(this).next().animate({
					'opacity' : '1',
					'right' : '30'
				}, 200);
			} else {
				$(this).next().animate({
					'opacity' : '0',
					'right' : '20'
				}, 200);
			}
		});
		layui.use('layer', function() {
			//非空验证(登录验证)
			//'input[type="button"]'
			$('input[name="sign_in"]').click(
					function() {
						var login = $('input[name="login"]').val(); //获取用户名
						var pwd = $('input[name="pwd"]').val(); //获取密码
						var code = $('input[name="code"]').val(); //验证码
						if (login == '') {
							ErroAlert('请输入您的账号');
						} else if (pwd == '') {
							ErroAlert('请输入密码');
						} else if (code == '' || code.length != 4||code.toUpperCase()!=CodeVal
								.toUpperCase()) {
							ErroAlert('验证码错误');
						} else {
							//登录
							var JsonData = {
								login : login,
								pwd : pwd,
								code : code
							};
							//此处做为ajax内部判断
							var url = "";
							if (JsonData.login != ""
									&& JsonData.pwd != "") {
								url = "loginServlet";
																						
							} else {
								ErroAlert("验证码输入错误");
							}
							
							
							AjaxPost(url, JsonData, function() {
								//认证中..
				                //fullscreen();
				                $('.login').addClass('test'); //倾斜特效
				                setTimeout(function () {
				                    $('.login').addClass('testtwo'); //平移特效
				                }, 300);

				                setTimeout(function () {
				                    $('.authent').show().animate({ right: -320 }, {
				                        easing: 'easeOutQuint',
				                        duration: 600,
				                        queue: false
				                    });
				                    $('.authent').animate({ opacity: 1 }, {
				                        duration: 200,
				                        queue: false
				                    }).addClass('visible');
				                }, 500);
								}, function(response) {
									//回调成功之后保存用户的信息，然后进行保存，已备后用。
									//alert("回调成功！" + response.realName);
									//认证完成
									setTimeout(function() {
										$('.authent').show().animate({
											right : 90
										}, {
											easing : 'easeOutQuint',
											duration : 600,
											queue : false
										});
										$('.authent').animate({
											opacity : 0
										}, {
											duration : 200,
											queue : false
										}).addClass('visible');
										$('.login').removeClass('testtwo'); //平移特效
									}, 2000);
									setTimeout(function() {
										$('.authent').hide();
										$('.login').removeClass('test');
		
										if (response.id!=null) {
											//登录成功
											$('.login div').fadeOut(100);
											$('.success').fadeIn(1000);
											$('.success').html(response.nickName);
											//跳转操作
											window.location.href="home.jsp?1";
										} else {
											//window.location.href="home.jsp";
											ErroAlert("您已经登录过了！");
										}
									}, 2400);
									//ajax返回 	
								})
						}
					})
					
					//点击注册按钮实现跳转到用户登录界面
					$('input[name="sign_up"]').click(		
						function(){
							window.location.href="sign-up.jsp";
						}
					)
		})
	</script>

</body>
</html>
