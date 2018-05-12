<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";  
%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>首页</title>
</head>
<script src="${basePath}resources/js/jquery.min.js"></script>
<body>
	<a href="index.action" id="home" >跳转到home.jsp</a>
	
	<!-- <script type="text/javascript">
	function doredirect(){
		alert("sds");
		window.location.href="IndexServlet";
	}
	
	function AjaxPost(Url,JsonData,LodingFun,ReturnFun) {
	    $.ajax({
	        type: "post",
	        url: "/index.action",
	       //data: JsonData,
	        //dataType: 'json',
	        async: 'false',
	        beforeSend: function(){
	        	alert("执行跳转前函数");
	        },
	        error: function () { AjaxErro({ "Status": "Erro", "Erro": "500" }); },
	        success: function (){
	        	alert("回调函数执行成功")
	        }
	    });
	}
	</script> -->
</body>
</html>