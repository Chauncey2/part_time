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
                    <!--<li class="pub-list-item">-->
                    <!--<a href="https://vip.doumi.com/employer/task/pubitems" class="pub_area" dmbalog="/jianzhi/vip/managecenter@atype=click@ca_source=pc@ca_from=publish_tg"><i class="pub-pop-ico2 pub_area"></i>斗米特工</a>-->
                    <!--</li>-->
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
    <script type="text/javascript">
        GJ.use('jquery,panel', function(){
            $(".pub_post_class1").click(function(){
                var isLimit=false;
                $.ajax({
                    url: 'https://vip.doumi.com/employer/post/ajaxCheckPubLimit',
                    type: "GET",
                    dataType: "json",
                    async:false,
                    success: function (result) {
                        if(result.error < 0) {
                            isLimit = true;
                            alert(result.message);
                        }else{
                            return true;
                        }
                    }
                });
                if(isLimit){
                    return false;
                }
            });


            $(".pub-area ").mouseover(function () {
                $(".pub-list").show();    //如果元素为隐藏,则将它显现
            });

            $(".pub-area").mouseleave(function () {
                $(".pub-list").hide();    //如果元素为显现,则将其隐藏
            });

            $(".pub_group_list > .group-tit").bind('click',function(e){
                if($(this).parents(".pub-list-group").find('.group-list').is(':hidden')){
                    $(this).parents(".pub-list-group").find('.group-list').show();
                    $(this).parents(".pub-list-group").addClass('active');
                }else{
                    $(this).parents(".pub-list-group").find('.group-list').hide();
                    $(this).parents(".pub-list-group").removeClass('active');
                }
            });

            /*$(".pub_group_list").bind('mouseleave',function(){
             $(this).find('.group-list').hide();
             });*/

            //获取时间戳
            var dateStr2TimeStamp = function(str) {
                var date = new Date(str);
                return date.getTime()/1000;
            };
//获取今天的时间戳
            var getTodayTime = function() {
                var date = new Date();
                return date.getTime()/1000;
            };


//判断是不是IE浏览器
            var isIE = function() {
                if (!!window.ActiveXObject || "ActiveXObject" in window ) {
                    return true
                }
                return false;
            };

//展示panel
            var panel = null;
            var showPanel = function(remoteUrl, title, width, height, oScrollTop, params, showCallBack) {
                var oldScrollPosY = oScrollTop || 0;
                var params = params || {};
                if ( !panel ) {
                    panel = GJ.panel({
                        title : title, url : remoteUrl, iframe : true,
                        style : 'text', width : width, height : height,
                        mask : true, paramsForChild : params,
                        onClose : function() {
                            if (oldScrollPosY && isIE()) {
                                $("html,body").animate({scrollTop:oScrollTop}, 1);
                            }
                        },
                        onShow : function(){
                            if(showCallBack){
                                showCallBack();
                            }
                        }
                    });
                } else {
                    panel.config.url=remoteUrl;
                    panel.setTitle(title);
                    panel.config.width=width;
                    panel.config.height=height;
                    panel.show();
                }
            }
//Url跳转
            var urlGo = function(url){
                window.location.href= url;
            };
//强制提醒并跳转
            var forceJump = function(txt, url) {
                GJ.alert({
                    title : '提醒', iframe : true, style : 'text', content: txt,
                    width : 400, height : 200,
                    onClose : function(){
                        if (url) {
                            urlGo(url);
                        }

                    }
                });
            };

            var spamConfig = {
                'jz_post.title' : 'title',
                'jz_post.city_id' : 'city_id',
                'jz_post.job_type' : 'job_type',
                'jz_post.hire_number' : 'hire_number',
                'jz_post.salary' : 'salary',
                'jz_post.payment_remark' : 'payment_remark',
                'jz_post.date_start_0' : 'date_start',
                'jz_post_worktime.worktime_start' : 'worktimejson',
                'jz_post_address.address_0' : 'workaddrjson',
                'jz_post_address.address_1' : 'intviewaddrjson',
                'jz_post_description.description' :'job_description',
                'jz_post.contact_person' : 'contact_person',
                'jz_post.consulting_no_1':'consulting_number',
                'jz_post.consulting_no_4' : 'consulting_number',
                'jz_post.contact_phone' : 'contact_phone',
                'jz_post.work_weekday' : 'work_weekday',
                //'jz_post.salary_unit' : 'salary_type',
            }

//点击提交按钮时敏感词过滤

            var checkSpamUrl = 'https://vip.doumi.com/employer/post/postspamsfilternew?type=submit';
            var checkPostPubSubmitSpamKeyword = function(callback){
                var formAllVal = $('#form_id').serializeArray();
                var ret = false;
                $.ajax({
                    async: false,
                    url: checkSpamUrl,
                    type: "POST",
                    data:formAllVal,
                    dataType: "json",
                    success: function (result) {
                        if ( result.error != -1 ) {
                            ret = true;
                            return;
                        }
                        $.each(result.hitfield, function(n, theField){
                            if (spamConfig[theField]) {
                                GJ.validator(spamConfig[theField]).setValid(false).displayError(result.message).scrollToTop();                             
                                console.log('spam:' +spamConfig[theField]);
                            }
                        });
                    }
                });
                return ret;
            };
            ;
            $('#pubBtn').click(function(){
                //alert(2);
                $.post("https://vip.doumi.com/linggong/checkCanPub", {time:7, _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'}, function(data){
                    if ( data.code < 0 && data.url != '') {
                        forceJump(data.msg, data.url)
                    } else if (data.code < 0 && data.url == '') {
                        forceJump(data.msg, "https://vip.doumi.com/managecenter");
                    } else if( data.code == 0) {
                        urlGo(data.url);
                    }
                }, 'json');
            });
            $(document).ready(function() {
                $.ajax({
                    url: 'https://vip.doumi.com/employer/post/statistics',
                    data: {_token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'},
                    type: "POST",
                    dataType: "json",
                    success: function (result) {
                        for(var i in result){
                            var data = result[i];
                            for (var j in data) {
                                $('#'+i+' .'+j).text(data[j] || 0);
                            }
                        }
                    }
                });
            });
        });
    </script>
    <div class="main">
        <!--公共header-->
        <script type="text/javascript">
            GJ.use('jquery,js/util/webuploader/webuploader.vip.js', function(){

                var MAX_IMAGE_SIZE = 3*1024*1024;

                $('.id-aside, .company-logo').mouseenter(function(e){
                    $(e.currentTarget).find('.logo-hover').show();
                }).mouseleave(function(){
                    $(this).find('.logo-hover').hide();
                });
                $('.legend-item').mouseenter(function(e){
                    $(e.currentTarget).find('.upload-ico').show();
                }).mouseleave(function(){
                    if ( $(this).find('img').attr('src') != '') {
                        $(this).find('.upload-ico').hide();
                    }

                });

                //上传成功通用执行函数
                var commonSucFunCallBack = function(file, res){
                    if ( res.code == 0) {
                        $(file.pick).find('img').attr('src', res.data.fullUrl);
                        $(file.pick).find('i').removeClass('loading');
                        $(file.pick).find('span').hide();
                        $(file.pick).find('.fail').hide();
                    } else {
                        $(file.pick).append('<span class="fail">上传失败重新上传</span>');
                    }
                };

                //首页图片保存到服务器
                var saveIndexCompanyLogo = function(imgUrl) {
                    var url = "https://vip.doumi.com/ajaxuploadcompanylogo";
                    $.ajax({
                        url: url,
                        type: "POST",
                        dataType: "json",
                        data: {'image_src' :imgUrl},
                        success: function (result) {
                            window.alert(result.msg);
                        },
                        error: function (result) {
                            window.alert('服务器超时')
                        },
                        beforeSend : function(xhr) {
                            xhr.setRequestHeader("X-CSRF-TOKEN", 'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb');
                        }

                    });
                };

                //上传中通用执行函数
                var commonProgressFunCallBack = function(file, percent){
                    $(file.pick).find('i').addClass('loading');
                }

                var uploadConfig = {
                    CompanyLogo : { //公司资料页面
                        pick : '.company-logo',
                        Success : function(file, res) {
                            $('#logoImgUrl').attr('src', res.data.fullUrl);
                            $('input[name=logo]').val(res.data.url);
                            $('#loadingId').removeClass('loading');
                        },
                        Progress : function(file, percent){
                            $('#loadingId').addClass('loading');
                        }
                    },
                    Licence : { //公司资质认证
                        pick : '#licenceId',
                        Success : function(file, res) {
                            commonSucFunCallBack(file, res);
                            $('input[name=licence]').val(res.data.url);
                        },
                        Progress : function(file, percent) {
                            commonProgressFunCallBack(file, percent);
                        }
                    },
                    Other : { //公司资质认证
                        pick : '#otherId',
                        Success : function(file, res) {
                            commonSucFunCallBack(file, res);
                            $('input[name=other]').val(res.data.url);
                        },
                        Progress : function(file, percent) {
                            commonProgressFunCallBack(file, percent);
                        }
                    },
                    Other2 : { //公司资质认证
                        pick : '#other2Id',
                        Success : function(file, res) {
                            commonSucFunCallBack(file, res);
                            $('input[name=other2]').val(res.data.url);
                        },
                        Progress : function(file, percent) {
                            commonProgressFunCallBack(file, percent);
                        }
                    },
                    IdFront : { //个人资质认证
                        pick : '#idfrontId',
                        Success : function(file, res) {
                            commonSucFunCallBack(file, res);
                            $('input[name=idfront]').val(res.data.url);
                        }
                    },
                    IdBack : { //个人资质认证
                        pick : '#idbackId',
                        Success : function(file, res) {
                            commonSucFunCallBack(file, res);
                            $('input[name=idback]').val(res.data.url);
                        }
                    },
                    Jobcerti : { //个人资质认证
                        pick : '#jobcertiId',
                        Success : function(file, res) {
                            commonSucFunCallBack(file, res);
                            $('input[name=jobcerti]').val(res.data.url);
                        }
                    },
                    Workcard : { //个人资质认证
                        pick : '#workcardId',
                        Success : function(file, res) {
                            commonSucFunCallBack(file, res);
                            $('input[name=workcard]').val(res.data.url);
                        }
                    },
                    IndexLogo : { //首页公司logo
                        pick : '#companyLogoId',
                        Success : function(file, res) {
                            commonSucFunCallBack(file, res);
                            //$('input[name=workcard]').val(res.data.url);
                            saveIndexCompanyLogo(res.data.url);
                        }
                    },
                    PostLogo : { //职位编辑
                        pick : '#postLogoId',
                        Success : function(file, res) {
                            commonSucFunCallBack(file, res);
                            $(file.pick).find('input[name=logo]').val(res.data.url);
                        }
                    },
                    AppPostQCode : { //职位编辑
                        pick : '#appPostQcode',
                        Success : function(file, res) {
                            if ( res.code == 0 ) {
                                $('input[name=desc_image]').val(res.data.url);
                                $('#descImg').attr('src', res.data.fullUrl);
                                $(file.pick).hide();
                                $('#descImgDiv').removeClass('error');
                                $('#descImgDiv').find('ui-upload-txt').text('');
                            } else {
                                $('#descImgDiv').addClass('error');
                                $('#descImgDiv').find('ui-upload-txt').text('上传出错，请重试');
                            }

                        }
                    },
                    lessonImages : { //课程图片上传
                        pick : '#lesson_images_div',
                        Success : function(file, res) {
                            $('#lesson_images_img').attr('src', res.data.fullUrl);
                            $('input[name=lesson_images]').val(res.data.url);
                            $('#loadingImagesId').removeClass('loading');
                            $('.hover-images').hide();
                            $('.jz-info-tips-lesson_images').html('<span class="validatorMsg validatorValid"> </span>');
                        },
                        Progress : function(file, percent){
                            $('#loadingImagesId').addClass('loading');
                        }
                    },
                    lessonPosters : { //课程海报上传
                        pick : '#lesson_posters_div',
                        compress : false,
                        Success : function(file, res) {
                            $('#lesson_posters_img').attr('src', res.data.fullUrl);
                            $('input[name=lesson_posters]').val(res.data.url);
                            $('#loadingPostersId').removeClass('loading');
                            $('.hover-posters').hide();
                        },
                        Progress : function(file, percent){
                            $('#loadingPostersId').addClass('loading');
                        }
                    },
                    teacherPhoto : { //教师头像上传
                        pick : '#photo_div',
                        Success : function(file, res) {
                            $('#photo_img').attr('src', res.data.fullUrl);
                            $('input[name=photo]').val(res.data.url);
                            $('#loadingId').removeClass('loading');
                            $('.logo-hover').hide();
                        },
                        Progress : function(file, percent){
                            $('#loadingId').addClass('loading');
                        }
                    }
                };

                //绑定上传控件
                for(var type in uploadConfig) {
                    if ( $(uploadConfig[type].pick).length > 0 ) {

                        //上传中事件
                        if ( !!!uploadConfig[type].Progress ) {
                            uploadConfig[type].Progress = function(file, percent) {
                                commonProgressFunCallBack(file, percent);
                            };
                        }
                        //上传之前的检查
                        if ( !!!uploadConfig[type].BeforeFileQueued ) {
                            uploadConfig[type].BeforeFileQueued = function(file) {
                                if ( file.size > MAX_IMAGE_SIZE ) {
                                    alert('图片太大，请上传小于3M大小的图片');
                                    $(this).cancelFile(file);
                                    return false;
                                }
                                return true;
                            };
                        }
                        //上传之前的检查
                        if ( !!!uploadConfig[type].Error ) {
                            uploadConfig[type].Error = function(file, res) {
                                $(file.pick).append('<span class="fail">上传失败重新上传</span>');
                            };
                        }
                        GJ.VipUploader.create(uploadConfig[type]);
                    }
                }
            });
        </script>

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

<script>
    GJ.use('jquery', function(){
        $(".imbar_panel").click(function (){
            window.open('https://vip.doumi.com/im/index?buid=13348554');
        });
    });
</script><!--页面ev,pv-->
<script>
    var SPEED_RENDER_END = new Date().getTime();
    window.PAGE_CONFIG = {"blogTracker":{"dmbch":"/jianzhi/vip/managecenter"},"fromInfo":{"from":""}} || {};
    GJ.use('blog_tracker', function(){
        setTimeout(function(){
            GJ.BLogTracker.trackPageView();
            GJ.BLogTracker.bindAllTrackEvent();
        }, 0);
    });
</script>
<!--用户踢出-->
<script>
    var currentRoute = "index";
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

<script type="text/javascript" src="/js/zeroclipboard/ZeroClipboard.min.js"></script>
<script type="text/javascript">
    GJ.use('jquery,panel', function(){

        //获取时间戳
        var dateStr2TimeStamp = function(str) {
            var date = new Date(str);
            return date.getTime()/1000;
        };
//获取今天的时间戳
        var getTodayTime = function() {
            var date = new Date();
            return date.getTime()/1000;
        };


//判断是不是IE浏览器
        var isIE = function() {
            if (!!window.ActiveXObject || "ActiveXObject" in window ) {
                return true
            }
            return false;
        };

//展示panel
        var panel = null;
        var showPanel = function(remoteUrl, title, width, height, oScrollTop, params, showCallBack) {
            var oldScrollPosY = oScrollTop || 0;
            var params = params || {};
            if ( !panel ) {
                panel = GJ.panel({
                    title : title, url : remoteUrl, iframe : true,
                    style : 'text', width : width, height : height,
                    mask : true, paramsForChild : params,
                    onClose : function() {
                        if (oldScrollPosY && isIE()) {
                            $("html,body").animate({scrollTop:oScrollTop}, 1);
                        }
                    },
                    onShow : function(){
                        if(showCallBack){
                            showCallBack();
                        }
                    }
                });
            } else {
                panel.config.url=remoteUrl;
                panel.setTitle(title);
                panel.config.width=width;
                panel.config.height=height;
                panel.show();
            }
        }
//Url跳转
        var urlGo = function(url){
            window.location.href= url;
        };
//强制提醒并跳转
        var forceJump = function(txt, url) {
            GJ.alert({
                title : '提醒', iframe : true, style : 'text', content: txt,
                width : 400, height : 200,
                onClose : function(){
                    if (url) {
                        urlGo(url);
                    }

                }
            });
        };

        var spamConfig = {
            'jz_post.title' : 'title',
            'jz_post.city_id' : 'city_id',
            'jz_post.job_type' : 'job_type',
            'jz_post.hire_number' : 'hire_number',
            'jz_post.salary' : 'salary',
            'jz_post.payment_remark' : 'payment_remark',
            'jz_post.date_start_0' : 'date_start',
            'jz_post_worktime.worktime_start' : 'worktimejson',
            'jz_post_address.address_0' : 'workaddrjson',
            'jz_post_address.address_1' : 'intviewaddrjson',
            'jz_post_description.description' :'job_description',
            'jz_post.contact_person' : 'contact_person',
            'jz_post.consulting_no_1':'consulting_number',
            'jz_post.consulting_no_4' : 'consulting_number',
            'jz_post.contact_phone' : 'contact_phone',
            'jz_post.work_weekday' : 'work_weekday',
            //'jz_post.salary_unit' : 'salary_type',
        }

//点击提交按钮时敏感词过滤

        var checkSpamUrl = 'https://vip.doumi.com/employer/post/postspamsfilternew?type=submit';
        var checkPostPubSubmitSpamKeyword = function(callback){
            var formAllVal = $('#form_id').serializeArray();
            var ret = false;
            $.ajax({
                async: false,
                url: checkSpamUrl,
                type: "POST",
                data:formAllVal,
                dataType: "json",
                success: function (result) {
                    if ( result.error != -1 ) {
                        ret = true;
                        return;
                    }
                    $.each(result.hitfield, function(n, theField){
                        if (spamConfig[theField]) {
                            GJ.validator(spamConfig[theField]).setValid(false).displayError(result.message).scrollToTop();
                            <!-- GJ.validator(spamConfig[theField]).setValid(false).displayError(result.hitfieldMsg[theField] || result.message).scrollToTop(); -->
                            console.log('spam:' +spamConfig[theField]);
                        }
                    });
                }
            });
            return ret;
        };
        //url群
        //铂金管理
        var urlEmptyAdvList = "https://vip.doumi.com/platinum/emptylist";
        var urlOnlineSuc = "https://vip.doumi.com/platinum/onlinesuccess";
        var urlOnlineFail = "https://vip.doumi.com/platinum/onlinefail";
        var urlSelPos = "https://vip.doumi.com/platinum/seladv";
        var urliIsAdv2MaxChangeTimes = "https://vip.doumi.com/platinum/isadvchange2maxtimes";
        var urlShouldPostShowEditTip = "https://vip.doumi.com/platinum/shouldeditshowtip";
        //
        var urlUpgradeTip = "https://vip.doumi.com/linggong/upgradetip";

        //职位管理
        var urlOfflineTip = "https://vip.doumi.com/postmanage/offlinetipadv";
        var urlRefreshSucPage = "https://vip.doumi.com/postmanage/refreshsucpage";
        var urlRefreshFailPage = "https://vip.doumi.com/postmanage/refreshfailpage";
        var urlPostOffline = "https://vip.doumi.com/postmanage/offline";
        var urlEditPostTip = "https://vip.doumi.com/postmanage/edittipadv";

        var urlToRefresh = "https://vip.doumi.com/adv/tofresh";

        //推广成功
        var onlineSuccess = function(postid) {
            showPanel(urlOnlineSuc+'?post_id='+postid, '发布成功', 780, 380);
        };

        //推广失败
        var onlineFailed = function(msg, errType) {
            var errTypeTmp = errType || 'error';
            var params = 'msg=' + msg + '&errType=' + errTypeTmp;
            showPanel(urlOnlineFail+'?' + params, '发布失败', 500, 200);
        };

        //展示结束招聘提示
        var offlineTip = function(postid) {
            showPanel(urlOfflineTip, '提示', 500, 200);
            //取消 or 确定
            panel.iframeObj.setHandlerForChild('setCommentText',function(obj){
                if (obj.act) {
                    offlinePost(postid);
                }
            });
        };

        //刷新成功
        var refreshSuccess = function(resRefreshTimes) {
            showPanel(urlRefreshSucPage + '?' + 'resTime='+resRefreshTimes, '刷新展位', 450, 200);
        };

        //刷新失败
        var refressFailed = function(type, msg) {
            var params = '?type=' + type + '&msg=' + msg;
            showPanel(urlRefreshFailPage + params, '刷新展位', 450, 200);
        };

        //刷新输入验证码
        var toRefresh = function(id, type) {
            var params = '?id=' + id + '&type=' + type;
            showPanel(urlToRefresh + params, '刷新', 500, 230);
            /*panel.iframeObj.setHandlerForChild('setCommentText',function(obj){
             if (obj.code == 0) {
             refreshSuccess(obj.resTime);
             }
             });*/
        };

        //refressImageCode(196, 'gold')

        //判断展位是不是到最大更换次数
        var from = "postlist";
        var isAdvChange2MaxTimes = function(postid, sucCallback) {
            $.ajax({
                type  : 'POST',
                url: urliIsAdv2MaxChangeTimes,
                data: {
                    post_id: postid,
                    from : from,
                    _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'
                },
                dataType: 'json'
            }).done(function(json) {
                sucCallback && sucCallback(json);
            })
        };

        //判断编辑职位需不需要展示提示
        var shouldPostShowEditTip = function(postid, sucCallback) {
            $.ajax({
                type  : 'POST',
                url: urlShouldPostShowEditTip,
                data: {
                    post_id: postid,
                    _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'
                },
                dataType: 'json'
            }).done(function(json) {
                sucCallback && sucCallback(json);
            })
        };

        //编辑职位提示
        var editPostTip = function(editUrl) {
            showPanel(urlEditPostTip, '提示', 500, 200);
            //取消 or 确定
            panel.iframeObj.setHandlerForChild('setCommentText',function(obj){
                if (obj.act) {
                    urlGo(editUrl);
                }
            });
        };

        //职位下线
        var offlinePost = function(postid){
            $.ajax({
                type  : 'POST',
                url: urlPostOffline,
                data: {
                    post_id: postid,
                    _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'
                },
                dataType: 'json'
            }).done(function(json) {
                window.location.reload();
            })
        };

        //更多操作
        $('.optbtnMore').mouseover(function(){
            $(this).addClass('active');
        }).mouseout(function(){
            $(this).removeClass('active');
        });

        //编辑职位提示
        $('.editpost').click(function(){
            var postid = $(this).data('pid');
            var adtypes = $(this).data('adtypes');

            if (adtypes != 2 ) {
                return true;
            }
            var editUrl = $(this).find('a').attr('href');
            shouldPostShowEditTip(postid, function(data){
                if (data.code == 0 ) {
                    urlGo(editUrl);
                } else if(data.code == -3) {
                    editPostTip(editUrl);
                } else {
                    window.location.reload();
                }
            });
            return false;
        });

        $(".optbtn").live('click', function (e){
            var $target = $(e.currentTarget);
            var pid = $target.attr('data-pid');
            var lstatus = $target.attr('data-lstatus');
            changePostStatus(pid, lstatus, e);
        });

        function changePostStatus(pid, lstatus, e){
            var ajaxUrl = '/ajax/open/';
            var $target = $(e.currentTarget);
            var $tag = '';//按钮显示文案
            var $but = '';//按钮提示文案
            var $em_txt = '';//招聘状态
            var $em_css = '';//招聘样式
            if (parseInt(lstatus, 10) === 5 || parseInt(lstatus, 10) === 3) {
                ajaxUrl = '/ajax/close/';
                lstatus = -5;
                $tag = '暂停报名';
                $but = '开启报名';
                $em_txt  = '报名已暂停';
                $em_css  = 'fc-70';
            } else {
                lstatus = 5;
                $tag = '开启报名';
                $but = '暂停报名';
                $em_txt = '招聘中';
                $em_css = 'fc-fa';
            }
            $.ajax({
                type  : 'POST',
                url: ajaxUrl,
                data: {
                    id: pid,
                    citydomain : 'bj',
                    _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'
                },
                dataType: 'json'
            }).done(function(json) {
                if(json.code === 0){
                    $target.find('a').html($but);
                    /*$('#em-'+pid).attr('class',$em_css);
                     $('#em-'+pid).html($em_txt);
                     $target.attr('data-lstatus', lstatus);
                     if(lstatus == 5){
                     $('#refresh_span_'+pid).show();
                     }else{
                     $('#refresh_span_'+pid).hide();
                     }*/
                    window.alert($tag +  '成功');
                }else{
                    window.alert(json.msg);
                }
                window.location.reload();
            }).fail(function() {
                window.alert('操作失败,请刷新页面重试');
            });
        }

        $('.offline').click(function(){
            var postid = $(this).data('pid');
            isAdvChange2MaxTimes(postid, function(data){
                if (data.code == 0 ) {
                    offlinePost(postid);
                } else if(data.code == -4) {
                    offlineTip(postid);
                }
            });
        });

        $(document).ready(function(){
            $(".optbtnMore").each(function(){
                var len = $(this).find("li").length;
                if (len <= 0) {
                    $(this).remove();
                }
            });

            $(".bList-item-bot").each(function(){
                var len1 = $(this).children(".bList-item-opBtn").children().length;
                var len2 = $(this).children(".bList-item-opLink").children().length;
                if (len1 <= 0 && len2 <= 0) {
                    $(this).remove();
                }
            });
        });
        $(".refresh_post").click( function () {
            if($(this).parent().hasClass('no_refresh')){
                return false;
            }

            var pid = $(this).data('pid');
            var refresh_type = 'gold';
            if($(this).data('refresh_type') == 13){
                refresh_type = 'wangcaibao';
            }

            toRefresh(pid, refresh_type);

            
        });

        $(".show_amount").mouseover(function (){
            $(this).children(".slow_amount").show();
        });

        $(".show_amount").mouseout(function (){
            $(this).children(".slow_amount").hide();
        });
        $('.cancel_pass, .cancel-pass').click(function(){
            $('.fake-pop-end').hide();
            $('.fake-pop-add').hide();
            $('.fake-pop-pen').hide();
            $('.cpa_cpupon_list').hide();
            $('.mask').hide();
        });

        $(".refresh_post").mouseover(function (){
            var pid = $(this).data('pid');
            $('.refresh_post_hover_'+pid).show();
        });

        $(".refresh_post").mouseout(function (){
            var pid = $(this).data('pid');
            $('.refresh_post_hover_'+pid).hide();
        });

        //购买名额
        $(".post_add_enter").live('click', function(e){
            var $target = $(e.currentTarget);
            var num = $target.attr('data-num');
            var pid = $target.attr('post-id');
            $("#post_add_input").attr('post-id', pid);
            $("#post_add_input").attr('num', num);
            $("#post_max_num").html('(最多还可以获取' + num*2 + '人报名)');
            $('.fake-pop-add').show();
            $('.mask').show();
            //获取下金钱
            getAddMoney(pid);
        });

        function getAddMoney(pid){
            var input = $("#post_add_input").val();
            var num = $("#post_add_input").attr('num');
            var p = /^\+?[1-9][0-9]*$/;
            if(!p.test(input)){
                return false;
            }
            if(input > (num*2)){
                $("#post_max_num").html('<span class="validatorMsg validatorError">报名人数不可超过' + num*2 + '</span>');
                buyNum = false;
                return false;
            }
            $("#post_max_num").html('(最多还可以获取' + num*2 + '人报名)');
            $.ajax({
                type  : 'POST',
                url: '/employer/post/ajaxbuyDepositNumber',
                data: {
                    id: pid,
                    num: input,
                    _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'
                },
                dataType: 'json'
            }).done(function(json) {
                if(json.code === 0){
                    $("#how_much").html(json.data);
                    buyNum = true;
                }else{
                    $("#post_max_num").html('<span class="validatorMsg validatorError">报名人数不可超过' + num*2 + '</span>');
                    buyNum = false;
                }
            }).fail(function() {
                $("#how_much").html('-');
            });
        }

        var buyNum = false;
        //购买名额-金钱验证
        $("#post_add_input").keyup(function (e) {
            var input = $(this).val();
            var num = $("#post_add_input").attr('num');
            var $target = $(e.currentTarget);
            var pid = $target.attr('post-id');
            var p = /^\+?[1-9][0-9]*$/;
            if( input == 0 || !input ){
                $("#how_much").html("0");
                buyNum = false;
                return false;
            }
            if(!p.test(input)){
                $("#post_max_num").html('<span class="validatorMsg validatorError">请输入正确的购买人数</span>');
                buyNum = false;
                return false;
            }
            if(input > (num*2)){
                $("#post_max_num").html('<span class="validatorMsg validatorError">报名人数不可超过' + num*2 + '</span>');
                buyNum = false;
                return false;
            }
            $("#post_max_num").html('(最多还可以获取' + num*2 + '人报名)');
            var num = $("#post_add_input").attr('num')

            $.ajax({
                type  : 'POST',
                url: '/employer/post/ajaxbuyDepositNumber',
                data: {
                    id: pid,
                    num: input,
                    _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'
                },
                dataType: 'json'
            }).done(function(json) {
                if(json.code === 0){
                    $("#how_much").html(json.data);
                    buyNum = true;
                }else{
                    $("#post_max_num").html('<span class="validatorMsg validatorError">' +json.msg+ '</span>');
                    buyNum = false;
                }
            }).fail(function() {
                $("#how_much").html('-');
            });
        });
        //提交
        $("#post_add").live('click', function(e){
            if( false == buyNum ){
                return false;
            }
            var input = $("#post_add_input").val();
            var pid   = $("#post_add_input").attr('post-id');
            var p = /^[0-9]+$/;
            if(!p.test(input)){
                $("#post_max_num").html('<span class="validatorMsg validatorError">请输入正确的购买人数</span>');
                return false;
            }
            $.ajax({
                type  : 'POST',
                url: '/employer/post/ajaxdoBuyDepositNumber',
                data: {
                    postId: pid,
                    hireNum: input,
                    _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'
                },
                dataType: 'json'
            }).done(function(json) {
                if(json.code === 0){
                    window.location.href = "https://vip.doumi.com/linggong/repay/" + json.data;
                }else{
                    $("#post_max_num").html('<span class="validatorMsg validatorError">' +json.msg+ '</span>');
                }
            }).fail(function() {
                $("#post_max_num").html('<span class="validatorMsg validatorError">操作失败，请刷新页面重试</span>');
            });
        });

        //保证金扣减明细
        $("#deposit_info").live('click', function(e){
            var $target = $(e.currentTarget);
            var pid = $target.attr('data-id');
            $.ajax({
                type  : 'POST',
                url: '/employer/post/ajaxRefundDeposit',
                data: {
                    id: pid,
                    _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'
                },
                dataType: 'json'
            }).done(function(json) {
                if(json.code === 0){
                    $("#deposit_pen").html(json.pen);
                    $("#deposit_total").html(json.total);
                    $("#deposit_refund").html(json.refund);
                    $('.fake-pop-pen').show();
                    $('.mask').show();
                }else{
                    window.alert(json.msg);
                }
            }).fail(function() {
                window.alert('操作失败,请刷新页面重试');
            });
        });

        $(".optbtnStop").live('click', function (e){
            var $target = $(e.currentTarget);
            var pid = $target.attr('data-pid');
            var ad_types = $target.attr('ad_types');
            if (ad_types == 12 || ad_types == 1) {
                GJ.panel({
                    title : '结束招聘'
                    ,url : 'https://vip.doumi.com/employer/post/endinvite/' + pid
                    ,iframe : true
                    ,style : 'text'
                    ,width : 450
                    ,mask : true
                    ,height : 220
                    ,onClose : function(){
                    }
                });
                return false;
            }
            if(ad_types == 0 || ad_types == 3){
                //普通帖子打开二次确认对话框
                createNormalPostConfirmBox(pid);
                return false;
            }
            var lstatus = $target.attr('data-lstatus');
            var ajaxUrl = '/ajax/stop/';
            var $target = $(e.currentTarget);
            var $tag = '';//按钮显示文案
            lstatus = 5;
            $tag = '停止报名';
            $.ajax({
                type  : 'POST',
                url: ajaxUrl,
                data: {
                    id: pid,
                    citydomain : 'bj',
                    _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'
                },
                dataType: 'json'
            }).done(function(json) {
                window.alert(json.msg);
                location.reload();
            }).fail(function() {
                window.alert('操作失败,请刷新页面重试');
            });
        });

        /**
         * 生成普通帖子的二次确认对话框
         */
        function createNormalPostConfirmBox(pid) {
            var confirmBoxTpl  ='<div class="box" role="confirm_offline_box" style="display: none;top:30%;' +
                    'position: fixed;width: 500px;margin:auto;left:0;' +
                    'right:0;background-color: #fff;border: solid 1px ' +
                    '#ddd;z-index:3000002"> <h2 class="pop-hd-v3"> ' +
                    '<span class="close">×</span> <div>结束招聘</div> </h2> ' +
                    '<div class="content"> <div class="superform-pop" ' +
                    'style="padding: 30px"> <div class=""> <div class="f14 fc-70">' +
                    '是否确认结束该职位招聘?</div> <div class="f14 fc-99 mt10">' +
                    '结束招聘后求职者无法再看到这个职位。</div> </div> ' +
                    '<div class="btn-group txtR"> <input type="button" ' +
                    'data-pid="'+pid+'" class="btn-yellow l-btn"' +
                    ' value="确定"> <input type="button" class="btn-gray l-btn ml-20" ' +
                    'value="取消"> </div> </div> </div> </div>';

            $("<div class='lpn_mask'></div>").css({left:0,top:0,position:'fixed',zIndex:3000001}).appendTo('body').show();
            $(confirmBoxTpl).appendTo('body').show();
            var confirmBox = $('div[role=confirm_offline_box]');
            confirmBox.find('span.close,input.btn-gray').click(function () {
                $("div[role=confirm_offline_box],.lpn_mask").remove();
            });
            confirmBox.find('input.btn-yellow').click(function () {
                $("div[role=confirm_offline_box],.lpn_mask").remove();
                $.ajax({
                    type  : 'POST',
                    url: '/ajax/stop/',
                    data: {
                        id: pid,
                        citydomain : 'bj',
                        _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'
                    },
                    dataType: 'json'
                }).done(function(json) {
                    window.alert(json.msg);
                    location.reload();
                }).fail(function() {
                    window.alert('操作失败,请刷新页面重试');
                });
            });
        }

        $(".share-ico").live('click', function (e){
            $(this).parent().toggleClass('share-ico-hover');
        });

        $(document).click(function(e) {
            var target = $(e.target);
            if(target.closest(".share-ico").length == 0){
                $('.share-ico-wrap').removeClass('share-ico-hover');
            }
        });

        $(".quickSharebtn").live('click', function (e){
            var postId = $(this).data('pid');
            var type   = $(this).data('type');
            var status   = $(this).data('status');
            var url    = 'https://vip.doumi.com/employer/post/quickshare/' + postId + '?status=' + status;
            var width  = 800;
            var height = 680;
            var panel  = '';
            if('待审核' == type || '审核拒绝' == type){
                width  = 430;
                height = 190;
            }
            panel  = GJ.panel({
                title : '快速分享职位'
                ,url : url
                ,mask :true
                ,iframe : true
                ,style : 'text'
                ,width : width
                ,height : height
                ,onClose : function(){
                }
            });
        });


        $("#widthdraw-button").live('click', function (e){
            if(0 >= 10){
                alert('每日仅限提现 10 次');
                return false;
            }
            if(0 >= 10000){
                alert('单日提现限额10000 元，请明天再来');
                return false;
            }
            var url    = 'https://vip.doumi.com/employer/wallet/withdraw/index';
            var width  = 500;
            var height = 460;
            var panel  = '';
            panel  = GJ.panel({
                title : '余额提现'
                ,url : url
                ,iframe : true
                ,style : 'text'
                ,width : width
                ,mask : true
                ,height : height
                ,onClose : function(){
                }
            });
        });

        $('.restrict_hover').live('mouseover',function(e){
            $(this).find('.min-b-doubt-box').show();
        });
        $('.restrict_hover').live('mouseout',function(e){
            $(this).find('.min-b-doubt-box').hide();
        });

        var client = new ZeroClipboard( $('.share-copy-link') );
        client.on( 'ready', function(event) {
            client.on( 'copy', function(event) {
                var link = $(event.target).attr('link');
                event.clipboardData.setData('text/plain', link);
                alert('复制成功');
            } );
            client.on( 'error', function(event) {
                ZeroClipboard.destroy();
            });
        });



        //上展位推广
        $('.put_online').click(function(){
            var currentPostId = $(this).data('pid');
            showPanel(urlSelPos+'/'+currentPostId, '发布职位', 700,450);
            //上展位推广返回
            panel.iframeObj.setHandlerForChild('setCommentText',function(obj){
                panel.close();
                if (obj.code == 0) {
                    onlineSuccess(currentPostId);
                } else if(obj.code == -3) {
                    onlineFailed(obj.msg, 'timesout');
                } else {
                    onlineFailed(obj.msg);
                }
            });
        });

        //空闲中铂金展位
        $('#emptyAdvPosId').click(function(){
            showPanel(urlEmptyAdvList, '空闲中', 500, 350);
        });

        //升级为保证金职位
        $('.upgradepost').click(function(){
            var postid = $(this).data('postid');
            if ( postid < 1 ) {
                return ;
            }
            showPanel(urlUpgradeTip+'?postid='+postid, '升级为保证金职位', 450, 420);
        })

        //加速招聘
        $(".speed_up").live('click', function (e){
            var $target = $(e.currentTarget);
            var pid = $target.attr('data-pid');
            var url = "https://vip.doumi.com/employer/post/speedup" + '/' + pid;
            showPanel(url,'付费零工',470,468);
        });

        //批量刷新
        $("#batchRefresh").live('click', function (e){
            var $target = $(e.currentTarget);
            var page_type = $target.attr('page_type');
            GJ.panel({
                title : '职位批量刷新'
                ,url : 'https://vip.doumi.com/pop/postbatchrefresh/'+page_type
                ,iframe : true
                ,style : 'text'
                ,width : 700
                ,mask : true
                ,height : 550
                ,onClose : function(){
                }
            });
        });

        $(".em_show_orders,.em_show_cities").live('mouseover', function (e){
            var $target = $(e.currentTarget);
            var offset = $target.offset();
            $('.show_box').show();
            $('.show_box').html($target.children('div').html());
            var oBW = $('.show_box').outerWidth();
            $('.show_box').css({
                "top" : offset.top + 23,
                "left": offset.left + 10,
                "margin-left": -oBW/2
            });
            //$target.children('div').show();
        });

        $(".em_show_orders,.em_show_cities").live('mouseout', function (e){
            var $target = $(e.currentTarget);
            $('.show_box').hide();
            $('.show_box').html('');
            //$target.children('div').hide();
        });

        //优选职位筛选
        $('#postStatus').change(function(){
            var postStatus = $(this).val();
            var pageType = "all";
            var url = 'https://vip.doumi.com/package/post/list?pageType=' + pageType + '&postStatus=' + postStatus;
            window.location.href = url;
        });

        // 点金职位筛选
        $('#cpaPostStatus').change(function(){
            var url = 'https://vip.doumi.com/pointgold/index?postStatus=' + $(this).val();
            window.location.href = url;
        });

        //优选职位删除前消耗套餐状态判断
        $(".del_post").live('click', function (e){
            var $target = $(e.currentTarget);
            var pid = $target.attr('data-id');
            var ad_types = $target.attr('ad_types');
            if (ad_types == 12) {
                var ajaxUrl = '/package/isexpired';
                $.ajax({
                    type  : 'POST',
                    url: ajaxUrl,
                    data: {
                        post_id: pid,
                        _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'
                    },
                    dataType: 'json'
                }).done(function(json) {
                    if (json.code == 0) {
                        //删除确认弹框
                        if (json.data == 'partExpired' || json.data == 'allNotExpired') {
                            GJ.panel({
                                title : '优选职位删除'
                                ,url : 'https://vip.doumi.com/pop/packagepostdel/' + pid + '?isExpired=' + json.data
                                ,iframe : true
                                ,style : 'text'
                                ,width : 450
                                ,mask : true
                                ,height : 220
                                ,onClose : function(){
                                }
                            });
                        } else if (json.data == 'allExpired') {
                            window.alert('该职位所消耗套餐已过期，不能进行删除操作');
                            location.reload();
                        }
                    } else {
                        window.alert(json.message);
                        location.reload();
                    }
                }).fail(function() {
                    window.alert('操作失败,请刷新页面重试');
                    location.reload();
                });
            }else{
                var pid = $(this).data('id');
                var url = "https://vip.doumi.com/employer/manage/del_post" + '/' + pid;
                showPanel(url,'删除职位',470,170);
            }
        });

        //高级刷新
        $(".refresh_post_plus").live('click', function (e){
            var pid = $(this).data('id');
            var url = "https://vip.doumi.com/employer/manage/refresh_plus" + '/' + pid;
            showPanel(url,'高级刷新',470,260);
        });

        //恢复上线
        $(".recover_online").live('click', function (e){
            var pid = $(this).data('id');
            var url = 'https://vip.doumi.com/pop/packagerecoveronline/' + pid;
            showPanel(url,'恢复上线',470,170);
        });

        //优选自动延时开关设置
        var isOnAutoRenew = false;
        $('.sCheckbox :checkbox').click(function(e){
            var that = this;
            if(isOnAutoRenew){
                $(that).is(':checked') ? $(that).prop("checked",false) : $(that).prop("checked",true);
                window.alert('你操作的太快了,请等待上次操作完成再操作');
                return false;
            }
            isOnAutoRenew = true;
            var is_auto = 0;
            if($(that).is(':checked')){
                is_auto = 1;
                $(that).prop("checked",false);
            }else{
                $(that).prop("checked",true);
            }
            var pid = $(e.currentTarget).attr('data-pid');
            var ajaxUrl = '/package/autorenew';
            $.ajax({
                type  : 'POST',
                url: ajaxUrl,
                data: {
                    post_id: pid,
                    swith_value: is_auto,
                    _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'
                },
                dataType: 'json'
            }).done(function(data) {
                isOnAutoRenew = false;
                if(data.code != 0){
                    console.log(data);
                    return false;
                }
                if(is_auto){
                    $(that).prop("checked",true);
                }else{
                    $(that).prop("checked",false);
                }
            }).fail(function() {
                isOnAutoRenew = false;
                window.alert('操作失败,请刷新页面重试');
            });
        });

        //优选自动开关延时提示
        $('.sCheckbox.disabled label').hover(function(e){
            var noticeHtml = '<em class="see-list-em">该职位未上线，不能使用该功能</em>';
            var $target = $(e.currentTarget);
            var offset = $target.offset();
            $('.show_box').html(noticeHtml);
            var oBW = $('.show_box').outerWidth();
            $('.show_box').css({
                "top" : offset.top + 23,
                "left": offset.left + 10,
                "margin-left": -oBW/2
            });
            $('.show_box').show();
        },function(e){
            var $target = $(e.currentTarget);
            $('.show_box').hide();
            $('.show_box').html('');
        });
    })
</script>

 <script type="text/javascript">
    GJ.use(['panel','jquery'],function() {
        var shangji_button = '.shangji_click_button';
        var tip_close_ico = '.sj_tip_close';
        var sj_tip_msg = '.sj_tip_msg';

        $(tip_close_ico).bind('click',function(e){
            $(sj_tip_msg).hide();
        });
        $(shangji_button).bind('click', function (e){
            var url    = 'https://vip.doumi.com/public/shangji/index';
            var width  = 500;
            var height = 630;
            var panel  = '';
            panel  = GJ.panel({
                title : '申请合作'
                ,url : url
                ,iframe : true
                ,style : 'text'
                ,width : width
                ,mask : true
                ,height : height
                ,onClose : function(){
                }
            });
        });
    });
</script>    
</body>
</html>
