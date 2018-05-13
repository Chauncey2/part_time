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
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>用户注册</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="Free HTML5 Template by FreeHTML5.co" />
	<meta name="keywords" content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
	<meta property="og:title" content=""/>
	<meta property="og:image" content=""/>
	<meta property="og:url" content=""/>
	<meta property="og:site_name" content=""/>
	<meta property="og:description" content=""/>
	<meta name="twitter:title" content="" />
	<meta name="twitter:image" content="" />
	<meta name="twitter:url" content="" />
	<meta name="twitter:card" content="" />

	<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
	<link rel="shortcut icon" href="favicon.ico">

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,700,300' rel='stylesheet' type='text/css'>
	
	<link rel="stylesheet" href="${basePath}resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${basePath}resources/css/animate.css">
	<link rel="stylesheet" href="${basePath}resources/css/style.css">

	<!-- Modernizr JS -->
	<script src="${basePath}resources/js/modernizr-2.6.2.min.js"></script>
	<!-- FOR IE9 below -->
	<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->

	</head>
	<body>

		<div class="container">
			<div class="row">
				<div class="col-md-12 text-center">
					
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 col-md-offset-4">
					

					
					<form action="#" class="fh5co-form animate-box" data-animate-effect="fadeIn">
						<h2>用户注册</h2>
						<div class="form-group">
							<label for="name" class="sr-only">用户名</label>
							<input type="text" class="form-control" id="name" placeholder="用户名" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="email" class="sr-only">Email</label>
							<input type="email" class="form-control" id="email" placeholder="Email" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="password" class="sr-only">密码</label>
							<input type="password" class="form-control" id="password" placeholder="密码" autocomplete="off">
						</div>
						<div class="form-group">
							<label for="re-password" class="sr-only">重复密码</label>
							<input type="password" class="form-control" id="re-password" placeholder="重复密码" autocomplete="off">
						</div>
						<div class="form-group">
							<p>已经注册了? <a href="login.jsp">登录</a></p>
						</div>
						<div class="form-group">
							<input type="submit" value="提交" class="btn btn-primary">
						</div>
					</form>

				</div>
			</div>
			
		</div>
	
	<!-- jQuery -->
	<script src="${basePath}resources/js/jquery.min.js"></script>
	<!-- Bootstrap -->
	<script src="${basePath}resources/js/bootstrap.min.js"></script>
	<!-- Placeholder -->
	<script src="${basePath}resources/js/jquery.placeholder.min.js"></script>
	<!-- Waypoints -->
	<script src="${basePath}resources/js/jquery.waypoints.min.js"></script>
	<!-- Main JS -->
	<script src="${basePath}resources/js/main.js"></script>

	</body>
</html>

