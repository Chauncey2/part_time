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
<meta name="viewport"
	content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no">
<title>发布职位-雇佣君兼职</title>
<link
	href="${basePath}resources/css/jianzhi/web/b/b_form.__1512563581__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_global.__1524650377__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_pop.__1520327087__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/b_pub.__1524650377__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/global.__1512563581__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/ui_kit.__1525771022__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/mvui-pc.__1512563581__.css"
	type="text/css" rel="stylesheet">
<link
	href="${basePath}resources/css/jianzhi/web/b/datepicker-2.__1512563581__.css"
	type="text/css" rel="stylesheet">

<!--<script type="text/javascript" src="//sta.doumi.com/cgi/ganji_sta.php?file=ganji,css/jianzhi/web/b/b_pub_v3.cmb.css&amp;css/jianzhi/web/b/datepicker-2.css&amp;configDir=css/jianzhi/web/b&amp;documentDomain=vip.doumi.com"></script>-->
<style type="text/css">
a {
	cursor: pointer;
}
</style>
<script type="text/javascript"
	src="${basePath}resources/js/mvui-pc/es5-shim.min.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/mvui-pc/es5-sham.min.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/datepicker/datepicker.js"></script>
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
	src="${basePath}resources/js/util/jquery/jquery-1.8.2.js"></script>
<script type="text/javascript"
	src="${basePath}resources/app/common/widget/widget.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/webuploader/webuploader.vip.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/webuploader/webuploader.fix.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/webuploader/webuploader.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/validator/validator-3.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/event/event_emitter.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/dragdrop/dragdrop.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/randomid/random_id.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/log_tracker/blogtracker.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/uuid/unvalid_uuids.js"></script>
<script type="text/javascript"
	src="${basePath}resources/js/util/uuid/uuid.js"></script>

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
<body class="pub">
	<div class="header">
		<div>
			<div class="jz-logo">
				<a href="#" title="雇佣君兼职"></a>
			</div>
			<div class="b-version">商家版</div>
			<ul class="nav">
				<li><a href="business_index.jsp">首页</a></li>
				<li class="line"></li>
				<li><a href="recruitManagement.jsp" login='true'>招聘管理</a></li>
				<li class="line"></li>

				<li><a href="bussinessManagement.jsp">企业管理</a>
				</li>
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
	<script type="text/javascript" src="${basePath}resources/js/biz/outer_b_im.js"></script>
	<script type="text/javascript" src="${basePath}resources/js/RongIMLib-2.1.3.min.js"></script>
	
	<!-- 等待注释 -->
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
	<div class="pub-v3 w">
		<div class="pub-info">
			<!--面包屑-->
			<div class="crumb">
				<a href="../business/bussinessManagement.html">雇佣君兼职</a>&ensp;&gt;&ensp;发布20人以下职位
			</div>
			<div class="pub-v3-con bgf">
				<!-- vip发布步骤-->
				<div class="mod-process process-v3 step3">
					<div class="mod-process-t">
						<span id="pos_placeholder"
							style="width: 0px; height: 0px; visibility: hidden; margin: 0px; padding: 0px;"></span>发布招聘20人以下职位
					</div>
				</div>

				<div class="pub-attention pub-refuse-reason">
					<div class="pub-t-v3">
						<h2>完成企业资质认证职位才可上线展示</h2>
					</div>
					<dl class="refuse-item mt5 clearfix">
						<dt>请您先完成企业资质认证，如果您是个人发帖，请先完成个人认证</dt>
						<dd>
							<a target="blank" href="#" style="text-decoration: none">&nbsp马上认证</a>
						</dd>
					</dl>
				</div>


				<div class="pub-form-v3">
					<div class="fixed-formTip" id="formTipDiv" style="display: none">
						<h3>
							<b>提示</b>
						</h3>
						<div class="fixed-formTip-con">
							展现城市、职位类型、招聘人数、职位名称发布后不可修改，请谨慎填写</div>
					</div>
					<!-- 发布信息表单 -->
					<form id="form_id" action="post.action" method="post">
						<!-- bd发布类型选择-->
						<div class="pub-area-v3">
							<div class="pub-t-v3">
								<h2>职位基本信息</h2>
							</div>
							<div class="pub-area-v3-con">

								<dl>
									<dt>
										职位名称<b>*</b>
									</dt>
									<dd>
										<div class="ui-input-wrap" id="title">
											<input type="text" class="ui-input-text"
												placeholder="6-20字以内，例如好又多超市促销员" name="Jname">
											<div class="ui-select-tip" id="jz-info-tips_title"></div>
										</div>
									</dd>
								</dl>
							</div>
						</div>

						<!--薪资与福利-->
						<div class="pub-area-v3">
							<div class="pub-t-v3">
								<h2>薪资与福利</h2>
							</div>
							<div class="pub-area-v3-con">
								<dl>
									<dt>
										薪资<b>*</b>
									</dt>
									<dd class="clearfix">
										<div class="col-5">
											<div class="ui-input-wrap">
												<input type="text" class="ui-input-text error"
													placeholder="请输入数字" name="salary" id="salary">
												<div class="ui-input-tip" id="jz-info-tips_salary"></div>
											</div>
										</div>
									</dd>
								</dl>
							</div>
						</div>
						<!--工作时间与地点-->
						<div class="pub-area-v3">
							<div class="pub-t-v3">
								<h2>工作时间与地点</h2>
							</div>
							<div class="pub-area-v3-con">
								<div class="clearfix">
									<div class="clearfix">
										<div class="clearfix">
											<div class="col-10">
												<dl class="mr-15">
													<dt>
														工作日期<b>*</b>
													</dt>

													<dd>
														<!-- 工作如期输入框 -->
														<input class="ui-input-text error" id="jobTime"
															type="date" value="2018-05-13"  name="jobTime"/> </select>
													</dd>
												</dl>
											</div>
											<div class="col-10" id="deadlineDiv">
												<dl class=" ml-15 ">
													<dt>
														工作地址<b>*</b>
													</dt>
													<dd class="clearfix">
														<!-- 工作地址输入框 -->
														<select class="ui-select form-block" name="job_type">
															<option value="0">请选择</option>
															<option value="1">清浦区</option>
															<option value="9">淮安区</option>
															<option value="11">清河区</option>
															<option value="13">楚州区</option>
														</select>
													</dd>
												</dl>
											</div>
										</div>
										<dl class="ui-addModal">
											<dt>
												详细地址<b>*</b>
											</dt>
											<dd>
												<div class="ui-input-wrap" id="title">
													<input type="text" class="ui-input-text"
														placeholder="请填写详细地址" name="address">
													<div class="ui-select-tip" id="jz-info-tips_title"></div>
												</div>
											</dd>

										</dl>
										<dl class="ui-addModal">

										</dl>
									</div>
								</div>
							</div>
						</div>


						<!----工作描述与要求---->
						<div class="pub-area-v3">
							<div class="pub-t-v3">
								<h2>工作描述与要求</h2>
							</div>
							<div class="pub-area-v3-con">
								<dl>
									<dt>
										职位描述<b>*</b>
									</dt>
									<dd>
										<div class="ui-input-wrap">
											<textarea class="ui-input-text form-block" rows="6"
												placeholder="请详细描述工作内容和职位要求，不要填写特殊符号、电话、QQ、微信、网址、公众号等信息，20—1000字以内。"
												name="job_description"></textarea>
											<div class="ui-select-tip" id="jz-info-tips_description"></div>
										</div>
									</dd>
								</dl>
							</div>


							<!--------联系方式-------->
							<div class="pub-area-v3">
								<div class="pub-t-v3">
									<h2>联系方式</h2>
								</div>
								<div class="pub-area-v3-con">
									<div class="clearfix">
										<div class="col-10">
											<dl class="mr-15">
												<dt>联系人</dt>
												<dd>
													<div class="ui-input-wrap">
														<input type="text" class="ui-input-text error"
															placeholder="请输入联系人姓名" value="" name="contact_person">
														<div class="ui-input-tip" id="jz-info-tips_contact_person"></div>
													</div>
												</dd>
											</dl>
										</div>

										<div class="col-10">
											<dl class="ml-15">
												<dt>
													联系电话<b>*</b>
												</dt>
												<dd>
													<div class="ui-input-wrap">
														<input type="text" class="ui-input-text error"
															placeholder="请输入手机号或固定电话" value="" name="contact_phone">
														<div class="ui-input-tip" id="jz-info-tips_contact_phone"></div>
													</div>
												</dd>
											</dl>
										</div>
									</div>
								</div>
							</div>
							
							<div class="pub-btn-wrap mt15">
								<input type="hidden" name="id" value="0"> <!-- <input
									type="hidden" name="pubtype" value="vip-normal"> <input
									type="hidden" name="linkAdId" value=""> <input
									type="hidden" name="clue_id" value="0"> --> <input
									type="submit" value="完成" class="pub-submit-btn" dmbalog=""
									id="pubId" />								
							</div>
							<input type="hidden" name="_token"
								value="LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb" />
								
					</form>



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
					<script type="text/javascript">
            GJ.use('jquery,js/util/validator/validator-3.js,panel', function(){
                var RegConfig = {
                    PNumber : /^[1-9]\d*$/,
                }

                function regCheck(str, regexObj)
                {
                    if(regexObj.test(str))
                        return true;
                    return false;
                }

                function pNumRegCheck(str)
                {
                    return regCheck(str, RegConfig.PNumber);
                }


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

                var checkSpamUrl = 'https://vip.doumi.com/employer/post/postspamsfilternew?type=submit&is_deposit=1';
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



                //相关变量选择器
                var cityIdSel = '#city_id'; //城市
                var hireNumSel = '#hire_number'; // 招聘人数
                var jobTypeSel = '#job_type_id'; //工作类型

                var ageStartSel = '#ageStart'; //年龄开始
                var ageEndSel = '#ageEnd'; //年龄结束
                var deadLineSel = 'input[name="deadline"]'; //截止日期
                var workDateStartSel = 'input[name="date_start"]'; //工作开始日期
                var workDateEndSel = 'input[name="date_end"]'; //工作结束日期

                var clueUrlSel = '#clueUrl'; //20以上招聘的链接

                //城市下拉框数据
                var disabledCity = false;
                var getRecommendcity= function(keyword, callback) {
                    $.post('/ajax/getRecommendcity', {keyword:keyword, _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'}, function(data) {
                        callback(data);
                    },'json')
                };

                var buildSuggestCityList = function(cityList) {
                    var html = '';
                    for(var index in cityList) {
                        html += '<li class="suggestCity" data-id="' + cityList[index].city_id + '" data-name="'+ cityList[index].short_name+'">' + cityList[index].short_name + '</li>';
                    }
                    return html;
                };

                var getCitysByProvinceId = function(provinceid, callback){
                    $.post('/ajax/getCitysByProvinceId', {provinceid:provinceid, _token:'LpwzAyNvUVKi84z9FeaYAar59nEVbHI7Olj8OHdb'}, function(data) {
                        callback(data);
                    },'json')
                };

                var hideProvinces = function(flag) {
                    var realFlag = flag ;
                    if ( realFlag ) {
                        $('#provincetab').removeClass('cur').removeClass('disabled');
                        $('#provincelist').hide();
                    } else {
                        $('#provincetab').removeClass('disabled').addClass('cur');
                        $('#provincelist').show();
                    }

                };

                var hideCitys = function(flag) {
                    var realFlag = flag ;
                    if ( realFlag ) {
                        $('#citytab').addClass('disabled').removeClass('cur');
                        $('#citylist').hide();
                    } else {
                        $('#citytab').removeClass('disabled').addClass('cur');
                        $('#citylist').show();
                    }

                }

                var buildCityList = function(cityList) {
                    var html = '';
                    var chooseCitys = 'null';
                    chooseCitys = eval('('+chooseCitys+')');
                    var filterCitys = 'null';
                    filterCitys = eval('('+filterCitys+')');
                    for(var index in cityList) {
                        if(typeof(cityList[index].name) == 'undefined'){
                            continue;
                        }
                        if( 'vip-normal' == 'vip-diamond' ){
                            /*钻石职位发布可选城市过滤*/
                            var city_id = cityList[index].id;
                            if(!filterCitys[city_id]){
                                html += '<li class="city" data-id="' + cityList[index].id + '" data-type=' + cityList[index].type + '>' + cityList[index].name + '</li>';
                            }
                        }else if( 'vip-normal' == 'package'){
                            //优选
                            var id = cityList[index].id;
                            if(!chooseCitys[id]){
                                continue;
                            }
                            html += '<li class="city" data-id="' + cityList[index].id + '" data-type=' + cityList[index].type + '>' + cityList[index].name + '</li>';
                        }else{
                            html += '<li class="city" data-id="' + cityList[index].id + '" data-type=' + cityList[index].type + '>' + cityList[index].name + '</li>';
                        }
                    }
                    return html;
                };

                var setSeleced = function(cityId, cityName){
                    $('input[name="city_id"]').val(cityId);
                    $('input[name="city_name"]').val(cityName);
                    GJ.validator("city_id").validate();
                    hideCityChooseArea(true);
                    hideCitySuggestList(true);
                };
                var hideCityChooseArea = function(flag) {
                    if(flag) {
                        $('#cityChooseArea').hide();
                    } else {
                        $('#cityChooseArea').show();
                    }
                };
                var hideCitySuggestList = function(flag) {
                    if(flag) {
                        $('#suggestCityListId').html('').hide();
                    } else {
                        $('#suggestCityListId').show();
                    }
                }

                $('#city_name').bind('input', function(){
                    var keyword = $(this).val();
                    hideCityChooseArea(true);
                    $('input[name="city_id"]').val(0);
                    getRecommendcity(keyword, function(data) {
                        //data = '[{"city_id":"14","city_name":"\u5929\u6d25\u5e02","prov_name":"\u5929\u6d25\u5e02","prov_short_name":"\u5929\u6d25","province_id":"3","short_name":"\u5929\u6d25"}]';
                        if (data && data.length > 0) {
                            $("#suggestCityListId").html(buildSuggestCityList(data));
                            hideCitySuggestList(false);
                            //hideCityChooseArea(true);
                        } else {
                            $("#suggestCityListId").html('<li class="active">暂无此城市</li>');
                            hideCitySuggestList(false);
                            //hideCityChooseArea(false);
                        }
                        console.log(data);
                    });
                });

                $('#city_name').click(function(){
                    if (disabledCity) {
                        return;
                    }
                    hideProvinces(false);
                    hideCityChooseArea(false)
                    hideCitys(true);
                    hideCitySuggestList(true);
                });
                $(document).click(function(e){
                    var theTarget = e.target;
                    if ($(theTarget).hasClass('city_id') || $(theTarget).hasClass('province') || $(theTarget).hasClass('city') || $(theTarget).hasClass('mod-choice-panel')) {
                        return;
                    }
                    hideCityChooseArea(true);
                    hideCitySuggestList(true);
                });

                $('.province').click(function(){
                    $('.province').removeClass('cur');
                    $(this).addClass('cur');
                    getCitysByProvinceId($(this).data('id'), function(citys){
                        //如果只有一个城市视为直辖市区
                        //alert(citys.length);
                        if(citys.length == 1){
                            setSeleced(citys[0].id, citys[0].name);
                        } else {
                            hideProvinces(true);
                            $('#citylist').html(buildCityList(citys));
                            hideCitys(false);
                        }


                    })
                });
                $('.city').live('click', function() {
                    $('.city').removeClass('cur');
                    $(this).addClass('cur');
                    setSeleced($(this).data('id'), $(this).text());

                });
                $('.suggestCity').live('click', function() {
                    setSeleced($(this).data('id'), $(this).data('name'));
                });


                //编辑工作时间
                var workTimeDdSel = '#workTime-list';
                var workTimeJsonSel = '#workTimeJson';
                var workTimeItemSel = '.worktime-item';
                var addWorkTimeUrl = 'https://vip.doumi.com/employer/post/worktime?act=work';
                var WORKTIME_MAX_COUNT = 50;
                var timeformat = function(time) {
                    if(time <= 9 ) {
                        return '0' + time;
                    }
                    return time;
                };
				//先JsonEncode，再urlencode一个对象
                var encodeUriAndJsonEncode = function(obj) {
                    return JSON.stringify(obj);
                };
				//先urldecode，再json解析一个对象
                var decodeUriAndJsonDecode = function(str) {
                    return JSON.parse(str);
                };
				//获取当前的工作时间json对象
                var getWorkTimeJson = function() {
                    if ($(workTimeJsonSel).val() != '') {
                        return decodeUriAndJsonDecode($(workTimeJsonSel).val());
                    }
                    return {};
                };
				//获取某一个工作时间
                var getWorkTimeByDataId = function(id){
                    var allData = getWorkTimeJson();
                    if( allData && allData[id]) {
                        return allData[id];
                    }
                    return {};
                };
				//设置工作时间json串
                var setWorkTimeJson = function(obj) {
                    return $(workTimeJsonSel).val(encodeUriAndJsonEncode(obj));
                };


				//获取已有的工作时间条数
                var getWorkTimeCount = function() {
                    return $(workTimeItemSel).size();
                }
				//生成工作时间div
                var buildWorkTimeTxt = function(data) {

                    var timeJson  = encodeUriAndJsonEncode(data);

                    console.log(data);
                    var html = '<li class="worktime-item" data-id="' + data.handle + '">';
                    html += buildDivContent(data);
                    html += '</li>';
                    return html;
                };
				//生成工作时间div内容
                var buildDivContent = function(data) {
                    var datTypeStr = '';
                    if(data.dayType == 0) {
                        datTypeStr = '白班';
                    } else {
                        datTypeStr = '夜班';
                    }
                    var showText = datTypeStr + timeformat(data.fromHour) + ':' + timeformat(data.fromMinu) + ' - ' + timeformat(data.toHour) + ':' + timeformat(data.toMinu);
                    var divContent = '<span class="ui-addModal-txt">'+showText+'</span>';
                    divContent += '<i class="icon-edit work_time_modify_class" title="编辑"></i>';
                    divContent += '<i class="icon-delete remove_time_info_class" title="删除"></i>';
                    return divContent;
                }
//添加展示的工作时间到页面上
                var addWorkTimeHtml = function(htmltxt) {
                    $('#workTime-list').prepend(htmltxt);
                }
// 更新工作时间到页面上
                var updateWorkTimeHtml = function(dataId, htmltxt) {
                    $(workTimeDdSel).find('li[data-id=' + dataId + ']').html(htmltxt);
                }
//删除页面展示的工作时间
                var delWorkTimeTxt = function(dateId) {
                    $('li[data-id='+ dateId + ']').remove();
                };
//新增加workTime
                var addWorkTimeData2InputHideData = function(obj) {
                    var currentWorkTimeJsonData = {};
                    currentWorkTimeJsonData = getWorkTimeJson();
                    var key = obj.handle;
                    currentWorkTimeJsonData[key] = obj;
                    setWorkTimeJson(currentWorkTimeJsonData);
                }
//删除workTime
                var delWorkTimeItemFromInputHideData = function(dataId) {
                    var currentWorkTimeJsonData = getWorkTimeJson() || {};
                    if ( pNumRegCheck(dataId) == true ) {
                        //若删除数据库里面存在的，标记删除
                        currentWorkTimeJsonData[dataId].action = 'del';
                    } else {
                        currentWorkTimeJsonData[dataId] = {};
                    }
                    setWorkTimeJson(currentWorkTimeJsonData);
                };

//展示添加工作时间panel
                var showAddWorkTimePanel = function(remoteUrl) {
                    var OldScrollTop = $(document).scrollTop();
                    showPanel(remoteUrl, '添加工作时间', 500, 308, OldScrollTop);
                }
//添加操作
                var panel = null;
                var scrollTopOld = $(document).scrollTop();
                $('.work_time_add_class').click( function() {

                    if(getWorkTimeCount() >= WORKTIME_MAX_COUNT) {
                        alert('您已添加5个工作工作时间，不能再添加！');
                        return false;
                    }

                    //$("html,body").animate({scrollTop:$(document).scrollTop()},1);

                    showAddWorkTimePanel(addWorkTimeUrl);

                    panel.iframeObj.setHandlerForChild('setCommentText',function(obj){
                        var htmlTxt = buildWorkTimeTxt(obj);
                        addWorkTimeHtml(htmlTxt);
                        addWorkTimeData2InputHideData(obj);
                        GJ.validator("worktimejson").validate();
                    });
                    return false;
                });

//删除工作时间操作
                $('.remove_time_info_class').live('click', function(){
                    var dataId   = $(this).parent().data('id');
                    delWorkTimeItemFromInputHideData(dataId);
                    delWorkTimeTxt(dataId);
                    GJ.validator("worktimejson").validate();
                });

//修改工作时间操作
                $('.work_time_modify_class').live('click', function(){
                    var dataId = $(this).parent().data('id');
                    var currentWorkTime = getWorkTimeByDataId(dataId);
                    console.log(currentWorkTime);
                    var updateWorkTimeUrl = 'https://vip.doumi.com/employer/post/worktime/' + dataId + '?para=' + encodeUriAndJsonEncode(currentWorkTime) + '&handle=' + dataId;
                    var scrollTopOld = $(document).scrollTop();
                    $("html,body").animate({scrollTop:scrollTopOld},1);
                    showAddWorkTimePanel(updateWorkTimeUrl);
                    panel.iframeObj.setHandlerForChild('setCommentText', function(obj){
                        var htmlTxt = buildDivContent(obj);
                        updateWorkTimeHtml(dataId, htmlTxt);
                        addWorkTimeData2InputHideData(obj);
                        GJ.validator("worktimejson").validate();
                    });
                    return false;
                });

//检查工作时间是否为空
                var isWorkTimeEmpty = function() {
                    if ( getWorkTimeCount() == 0) {
                        return true;
                    } else {
                        return false;
                    }
                };

                var checkWorkTime = function() {
                    return !isWorkTimeEmpty();
                }



                //添加工作地址
                //----常量----
                var ADDR_MAX_COUNT = 50 ; //最大的添加地址数量

//--元素选择器--【工作地址】
                var workAddrDdSel = '#workAddrList'; //工作地址的dd
                var workAddrItemSel = '.workaddr-item'; //工作地址添加的项目
                var workAddrJsonSel = '#workaddrjson';  //工作地址数据隐藏域
                var addWorkAddrBtn = '#addWorkAddrBtn'; //添加工作地址按钮
                var delWorkAddrBtn = '.delWorkAddrBtn'; //删除工作地址按钮
                var modifyWorkAddrBtn = '.modifyWorkAddrBtn'; //修改工作地址按钮

//--元素选择器--【面试地址】
                var intviewAddrDdSel = '#interviewAddrDl'; //工作地址的dd
                var intviewAddrItemSel = '.interviewaddr-item'; //工作地址添加的项目
                var intviewAddrJsonSel = '#intviewaddrjson';  //面试地址数据隐藏域
                var addIntviewAddrBtn = '#addIntviewAddrBtn'; //添加面试地址按钮
                var delIntviewAddrBtn = '.delIntviewAddrBtn'; //删除面试地址按钮
                var modifyIntviewAddrBtn = '.modifyIntviewAddrBtn'; //修改面试地址按钮

//【工作地址】 and 【面试地址】--公用函数-- --BEGIN--
                var getAddrCount = function(type) { //获取地址条数
                    var addrQueryStr = '';
                    if (type == 'work') {
                        addrQueryStr = workAddrItemSel;
                    } else if (type == 'interview') {
                        addrQueryStr = intviewAddrItemSel;
                    }
                    return $(addrQueryStr).size();
                };
//根据type【work, interview】返回json选择器
                var queryAddrJsonSelectorFromType = function(type) {
                    if (type == 'work' ) {
                        return workAddrJsonSel;
                    } else if (type == 'interview') {
                        return intviewAddrJsonSel;
                    }
                    return '';
                }
                var getAddrJson = function(type) { //获取地址的json数据
                    var addrJsonQueryStr = queryAddrJsonSelectorFromType(type);
                    if ($(addrJsonQueryStr).val()) {
                        return decodeUriAndJsonDecode($(addrJsonQueryStr).val());
                    }
                    return {};
                };

                var setAddrJson = function(type, obj) { //设置地址数据
                    var addrJsonQueryStr = queryAddrJsonSelectorFromType(type);
                    return $(addrJsonQueryStr).val(encodeUriAndJsonEncode(obj));
                };

                var addAddrData2InputHideData = function(obj, type) { //增加地址数据到json
                    var currentAddrJsonData = {};
                    currentAddrJsonData = getAddrJson(type);
                    var key = obj.handle;
                    currentAddrJsonData[key] = obj;
                    setAddrJson(type, currentAddrJsonData);
                };

                var delAddrItemFromInputHideData = function(dataId, type) { //删除地址数据
                    var currentAddrJsonData = {};
                    currentAddrJsonData = getAddrJson(type);
                    if ( pNumRegCheck(dataId) == true ) {
                        //若删除数据库里面存在的，标记删除
                        currentAddrJsonData[dataId].action = 'del';
                    } else {
                        currentAddrJsonData[dataId] = {};
                    }
                    setAddrJson(type, currentAddrJsonData);
                };

                var getAddrByDataId = function(id, type){ //获取某一个地址
                    var allData = getAddrJson(type);
                    if( allData && allData[id]) {
                        return allData[id];
                    }
                    return {};
                };

                var delAddrTxt = function(dateId) { //删除页面展示的地址
                    $('li[data-id='+ dateId + ']').remove();
                };

//【工作地址】 and 【面试地址】--公用函数-- --END--
/////////////--工作地址函数--/////////////
                var showAddWorkAddrPanel = function(remoteUrl) {  //展示添加工作地址面板
                    var OldScrollTop = $(document).scrollTop();
                    showPanel(remoteUrl, '添加工作地点', 718, 528, OldScrollTop);
                };
                var buildWorkAddrTxt = function(obj) {
                    var html = '<li class="workaddr-item" data-id="'+obj.handle+'">';

                    html += buildWorkAddrDivContent(obj.showText, obj.status);
                    html += '</li>';
                    return html;
                };
                var buildWorkAddrDivContent = function(showTxt, status) {
                    var html = '<span class="ui-addModal-txt">';
                    if(status == -1) {
                        html+='<i class="icon-warning mr10"></i>';
                    }
                    html= html+showTxt + '</span>';
                    html += '<i class="icon-edit modifyWorkAddrBtn" title="编辑"></i>';
                    html += '<i class="icon-delete delWorkAddrBtn" title="删除"></i>';
                    return html;
                }
                var addWorkAddrHtml = function(htmltxt) { //添加展示的工作地点到页面上
                    $('#workAddrList').prepend(htmltxt);
                }
                var addWorkAddrHtmlAfter = function(htmltxt) { //添加展示的工作地点到页面上
                    $('#workAddrList').append(htmltxt);
                }
                var updateWorkAddrHtml = function(dataId, htmltxt) { // 更新工作地址到页面上
                    $(workAddrDdSel).find('li[data-id=' + dataId + ']').html(htmltxt);
                }

//工作地址添加
                $(addWorkAddrBtn).click(function(){

                    if(getAddrCount('work') >= ADDR_MAX_COUNT) {
                        alert('您已添加'+ ADDR_MAX_COUNT +'个工作地点，不能再添加！');
                        return false;
                    }

                    var city_id_val = $('input[name="city_id"]').val();
                    var addWorkAddrUrl = 'https://vip.doumi.com/linggong/workaddrr?act=work&city='+city_id_val;

                    showAddWorkAddrPanel(addWorkAddrUrl);
                    panel.iframeObj.setHandlerForChild('setCommentText',function(obj){
                        var htmlTxt = buildWorkAddrTxt(obj);
                        addWorkAddrHtml(htmlTxt);
                        addAddrData2InputHideData(obj, 'work');
                        GJ.validator("workaddrjson").validate();
                    });

                    return false;
                });

                //工作地址删除
                $(delWorkAddrBtn).live('click', function() {
                    var dataId = $(this).parent().data('id');
                    delAddrItemFromInputHideData(dataId, 'work');
                    delAddrTxt(dataId);
                    GJ.validator("workaddrjson").validate();
                });

                //工作地址修改操作
                $(modifyWorkAddrBtn).live('click', function(){
                    var dataId  = $(this).parent().data('id');
                    var currentAddr = getAddrByDataId(dataId, 'work');
                    var addrUrl = 'https://vip.doumi.com/linggong/workaddrr/' + dataId + '?act=work&para=' + encodeUriAndJsonEncode(currentAddr);
                    var scrollTopOld = $(document).scrollTop();
                    $("html,body").animate({scrollTop:scrollTopOld},1);
                    showAddWorkAddrPanel(addrUrl);
                    panel.iframeObj.setHandlerForChild('setCommentText', function(obj){
                        var htmlTxt = buildWorkAddrDivContent(obj.showText);
                        updateWorkAddrHtml(dataId, htmlTxt);
                        addAddrData2InputHideData(obj, 'work');
                        GJ.validator("workaddrjson").validate();
                    });
                    return false;
                });

                /////////////--面试地址函数--/////////////
                var showAddIntviewAddrPanel = function(remoteUrl) {  //展示添加工作地址面板
                    var OldScrollTop = $(document).scrollTop();
                    showPanel(remoteUrl, '添加面试地点', 718, 528, OldScrollTop);
                };
                var buildIntviewAddrTxt = function(obj) {
                    var html = '<li class="interviewaddr-item" data-id="'+obj.handle+'">';
                    html += buildIntviewAddrDivContent(obj.showText);
                    html += '</li>';
                    return html;
                };
                var buildIntviewAddrDivContent = function(showTxt) {
                    var html = '<span class="ui-addModal-txt">'+showTxt+'</span>';
                    html += '<i class="icon-edit modifyIntviewAddrBtn" title="编辑"></i>';
                    html += '<i class="icon-delete delIntviewAddrBtn" title="删除"></i>';
                    return html;
                }

                var addIntviewAddrHtml = function(htmltxt) { //添加展示的面试地点到页面上
                    $('#interviewAddrList').prepend(htmltxt);
                }
                var updateIntviewAddrHtml = function(dataId, htmltxt) { // 更新面试地址到页面上
                    $('#interviewAddrList').find('li[data-id=' + dataId + ']').html(htmltxt);
                }

                //面试地址添加操作
                $(addIntviewAddrBtn).click(function(){

                    if(getAddrCount('interview') >= ADDR_MAX_COUNT) {
                        alert('只能添加一个面试地点');
                        return false;
                    }

                    var city_id_val = $('input[name="city_id"]').val();
                    var addIntviewAddrUrl = 'https://vip.doumi.com/linggong/workaddrr?act=work&city='+city_id_val;

                    showAddIntviewAddrPanel(addIntviewAddrUrl);
                    panel.iframeObj.setHandlerForChild('setCommentText',function(obj){
                        var htmlTxt = buildIntviewAddrTxt(obj);
                        addIntviewAddrHtml(htmlTxt);
                        addAddrData2InputHideData(obj, 'interview');
                        GJ.validator("intviewaddrjson").validate();
                    });
                    return false;
                });

//面试地址删除地址
                $(delIntviewAddrBtn).live('click', function(){
                    var dataId = $(this).parent().data('id');
                    delAddrItemFromInputHideData(dataId, 'interview');
                    delAddrTxt(dataId);
                    GJ.validator("intviewaddrjson").validate();
                });

//面试工作地址修改操作
                $(modifyIntviewAddrBtn).live('click', function(){
                    var dataId  = $(this).parent().data('id');
                    var currentAddr = getAddrByDataId(dataId, 'interview');
                    console.log(dataId);
                    var addrUrl = 'https://vip.doumi.com/linggong/workaddrr/' + dataId + '?act=work&para=' +  encodeUriAndJsonEncode(currentAddr);

                    var scrollTopOld = $(document).scrollTop();
                    $("html,body").animate({scrollTop:scrollTopOld},1);
                    showAddIntviewAddrPanel(addrUrl);
                    panel.iframeObj.setHandlerForChild('setCommentText', function(obj){
                        var htmlTxt = buildIntviewAddrDivContent(obj.showText);
                        updateIntviewAddrHtml(dataId, htmlTxt);
                        addAddrData2InputHideData(obj, 'interview');
                        GJ.validator("intviewaddrjson").validate();
                    });
                    return false;
                });

                var interviewAddrDlSel = '#interviewAddrDl'; //面试地址展示位置
                var getIsInterview = function() {
                    return $('input:radio[name="is_interview"]:checked').val();
                }
// 是否需要面试点击
                $('.is_interview').click(function () {
                    if( getIsInterview() == 1) {
                        $(interviewAddrDlSel).show();
                    }else{
                        $(interviewAddrDlSel).hide();
                    }
                });

//检查工作地址是否为空
                var isWorkAddrEmpty = function() {
                    if ( getAddrCount('work') == 0) {
                        return true;
                    } else {
                        return false;
                    }
                };
//检查面试地址是否为空
                var isInterviwAddrEmpty = function() {
                    if ( getAddrCount('interview') == 0 && getIsInterview() == 1) {
                        return true;
                    } else {
                        return false;
                    }
                };

                var checkWorkAddr = function() {
                    return !isWorkAddrEmpty()
                };

                /*var checkInterviewAddr = function() {
                    return !isInterviwAddrEmpty()
                }*/

//////////////批量添加工作地址
                $('#addMultiWorkAddrBtn').click(function(){

                    if(getAddrCount('work') >= ADDR_MAX_COUNT) {
                        alert('您已添加'+ ADDR_MAX_COUNT +'个工作地点，不能再添加！');
                        return false;
                    }

                    var city_id = $('input[name="city_id"]').val();
                    var addMultiWorkAddrUrl = '/address/addmultiaddr?city_id=' + city_id;
                    var OldScrollTop = $(document).scrollTop();
                    showPanel(addMultiWorkAddrUrl, '添加工作地点', 728, 570, OldScrollTop);
                    panel.iframeObj.setHandlerForChild('setCommentText',function(objList){
                        for(var i in objList){
                            //var htmlTxt = buildWorkAddrTxt(objList[i]);
                            //addWorkAddrHtmlAfter(htmlTxt);
                            addAddrData2InputHideData(objList[i], 'work');
                        }
                        var workAddrJsonData = getAddrJson('work');
                        console.log(workAddrJsonData);
                        var theSucAddrHtml = '';
                        var theFailAddrHtml = '';
                        for(var i in workAddrJsonData) {
                            if (workAddrJsonData[i].status && workAddrJsonData[i].status == -1) {
                                theFailAddrHtml += buildWorkAddrTxt(workAddrJsonData[i]);
                            } else if( workAddrJsonData[i].action =='del'){

                            } else if(workAddrJsonData[i].showText ) {
                                theSucAddrHtml += buildWorkAddrTxt(workAddrJsonData[i]);
                            }
                        }
                        $('#workAddrList').html('').html(theSucAddrHtml+theFailAddrHtml)

                        GJ.validator("workaddrjson").validate();
                    });
                })
                var checkWorkAddrComplete = function(){
                    var workAddrJsonData = getAddrJson('work');
                    for(var i in workAddrJsonData) {
                        if (workAddrJsonData[i].status && workAddrJsonData[i].status == -1) {
                            return false;
                        }
                    }
                    return true;
                }

                //年龄
                //大于某个年龄的置灰
                var disabledAgeGreaterThan = function(fromAge) {
                    $('#ageStart option').each(function(i, dom){
                        if ($(this).val() >= fromAge && $(this).val() != 0 && fromAge!=0) {
                            $(this).attr("disabled", true).addClass('fc-cc');
                        } else {
                            $(this).attr("disabled", false).removeClass('fc-cc');
                        }
                    });
                };

//小于某个年龄的置灰
                var disabledAgeLessThan = function(toAge) {
                    $('#ageEnd option').each(function(i, dom){
                        if ($(this).val() <= toAge && $(this).val() != 0 && toAge!=0) {
                            $(this).attr("disabled", true).addClass('fc-cc');
                        } else {
                            $(this).attr("disabled", false).removeClass('fc-cc');
                        }
                    });
                };

                if ( $(ageStartSel).val() > 0 ) {
                    disabledAgeLessThan($(ageStartSel).val());
                }
                if($(ageEndSel).val() > 0) {
                    disabledAgeGreaterThan($(ageEndSel).val());
                }

                $(ageStartSel).change(function(){
                    disabledAgeLessThan($(this).val());
                });
                $(ageEndSel).change(function(){
                    disabledAgeGreaterThan($(this).val());
                });
                //工作日期 + 报名截止日期
                //根据选择的日期类型得到他们的值
                var getWorkDateAbout = function(type) {
                    var choosenDateSel = '';
                    if (type == 'start_date') {
                        choosenDateSel = workDateStartSel;
                    } else if (type == 'end_date') {
                        choosenDateSel = workDateEndSel;
                    } else if ( type == 'deadline') {
                        choosenDateSel = deadLineSel;
                    }
                    var dateStr = $(choosenDateSel).val();
                    var timeStr = dateStr2TimeStamp(dateStr);
                    return {date:dateStr,time:timeStr};
                };

//日期 VS 今天
                var dateVsToday = function(str) {
                    var time = dateStr2TimeStamp(str);
                    if ( time + 60*60*24 < getTodayTime() ) {
                        return false;
                    }
                    return true;
                };

//开始日期 VS 结束日期
                var endDateVsStartDate = function() {
                    var startDateInfo = getWorkDateAbout('start_date');
                    var endDateInfo = getWorkDateAbout('end_date');
                    if ( startDateInfo.time > endDateInfo.time) {
                        return false;
                    }
                    return true;
                };

//截止日期 VS 工作结束日期
                var deadlineVsEndDate = function(str) {
                    var endDateInfo = getWorkDateAbout('end_date');
                    var time = dateStr2TimeStamp(str);
                    if (time > endDateInfo.time) {
                        return false;
                    }
                    return true;
                };
//截止日期 VS 工作开始日期
                var deadlineVsStartDate = function(str) {
                    var startDateInfo = getWorkDateAbout('start_date');
                    var time = dateStr2TimeStamp(str);
                    if (time < startDateInfo.time) {
                        return false;
                    }
                    return true;
                };

//截止日期 VS 工作结束日期2
                var deadlineVsEndDate2 = function() {
                    var endDateInfo = getWorkDateAbout('end_date');
                    var deadline = getWorkDateAbout('deadline');
                    if (deadline.time > endDateInfo.time) {
                        return false;
                    }
                    return true;
                };

//截止日期 - 当前的发布日期不能小于三个月    DMB-581 update 30天
                var deadlineVs1Month = function(str) {
                    var deadLineDate = new Date(str);
                    var todayDate    = new Date;
                    var diffDate     = parseInt( (deadLineDate - todayDate) / 1000 / 60 / 60 / 24 );
                    if( diffDate > 30 ){
                        return false;
                    }
                    return true;
                };

//截止日期不得早于工作开始时间
                var deadlineNowDate = function(str){
                    var startDateInfo = getWorkDateAbout('start_date');
                    var time = dateStr2TimeStamp(str);
                    if( startDateInfo.time > time ){
                        return false;
                    }
                    return true;
                }

//截止日期不得早于工作开始时间2
                var deadlineNowDate2 = function(){
                    var startDateInfo = getWorkDateAbout('start_date');
                    var deadline = getWorkDateAbout('deadline');
                    if( startDateInfo.time > deadline.time ){
                        return false;
                    }
                    return true;
                }

//工作周期不得超过30天
                var deadline1Month = function(){
                    var startDateInfo = getWorkDateAbout('start_date');
                    var endDateInfo = getWorkDateAbout('end_date');
                    if ( ( endDateInfo.time - startDateInfo.time ) > ( 86400 * 30 ) ) {
                        return false;
                    }
                    return true;
                }

                //福利点击
                //获取相同元素的值
                var collectSameEleVal = function(queryStr) {
                    var arr = [];
                    $(queryStr).each(function(i, dom){
                        if($(this).hasClass('active')){
                            arr.push($(this).data('val'));
                        }
                    });
                    return arr;
                };

//设置特殊要求的隐藏域
                var setSpecialDemandHideData = function() {
                    var specialDemandArr = collectSameEleVal('.tab_special_demand');
                    $('#tab_special_demand').val(specialDemandArr.join(','));
                };

//设置福利的隐藏域
                var setTreatmentHideData = function() {
                    var treatMentArr = collectSameEleVal('.tab_treatment');
                    $('#tab_treatment').val(treatMentArr.join(','));
                };

//特殊要求，福利点击
                $(".tab_special_demand,.tab_treatment").click(function () {
                    if($(this).hasClass('active')){
                        $(this).removeClass('active');
                    } else {
                        $(this).addClass('active');
                    }
                    if ($(this).hasClass('tab_treatment')) {
                        setTreatmentHideData();
                    } else if ($(this).hasClass('tab_special_demand')) {
                        setSpecialDemandHideData();
                    }
                });
                //咨询方式
                var consultNumSel = 'input[name="consulting_number"]';
                var getSelectConsultWay = function() {
                    return $("input[name='consult_way']:checked").val();
                };

                var getSelectConsultNumber = function() {
                    var y = $(consultNumSel).val();
                    return y;
                };
                var theOldConsultWay = getSelectConsultWay();
                $('.consultingWayLabel').click(function() {
                    $('#consultingWayTip').html($(this).text()+'<b>*</b>');
                    var consultWay = getSelectConsultWay();

                    if (consultWay == theOldConsultWay) {
                        return ;
                    }
                    theOldConsultWay =  consultWay;
                    $('input[name="consulting_number"]').val('');
                    if ( consultWay == '0') {
                        $('#consultWayId').hide();
                        return;
                    }
                    $('#consultWayId').show();
                    GJ.validator("consulting_number").displayValid();
                    if(consultWay == 2) {
                        $(consultNumSel).attr('placeholder', '请输入QQ号');
                    } else if (consultWay == 1) {
                        $(consultNumSel).attr('placeholder', '请输入个人微信号');
                    } else if(consultWay == 4) {
                        $(consultNumSel).attr('placeholder', '请输入微信公众号');
                    }
                });



                var checkQQ = function() {
                    if ( getSelectConsultWay() == '2' && !/^[0-9]{5,15}$/.test(getSelectConsultNumber())) {
                        return false;
                    }
                    return true;
                };

                var checkWx = function() {
                    if ( getSelectConsultWay() == '1' && !/^[a-zA-Z\d_-]{1,20}$/.test(getSelectConsultNumber())) {
                        return false;
                    }
                    return true;
                };

                var checkWxPubNumber = function() {
                    if ( getSelectConsultWay() == 4 && !/[\u4e00-\u9fa5_a-zA-Z0-9_-]{1,40}/.test(getSelectConsultNumber())) {
                        return false;
                    }
                    return true;
                };

                var checkConsultNumRequired = function() {
                    if ( getSelectConsultWay() != 0 && getSelectConsultNumber() == '') {
                        return false;
                    }
                    return true;
                }

                //
                var workDayId = '.workDayEdit';

                var workDayChooseUrl = 'https://vip.doumi.com/post/chooseWeekday?days=';
//var WeekDayConfig = ['星期日', '星期一', '星期二','星期三','星期四','星期五','星期六'];
                var WeekDayConfig = ['日', '一', '二','三','四','五','六'];


                var setWorkDayHideData =  function(val){
                    $('#work_weekday').val(val.join(','));
                };

                var setWorkDayShow = function(val) {
                    var arr = [];
                    var text = '';
                    for(var i in val) {
                        arr.push(WeekDayConfig[val[i]]);
                    }

                    text = '每周' + arr.join('、') + '上班'

                    $('#workDayText').text(text);
                    $('.workTime-txtArea').show();
                    $('.addWorkDay').hide();
                };


                $(workDayId).click( function(e) {
                    var theTarget = e.target;
                    var days = $('#work_weekday').val();
                    var url = workDayChooseUrl+days;
                    showPanel(url, '添加工作时间', 500, 260);

                    panel.iframeObj.setHandlerForChild('setCommentText',function(obj){
                        console.log(obj);
                        setWorkDayShow(obj);
                        setWorkDayHideData(obj);
                        GJ.validator("work_weekday").validate();
                    });
                    return false;
                });

                //发帖类型切换
                var originPubType = "vip-normal";
                $('input[name="bdPubType"]').click(function(){
                    var paramsStr = window.location.search;
                    var pubtype = $('input:radio[name="bdPubType"]:checked').val();

                    $('input[name="pubtype"]').val(pubtype);
                    if ( pubtype == originPubType ) {
                        return false;
                    }
                    $('#pubId').attr('disabled', true);
                    if( pubtype == 'bd-app') {
                        urlGo("../recurit/recruitManagement.html"+paramsStr)
                    }else if (pubtype == 'bd-normal'){
                        urlGo("https://vip.doumi.com/post/pub/bdnormal"+paramsStr)
                    } else if (pubtype == 'bd-bojin') {
                        urlGo("https://vip.doumi.com/post/pub/bdbojin"+paramsStr)
                    }
                    if( originPubType == 'bd-app' && pubtype != 'bd-app') {
                        if (pubtype == 'bd-normal'){
                            urlGo("https://vip.doumi.com/post/pub/bdnormal"+paramsStr)
                        } else if (pubtype == 'bd-bojin') {
                            urlGo("https://vip.doumi.com/post/pub/bdbojin"+paramsStr)
                        }
                    }
                    originPubType = pubtype
                    if (pubtype == 'bd-bojin') {
                        $('#tabIsPublic').hide();
                    } else if(pubtype == 'bd-normal') {
                        $('#tabIsPublic').show();
                    }

                })

                //deadline date_start
                var deadline = new Mvuipc.Calendar({
                    el: '#deadlineId',
                    start: '2018-05-11',
                    end: '2019-12-31',
                    select: '',
                    onSelected: function (date) {
                        $('input[name="deadline"]').val(date.date);
                        if($('input[name="deadline"]').length > 0) {
                            GJ.validator("deadline").validate();
                        }
                    },
                    onClick : function() {
                        workdate.hide();
                    }
                });

                var workdate = new Mvuipc.Calendarjoint({
                    el: '#workdateId',
                    start: '2018-05-11',
                    end: '2019-12-31',
                    selectStart: $('input[name="date_start"]').val(),
                    selectEnd: $('input[name="date_end"]').val(),
                    onSelected: function (startDate, endDate) {
                        $('input[name="date_start"]').val(startDate.date);
                        $('input[name="date_end"]').val(endDate.date);
                        if($('input[name="deadline"]').length > 0) {
                            GJ.validator("deadline").validate();
                        }
                        if($('input[name="date_start"]').length > 0) {
                            GJ.validator("date_start").validate();
                        }
                    },
                    onClick : function() {
                        deadline.hide();
                    }
                });

                //工作地址验证
                var withContactWayTip = '您输入内容包含电话、qq、email、网址等联系方式，请检查';

// 城市
                if($('input[name="city_id"]').length > 0) {
                    GJ.validator("city_id")
                            .setTipSpanId("jz-info-tips_city_id")
                            .setCallback(function(str){
                                return parseInt(str) > 0;
                            }, '请选择城市')
                }

//职位类型
                if($('select[name="job_type"]').length > 0) {
                    GJ.validator("job_type")
                            .setTipSpanId("jz-info-tips_job_type")
                            .setCallback(function(str){
                                return parseInt(str) > 0;
                            }, '请选择职位类型')
                }

//职位标题验证
                if($('input[name="title"]').length > 0) {
                    GJ.validator("title")
                            .setTipSpanId("jz-info-tips_title")
                            .setEmptyValue("")
                            .setRequired("请填写")
                            .setStrlenType("symbol")
                            .setLength(6, 20, "请输入6-20字")
                        //.setRegexp(/[1-9]\d{6,11}/, withContactWayTip, true)
                        //.setRegexp(/1[3456789]\d{9}$|^(0\d{2,4}-?)[2-9]\d{6,7}$|^[48]00\d?(-?\d{3,4}){2}/, withContactWayTip, true)
                        //.setRegexp(/[a-z0-9]+([._\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+/, withContactWayTip, true)
                        //.setRegexp(/([a-zA-z]+:\/\/)?([\w]+\.)+([\w]+\.)+[\w-]+(\/[\w- ./?%&=]*)?|(http|https):\/\/[^\s]*/, withContactWayTip, true)
                            .setRegexp(/✅|✔|√|♥|☆|★|█|▇|♀/, '请勿输入特殊字符', true)
                            .setRegexp(/【|】/, '请勿输入全角字符', true)
                            .setAjax("/employer/post/postspamsfilternew", "您输入的内容包含敏感词,电话、qq、email、网址，请检查");
                }


//人数
                var hireNumLimit = 20;
                if($('input[name="hire_number"]').length > 0 ) {
                    GJ.validator("hire_number")
                            .setTipSpanId("jz-info-tips_hire_number")
                            .setEmptyValue("")
                            .setRequired("请填写")
                            .setRegexp(/^[1-9]\d*$/, "请输入整数", false)
                            .setCompareValue("<=", hireNumLimit, '限'+hireNumLimit+'人以内');
                }

//薪资

                if($('input[name="salary"]').length > 0) {
                    GJ.validator("salary")
                            .setTipSpanId("jz-info-tips_salary")
                            .setEmptyValue("")
                            .setRequired("请填写")
                            .setRegexp(/^\d+(\.\d{1,2})?$/, "请填写数字，最多2位小数", false)
                            .setCompareValue("<=", "100000", "数字不能超过100000");
                }

                if($('input[name="salary_min"]').length > 0) {
                    GJ.validator("salary_min")
                            .setTipSpanId("jz-info-tips_salary_min")
                            .setCallback(
                            function(str){
                                if($('#salary_min').attr('disabled')){
                                    return true;
                                }
                                return str != "";
                            }, "请填写")
                            .setCallback(
                            function(str){
                                if($('#salary_min').attr('disabled')){
                                    return true;
                                }
                                var reg = new RegExp("^[0-9]+?$");
                                return reg.test(str);
                            }, "请填写整数")
                            .setCallback(
                            function(str){
                                if($('#salary_min').attr('disabled')){
                                    return true;
                                }
                                return parseInt(str) >= 100;
                            }, "数字不能小于100")
                            .setCallback(
                            function(str){
                                if($('#salary_min').attr('disabled')){
                                    return true;
                                }
                                return str <= 99998;
                            }, "数字不能超过99998")
                            .setCallback(
                            function(str){
                                if($('#salary_min').attr('disabled')){
                                    return true;
                                }
                                var min = parseInt($('#salary_min').val());
                                var max = parseInt($('#salary_max').val());
                                if(!min || !max){
                                    return true;
                                }
                                return min < max;
                            }, "薪资最低值不能大于或等于最高值");
                }

                if($('input[name="salary_max"]').length > 0) {
                    GJ.validator("salary_max")
                            .setTipSpanId("jz-info-tips_salary_max")
                            .setCallback(
                            function(str){
                                if($('#salary_min').attr('disabled')){
                                    return true;
                                }
                                return str != "";
                            }, "请填写")
                            .setCallback(
                            function(str){
                                if($('#salary_min').attr('disabled')){
                                    return true;
                                }
                                var reg = new RegExp("^[0-9]+?$");
                                return reg.test(str);
                            }, "请填写整数")
                            .setCallback(
                            function(str){
                                if($('#salary_max').attr('disabled')){
                                    return true;
                                }
                                return parseInt(str) >= 100;
                            }, "数字不能小于100")
                            .setCallback(
                            function(str){
                                if($('#salary_max').attr('disabled')){
                                    return true;
                                }
                                return str <= 99999;
                            }, "数字不能超过99999")
                            .setCallback(
                            function(str){
                                if($('#salary_min').attr('disabled')){
                                    return true;
                                }
                                var min = parseInt($('#salary_min').val());
                                var max = parseInt($('#salary_max').val());
                                if(!min || !max){
                                    return true;
                                }
                                return min < max;
                            }, "薪资最高值不能小于或等于最低值");
                }

//面试地址验证
                if($('input[name="salary_type"]').length > 0) {
                    GJ.validator("salary_type")
                            .setTipSpanId("jz-info-tips_salary_type")
                }


//薪资备注
                if($('textarea[name="payment_remark"]').length > 0) {
                    GJ.validator("payment_remark")
                            .setTipSpanId("jz-info-tips_payment_remark")
                            .setEmptyValue("")
                            .setRegexp(/^[\s\S]{0,50}$/, "请输入50字以内", false)
                        //.setRegexp(/[1-9]\d{6,11}/, withContactWayTip, true)
                        //.setRegexp(/1[3456789]\d{9}$|^(0\d{2,4}-?)[2-9]\d{6,7}$|^[48]00\d?(-?\d{3,4}){2}/, withContactWayTip, true)
                        //.setRegexp(/[a-z0-9]+([._\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+/, withContactWayTip, true)
                        //.setRegexp(/([a-zA-z]+:\/\/)?([\w]+\.)+([\w]+\.)+[\w-]+(\/[\w- ./?%&=]*)?|(http|https):\/\/[^\s]*/, withContactWayTip, true)
                            .setAjax("/employer/post/postspamsfilternew", "您输入的内容包含敏感词，请检查");
                }

//联系人
                if($('input[name="contact_person"]').length > 0) {
                    GJ.validator("contact_person")
                            .setTipSpanId("jz-info-tips_contact_person")
                            .setEmptyValue("")
                            .setRegexp(/^[\s\S]{1,10}$/, "请输入1-10个字", false)
                        //.setRegexp(/[1-9]\d{6,11}/, withContactWayTip, true)
                        //.setRegexp(/1[3456789]\d{9}$|^(0\d{2,4}-?)[2-9]\d{6,7}$|^[48]00\d?(-?\d{3,4}){2}/, withContactWayTip, true)
                        //.setRegexp(/[a-z0-9]+([._\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+/, withContactWayTip, true)
                        //.setRegexp(/([a-zA-z]+:\/\/)?([\w]+\.)+([\w]+\.)+[\w-]+(\/[\w- ./?%&=]*)?|(http|https):\/\/[^\s]*/, withContactWayTip, true)
                            .setAjax("/employer/post/postspamsfilternew", "您输入的内容包含敏感词，请检查");
                }

//职位描述
                if($('textarea[name="job_description"]').length > 0) {
                    GJ.validator("job_description")
                            .setTipSpanId("jz-info-tips_description")
                            .setEmptyValue("")
                            .setRegexp(/^[\s\S]{20,1000}$/, "描述内容为20-1000字", false)
                            .setRequired("请填写")
                        //.setRegexp(/[1-9]\d{6,11}/, withContactWayTip, true)
                        //.setRegexp(/1[3456789]\d{9}$|^(0\d{2,4}-?)[2-9]\d{6,7}$|^[48]00\d?(-?\d{3,4}){2}/, withContactWayTip, true)
                        //.setRegexp(/[a-z0-9]+([._\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+/, withContactWayTip, true)
                        //.setRegexp(/([a-zA-z]+:\/\/)?([\w]+\.)+([\w]+\.)+[\w-]+(\/[\w- ./?%&=]*)?|(http|https):\/\/[^\s]*/, withContactWayTip, true)
                            .setAjax("/employer/post/postspamsfilternew", "您输入的内容包含敏感词，请检查");
                }

// 联系电话
                if($('input[name="contact_phone"]').length > 0) {
                    GJ.validator("contact_phone")
                            .setTipSpanId("jz-info-tips_contact_phone")
                            .setEmptyValue("")
                            .setRequired("请填写")
                            .setRegexp(/^1[3456789]\d{9}$|^(0\d{2,4}-)?[2-9]\d{6,7}(-\d{2,6})?$|^(?!\d+(-\d+){4,})[48]00(-?\d){7,16}$/, "请输入正确的电话号码", false);
                }

//工作地址
                if($('input[name="workaddrjson"]').length > 0) {
                    GJ.validator("workaddrjson")
                            .setTipSpanId("jz-info-tips_work_addr")
                            .setEmptyValue("请录入工作地址")
                            .setCallback(
                            function(str){
                                return checkWorkAddr();
                            }, "请录入工作地址")
                            .setCallback(
                            function(str){
                                return checkWorkAddrComplete();
                            }, "请修改");;
                }

//面试地址验证
                if($('input[name="intviewaddrjson"]').length > 0) {
                    GJ.validator("intviewaddrjson")
                            .setTipSpanId("jz-info-tips_interview")
                            .setEmptyValue("请录入面试地址")
                            .setCallback(
                            function(str){
                                return checkInterviewAddr();
                            }, "请录入面试地址");
                }

//工作时间验证
                if($('input[name="worktimejson"]').length > 0) {
                    GJ.validator("worktimejson")
                            .setTipSpanId("jz-info-tips_work_time")
                            .setEmptyValue("请录入工作时间")
                            .setCallback(
                            function(str){
                                return checkWorkTime();
                            }, "请录入工作时间");
                }

//截止招聘日期
                if($('input[name="deadline"]').length > 0) {
                    GJ.validator("deadline")
                            .setTipSpanId("jz-info-tips_deadline")
                            .setRequired("请选择", function(){
                                deadline.setError();
                            }).setCallback(
                            function(str){
                                var flag = deadlineVsEndDate(str);
                                if(!flag) {
                                    deadline.setError();
                                }
                                return flag;
                            }, "报名截止日期不能晚于工作结束日期")
                            .setCallback(
                            function(str){
                                var flag = dateVsToday(str);
                                if(!flag) {
                                    deadline.setError();
                                }
                                return flag;
                            }, "截止报名日期不能早于今天")
                            .setCallback(
                            function(str){
                                var flag = deadlineVs1Month(str);
                                if(!flag) {
                                    deadline.setError();
                                }
                                return flag;
                            }, "招聘周期不得超过30天，请修改截止日期");

                }

//工作开始日期和结束日期
                if($('input[name="date_start"]').length > 0) {
                    GJ.validator("date_start")
                            .setTipSpanId("jz-info-tips_workdate")
                            .setRequired("请填写工作开始和结束日期", function(){
                                workdate.setError();
                            }).setCallback(
                            function(str){
                                var flag = /^\d+\-\d+\-\d+$/.test(str);
                                if(!flag) {
                                    workdate.setError();
                                }
                                return flag;
                            }, "录入有误，请重新填写");
                }

//工作week_day
                if($('input[name="work_weekday"]').length > 0) {
                    GJ.validator("work_weekday")
                            .setTipSpanId("jz-info-tips_work_day")
                            .setRequired("请录入工作日");
                }

                if($('input[name="consulting_number"]').length > 0) {
                    GJ.validator("consulting_number").setTipSpanId("jz-info-tips_consulting_number").setCallback(
                            function(str){
                                return checkConsultNumRequired();
                            }, "请填写").setCallback(
                            function(str){
                                return checkQQ();
                            }, "请录入正确QQ").setCallback(
                            function(str){
                                return checkWx();
                            }, "请录入正确微信号").setCallback(
                            function(str){
                                return checkWxPubNumber();
                            }, "请录入正确微信公众账号");
                }
                var hoverInputSel = '#cityDiv,#jobTypeDiv,#hireNumDiv,#deadlineDiv,#package_city';
                var orgTipTopVal = 0;
                $(hoverInputSel).mouseenter(function(e){
                    var theId= $(e.currentTarget).attr('id');
                    var tipText = '展现城市、职位类型、招聘人数、职位名称发布后不可修改，请谨慎填写';;
                    if (theId == 'cityDiv' || theId == 'package_city') {
                        $('#formTipDiv').css('top', orgTipTopVal);
                        tipText = '展现城市发布后不可修改，请谨慎填写';
                    } else if (theId == 'jobTypeDiv' ) {
                        $('#formTipDiv').css('top', orgTipTopVal);
                        tipText = '职位类型发布后不可修改，请谨慎填写';
                    } else if (theId == 'hireNumDiv' ) {
                        $('#formTipDiv').css('top', orgTipTopVal);
                        tipText = '招聘人数发布后不可修改，请谨慎填写';
                    } else if (theId == 'deadlineDiv' ) {
                        $('#formTipDiv').css('top', 700);
                        tipText = '截止日期发布后不可修改，请谨慎填写';
                    }
                    $('#formTipDiv').find('.fixed-formTip-con').text(tipText);
                    $('#formTipDiv').show();
                }).mouseleave(function(){
                    $('#formTipDiv').hide();
                });

                //提交
                var submitUrl = "https://vip.doumi.com/post/create"
                GJ.validator.addFormCallback('form_id', function() {
                    var spamCheckRes = checkPostPubSubmitSpamKeyword();
                    console.log(spamCheckRes);
                    if (!spamCheckRes) {
                        return false;
                    }
                    $.post(submitUrl, $('#form_id').serialize(), function(data) {

                        if (data.code === 0) {
                            urlGo(data.url);
                        } else {
                            GJ.alert({
                                title : '发布失败',
                                content : data.message,
                                mask : true,
                                width : 300,
                                height : 150
                            });
                        }
                        return false;

                    }, 'json');
                    return false;
                }, function(data) {
                    console.log(data)
                });


                //20人以上链接点击，需要把当前页面填写的信息带过去
                $(clueUrlSel).click(function(){
                    var url = $(this).data('url');
                    var obj = new Object();
                    //obj.province_id = $('input[name=province_id]').val();
                    obj.city_id = $('input[name=city_id]').val();
                    obj.hire_number = $('input[name=hire_number]').val();
                    obj.job_type = $('#job_type_id').val();
                    obj.salary = $('#salary').val();
                    obj.salary_type = $('select[name=salary_type]').val();
                    obj.payment_type = $('select[name=payment_type]').val();
                    obj.date_start = $('input[name=date_start]').val();
                    obj.date_end = $('input[name=date_end]').val();
                    obj.contact_person = $('input[name=contact_person]').val();
                    obj.contact_phone = $('input[name=contact_phone]').val();
                    obj.job_description = $('textarea[name=job_description]').val();
                    if ( $('input[name=post_id]').val() > 0) {
                        obj.post_id = $('input[name=post_id]').val();
                    }
                    console.log(obj);
                    GJ.setCookie('clue_data', JSON.stringify(obj), 5);
                    window.open(url);
                });

            });
        </script>
				</div>

			</div>

		</div>
	</div>
	<!--IM消息-->
	<div class="b-webim imbar_panel">
		<span class="b-webim-icon"><i></i></span> <span class="b-webim-txt">消息中心<em
			class="fc-fa"></em></span>
	</div>
	<div class="mask" style="display: none"></div>
	<div class="phone-preview-wrap" style="display: none">
		<span class="phone-preview-close"></span>
		<div class="phone-preview fl">
			<div class="phone-preview-inner">
				<iframe id='preview_left' src="" width="101%" height="100%"
					frameborder="0" scrolling="auto"></iframe>
			</div>
		</div>
		<div class="phone-preview fr">
			<div class="phone-preview-inner">
				<iframe id='preview_right' src="" width="101%" height="100%"
					frameborder="0" scrolling="auto"></iframe>
			</div>
		</div>
	</div>

	<script>
    GJ.use('jquery', function(){
        $(".imbar_panel").click(function (){
            window.open('https://vip.doumi.com/im/index?buid=13348554');
        });
    });
</script>
	<!--页面ev,pv-->
	<script>
    var SPEED_RENDER_END = new Date().getTime();
    window.PAGE_CONFIG = {"blogTracker":{"dmbch":"/jianzhi/vip/dmlg/postedit/detail"},"fromInfo":{"from":""}} || {};
    GJ.use('blog_tracker', function(){
        setTimeout(function(){
            GJ.BLogTracker.trackPageView();
            GJ.BLogTracker.bindAllTrackEvent();
        }, 0);
    });
</script>
	<!--用户踢出-->
	<script>
    var currentRoute = "post.pub.vipnormal";
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
</body>
</html>
