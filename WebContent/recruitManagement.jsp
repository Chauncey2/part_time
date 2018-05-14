<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" >
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"  isELIgnored="false"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>首页-雇佣君兼职</title>
    <link href="${basePath}resources/css/jianzhi/web/b/b_base_v3.__1522055385__.css" type="text/css" rel="stylesheet">
    <link href="${basePath}resources/css/jianzhi/web/b/b_business_manage.__1522055385__.css" type="text/css" rel="stylesheet">
    <link href="${basePath}resources/css/jianzhi/web/b/b_form.__1512563581__.css" type="text/css" rel="stylesheet">
    <link href="${basePath}resources/css/jianzhi/web/b/b_global.__1524650377__.css" type="text/css" rel="stylesheet">
    <link href="${basePath}resources/css/jianzhi/web/b/b_online.__1517826784__.css" type="text/css" rel="stylesheet">
    <link href="${basePath}resources/css/jianzhi/web/b/b_pop.__1520327087__.css" type="text/css" rel="stylesheet">
    <link href="${basePath}resources/css/jianzhi/web/b/b_pub.__1524650377__.css" type="text/css" rel="stylesheet">
    <link href="${basePath}resources/css/jianzhi/web/b/b_pub_companyInfo.__1525349146__.css" type="text/css" rel="stylesheet">
    <link href="${basePath}resources/css/jianzhi/web/global.__1512563581__.css" type="text/css" rel="stylesheet">
    <link href="${basePath}resources/css/jianzhi/web/b/ui_kit.__1525771022__.css" type="text/css" rel="stylesheet">
    <link href="${basePath}resources/css/jianzhi/web/b/b_certification.__1524736962__.css" type="text/css" rel="stylesheet">
    <link href="${basePath}resources/css/jianzhi/web/b/youxuan.__1525771022__.css" type="text/css" rel="stylesheet">
    <link href="${basePath}resources/css/jianzhi/web/b/b_index.css" type="text/css" rel="stylesheet">
    <link href="${basePath}resources/css/v5/want_manage/jz/ico.__1478776853__.css" type="text/css" rel="stylesheet">

    <script src="${basePath}resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/jquery-form.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/jquery.min.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/hm.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/protobuf-2.1.1.min.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/RongIMLib-2.1.3.min.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/util/panel/panel.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/util/ganji/ganji.js"></script>
    <link rel="stylesheet" href="${basePath}resources/js/util/panel/panel.css" type="text/css">
    <script type="text/javascript" src="${basePath}resources/js/util/iframe/rpc3.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/util/iframe/iframe.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/util/dragdrop/dragdrop.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/util/datepicker/datepicker.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/app/pub/ajax_helper.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/util/event/event_emitter.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/util/jquery/ui/i18n/jquery.ui.datepicker-zh-CN.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/util/string/string.js"></script>
    <script type="text/javascript" src="${basePath}resources/js/util/jquery/ui/jquery.ui.datepicker.js"></script>
    <link rel="stylesheet" href="${basePath}resources/js/util/jquery/themes/base/jquery.ui.all.css" type="text/css">
    <script type="text/javascript" src="../js/util/jquery/ui/jquery.ui.core.js"></script>
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?7c0a2fe029631e2d7436151fab071753";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>
</head>
<body class="b-index">
<div class="header" >
    <div>
        <div class="jz-logo">
            <a href="#" title="雇佣君兼职"></a>
        </div>
        <div class="b-version">商家版</div>
        <ul class="nav">
            <li>
                <a href="business_index.jsp">首页</a>
            </li>
            <li class="line"></li>
            <li>
                招聘管理
            </li>
            <li class="line"></li>
            <li>
                <a href="bussinessManagement.jsp">企业管理</a>
            </li>
        </ul>

        <div class="header-r clearfix">
            <div class="fl fc-4b h-userName">
                <span class="userName"><span>
                                    王佳薇
                                </span><i class="ar"></i></span>
                <ul class="h-userName-menu">
                    <li><a href="#">退出</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/biz/outer_b_im.js"></script>
<script type="text/javascript" src="/js/RongIMLib-2.1.3.min.js"></script>

<div class="see-list show_box" style="display: none"></div>
<div class="w mt10 clearfix">
    <div class="aside-container">
        <div class="aside">
            <div class="pub-area">
                <a href="post.jsp" class="pub-btn" id="pub_btn">发布职位</a>
                <ul class="pub-btn-pop-v2 pub-list" id="pub_list"  style="display: none;" >
                    <li class="pub-list-item">
                        <a class="pub_post_class pub_area" dmbalog="/jianzhi/vip/managecenter@atype=click@ca_source=pc@ca_from=publish_jz" href="https://vip.doumi.com/post/pub/fulltime"><i class="pub-pop-ico1 pub_area"></i>全职招聘</a>
                    </li>
                    <li class="pub-list-item">
                        <a class="pub_post_class pub_area" dmbalog="/jianzhi/vip/managecenter@atype=click@ca_source=pc@ca_from=publish_jz" id="pubBtn" href="javascript:;"><i class="pub-pop-ico1 pub_area"></i>兼职招聘</a>
                    </li>
                </ul>
            </div>
            <div class="b-menu">
                <dl>
                    <dt><a href="recruit.action"  class="cur" >
                        <i class="menu-ico2"></i>职位管理<!--  --></a></dt>
                    <dd>
                        <ul>
                            <li><a href="noAudit.action" style="color: #69e">进行中</a></li>
                        </ul>
                    </dd>
                </dl>
            </div>
        </div>
    </div>
    
    <div class="main">
        <!--公共header-->
        <div class="bList-t clearfix">
                <h3>全部职位</h3>
            </div>
        <c:forEach items="${messageList}" var="message"	varStatus="status">
        <div class="bList"> 
            <div class="bList-item">
                <div class="bList-item-top">
                    <div class="bList-item-t">
                       	 ${message.jname}  
                    </div>                                    
                    <div class="bList-item-num">                   
	                    <div class="bList-item-num-load">
	                        <span>报名人数：</span>
	                        <!-- <span class="loading"><i style="width:0%"></i></span> -->
	                        <span class="remain"><em>0</em>/3</span>
	                    </div>
                	</div>
                </div>
                <div class="bList-item-mid">
                    <ul class="clearfix">
                        <li>
                            <em class="salary">${message.jsalary}</em>
                        </li>
                        <li>
                            <span>职位ID：</span>${status.index+1}
                        </li>
                   
                        <!--职位类型-->
                        <li class="pubTime">
                            <span>职位类型：</span>
                            <em class="fc-70">兼职</em>
                        </li>

                        <li class="pubTime">
                            <span>发布时间：</span>
                            <em class="fc-70">${message.jreleasetime}</em>
                        </li>
                        <li>
                            <span>所在区县</span>
                            <em class="fc-70">${message.jlocal}</em>
                        </li>
                        <li>
                            <span>招聘状态：</span>
                            <em class="fc-70">进行中</em>
                        </li>
                        <li>
                        	<input type="button" value="结束"/>
                        </li>                         
                    </ul>
                </div>               
  
            </div>
        </div>
        </c:forEach> 
                       
<div class="mask" style="display:none"></div>
<div class="phone-preview-wrap" style="display:none">
    <span class="phone-preview-close"></span>
    <div class="phone-preview fl">
        <div class="phone-preview-inner">
            <iframe id='preview_left' src="" width="101%" height="100%" frameborder="0" scrolling="auto"></iframe>
        </div>
    </div>
    <div class="phone-preview fr">
        <div class="phone-preview-inner">
            <iframe id='preview_right' src="" width="101%" height="100%" frameborder="0" scrolling="auto"></iframe>
        </div>
    </div>
</div>
<script type="text/javascript" src="/js/zeroclipboard/ZeroClipboard.min.js"></script>
</body>
</html>
