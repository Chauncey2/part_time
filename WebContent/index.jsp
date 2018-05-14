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
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-transform"/>
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta property="wb:webmaster" content="c93d0b6fb2efc687" />
    <title>大学生兼职-雇佣君</title>
    <link rel="alternate" type="applicationnd.wap.xhtml+xml" media="handheld" href="http://m.doumi.com/?from=sem_baidu_pz&amp;ca_source=pc"/>
    <meta name="mobile-agent" content="format=wml; url=http://m.doumi.com/?from=sem_baidu_pz&amp;ca_source=pc" />
    <meta name="mobile-agent" content="format=xhtml; url=http://m.doumi.com/?from=sem_baidu_pz&amp;ca_source=pc" />
    <meta name="mobile-agent" content="format=html5; url=http://m.doumi.com/?from=sem_baidu_pz&amp;ca_source=pc" />
    <!--<link rel="shortcut icon" href="/images/favicon.ico">-->
    <!--<script type="text/javascript" src="//sta.doumi.com/cgi/ganji_sta.php?file=ganji,css/jianzhi/web/c/index2.cmb.css&configDir=css/jianzhi/web/c&documentDomain=www.doumi.com"></script>-->
    <link href="${basePath}resources/css/jianzhi/web/c/jz_pop.__1502442964__.css" rel="stylesheet" type="text/css">
    <link href="${basePath}resources/css/jianzhi/web/c/v2/jz_c_global.__1517917816__.css" rel="stylesheet" type="text/css">
    <link href="${basePath}resources/css/jianzhi/web/c/v2/index.__1519290580__.css" rel="stylesheet" type="text/css">
    <link href="${basePath}resources/css/jianzhi/web/global.__1512563581__.css" rel="stylesheet" type="text/css">

    <meta name="applicable-device" content="pc" />
</head>
<body class="index foobar-show">
<div class="header">
    <div class="w clearfix">
        <a class="jz-logo" href="/" title="雇佣君">雇佣君</a>
        <a class="location" href="#">淮安</a>
        <ul class="nav" data="index">
            <li><a class="current">首页</a></li>
            <li><a href="home.jsp" class="zhiweiCity"  dmaLog="/jianzhi/index@city=huaian@atype=click@ca_source=pc@ca_from=zhiwei" >职位</a></li>
            <li><a href="business_index.jsp" onclick="_hmt.push(['_trackEvent', 'pc_home_shanjiafatie', 'click'])"  target="_blank" rel="nofollow"  dmaLog="/jianzhi/index@city=huaian@atype=click@ca_source=pc@ca_from=qiyeban" >企业版</a></li>
        </ul>
        <div class="login-info">
          <a class="login-reg jz_lg" href="login.jsp" rel="nofollow">注册登录</a>
        </div>
    </div>
</div>
<div class="first-screen">
    <div class="w">
        <div class="wrap">
            <p class="slogan">雇佣君，灵活用工一站式服务平台</p>
            <p class="vision">工作好·选择多·上手快</p>          
        </div>
        <div class="guide-scroll">滚动<span class="icon"></span></div>
    </div>
</div>
<div class="page">
    <div class="section s2">
        <h2 class="wow fadeInUp">商户招聘服务</h2>
        <ul class="feature">
            <li class="wow fadeInUp"><span class="icon i1"></span>资质审核</li>
            <li class="wow fadeInUp"><span class="icon i2"></span>人才精准匹配</li>
            <li class="wow fadeInUp"><span class="icon i3"></span>快捷发布职位</li>
            <li class="wow fadeInUp"><span class="icon i4"></span>实时便捷管控</li>
        </ul>
    </div>
    <div class="section s5">
        <div class="w">
            <div class="title-wrap wow fadeInUp">
                <h2>专业靠谱的灵活用工平台</h2>
                <p>专业审核团队，靠谱职位担保</p>
            </div>
            <ul class="feature_2">
                <li class="wow fadeInUp"><span class="icon i1"></span><p>全部职位专业团队审核认证<br>资质认证，安全放心</p></li>
                <li class="wow fadeInUp"><span class="icon i2"></span><p>直招职位全程介入监控督导<br>杜绝骗子，保证权益</p></li>
                <li class="wow fadeInUp"><span class="icon i3"></span><p>工资保障职位承诺工资先行赔付<br>规避纠纷，完美体验</p></li>
            </ul>
        </div>
    </div>
</div>
<!-- <script type="text/javascript" src="../js/wow.min.js"></script> -->
<!-- <script type="text/javascript"> -->
<script type="text/javascript">
    GJ.use('app/common/widget/widget.js', function(widget) {
        var windowHeight = $(window).height();
        var $firstScreen = $('.first-screen');
        $('.page').css('margin-top', windowHeight);
        if (!($.browser && $.browser.msie && (parseFloat($.browser.version) < 10))) {
            scrollAnimate();
        }

        function scrollAnimate() {
            var data = [];
            $('.wow').each(function() {

                var item = {};
                item.$obj = $(this);
                var itemTop = $(this).offset().top;
                item.downShow = itemTop - windowHeight + 100;
                item.downHide = itemTop + $(this).height();
                item.upShow = itemTop + $(this).height();
                item.upHide = itemTop - windowHeight;
                item.className = $(this).attr('class').match(/wow (.+?)( |$)/)[1];
                data.push(item);
                $(this).removeClass(item.className);
                item.$obj.css({'visibility' : 'hidden'});
            });
            var cScrollTop = $(window).scrollTop();
            $(window).on('scroll', function() {
                var nScrollTop = $(this).scrollTop();
                if (nScrollTop > cScrollTop) { //down
                    if (nScrollTop < windowHeight) {
                        $firstScreen.css('opacity', (1-nScrollTop/windowHeight));
                    }
                    $.each(data, function(i,item) {
                        if (nScrollTop > item.downHide) {
                            item.$obj.css({'visibility' : 'hidden'});
                            item.$obj.removeClass(item.className + ' animation-node-act swing');
                        } else if (nScrollTop > item.downShow) {
                            if (item.$obj.css('visibility') == 'visible') {
                                return;
                            }
                            item.$obj.addClass(item.className + ' animation-node-act');
                            item.$obj.on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
                                item.$obj.css({'visibility' : 'visible'});
                                if (item.$obj.hasClass('cb-swing')) {
                                    setTimeout(function() {
                                        item.$obj.removeClass('animation-node-act').addClass('swing')
                                    }, item.$obj.data('delay'))

                                }
                            })
                        }
                    });
                } else { //up
                    if (nScrollTop < windowHeight) {
                        $firstScreen.css('opacity', ((windowHeight-nScrollTop)/windowHeight));
                    }
                    $.each(data, function(i,item) {
                        if (nScrollTop < item.upHide) {
                            item.$obj.css({'visibility' : 'hidden'});
                            item.$obj.removeClass(item.className + ' animation-node-act swing');
                        } else if (nScrollTop < item.upShow) {
                            if (item.$obj.css('visibility') == 'visible') {
                                return;
                            }
                            item.$obj.addClass(item.className + ' animation-node-act');
                            item.$obj.on('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function() {
                                item.$obj.css({'visibility' : 'visible'});
                                if (item.$obj.hasClass('cb-swing')) {
                                    setTimeout(function() {
                                        item.$obj.removeClass('animation-node-act').addClass('swing')
                                    }, item.$obj.data('delay'))

                                }
                            })
                        }
                    });
                }
                cScrollTop = nScrollTop;
            });
        }

        $('.dropdown').hover(function() {
            $(this).addClass('active');
        }, function() {
            $(this).removeClass('active');
        });

        $('.friend-link .btn_arrow').click(function() {
            $(this).parents('.friend-link').toggleClass('active');
            return false;
        });

        $('.nav .tg').hover(function() {
            $('.nav .qr-code').addClass('active');
        }, function() {
            $('.nav .qr-code').removeClass('active');
        });
        $('i.guide-close').on('click', function(){
            $('div.foobar').hide();
            $('body').removeClass('foobar-show');
        });
    });
</script>
<!-- js end -->

<div style="display:none;" id="content_3">
    <!--以下所有显示操作：添加hide类表示隐藏该元素，去除hide类表示显示该元素-->
    <div class="login-pop c-pop w250" id="win_login">
        <!--密码登录与手机号登录按钮切换，切换至哪个按钮给此按钮添加active类-->
        <div class="login-header clearfix">
            <span class="fl" data-switch="0">密码登录</span>
            <span class="fl active" data-switch="1">手机号登录</span>
        </div>
        <!--start 密码登录-->
        <form action="#" class="login-pwd">
            <!--密码出错出现提示，去掉hide类即可显示-->
            <!-- <div class="error-area" id="login_error" style="display:none;"> -->
            <div class="error-area" id="login_error_pwd" style="display:none;">
                <!-- <span class="lg_error_msg"> -->
                <span class="lg_error_msg" id="lg_error_msg_pwd">
                    <i class="error-area-ico"></i>
                    使用密码登录
                </span>
            </div>
            <div class="reg-input">
                <i class="tel-ico"></i>
                <input type="text" name="lg_phone" id="lg_phone" maxlength="11" placeholder="请输入手机号">
            </div>
            <!-- <div class="reg-input mt20"> -->
            <div class="pwd-input">
                <i class="pwd-ico"></i>
                <input type="password" name="lg_pass" id="lg_password" placeholder="请输入登录密码">
            </div>

            <div class="reg-text">
                <label class="auto-login">
                    <!-- <input type="checkbox"> 下次自动登陆 -->
                </label>
                <a href="javascript:" class="fr" id="btn_forget">老用户设置密码/忘记密码</a>
            </div>
            <!--start 获取图片验证码-->
            <div class="code-input hide">
                <input type="text" class="send-codeInput" maxlength="4" placeholder="输入图片验证码" name="lg_verify" id="lg_verify">
                <span class="send-img fr">
                    <img src="" name="lg_verify_img"/>
                </span>
            </div>
            <div class="reg-text pass-change-verifyCode hide">
                <a href="javascript:;" class="fr" id="lg_change_verify">看不清，换一个</a>
            </div>
            <!--end-->
            <!--登录按钮-->
            <div class="login-btn">
                <input type="submit" value="登录" class="btn btn-large" id="doLoginPassword">
            </div>
            <!--没有账号注册-->
            <div class="reg-text reg-go">
                还没有账号？<a href="javascript:" id="btn_register">去注册</a>
            </div>
        </form>
        <!--end-->
        <!--start 手机号登录-->
        <form action="#" class="login-phone hide">
            <!--密码出错出现提示，去掉hide类即可显示-->
            <!-- <div class="error-area" id="login_error" style="display:none;"> -->
            <div class="error-area" id="login_error_phone" style="display:none;">
                <span class="lg_error_msg" id="lg_error_msg_phone">
                    <i class="error-area-ico"></i>
                    使用手机号码直接登录
                </span>
            </div>
            <div class="reg-input">
                <i class="tel-ico"></i>
                <input type="text" name="lg_phone2" id="lg_phone2" maxlength="11" placeholder="请输入手机号">
            </div>
            <div class="code-input">
                <input type="text" class="send-codeInput" placeholder="动态密码" name="lg_code" id="lg_code">
                <span class="fr get-dynamic-pass hide" data-btn="get_code_n"></span>
                <a href="javascript:" class="fr get-dynamic-pass" id="lg_get_code" data-btn="get_code_y">
                    获取动态密码
                </a>
            </div>
            <!--start 获取图片验证码-->
            <div class="code-input">
                <input type="text" class="send-codeInput" maxlength="4" placeholder="输入图片验证码" name="lg_verify2" id="lg_verify2">
                <span class="send-img fr">
                    <img src="" name="lg_verify_img2"/>
                </span>
            </div>
            <div class="reg-text pass-change-verifyCode hide">
                <a href="javascript:;" class="fr lg_change_verify2" id="lg_change_verify2">看不清，换一个</a>
            </div>
            <!--end-->
            <div class="login-btn">
                <input type="submit" value="登录" class="btn btn-large" id="doLogin">
            </div>
        </form>
        <!--end-->
    </div>
    <!--end-->
    <!--start 注册-->
    <div class="login-pop c-pop w250 hide" id="win_register">
        <form>
            <div class="error-area" id="login_error" style="display:none;">
                <span class="lg_error_msg">
                    <i class="error-area-ico"></i>
                    使用手机号注册
                </span>
            </div>
            <div class="reg-input">
                <i class="tel-ico"></i>
                <input type="text" name="re_phone" id="re_phone" maxlength="11" placeholder="请输入手机号">
            </div>
            <div class="pwd-input">
                <i class="pwd-ico"></i>
                <input type="password" name="re_pass" id="re_password" placeholder="请输入密码">
            </div>
            <div class="code-input">
                <input type="text" class="send-codeInput" placeholder="动态密码" name="re_code" id="re_code">
                <span class="fr get-dynamic-pass hide" data-btn="get_code_n"></span>
                <a href="javascript:" class="fr get-dynamic-pass" id="re_get_code" data-btn="get_code_y">获取动态密码</a>
            </div>

            <!--start 获取图片验证码, 分别给外层div增加hide类可隐藏 -->
            <div class="code-input">
                <input type="text" class="send-codeInput" maxlength="4" placeholder="输入图片验证码" name="re_verify" id="re_verify">
                <!-- <span class="fr"> -->
                <span class="send-img fr">
                    <img src="" name="re_verify_img"/>
                </span>
            </div>
            <div class="reg-text pass-change-verifyCode hide">
                <a href="javascript:;" class="fr re_change_verify" id="re_change_verify">看不清，换一个</a>
            </div>
            <!--end-->
            <div class="login-btn">
                <input type="submit" value="注册" class="btn btn-large" id="doRegister">
            </div>
            <!--注册协议-->
            <div class="reg-text reg-go fc-gray">
                注册表示同意<a href="//www.doumi.com/agreement/" target="_blank">《斗米协议》</a>
            </div>
            <!--已账号去登录-->
            <div class="reg-text reg-go">
                已有斗米帐号？<a href="javascript:" id="btn_login">去登录</a>
            </div>
        </form>
    </div>
    <!--end-->
    <!--start 忘记密码-->
    <div class="login-pop c-pop w250 hide" id="win_forget">
        <!-- <form> -->
        <form class="forgot-pwd">
            <div class="error-area" id="login_error" style="display:none;">
                    <span class="lg_error_msg">
                        <i class="error-area-ico"></i>
                        使用手机号找回密码
                    </span>
            </div>
            <div class="reg-input">
                <i class="tel-ico"></i>
                <input type="text" name="fg_phone" id="fg_phone" maxlength="11" placeholder="请输入手机号">
            </div>
            <div class="pwd-input">
                <i class="pwd-ico"></i>
                <input type="password" name="fg_pass" id="fg_password" placeholder="请输入新密码">
            </div>
            <div class="code-input">
                <input type="text" class="send-codeInput" placeholder="动态密码" name="fg_code" id="fg_code">
                <span class="fr get-dynamic-pass hide" data-btn="get_code_n"></span>
                <a href="javascript:" class="fr get-dynamic-pass" id="fg_get_code" data-btn="get_code_y">
                    获取动态密码</a>
            </div>
            <!--start 获取图片验证码, 分别给外层div增加hide类可隐藏 -->
            <div class="code-input hide">
                <input type="text" class="send-codeInput" maxlength="4" placeholder="输入图片验证码" name="fg_verify" id="fg_verify">
                <span class="send-img fr">
                    <img src="" name="fg_verify_img"/>
                </span>
            </div>
            <div class="reg-text pass-change-verifyCode hide">
                <a href="javascript:;" class="fr fg_change_verify" id="fg_change_verify">看不清，换一个</a>
            </div>
            <!--end-->
            <div class="login-btn">
                <input type="submit" value="重置密码" class="btn btn-large" id="doForget">
            </div>
        </form>
    </div>
    <!--end-->
    <!--登录成功-->
    <div class="c-pop w250 win_success hide" id="win_success">
        <div class="c-pop-txt success success_tag">成功</div>
        <div class="c-pop-btn">
            <button class="btn" id="btn_success" type="button">确认</button>
        </div>
    </div>
    <!-- download app start -->
    <div class="c-pop win_download w250 hide" id="win_download">
        <div class="c-pop-img"><img src="//sta.doumistatic.com/src/image/qrcode_doumi_app.png" alt="" id="win_download_img"></div>
        <div class="c-pop-txt fc-gray">
            <p>下载斗米APP，</p>
            <p>点击菜单“我的”-“我的简历”中查看</p>
        </div>
        <div class="c-pop-btn">
            <button class="btn btn_download" type="button">我知道了</button>
        </div>
    </div>
    <!-- download app end -->
</div>
<!--footer !-->
<script type="text/javascript">
    var panel = '';
    var step = 60;
    var downLoad ='';
    GJ.use('js/util/modal/modal.js, js/util/modal/modal.css, js/util/ui_compatible/placeholder.js', function(Modal){
        $("#h_phone-qrcode").mouseover(function(){
            $("#h_qrcode").show();
            return true;
        }).mouseout(function(){
            $("#h_qrcode").hide();
            return true;
        });

        // do login
        panel = new Modal({
            $triggerEl:$('.jz_lg'),
            title   : '登录',
            content : $('#content_3'),
            mask : 'true',
            width:440,
            height: 420
        });

        //do download
        downLoad = new Modal({
            $triggerEl:$('.menu-info'),
            title   : '下载APP',
            content : $('#content_3'),
            mask : 'true',
            width:410,
            height: 300
        });


        $('.js-modal-title').css('text-align', 'center');

        $('.menu-info').live('click', function() {
            $('.js-modal-title').text('下载APP');
            $('.login-pop').hide();
            $('.win_download').show();
            $('.js-modal').addClass('modal-app');

            $('.btn_download').live('click', function(){
                $('.js-modal').removeClass('modal-app');
                $('.js-modal').removeClass('js-show');
                $('.js-modal-mask').removeClass('js-show');
                $('.win_download').hide();
            });

            $('.js-modal-close').live('click', function(){
                $('.js-modal').removeClass('modal-app');
                $('.win_download').css('display', 'none');
            });
        });

        $('.jz_lg').live('click', function() {
            $('.js-modal-title').text('登录');
            $('.login-pop').hide();
            $('.win_success').hide();
            $('.login-pop:eq(3)').show();
            $('.login-pop:eq(3)').find('.login-header').find('span').removeClass('active');
            $('.login-pop:eq(3)').find('.login-header').find('span:eq(0)').addClass('active');
            if('placeholder' in document.createElement('input')){
                $('input:text').val('');
                $('input:password').val('');
            }
            clearTimeout(ctime);
            step = 60;
            $('.login-pop:eq(3)').find('form').hide();
            $('.login-pop:eq(3)').find('form:eq(0)').show();
            $('[data-btn="get_code_n"]').hide();
            $('[data-btn="get_code_y"]').show();
            $('input[name="lg_verify"]').parent().hide();
            $('input[name="lg_verify2"]').parent().hide();
            $('input[name="re_verify"]').parent().hide();
            $('input[name="fg_verify"]').parent().hide();
            $('.pass-change-verifyCode').hide();
            $('.login-pop:eq(3)').find('form:eq(0)').find('.error-area').hide();
            $('.login-pop:eq(3)').find('form:eq(1)').find('.error-area').hide();
            $('.login-pop:eq(4)').find('form:eq(0)').find('.error-area').hide();
            $('.login-pop:eq(5)').find('form:eq(0)').find('.error-area').hide();
            $('.js-modal').addClass('modal-account');
        });

        $('.jz_lgout').click(function(){
            // do cancel baoming
            $.ajax({
                'type' : 'POST',
                'url'  : '/api/v1/client/logout',
                'dataType' : 'json',
                'success' : function (json) {
                    window.location.reload();
                },
                'error' : function (err) {
                    var err = $.parseJSON(err.responseText);
                    window.alert(err.message);
                    window.location.reload();
                }
            });

        });

        $('.login-header > span').live('click', function() {
            var container = $(this).parents('.login-pop');
            var flg = $(this).attr('data-switch');
            var phoneNumber = ''; //DMC-2260 携带手机号
            if (flg == '1') {
                phoneNumber = container.find('input[name="lg_phone"]').val();
            } else {
                phoneNumber = container.find('input[name="lg_phone2"]').val();;
            }

            $(this).parent().find('span').removeClass('active');
            $(this).addClass('active');
            container.find('form').hide();
            container.find('form:eq('+flg+')').show();
            if (flg == 1) {
                $('.modal-account').removeClass('account-password account-register account-modify').addClass('account-phone');
                if ((phoneNumber.length === 11 && /^1\d{10}$/.test(phoneNumber))) {
                    container.find('input[name="lg_phone2"]').val(phoneNumber);
                }
            } else {
                $('.modal-account').removeClass('account-phone account-register account-modify').addClass('account-password');
                if ((phoneNumber.length === 11 && /^1\d{10}$/.test(phoneNumber))) {
                    container.find('input[name="lg_phone"]').val(phoneNumber);
                }
            }
        });

        $('#lg_get_code').live('click', function (){
            var container = $(this).parent().parent().parent();
            var phone = container.find('input[name="lg_phone2"]').val();
            var phonereg  = /^1\d{10}$/;
            // var iserror = (container.find(".lg_error_msg").html().replace('<i class="error-area-ico"></i>','').length != container.find(".lg_error_msg").html().length)?true:false;
            var iserror = (container.find("#lg_error_msg_phone").html().replace('<i class="error-area-ico"></i>','').length != container.find("#lg_error_msg_phone").html().length)?true:false;

            if (!phonereg.test(phone)) {
                // container.find('.error-area').show();
                container.find('#login_error_phone').show();
                // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入正确的手机号');
                container.find("#lg_error_msg_phone").html('<i class="error-area-ico"></i>请输入正确的手机号');
                return false;
            } else {
                // container.find('.error-area').hide();
                container.find('#login_error_phone').hide();
                // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>使用手机号码直接登录');
                container.find("#lg_error_msg_phone").html('<i class="error-area-ico"></i>使用手机号码直接登录');
            }
            $.ajax({
                'type' : 'POST',
                'url'  : '/api/v1/client/authCkCode/',
                'data' : {mobile:phone},
                'dataType' : 'json',
                'success' : function (json) {
                    if (json.code == 0) {
                        step = 60;
                        countDown(container);
                        // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入验证码');
                        container.find("#lg_error_msg_phone").html('<i class="error-area-ico"></i>请输入验证码');
                        container.find('input[name="lg_verify2"]').parent().hide();
                        container.find('.pass-change-verifyCode').hide();
                    } else {
                        // container.find('.error-area').show();
                        container.find('#login_error_phone').show();
                        // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+json.message);
                        container.find("#lg_error_msg_phone").html('<i class="error-area-ico"></i>'+json.message);
                    }
                },
                'error' : function (err) {
                    var err = $.parseJSON(err.responseText);
                    if (err.message && (err.code != -3 && err.code != -4)) {
                        // container.find('.error-area').show();
                        container.find('#login_error_phone').show();
                        // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+err.message);
                        container.find("#lg_error_msg_phone").html('<i class="error-area-ico"></i>'+err.message);
                    }

                    if (err.code == -3 || err.code == -4) {
                        // container.find('.error-area').show();
                        container.find('#login_error_phone').show();
                        // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入验证码');
                        container.find("#lg_error_msg_phone").html('<i class="error-area-ico"></i>请输入验证码');
                        var ishidden = container.find('img[name="lg_verify_img2"]').parent().parent().is(":hidden");
                        container.find('input[name="lg_verify2"]').parent().show();
                        if (container.find('img[name="lg_verify_img2"]').attr('src') == "" || ishidden || iserror) {
                            container.find('input[name="lg_verify2"]').val('');
                            container.find('img[name="lg_verify_img2"]').attr('src', '/api/v1/client/showCkCodeV2?rand=' + Math.random());
                        }
                        // container.find('.pass-change-verifyCode').show();
                        container.find('a[id="lg_change_verify2"]').parent().show();
                        container.find('a[id="lg_change_verify2"]').attr('is_click', '1');
                    } else {
                        //window.location.reload();
                    }
                }
            });
            return false;

        });

        $('#lg_verify').live('keyup', function() {
            var container = $(this).parents('.login-pop');
            var phone  = container.find('input[name="lg_phone"]').val();
            var verify = $(this).val();
            var phonereg  = /^1\d{10}$/;
            var verifyreg = /^\w{4}$/i;

            if(verify.length >= 4) {
                var lg_error_msg_pwd = container.find("#lg_error_msg_pwd").text();
                if (lg_error_msg_pwd == '请输入验证码' || lg_error_msg_pwd == '图片验证码错误！') {
                    container.find('#login_error_pwd').hide();
                    container.find("#lg_error_msg_pwd").html('');
                }
            }

            if (!phonereg.test(phone)) {
                return false;
            }

            if (verify.length < 4) {
                return false;
            }

            if (verify.length >= 4 && !verifyreg.test(verify)) {
                // container.find('.error-area').show();
                // container.find('form:eq(0)').find(".lg_error_msg").html('<i class="error-area-ico"></i>'+'图片验证码错误！');
                container.find('#login_error_pwd').show();
                container.find("#lg_error_msg_pwd").html('<i class="error-area-ico"></i>'+'图片验证码错误！');
                return false;
            }
        });

        $('#lg_verify2').live('keyup', function() {
            var container = $(this).parents('.login-pop');
            var phone  = container.find('input[name="lg_phone2"]').val();
            var verify = $(this).val();
            var phonereg  = /^1\d{10}$/;
            var verifyreg = /^\w{4}$/i;
            if (!phonereg.test(phone)) {
                return false;
            }
            if (verify.length < 4 || verify.length > 4) {
                return false;
            }
            if (verify.length = 4 && !verifyreg.test(verify)) {
                //container.find('input[name="lg_verify2"]').val('');
                //container.find('input[name="lg_verify2"]').blur();
                // container.find('.error-area').show();
                container.find('#login_error_phone').show();
                container.find('form:eq(1)').find(".lg_error_msg").html('<i class="error-area-ico"></i>'+'图片验证码错误！');
                return false;
            }
            $.ajax({
                'type' : 'POST',
                'url'  : '/api/v1/client/authCkCode/',
                'data' : {mobile:phone, code:verify},
                'dataType' : 'json',
                'success' : function (json) {
                    if (json.code == 0) {
                        container.find('input[name="lg_verify2"]').parent().hide();
                        container.find('.pass-change-verifyCode').hide();
                        container.find('.error-area').hide();
                        //container.find('form:eq(1)').find(".lg_error_msg").html('请输入验证码');
                        step = 60;
                        countDown(container);
                    } else {
                        // container.find('.error-area').show();
                        container.find('#login_error_phone').show();
                        container.find('form:eq(1)').find(".lg_error_msg").html('<i class="error-area-ico"></i>'+json.message);
                    }
                },
                'error' : function (err) {
                    var err = $.parseJSON(err.responseText);
                    $('.lg_change_verify2[is_click="1"]').trigger('click');
                    if (err.message) {
                        // container.find('.error-area').show();
                        container.find('#login_error_phone').show();
                        container.find('form:eq(1)').find(".lg_error_msg").html('<i class="error-area-ico"></i>'+err.message);
                    }
                    if (err.code == -3 || err.code == -4) {
                        container.find('input[name="lg_verify2"]').parent().show();
                        //container.find('input[name="lg_verify2"]').val('');
                        //container.find('input[name="lg_verify2"]').blur();
                        // container.find('.pass-change-verifyCode').show();
                        container.find('a[id="lg_change_verify2"]').parent().show();
                    } else {
                        //window.location.reload();
                    }
                }
            });
            return false;
        });

        $('#doLogin').live('click', function() {
            var container = $(this).parent().parent();
            var phone = container.find('input[name="lg_phone2"]').val();
            var code  = container.find('input[name="lg_code"]').val();
            var phonereg = /^1\d{10}$/;
            if (phone == "") {
                // container.find('.error-area').show();
                container.find('#login_error_phone').show();
                // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入手机号');
                container.find("#lg_error_msg_phone").html('<i class="error-area-ico"></i>请输入手机号');
                return false;
            }
            if (!phonereg.test(phone)) {
                // container.find('.error-area').show();
                container.find('#login_error_phone').show();
                // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入正确的手机号');
                container.find("#lg_error_msg_phone").html('<i class="error-area-ico"></i>请输入正确的手机号');
                return false;
            }
            if (code == "") {
                // container.find('.error-area').show();
                container.find('#login_error_phone').show();
                // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入验证码');
                container.find("#lg_error_msg_phone").html('<i class="error-area-ico"></i>请输入验证码');
                return false;
            }
            $.ajax({
                'type' : 'POST',
                'url'  : '/api/v1/client/login/',
                'data' : {
                    mobile:phone,
                    code:code
                },
                'dataType' : 'json',
                'success' : function (json) {
                    var nav = $('.nav').attr('data');
                    if (nav == 'index') {
                        window.location.href = $('.zhiweiCity').attr('href');
                    } else {
                        window.location.reload();
                    }
                },
                'error' : function (json) {
                    var jsonmsg = $.parseJSON(json.responseText);

                    if (-208 == jsonmsg.code) {
                        window.alert(jsonmsg.message);
                        window.location.reload();
                    } else {
                        // container.find('.error-area').show();
                        container.find('#login_error_phone').show();
                        // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+jsonmsg.message);
                        container.find("#lg_error_msg_phone").html('<i class="error-area-ico"></i>'+jsonmsg.message);
                    }
                }
            });
            return false;
        });

        $('#doLoginPassword').live('click', function() {
            var container = $(this).parent().parent();
            var phone = container.find('input[name="lg_phone"]').val();
            //if('placeholder' in document.createElement('input')){
            var password = container.find('input:password[name="lg_pass"]').val();
            //} else {
            //    var password = container.find('input:text[name="lg_pass"]').val();
            //}
            var verify   = container.find('input[name="lg_verify"]').val();
            if (verify == "输入图片验证码") {
                verify = ''
            }

            var phonereg = /^1\d{10}$/;
            var passwordreg = /^[0-9A-Za-z]{6,}$/;
            var verifyreg = /^\w{4}$/i;
            if (phone == "") {
                // container.find('.error-area').show();
                // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入手机号');
                container.find('#login_error_pwd').show();
                container.find("#lg_error_msg_pwd").html('<i class="error-area-ico"></i>请输入手机号');
                return false;
            }
            if (password == "") {
                // container.find('.error-area').show();
                // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入密码');
                container.find('#login_error_pwd').show();
                container.find("#lg_error_msg_pwd").html('<i class="error-area-ico"></i>请输入密码');
                return false;
            }
            if (!phonereg.test(phone)) {
                // container.find('.error-area').show();
                // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入正确的手机号');
                container.find('#login_error_pwd').show();
                container.find("#lg_error_msg_pwd").html('<i class="error-area-ico"></i>请输入正确的手机号');
                return false;
            }
            if (!passwordreg.test(password)) {
                // container.find('.error-area').show();
                // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入正确的密码');
                container.find('#login_error_pwd').show();
                container.find("#lg_error_msg_pwd").html('<i class="error-area-ico"></i>请输入正确的密码');
                return false;
            }
            if (verify.length == 4 && !verifyreg.test(verify)) {
                // container.find('.error-area').show();
                // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+'图片验证码错误！');
                container.find('#login_error_pwd').show();
                container.find("#lg_error_msg_pwd").html('<i class="error-area-ico"></i>'+'图片验证码错误！');
                return false;
            }
            if (!container.find('input[name="lg_verify"]').parent().is(':hidden') && verify == "") {
                // container.find('.error-area').show();
                // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+'请输入验证码');
                container.find('#login_error_pwd').show();
                container.find("#lg_error_msg_pwd").html('<i class="error-area-ico"></i>'+'请输入验证码');
                return false;
            }
            $.ajax({
                'type' : 'POST',
                'url'  : '/api/v1/client/loginwithpassword',
                'data' : {mobile:phone, password:password, code:verify},
                'dataType' : 'json',
                'success' : function (json) {                 
                    nav = $('.nav').attr('data');
                    if (nav == 'index') {
                        window.location.href = $('.zhiweiCity').attr('href');
                    } else {
                        window.location.reload();
                    }
                },
                'error' : function (json) {
                    var jsonmsg = $.parseJSON(json.responseText);
                    container.find('img[name="lg_verify_img"]').attr('src', '/api/v1/client/showCkCodeV2?rand=' + Math.random());
                    if (jsonmsg.message && jsonmsg.code != -3) {
                        // container.find('.error-area').show();
                        // container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+jsonmsg.message);
                        container.find('#login_error_pwd').show();
                        container.find("#lg_error_msg_pwd").html('<i class="error-area-ico"></i>'+jsonmsg.message);
                    }
                    if (jsonmsg.code == -3) {
                        // container.find('.error-area').show();
                        // container.find(".lg_error_msg").html('请输入验证码');
                        container.find('#login_error_pwd').show();
                        container.find("#lg_error_msg_pwd").html('<i class="error-area-ico"></i>请输入验证码');
                        $('.modal-account').removeClass('account-phone account-register account-modify').addClass('account-password');
                        container.find('input[name="lg_verify"]').parent().show();
                        container.find('input[name="lg_verify"]').val('');
                        container.find('img[name="lg_verify_img"]').attr('src', '/api/v1/client/showCkCodeV2?rand=' + Math.random());
                        // container.find('.pass-change-verifyCode').show();
                        container.find('a[id="lg_change_verify"]').parent().show();
                    } else {
                        //window.location.reload();
                    }
                }
            });
            return false;
        });

        $('#lg_change_verify').live('click', function(){
            $(this).parents('.login-pop').find('input[name="lg_verify"]').val('');
            $(this).parents('.login-pop').find('img[name="lg_verify_img"]').attr('src', '/api/v1/client/showCkCodeV2?rand=' + Math.random());
        });

        $('#lg_change_verify2').live('click', function(){
            $(this).parents('.login-pop').find('input[name="lg_verify2"]').val('');
            $(this).parents('.login-pop').find('img[name="lg_verify_img2"]').attr('src', '/api/v1/client/showCkCodeV2?rand=' + Math.random());
        });

        $('#doRegister').live('click', function(){
            var container = $(this).parents('.login-pop');
            var phone     = container.find('input[name="re_phone"]').val();
            var password = container.find('input:password[name="re_pass"]').val();          
            var code      = container.find('input[name="re_code"]').val();
            var phonereg = /^1\d{10}$/;
            var passwordreg = /^\S{6,12}$/;
            var passwordreg2= /^\d+$/;
            var passwordreg3= /^(\S)\1{5,11}$/;
            var codereg  = /^\d{6}$/;
            if (!phonereg.test(phone)) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入正确的手机号');
                return false;
            }
            if (password == "") {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入密码');
                return false;
            }
            if (password.length != password.replace(' ', '').length) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>密码不能包含空格');
                return false;
            }
            if (!passwordreg.test(password)) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入6-12位非纯数字密码');
                return false;
            }
            if (passwordreg2.test(password)) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请勿输入纯数字密码');
                return false;
            }
            if (passwordreg3.test(password)) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请勿使用单一重复字符密码');
                return false;
            }
            if (code == "") {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i  class="error-area-ico"></i>请输入验证码');
                return false;
            }
            if (!codereg.test(code)) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i  class="error-area-ico"></i>请输入正确的验证码');
                return false;
            }
            $.ajax({
                'type' : 'POST',
                'url'  : '/api/v1/client/register/',
                'data' : {
                    mobile:phone,
                    password:password,
                    code:code,
                    qr_code_type: window.PAGE_CONFIG.fromInfo.qr_code_type,
                    qr_code_invite: window.PAGE_CONFIG.fromInfo.qr_code_invite,
                    ca_campaign: ''
                },
                'dataType' : 'json',
                'success' : function (json) {   
                    nav = $('.nav').attr('data');
                    if (nav == 'index') {
                        window.location.href = $('.zhiweiCity').attr('href');
                    } else {
                        window.location.reload();
                    }
                },
                'error' : function (err) {
                    var err = $.parseJSON(err.responseText);
                    if (err.message && (err.code != -3 && err.code != -4)) {
                        container.find('.error-area').show();
                        container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+err.message);
                    }

                    if (err.code == -3 || err.code == -4) {
                        container.find('.error-area').hide();

                        container.find('input[name="re_verify"]').parent().show();
                        container.find('input[name="re_verify"]').val('');
                        container.find('img[name="re_verify_img"]').attr('src', '/api/v1/client/showCkCodeV2?rand=' + Math.random());

                        container.find('a[id="re_change_verify"]').parent().show();
                    } else {
                        //window.location.reload();
                    }
                }
            });

            return false;
        });

        $('#doForget').live('click', function(){
            var container = $(this).parents('.login-pop');
            var phone     = container.find('input[name="fg_phone"]').val();

            var password = container.find('input:password[name="fg_pass"]').val();
            
            var code      = container.find('input[name="fg_code"]').val();
            var phonereg = /^1\d{10}$/;
            var passwordreg = /^\S{6,12}$/;
            var passwordreg2= /^\d+$/;
            var passwordreg3= /^(\S)\1{5,11}$/;
            var codereg  = /^\d{6}$/;
            if (!phonereg.test(phone)) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入正确的手机号');
                return false;
            }
            if (password == "") {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入密码');
                return false;
            }
            if (password.length != password.replace(' ', '').length) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>密码不能包含空格');
                return false;
            }
            if (!passwordreg.test(password)) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入6-12位非纯数字密码');
                return false;
            }
            if (passwordreg2.test(password)) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请勿输入纯数字密码');
                return false;
            }
            if (passwordreg3.test(password)) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请勿使用单一重复字符密码');
                return false;
            }
            if (code == "") {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i  class="error-area-ico"></i>请输入验证码');
                return false;
            }
            if (!codereg.test(code)) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i  class="error-area-ico"></i>请输入正确的验证码');
                return false;
            }
            $.ajax({
                'type' : 'POST',
                'url'  : '/api/v1/client/forget/',
                'data' : {mobile:phone, password:password, code:code, autologin: 1},
                'dataType' : 'json',
                'success' : function (json) {
                    if (json.code == 1) {
                        container.parent().find('.login-pop').hide();

                        $('.win_success').show();
                        $('.win_success').find('.success_tag').text('恭喜，重置密码成功');
                        $('.win_success').find('.btn').text('直接登录');

                        $('.js-modal-close').live('click', function(){
                            // window.location.reload();
                            nav = $('.nav').attr('data');
                            if (nav == 'index') {
                                window.location.href = $('.zhiweiCity').attr('href');
                            } else {
                                window.location.reload();
                            }
                        });
                    } else {
                        container.parent().find('.login-pop').hide();

                        $('.win_success').show();
                        // $('.win_success').find('.success').text(json.message);
                        $('.win_success').find('.success_tag').text('恭喜，重置密码成功');
                        $('.win_success').find('.btn').text('直接登录');

                        $('.js-modal-close').live('click', function(){
                            // window.location.reload();
                            nav = $('.nav').attr('data');
                            if (nav == 'index') {
                                window.location.href = $('.zhiweiCity').attr('href');
                            } else {
                                window.location.reload();
                            }
                        });
                    }
                },
                'error' : function (err) {
                    var err = $.parseJSON(err.responseText);
                    if (err.message && (err.code != -3 && err.code != -4)) {
                        container.find('.error-area').show();
                        container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+err.message);
                    }

                    if (err.code == -3 || err.code == -4) {
                        //container.find(".lg_error_msg").html('请输入验证码');
                        container.find('.error-area').hide();
                        container.find('input[name="fg_verify"]').parent().show();
                        container.find('input[name="fg_verify"]').val('');
                        container.find('img[name="fg_verify_img"]').attr('src', '/api/v1/client/showCkCodeV2?rand=' + Math.random());
                        // container.find('.pass-change-verifyCode').show();
                        container.find('a[id="fg_change_verify"]').parent().show();
                    }
                }
            });

            return false;
        });

        $('#btn_success').live('click', function(){
            nav = $('.nav').attr('data');
            if (nav == 'index') {
                window.location.href = $('.zhiweiCity').attr('href');
            } else {
                window.location.reload();
            }
        });

        $('#btn_register').live('click', function(){
            $('.modal-account').removeClass('account-phone account-password account-modify').addClass('account-register');
            var container = $(this).parents('.login-pop').parent();
            var phoneNumber = container.find('input[name="lg_phone"]').val(); //DMC-2260
            container.find('.login-pop').hide();
            $('.js-modal-title').text('注册');
            container.find('.login-pop[id="win_register"]').show();
            if ((phoneNumber.length === 11 && /^1\d{10}$/.test(phoneNumber))) {
                container.find('input[name="re_phone"]').val(phoneNumber); //DMC-2260
            }

        });

        $('#btn_forget').live('click', function(){
            $('.modal-account').removeClass('account-phone account-register account-password').addClass('account-modify');
            var container = $(this).parents('.login-pop').parent();
            var phoneNumber = container.find('input[name="lg_phone"]').val(); //DMC-2260
            container.find('.login-pop').hide();
            $('.js-modal-title').text('忘记密码');
            container.find('.login-pop[id="win_forget"]').show();
            if ((phoneNumber.length === 11 && /^1\d{10}$/.test(phoneNumber))) {
                container.find('input[name="fg_phone"]').val(phoneNumber); //DMC-2260
            }

        });

        $('#btn_login').live('click', function(){
            $('.modal-account').removeClass('account-phone account-register account-modify').addClass('account-password');
            var container = $(this).parents('.login-pop').parent();
            container.find('.login-pop').hide();
            $('.js-modal-title').text('登录');
            container.find('.login-pop[id="win_login"]').show();
            container.find('.login-pop[id="win_login"]').find('.login-header').find('span').removeClass('active');
            container.find('.login-pop[id="win_login"]').find('.login-header').find('span:eq(0)').addClass('active');
            container.find('.login-pop[id="win_login"]').find('form').hide();
            container.find('.login-pop[id="win_login"]').find('form:eq(0)').show();
        });

        $('#re_get_code').live('click', function (){
            var container = $(this).parents('.login-pop');
            var phone = container.find('input[name="re_phone"]').val();
            var phonereg  = /^1\d{10}$/;
            var iserror = (container.find(".lg_error_msg").html().replace('<i class="error-area-ico"></i>','').length != container.find(".lg_error_msg").html().length)?true:false;
            if (!phonereg.test(phone)) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入正确的手机号');
                return false;
            } else {
                container.find('.error-area').hide();
                container.find(".lg_error_msg").html('使用手机号注册');
            }
            $.ajax({
                'type' : 'POST',
                'url'  : '/api/v1/client/authCkCode/',
                'data' : {mobile:phone},
                'dataType' : 'json',
                'success' : function (json) {
                    if (json.code == 0) {
                        step = 60;
                        countDown(container);
                        container.find(".lg_error_msg").html('请输入验证码');
                        container.find('input[name="re_verify"]').parent().hide();
                        container.find('.pass-change-verifyCode').hide();
                    } else {
                        container.find('.error-area').show();
                        container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+json.message);
                    }
                },
                'error' : function (err) {
                    var err = $.parseJSON(err.responseText);
                    if (err.message && err.code != -3 && err.code != -4) {
                        container.find('.error-area').show();
                        container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+err.message);
                    }

                    if (err.code == -3 || err.code == -4) {
                        var ishidden = container.find('img[name="re_verify_img"]').parent().parent().is(":hidden");
                        container.find('input[name="re_verify"]').parent().show();
                        if (container.find('img[name="re_verify_img"]').attr('src') == "" || ishidden || iserror) {
                            container.find('input[name="re_verify"]').val('');
                            container.find('img[name="re_verify_img"]').attr('src', '/api/v1/client/showCkCodeV2?rand=' + Math.random());
                        }
                        // container.find('.pass-change-verifyCode').show();
                        container.find('a[id="re_change_verify"]').parent().show();
                        container.find('a[id="re_change_verify"]').attr('is_click', '1');
                    } else {
                        //window.location.reload();
                    }
                }
            });
            return false;

        });

        $('#re_verify').live('keyup', function() {
            var container = $(this).parents('.login-pop');
            var phone  = container.find('input[name="re_phone"]').val();
            var verify = $(this).val();
            var phonereg  = /^1\d{10}$/;
            var verifyreg = /^\w{4}$/i;
            if (!phonereg.test(phone)) {
                return false;
            }
            if (verify.length < 4 || verify.length > 4) {
                return false;
            }
            if (verify.length = 4 && !verifyreg.test(verify)) {
                //container.find('input[name="re_verify"]').val('');
                //container.find('input[name="re_verify"]').blur();
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+'图片验证码错误！');
                return false;
            }
            $.ajax({
                'type' : 'POST',
                'url'  : '/api/v1/client/authCkCode/',
                'data' : {mobile:phone, code:verify},
                'dataType' : 'json',
                'success' : function (json) {
                    if (json.code == 0) {
                        container.find('input[name="re_verify"]').parent().hide();
                        container.find('.pass-change-verifyCode').hide();
                        container.find(".lg_error_msg").html('请输入验证码');
                        step = 60;
                        countDown(container);
                    } else {
                        container.find('.error-area').show();
                        container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+json.message);
                    }
                },
                'error' : function (err) {
                    var err = $.parseJSON(err.responseText);
                    $('.re_change_verify[is_click="1"]').trigger('click');
                    if (err.message) {
                        container.find('.error-area').show();
                        container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+err.message);
                    }

                    if (err.code == -3 || err.code == -4) {
                        container.find('input[name="re_verify"]').parent().show();
                        //container.find('input[name="re_verify"]').val('');
                        //container.find('input[name="re_verify"]').blur();
                        // container.find('.pass-change-verifyCode').show();
                        container.find('a[id="re_change_verify"]').parent().show();
                    } else {
                        //window.location.reload();
                    }
                }
            });
            return false;
        });

        $('#re_change_verify').live('click', function(){
            $(this).parents('.login-pop').find(".error-area").hide();
            $(this).parents('.login-pop').find(".lg_error_msg").html('');
            $(this).parents('.login-pop').find('input[name="re_verify"]').val('');
            $(this).parents('.login-pop').find('img[name="re_verify_img"]').attr('src', '/api/v1/client/showCkCodeV2?rand=' + Math.random());
        });

        $('#fg_get_code').live('click', function (){
            var container = $(this).parents('.login-pop');
            var phone = container.find('input[name="fg_phone"]').val();
            var phonereg  = /^1\d{10}$/;
            var iserror = (container.find(".lg_error_msg").html().replace('<i class="error-area-ico"></i>','').length != container.find(".lg_error_msg").html().length)?true:false;
            if (!phonereg.test(phone)) {
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入正确的手机号');
                return false;
            } else {
                container.find('.error-area').hide();
                container.find(".lg_error_msg").html('使用手机号找回密码');
            }
            $.ajax({
                'type' : 'POST',
                'url'  : '/api/v1/client/authCkCode/',
                'data' : {mobile:phone},
                'dataType' : 'json',
                'success' : function (json) {
                    if (json.code == 0) {
                        step = 60;
                        countDown(container);
                        container.find(".lg_error_msg").html('<i class="error-area-ico"></i>请输入验证码');
                        container.find('input[name="fg_verify"]').parent().hide();
                        container.find('.pass-change-verifyCode').hide();
                    } else {
                        container.find('.error-area').show();
                        container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+json.message);
                    }
                },
                'error' : function (err) {
                    var err = $.parseJSON(err.responseText);
                    if (err.message && err.code != -3 && err.code != -4) {
                        container.find('.error-area').show();
                        container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+err.message);
                    }

                    if (err.code == -3 || err.code == -4) {
                        var ishidden = container.find('img[name="fg_verify_img"]').parent().parent().is(":hidden");
                        container.find('input[name="fg_verify"]').parent().show();
                        if (container.find('img[name="fg_verify_img"]').attr('src') == "" || ishidden || iserror) {
                            container.find('input[name="fg_verify"]').val('');
                            container.find('img[name="fg_verify_img"]').attr('src', '/api/v1/client/showCkCodeV2?rand=' + Math.random());
                        }
                        // container.find('.pass-change-verifyCode').show();
                        container.find('a[id="fg_change_verify"]').parent().show();
                        container.find('a[id="fg_change_verify"]').attr('is_click', '1');
                    } else {
                        //window.location.reload();
                    }
                }
            });
            return false;

        });

        $('#fg_verify').live('keyup', function() {
            var container = $(this).parents('.login-pop');
            var phone  = container.find('input[name="fg_phone"]').val();
            var verify = $(this).val();
            var phonereg  = /^1\d{10}$/;
            var verifyreg = /^\w{4}$/i;
            if (!phonereg.test(phone)) {
                return false;
            }
            if (verify.length < 4 || verify.length > 4) {
                return false;
            }
            if (verify.length = 4 && !verifyreg.test(verify)) {
                //container.find('input[name="fg_verify"]').val('');
                //container.find('input[name="fg_verify"]').blur();
                container.find('.error-area').show();
                container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+'图片验证码错误！');
                return false;
            }
            $.ajax({
                'type' : 'POST',
                'url'  : '/api/v1/client/authCkCode/',
                'data' : {mobile:phone, code:verify},
                'dataType' : 'json',
                'success' : function (json) {
                    if (json.code == 0) {
                        container.find('input[name="fg_verify"]').parent().hide();
                        container.find('.pass-change-verifyCode').hide();
                        container.find(".lg_error_msg").html('请输入验证码');
                        step = 60;
                        countDown(container);
                    } else {
                        container.find('.error-area').show();
                        container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+json.message);
                    }
                },
                'error' : function (err) {
                    var err = $.parseJSON(err.responseText);
                    $('.fg_change_verify[is_click="1"]').trigger('click');
                    if (err.message) {
                        container.find('.error-area').show();
                        container.find(".lg_error_msg").html('<i class="error-area-ico"></i>'+err.message);
                    }

                    if (err.code == -3 || err.code == -4) {
                        container.find('input[name="fg_verify"]').parent().show();
                        //container.find('input[name="fg_verify"]').val('');
                        //container.find('input[name="fg_verify"]').blur();

                        // container.find('.pass-change-verifyCode').show();
                        container.find('a[id="fg_change_verify"]').parent().show();
                    } else {
                        //window.location.reload();
                    }
                }
            });
            return false;
        });

        $('#fg_change_verify').live('click', function(){
            $(this).parents('.login-pop').find(".error-area").hide();
            $(this).parents('.login-pop').find(".lg_error_msg").html('');
            $(this).parents('.login-pop').find('input[name="fg_verify"]').val('');
            $(this).parents('.login-pop').find('img[name="fg_verify_img"]').attr('src', '/api/v1/client/showCkCodeV2?rand=' + Math.random());
        });

        var ctime = null;
        function countDown(obj) {
            if (step == 0) {
                obj.find('.get-dynamic-pass[data-btn="get_code_n"]').hide();
                obj.find('.get-dynamic-pass[data-btn="get_code_y"]').show();
                step = 60;
            } else {
                obj.find('.get-dynamic-pass[data-btn="get_code_n"]').show();
                obj.find('.get-dynamic-pass[data-btn="get_code_y"]').hide();
                obj.find('.get-dynamic-pass[data-btn="get_code_n"]').html(step+'秒后重试');
                step--;
                ctime = setTimeout(function(){countDown(obj)}, 1000);
            }
        };
    });
    GJ.use('app/common/widget/widget.js', function(widget) {
        widget.initWidgets();

        $('.dropdown').hover(function() {
            $(this).addClass('active');
        }, function() {
            $(this).removeClass('active');
        });
    });
</script>
<script type="text/javascript">
    var SPEED_RENDER_END = new Date().getTime();
    window.PAGE_CONFIG = {"logTracker":{"dmch":"\/jianzhi\/index@city=huaian"},"fromInfo":{"ca_source":"sem_baidu_pz","ca_platform":1,"qr_code_type":null,"qr_code_invite":null},"icityDomainPage":"bj"} || {};
    GJ.use('app/ms_v2/zhiyou/index.js', function(Page){
        Page.run();
    });
</script>

<script>
    var _hmt = _hmt || [];
    (function() {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?5ce0ad453d8e97ccbaafe0027ce9e106";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>

</body>
</html>
