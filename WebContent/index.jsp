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
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title>雇佣君-企业版</title>
    
    <link href="${basePath}resources/css/jianzhi/web/global.__1512563581__.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}resources/css/jianzhi/web/b/b_pop.__1520327087__.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}resources/css/jianzhi/web/b/b_global.__1524650377__.css" rel="stylesheet" type="text/css"/>
    <link href="${basePath}resources/css/jianzhi/web/index.__1517912310__.css" rel="stylesheet" type="text/css"/>
    
     
    <script type="text/javascript" src="${basePath}resources/js/wow.min.js"></script>
    <script src="${basePath}resources/js/util/ganji/ganji.js" type="text/jaavascript"></script>
    <script src="${basePath}resources/js/util/uuid/uuid.js" type="text/jaavascript"></script>
    <script src="${basePath}resources/js/util/uuid/unvalid_uuids.js" type="text/jaavascript"></script>
    <script src="${basePath}resources/js/util/randomid/random_id.js" type="text/jaavascript"></script>
    <script src="${basePath}resources/js/util/log_tracker/blogtracker.js" type="text/jaavascript"></script>
    <script src="${basePath}resources/js/util/jquery/jquery-1.8.2.js" type="text/jaavascript"></script>

    <script>
        var _this = 0;
        var timer;
        GJ.use('jquery', function() {
            $('.download').hover(function(e) {
                $(this).addClass('active');
            },function(e) {
                $(this).removeClass('active');
            });
            $(".prev-arrow").on('click',function(e) {
                _this = (_this-1)<0?3:_this-1;
                $(".cate-tab li").eq(_this).addClass('active').siblings().removeClass('active');
                $(".cate-content .cate-items").hide().eq(_this).show();
            })
            $(".next-arrow").on('click',function(e) {
                _this = (_this+1)>3?0:_this+1;
                $(".cate-tab li").eq(_this).addClass('active').siblings().removeClass('active');
                $(".cate-content .cate-items").hide().eq(_this).show();
            })
            $(".b2").on('mouseenter',function(e) {
                clearInterval(timer);
            })
            $(".cate-tab li").on('mouseover',function(e) {
                clearInterval(timer);
                _this = $(this).index();
                $(".cate-tab li").eq(_this).addClass('active').siblings().removeClass('active');
                $(".cate-content .cate-items").hide().eq(_this).show();
            })
            $(".b2").on('mouseleave',function(e) {
                timer = setInterval(run,7000);
            })
            $(window).scroll(function() {
                var scrollHeight = $(window).scrollTop();
                var b1Height=$('.b1').height();
                var b2Height=$('.b2').height();
                if((scrollHeight+80)>=(b1Height+b2Height)){
                    $(".header").removeClass('fixed-header');
                }else{
                    $(".header").addClass('fixed-header');
                }
            });
        });

        var wow = new WOW({
            offset: 50
        });
        wow.init();
        //7秒轮播一次
        timer = setInterval(run, 7000);
        function run(){
            _this = (_this == 3) ? 0 : _this + 1;
            //某个div显示，其他的隐藏
            $(".cate-content .cate-items").hide().eq(_this).show();
            $(".cate-tab li").eq(_this).addClass('active').siblings().removeClass('active');
        }
    </script>
</head>
<body class="b-index">

<div class="header fixed-header">
    <div class="w">
        <div class="jz-logo"><a href="#" title="雇佣君">雇佣君</a></div>
        <div class="b-version">商家版</div>
        <ul class="nav">
            <li>首页</li>
            <li class="line"></li>
            <li><a href="../recruit/recruitManagement.html" login="true">招聘管理</a></li>
            <!--<li class="line"></li>-->
        </ul>
        <div class="header-r clearfix">
            <span class="fl"><a href="" login="true" class="jz_lg" id='header_login'>注册登录</a></span>
        </div>
    </div>
</div>


<div class="b1">
    <div class="b1-inner">
        <div class="h-group">
            <!--<h3 class="platform indent">58赶集集团全力打造兼职招聘平台</h3>-->
            <h2 class="effect indent">精准快捷 一站式招聘</h2>
            <h3 class="keywords indent">海量人才 精准匹配 优选推送 信用保障</h3>
        </div>
        <div class="btn-group">
            <a href="#" class="index-btn pub-btn" login="true" dmbalog="/jianzhi/vip/index@atype=click@ca_source=pc@ca_from=fashpublish">快速发布职位</a>
       		<a href="index.action" class="index-btn pub-btn"  dmbalog="/jianzhi/vip/index@atype=click@ca_source=pc@ca_from=fashpublish">兼职信息</a>
        </div>
    </div>
</div>

<!--b2-->
<div class="b2">
    <ul class="cate-tab">
        <li class="active"><i class="cate-ico1"></i><p>海量用户</p><span class="cate-ico-bg"></span></li>
        <li><i class="cate-ico2"></i><p>人才精准匹配</p><span class="cate-ico-bg"></span></li>
        <li><i class="cate-ico3"></i><p>IM实时沟通</p><span class="cate-ico-bg"></span></li>
        <li><i class="cate-ico4"></i><p>人员便捷管控</p><span class="cate-ico-bg"></span></li>
    </ul>
<div class="b5">
    <div class="border wow fadeIn"></div>
    <i class="crown-ico"></i>
    <div class="txt1 indent wow fadeInUp">VIP招聘服务 全方位提升招聘效果</div>
    <div class="txt2 indent wow fadeInUp">提升职位排名 闪电招聘 全程托管 招聘效果实时监控</div>
    <div class="btn-group wow fadeInUp"><a href="https://vip.doumi.com/zhaopin" class="contact">联系我们</a></div>
</div>

<!--b6-->
<div class="b6">
    <div class="txt1">从现在开始，雇佣君助你一臂之力<a href="https://vip.doumi.com/employer/post/pub" class="index-btn shadow-btn" login="true">立即发布职位</a></div>
</div>
<script>
    var SPEED_RENDER_END = new Date().getTime();
    window.PAGE_CONFIG = {"blogTracker":{"dmbch":"/jianzhi/vip/index"},"fromInfo":{"from":""}} || {};
    GJ.use('blog_tracker', function(){
        setTimeout(function(){
            GJ.BLogTracker.trackPageView();
            GJ.BLogTracker.bindAllTrackEvent();
        }, 0);
    });
</script>
<!--用户踢出-->
<script>
    var currentRoute = "index.homepage";
    GJ.use(['jquery'], function(){
        var checkUserIsForBidden = function(){
            $.post("https://vip.doumi.com/employer/user/isUserOk",{currentRoute:currentRoute, _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'}, function(data) {
                if ( data.code == -1 ) {
                    window.location.href = 'https://vip.doumi.com/employer/user/logout';
                }
            }, 'json');
        };
        checkUserIsForBidden();
        $('a').click(function() {
            if ( $(this).text() != '退出') {
                checkUserIsForBidden();
            }
        });
    });
</script>

<div class="fake-pop header_login_windows login-pop-box" style="display:none;height:450px;top:30%;">
    <div class="fake-pop-hd">
        <h2 class='header_login_windows_title'>登录</h2>
        <i class="cancel-pass-all header_login_windows_close">×</i>
    </div>
    <div class="fake-pop-con txtC">
        <!-- login start -->
        <div class="login-pop w250"  id='header_login_div'>
          
            <div class="login-header">
                <span class="fl active" data-switch="1" id='header_passwd_login'>密码登录</span>
                <span class="fl" data-switch="2" id='header_phone_login'>手机号登录</span>
            </div>
            <!-- pwd start -->
            <form action="#">
                <div class="login-pwd">
                 
                    <div class="error-area" id='login_error_msg_div' style='display: none;'>
		                <span class="lg_error_msg"  id='login_error_msg'>
		                    <i class="error-area-ico"></i>
		                    密码登录页面提示信息
		                </span>
                    </div>
                    <div class="reg-input">
                        <i class="tel-ico"></i>
                        <input type="text" class='login_phone' name="phone_login" id="phone_id" placeholder="请输入手机号">
                    </div>
                    <div class="pwd-input">
                        <i class="pwd-ico"></i>
                        <input type="password" name="passwd_login" id="password_id" placeholder="请输入登录密码">
                    </div>
                    <div class="reg-text">
                        <label class="auto-login">

                        </label>
                        <a href="javascript:" class="fr reset_passwd">老用户设置密码/忘记密码</a>
                    </div>
                    <!--div class="code-input">
                        <input type="text" class="send-codeInput" placeholder="输入图片验证码" name="" id="">
                            <span class="send-img fr">
                                <img src="" />
                            </span>
                    </div>
                    <div class="reg-text">
                        <a href="javascript:;" class="fr">看不清，换一个</a>
                    </div-->
                    <div class="login-btn">
                        <input type="submit" value="登录" class="btn btn-large" id="jz_submit_login">
                    </div>
                    <div class="reg-text reg-go">
                        还没有账号？<a href="javascript:" id='header_to_register'>去注册</a>
                    </div>
                </div>
            </form>
            <!-- pwd end -->
            <!-- phone start -->
            <form action="#">
                <div class="login-phone hide">
                    <!-- 验证提示默认不显示，className加hide即可隐藏 -->
                    <div class="error-area error_msg_div" style='display: none;'>
		                <span class="lg_error_msg error_msg_content">
		                    <i class="error-area-ico"></i>
		                    手机登录页面提示信息
		                </span>
                    </div>
                    <div class="reg-input">
                        <i class="tel-ico"></i>
                        <input type="text" class="login_phone" name="register_phone" id="phone2_id" placeholder="请输入手机号">
                    </div>
                    <div class="code-input">
                        <input type="text" class="send-codeInput register_msg" placeholder="填写验证码" name="code_login">
                        <!--<button type='button' id='register_send' class="get-dynamic-pass fr register_send" style='height:36px;'>获取验证码</button>-->
                    </div>
                    <div class="code-input header_code_div" style="display:none;">
                        <!--<input type="text" class="send-codeInput header_send_code" placeholder="输入图片验证码" name="register_code" id="register_code">-->
		                <span class="send-img fr">
		                    <img class='header_send_img' src="" />
		                </span>
                    </div>
                    <div class="reg-text header_code_div" style="display:none;">
                        <a href="javascript:;" class="fr" id='change_phone_code_btn'>看不清，换一个</a>
                    </div>
                    <div class="login-btn">
                        <input type="submit" value="登录" class="btn btn-large" id="jz_submit_phone_login">
                    </div>
                </div>
            </form>
            <!-- phone end -->
        </div>
        <!-- login end -->
        <!-- register start -->
        <form action="#">
            <div class="login-pop w250" id='header_register' style='display: none;'>
                <div class="error-area error_msg_div" style="display:none;">
		                <span class="lg_error_msg error_msg_content">
		                    <i class="error-area-ico"></i>
		                    注册页面提示信息
		                </span>
                </div>
                <div class="reg-input">
                    <i class="tel-ico"></i>
                    <input type="text" class="login_phone" name="register_phone" id="register_phone" placeholder="请输入手机号">
                </div>
                <div class="code-input">
                    <input type="text" class="send-codeInput register_msg" placeholder="填写验证码" name="register_msg">
                    <button type='button' id='register_send' class="get-dynamic-pass fr register_send" style='height:36px;'>获取验证码</button>
                </div>
                <div class="code-input header_code_div" style='display: none;'>
                    <input type="text" class="send-codeInput header_send_code" placeholder="输入图片验证码" name="register_code" id="register_code">
		                <span class="send-img fr">
		                    <img class='header_send_img' src="" />
		                </span>
                </div>
                <div class="reg-text header_code_div" style='display: none;'>
                    <a href="javascript:;" class="fr" id='register_code_btn'>看不清，换一个</a>
                </div>
                <div class="pwd-input">
                    <i class="pwd-ico"></i>
                    <input type="password" name="register_password" id="register_password" placeholder="请输入密码">
                </div>
                <div class="reg-text">
                    <input type="checkbox" value="" class="jz-checkbox" id="regprotocolid">我已阅读并同意<a href="https://vip.doumi.com/employer/user/regprotocol" class="header_to_login" target="_blank">《斗米兼职平台发布协议》</a>
                </div>
                <div class="login-btn">
                    <input type="submit" value="注册" class="btn btn-large" id="jz_submit_register">
                </div>
                <div class="reg-text reg-go">
                    已有雇佣君帐号？<a href="javascript:" class='header_to_login gologin'>去登录</a>
                </div>
            </div>
        </form>
        <!-- register end -->
        <!-- forgot pwd start -->
        <form action="#">
            <div class="login-pop w250" id='header_forgot_div' style='display: none;'>
                <div class="error-area error_msg_div" style='display: none;'>
		                <span class="lg_error_msg error_msg_content">
		                    <i class="error-area-ico"></i>
		                    忘记密码页面提示信息
		                </span>
                </div>
                <div class="reg-input">
                    <i class="tel-ico"></i>
                    <input type="text" class="login_phone" name="register_phone" id="phone" placeholder="请输入需要重置密码的帐号">
                </div>
                <div class="code-input">
                    <input type="text" class="send-codeInput" placeholder="填写验证码" name="register_msg" id="register_msg">
                    <!--<button type='button' id='register_send' class="get-dynamic-pass fr register_send" style='height:36px;'>获取验证码</button>-->
                </div>
                <div class="code-input header_code_div" style='display: none;'>
                    <input type="text" class="send-codeInput header_send_code" placeholder="输入图片验证码" name="img_code" id="">
		                <span class="send-img fr">
		                    <img class='header_send_img' src="" />
		                </span>
                </div>
                <div class="reg-text header_code_div" style='display: none;'>
                    <a href="javascript:;" class="fr" id='forgot_code_btn'>看不清，换一个</a>
                </div>
                <div class="pwd-input">
                    <i class="pwd-ico"></i>
                    <!--<input type="password" name="register_password" id="register_password" placeholder="请输入新密码">-->
                </div>
                <div class="login-btn">
                    <input type="submit" value="重置密码" class="btn btn-large" id="header_forgot_btn">
                </div>
            </div>
        </form>
        <!-- forgot pwd end -->
        <!-- login succeed start -->
        <div class="login-pop w250" style='display: none;' id='header_forgot_success'>
            <div class="login-pop-txt">恭喜，重置密码成功</div>
            <div class="login-pop-btn">
                <button class="btn" type="button" id='header_forgot_success_btn'>直接登录</button>
            </div>
        </div>
        <!-- login succeed end -->
    </div>
</div>
<div class="mask header_login_windows_mask"></div>
<script type="text/javascript">
    var headerLoginDiv = '#header_login';
    var headerLogin = '#header_login_div';
    var headerRegisterDiv = '#header_register';
    var headerLoginWindows = '.header_login_windows';
    var headerLoginWindowsClose = '.header_login_windows_close';
    var headerLoginWindowsTitle = '.header_login_windows_title';
    var headerLoginWindowsMask = '.header_login_windows_mask';
    var headerPasswdLogin = '#header_passwd_login';
    var headerPhoneLogin = '#header_phone_login';
    var jzSubmitLogin = '#jz_submit_login';
    var jzSubmitPhoneLogin = '#jz_submit_phone_login';
    var jzSubmitRegister = '#jz_submit_register';
    var loginErrorMsg = '#login_error_msg';
    var loginErrorMsgDiv = '#login_error_msg_div';
    var headerToRegister = '#header_to_register';
    var headerRegisterPhone = '#register_phone';
    var headerRegisterMsg = '#register_msg';
    var headerRegisterMsgBtn = '.register_send';
    var headerRegisterPw = '#register_password';
    var headerRegisterRePw = '#register_repassword';
    var headerRegisterCode = '#register_code';
    var headerRegisterCodeBtn = '#register_code_btn';
    var headerChangePhoneCodeBtn = '#change_phone_code_btn';
    var headerForgotCodeBtn = '#forgot_code_btn';
    var headermsgDiv = '.error_msg_div';
    var headermsgContent = '.error_msg_content';
    var headerSendImg = '.header_send_img';
    var headerCodeDiv = '.header_code_div';
    var headerToLogin = '.gologin';
    var HeaderResetPasswd = '.reset_passwd';
    var headerForgotDiv = '#header_forgot_div';
    var headerForgotBtn = '#header_forgot_btn';
    var headerForgotSuccess = '#header_forgot_success';
    var headerForgotSuccessBtn = '#header_forgot_success_btn';
    var headerSendCode = '.header_send_code';
    var loginPhone = '.login_phone';
    var phonereg = /^1\d{10}$/;
    var passwordreg = /^[0-9A-Za-z]{6,}$/;
    var InterValObj; //timer变量，控制时间
    var count = 60; //间隔函数，1秒执行
    var curCount;//当前剩余秒数
    var checkCode = false;
    var jumpUrl = '';
    var default_phone = '';
    GJ.use('jquery', function(){
        $(headerLoginDiv).live('click',function(e){
            showHeaderLoginAll();
        });
        $(headerLoginWindowsClose).live('click',function(e){
            $(headerLoginWindows).hide();
            $(headerLoginWindowsMask).hide();
        });
        $('.login-header > span').live('click', function() {
            var container = $(this).parents('.login-pop');
            var flg = $(this).attr('data-switch');
            $(this).parent().find('span').removeClass('active');
            $(this).addClass('active');
            if (flg == 1) {
                container.find('.login-pwd').show();
                container.find('.login-phone').hide();
            } else {
                container.find('.login-pwd').hide();
                container.find('.login-phone').show();
            }
        });
        $(headerToLogin).bind('click',function(e){
            showHeaderLogin();
        });
        $(HeaderResetPasswd).bind('click',function(e){
            showHeaderForgot();
        });
        $(headerForgotSuccessBtn).bind('click',function(e){
            var phone = $('#header_forgot_div').find('input[name="register_phone"]').val();
            var passwd = $('#header_forgot_div').find('input[name="register_password"]').val();
            $.ajax({
                'type' : 'POST',
                'url'  : "https://vip.doumi.com/employer/user/ajaxlogin",
                'data' : {phone_login:phone, passwd_login:passwd, _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'},
                'dataType' : 'json',
                'success' : function (data) {
                    if(data.errno == 0){
                        if (jumpUrl) {
                            window.location.href=jumpUrl;
                        } else {
                            window.location.href=data.jumpUrl;
                        }
                    }else{
                        showHeaderLogin();
                        alert('登录失败，请重新输入密码后登陆');
                    }
                },
                'error' : function (data) {
                    showHeaderLogin();
                    alert('登录失败，请重新输入密码后登陆');
                }
            });
        });
        $(headerSendCode).bind('keyup',function(){
            var container = $(this).parent().parent();
            var phone = container.find('input[name="register_phone"]').val();
            var code = $(this).val();
            if(code.length != 4){
                return false;
            }
            if(phone == ''){
                showHeaderErrorMsg(container,'请输入手机号');
                return false;
            }
            if (!phonereg.test(phone)) {
                showHeaderErrorMsg(container,'请输入正确的手机号');
                return false;
            }
            checkPhoneCode(container,phone,code);
        });
        $(document).live('click',function(e){
            var login_status = "";
            var header_login_class_name = 'org-bor-btn';
            if(login_status == '' && $(e.target).attr('login'))
            {
                jumpUrl = $(e.target).attr('href');
                showHeaderLoginAll();
                return false;
            }
        });
        $(jzSubmitLogin).live('click',function(e){
            var container = $(this).parent().parent();
            var phone = container.find('input[name="phone_login"]').val();
            var password = container.find('input[name="passwd_login"]').val();
            if(phone == ''){
                container.find(loginErrorMsg).html('<i class="error-area-ico"></i>请输入手机号');
                container.find(loginErrorMsgDiv).show();
                return false;
            }
            if(password == ''){
                container.find(loginErrorMsg).html('<i class="error-area-ico"></i>请输入密码');
                container.find(loginErrorMsgDiv).show();
                return false;
            }
            if (!phonereg.test(phone)) {
                container.find(loginErrorMsg).html('<i class="error-area-ico"></i>请输入正确的手机号');
                container.find(loginErrorMsgDiv).show();
                return false;
            }
            if (!passwordreg.test(password)) {
                container.find(loginErrorMsg).html('<i class="error-area-ico"></i>请输入正确的密码');
                container.find(loginErrorMsgDiv).show();
                return false;
            }
            $.ajax({
                'type' : 'POST',
                'url'  : "https://vip.doumi.com/employer/user/ajaxlogin",
                'data' : {phone_login:phone, passwd_login:password, _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'},
                'dataType' : 'json',
                'success' : function (data) {
                    if(data.errno == 0){
                        if (jumpUrl) {
                            window.location.href=data.jumpUrl;
                        } else {
                            window.location.href=data.jumpUrl;
                        }
                    }else{
                        container.find(loginErrorMsg).html('<i class="error-area-ico"></i>'+data.msg);
                        container.find(loginErrorMsgDiv).show();
                        return false;
                    }
                    return false;
                },
                'error' : function (data) {
                    alert('登录失败');
                },
                'beforeSend' : function(xhr) {
                    xhr.setRequestHeader("X-CSRF-TOKEN", 'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb');
                }
            });
            return false;
        });

        //**********************手机号登录**************************//
        $(jzSubmitPhoneLogin).live('click',function(e){
            var container = $(this).parent().parent();
            var phone = container.find('input[name="register_phone"]').val();
            var code = container.find('input[name="code_login"]').val();
            if(phone == ''){
                showHeaderErrorMsg(container,'请输入手机号');
                return false;
            }
            if(code == ''){
                showHeaderErrorMsg(container,'请输入验证码');
                return false;
            }
            if (!phonereg.test(phone)) {
                showHeaderErrorMsg(container,'请输入正确的手机号');
                return false;
            }
            $.ajax({
                'type' : 'POST',
                'url'  : "https://vip.doumi.com/employer/user/ajaxPhoneLogin",
                'data' : {phone_login:phone, verify_code:code, _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'},
                'dataType' : 'json',
                'success' : function (data) {
                    if(data.errno == 0){
                        if (jumpUrl) {
                            window.location.href=jumpUrl;
                        } else {
                            window.location.href=data.jumpUrl;
                        }
                    }else{
                        showHeaderErrorMsg(container,data.msg);
                        return false;
                    }
                    return false;
                },
                'error' : function (data) {
                    alert('登录失败');
                }
            });
            return false;
        });
        //*********************************************************************//
        $(jzSubmitRegister).bind('click',function(e){
            var container = $(this).parent().parent();
            var phone = container.find('input[name="register_phone"]').val();
            var password = container.find('input[name="register_password"]').val();
            var repassword = container.find('input[name="register_repassword"]').val();
            var msg_code = container.find('input[name="register_msg"]').val();
            var img_code = container.find('input[name="img_code"]').val();
            if(phone == ''){

                container.find(headermsgContent).html('<i class="error-area-ico"></i>请输入手机号');
                container.find(headermsgDiv).show();
                return false;
            }
            if(msg_code == ''){
                container.find(headermsgContent).html('<i class="error-area-ico"></i>请输入短信验证码');
                container.find(headermsgDiv).show();
                return false;
            }
            if(password == ''){
                container.find(headermsgContent).html('<i class="error-area-ico"></i>请输入密码');
                container.find(headermsgDiv).show();
                return false;
            }

            if (!phonereg.test(phone)) {
                container.find(headermsgContent).html('<i class="error-area-ico"></i>请输入正确的手机号');
                container.find(headermsgDiv).show();
                return false;
            }

            if (!passwordreg.test(password)) {
                container.find(headermsgContent).html('<i class="error-area-ico"></i>请输入正确的密码');
                container.find(headermsgDiv).show();
                return false;
            }
            if ( !$('#regprotocolid').attr('checked')) {
                container.find(headermsgContent).html('<i class="error-area-ico"></i>请勾选《斗米兼职平台发布协议》');
                container.find(headermsgDiv).show();
                return false;
            }
            $.ajax({
                'type' : 'POST',
                'url'  : "https://vip.doumi.com/employer/user/ajaxregister",
                'data' : {phone:phone, verify_code:msg_code, password:password},
                'dataType' : 'json',
                'success' : function (data) {
                    if(data.errno == 0){
                        var url = "https://vip.doumi.com/managecenter";
                        window.location.href=url;
                    }else{
                        showHeaderErrorMsg(container,data.msg);
                        return false;
                    }
                    return false;
                },
                'error' : function (data) {
                    alert('注册失败');
                },
                'beforeSend' : function(xhr) {
                    xhr.setRequestHeader("X-CSRF-TOKEN", 'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb');
                }

            });
            return false;

        });

        var checkPhoneCode = function(event,phone,code){
            var result = false;
            if (code.length != 4) {
                showHeaderErrorMsg(event,'图片验证码错误！');
                return false;
            }

            $.ajax({
                'type' : 'POST',
                'url'  : '/api/v1/client/authCkCode',
                'data' : {mobile:phone, code:code},
                'dataType' : 'json',
                'success' : function (json) {
                    if (json.code == 0) {
                        result = true;
                        event.find(headerCodeDiv).hide();
                        $('.error_msg_div').hide();
                        //container.find(headerRegisterMsg).focus();
                        curCount = count;
                        $('.register_send').attr({"disabled":"disabled"});
                        //设置button效果，开始计时
                        $('.register_send').text(curCount + "秒后重试");
                        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
                    } else {
                        showHeaderErrorMsg(event,json.message);
                    }
                },
                'error' : function (err) {
                    var err = $.parseJSON(err.responseText);
                    if (err.message) {
                        showHeaderErrorMsg(event,err.message);
                    }
                    if (err.code == -3 || err.code == -4) {
                        $('.fr > img').attr('src', '/api/v1/client/showCkCode?rand=' + Math.random());
                    }
                }
            });
            return result;

        }

        $(headerRegisterMsgBtn).click(function(){
            var _This = this;
            var container = $(this).parent().parent();
            var phone = container.find('input[name="register_phone"]').val();
            if(!(phonereg.test(phone))){
                showHeaderErrorMsg(container,'请输入正确的手机号');
                return false;
            }else{
                hideHeaderErrorMsg(container);
            }
            $.ajax({
                'url':'/api/v1/client/authCkCode',
                'type':'POST',
                'data':{'mobile': phone},
                'cache': false,
                'dataType': 'json',
                'async'   : false,
                'success': function(data) {
                    if(!data.error){
                        container.find(headerRegisterMsg).focus();
                        curCount = count;
                        $(_This).attr({"disabled":"disabled"});
                        //设置button效果，开始计时
                        $(_This).text(curCount + "秒后重试");
                        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
                    }else{
                        alert(data.message);
                    }
                },'error': function(err) {
                    var err = $.parseJSON(err.responseText);
                    if (err.message) {
                        showHeaderErrorMsg(container,err.message);
                    }
                    if (err.code == -3 || err.code == -4) {
                        //curCount = count;
                        $(_This).attr({"disabled":"disabled"});
                        //设置button效果，开始计时
                        //$(_This).text(curCount + "秒后重试");
                        //InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次
                        checkCode = true;
                        container.find(headerSendCode).val('');
                        setHeaderLoginHeight(150);
                        container.find(headerCodeDiv).show();
                        reset(container);
                    }
                }
            });

        });

        $(headerForgotBtn).bind('click',function(){
            var container = $(this).parent().parent();
            var phone = container.find('input[name="register_phone"]').val();
            var password = container.find('input[name="register_password"]').val();
            var repassword = container.find('input[name="register_repassword"]').val();
            var msg_code = container.find('input[name="register_msg"]').val();
            var img_code = container.find('input[name="img_code"]').val();
            if(phone == ''){
                showHeaderErrorMsg(container,'请输入手机号');
                return false;
            }
            if(msg_code == ''){
                showHeaderErrorMsg(container,'请输入短信验证码');
                return false;
            }
            if(password == ''){
                showHeaderErrorMsg(container,'请输入密码');
                return false;
            }

            if (!phonereg.test(phone)) {
                showHeaderErrorMsg(container,'请输入正确的手机号');
                return false;
            }
            if (!passwordreg.test(password)) {
                showHeaderErrorMsg(container,'请输入正确的密码');
                return false;
            }

            $.ajax({
                'type' : 'POST',
                'url'  : "https://vip.doumi.com/employer/user/ajaxreset",
                'data' : {phone:phone, verify_code:msg_code, password:password},
                'dataType' : 'json',
                'success' : function (data) {
                    if(data.errno == 0){
                        showHeaderForgotSuccess();
                        //window.location.reload();
                    }else{
                        showHeaderErrorMsg(container,data.msg);
                        return false;
                    }
                    return false;
                },
                'error' : function (data) {
                    alert('注册失败');
                },
                'beforeSend' : function(xhr) {
                    xhr.setRequestHeader("X-CSRF-TOKEN", 'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb');
                }
            });
            return false;

        });

        $(headerToRegister).bind('click',function(e){
            $(headerForgotDiv).hide();
            $(headerLogin).hide();
            $(headerForgotSuccess).hide();
            changeHeaderLoginTitle('注册');
            changeHeaderLoginDiv('500px');
            $(headerRegisterDiv).show();
        });

        //timer处理函数
        function SetRemainTime() {
            if (curCount == 1) {
                window.clearInterval(InterValObj);//停止计时器
                $(headerRegisterMsgBtn).removeAttr("disabled");//启用按钮
                $(headerRegisterMsgBtn).text("获取验证码");
            }
            else {
                curCount--;
                $(headerRegisterMsgBtn).text(curCount + "秒后重试");
            }
        }

        var changeHeaderLoginDiv = function(height){
            $(headerLoginWindows).css('height',height);
        }
        var changeHeaderLoginTitle = function(title){
            $(headerLoginWindowsTitle).text(title);
        }
        var showHeaderErrorMsg = function(event,msg){
            event.find(headermsgContent).html('<i class="error-area-ico"></i>'+msg);
            event.find(headermsgDiv).show();
        }
        var hideHeaderErrorMsg = function(event){
            event.find(headermsgContent).html('');
            event.find(headermsgDiv).hide();
        }
        var reset = function(event){
            showHeaderErrorMsg(event,'请输入图片验证码');
            event.find(headerSendCode).val('');
            event.find(headerSendImg).attr('src', '/api/v1/client/showCkCode?rand=' + Math.random());
        }
        $(headerRegisterCodeBtn).live('click', function() {
            $('.fr > img').attr('src', '/api/v1/client/showCkCode?rand=' + Math.random());
        });

        $(headerForgotCodeBtn).live('click', function() {
            $('.fr > img').attr('src', '/api/v1/client/showCkCode?rand=' + Math.random());
        });

        $(headerChangePhoneCodeBtn).live('click', function() {
            $('.fr > img').attr('src', '/api/v1/client/showCkCode?rand=' + Math.random());
        });

        var showHeaderLogin = function(){
            changeHeaderLoginTitle('登录');
            changeHeaderLoginDiv('450px');
            $(headerForgotDiv).hide();
            $(headerRegisterDiv).hide();
            $(headerForgotSuccess).hide();
            $(headerLogin).show();
        }

        var showHeaderForgot = function(){
            changeHeaderLoginTitle('重置密码');
            changeHeaderLoginDiv('440px');
            $(headerLogin).hide();
            $(headerRegisterDiv).hide();
            $(headerForgotSuccess).hide();
            $(headerForgotDiv).show();
        }
        var showHeaderForgotSuccess = function(){
            changeHeaderLoginTitle('重置密码成功');
            changeHeaderLoginDiv('200px');
            $(headerLogin).hide();
            $(headerRegisterDiv).hide();
            $(headerForgotDiv).hide();
            $(headerForgotSuccess).show();
        };
        var showHeaderLoginAll = function(){
            showHeaderLogin();
            $(headerLoginWindows).show();
            $(headerLoginWindowsMask).show();
        }
        var setHeaderLoginHeight = function(height){
            var nowHeight = $(headerLoginWindows).outerHeight(true);
            $(headerLoginWindows).css('height',nowHeight + height);
        }

        var getDefaultPhone = function(){
            var phone = '';
            $(loginPhone).each(function(index,e){
                phone = $(e).val();
                if(phone){
                    return false;
                }
            });
            return phone;
        }

        var setDefaultPhone = function(phone){
            $(loginPhone).each(function(index,e){
                $(e).val(phone);
            });
            return true;
        }

        $(document).ready(function(){
            default_phone = getDefaultPhone();
            setDefaultPhone(default_phone);
        });

        $(loginPhone).live('keyup blur',function(event) {
            var phone = $(this).val();
            setDefaultPhone(phone);
        });
    });
</script>
</body>
</html>
