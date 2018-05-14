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
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
    <title>企业管理-资质认证</title>
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
    <script type="text/javascript" src="${basePath}resources/js/util/jquery/ui/jquery.ui.core.js"></script>
    <!--<script type="text/javascript" src="//sta.doumi.com/cgi/ganji_sta.php?file=ganji,css/jianzhi/web/b/certification.cmb.css&amp;configDir=css/jianzhi/web/b&amp;documentDomain=vip.doumi.com"></script>        -->
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
<body     class="bg-f2 certification-extend"
        >
<div  class="header fixed-header" >
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
                <a href="../recruit/recruitManagement.jsp">招聘管理</a>
            </li>
            <li class="line"></li>
            <!--<li>-->
            <!--<a href="http://vip.doumi.com/saas/#/project" login='true'>用工管理</a>-->
            <!--</li>-->
            <!--<li class="line"></li>-->
            <!--<li>-->
            <!--<a href="https://vip.doumi.com/zhaopin/">外包服务</a>-->
            <!--</li>-->
            <li>
                企业管理
            </li>
        </ul>

        <div class="header-r clearfix">
            <div class="fl fc-4b h-userName">
                <span class="userName"><span>
                                    王佳薇
                                </span><i class="ar"></i></span>
                <ul class="h-userName-menu">
                    <li><a href="https://vip.doumi.com/employer/user/logout">退出</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="../js/biz/outer_b_im.js"></script>
<script type="text/javascript" src="../js/RongIMLib-2.1.3.min.js"></script>
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

        $("#h_phone-qrcode").mouseover(function(){
            $("#h_qrcode").show();
            return true;
        }).mouseout(function(){
            $("#h_qrcode").hide();
            return true;
        });
        if(window.innerHeight < 760){
            $(".phone-preview-close").addClass("pos-ab");
        }else{
            $(".phone-preview-close").removeClass("pos-ab");
        }

        var this_id = "13348554";
        //获取底部新消息和沟通职位信息的回调函数
        var imFooterNewsNum = function(newsNum,postsNum){
            if(newsNum > 99){
                newsNum = '(99<sup>+</sup>)';
            }else{
                newsNum = '('+newsNum+')';
            }
            $('.b-webim-txt > .fc-fa').html(newsNum);
        }

        //获取职位新消息回调函数
        var impostlistnewsnum = function(postid,num){
            if(num > 99){
                num = '';
                $('#news_num_'+postid).addclass("b-webim-morenum");
            }else{
                $('#news_num_'+postid).removeclass("b-webim-morenum");
            }
            $('#news_num_'+postId).html(num);
        }
        //保存postid数组
        var postids = [];
        $('.b-webim-news').each(function(){
            postids.push($(this).attr('postId'));
        });
        window.dm = {
            beApiRootPath : "//vip.doumi.com/",
            debug : true
        };
        seajs.use("/js/biz/outer_b_im.js", function(im) {
            if(!this_id){
                $('.b-webim').hide();
                return false;
            }
            im.connect(13348554, function(data) {
                imFooterNewsNum(data.totalMsgNum,data.totalJobNum);

                $.each(postids, function() {
                    if (data.msg[this]) {
                        imPostListNewsNum(this, data.msg[this]);
                        $('#news_num_'+this).css('display','block');
                    }else{
                        $('#news_num_'+this).css('display','none');
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
                <dt  class="active" ><a
                        href="bussinessManagement.jsp"><i
                        class="icon-companyInfo"></i>企业信息</a></dt>
                <dd><a  href="bussinessManagement.jsp">企业资料</a></dd>
                <dd><a  class="active"
                        href="businessAuthorize.jsp">资质认证</a></dd>
            </dl>
            <dl>
                <dt ><a
                        href="businessWallet.jsp"><i
                        class="icon-wallet"></i>企业钱包</a></dt>
            </dl>
            <dl>
                <dt ><a href="businessContract.jsp"><i
                        class="icon-hetong"></i>合同管理</a></dt>
            </dl>
        </div>
    </div>
    <div class="mod-content pub-v3 mt20">
    <div class="certification-choose">
        <h2 class="certification-choose-t">请选择认证类型</h2>
        <div class="certification-choose-con clearfix">
            <div class="certification-choose-item">
                <a class="certification-choose-wrap" id="choice_company" href="javascript:void(0)">
                    <i class="choose-area-icon icon1"></i>
                    <h3 class="choose-area-t">企业营业执照认证</h3>
                    <p class="choose-area-text">营业执照认证通过后，职位才可以<br>通过审核并向求职者展示</p>
                    <div class="choose-area-state">
                        <i class="icon-warning-blue-s"></i>
                        <span>未认证</span>
                    </div>
                </a>
            </div>
            <div class="certification-choose-item mar-space">
                <a class="certification-choose-wrap" id="choice_person" href="javascript:void(0)">
                    <i class="choose-area-icon icon2"></i>
                    <h3 class="choose-area-t">个人实名认证</h3>
                    <p class="choose-area-text">完成个人实名认证<br>获取更多报名</p>
                    <div class="choose-area-state">
                        <i class="icon-warning-blue-s"></i>
                        <span>未认证</span>
                    </div>
                </a>
            </div>
            <div class="certification-choose-item">
                <a class="certification-choose-wrap" href="https://vip.doumi.com/employer/company/othersauth">
                    <i class="choose-area-icon icon3"></i>
                    <h3 class="choose-area-t">其他资质认证</h3>
                    <p class="choose-area-text">请按提示补充所需资质<br>如代理招聘协议</p>
                </a>
            </div>
        </div>
    </div>

    <script type="text/javascript">

        var panel;
        GJ.use('jquery,panel,js/util/datepicker/datepicker.js,js/app/pub/ajax_helper.js', function () {
            $(function ($) {
                //点击公司认证
                $('#choice_company').click(function () {
                    window.location.href = 'https://vip.doumi.com/employer/company/companyauth';
                })

                //点击个人认证
                $('#choice_person').click(function () {
                    window.location.href = 'https://vip.doumi.com/employer/company/personauth';
                })

                //删除职位失败弹窗
                function delpostErrorPop(msg) {
                    var config = {
                        content: '<div class="b-pop">' +
                        '<div class="p1">' + msg + '</div>' +
                        '<div class="btn-group">' +
                        '<input type="button" class="btn-yellow l-btn" value="知道了" onclick="panel.close()">' +
                        '</div>' +
                        '</div>',
                        style: 'text',
                        mask: true,
                        width: 442,
                        title: '提示',
                        height: 200,
                    }
                    panel = GJ.panel(config);
                    panel.show()
                }

            });
        });
    </script>
</div>
</div>
</body>
</html>
