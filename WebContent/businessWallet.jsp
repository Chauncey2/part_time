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
    <title>我的钱包</title>
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
    <link href="${basePath}resources/css/jianzhi/web/b/b_wallet.__1525349146__.css" type="text/css" rel="stylesheet">

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
    <!--<script type="text/javascript" src="//sta.doumi.com/cgi/ganji_sta.php?file=ganji,css/jianzhi/web/b/b_wallet.cmb.css&con-->
<!--figDir=css/jianzhi/web/b&documentDomain=vip.doumi.com"></script>-->
    <script>
        var _hmt = _hmt || [];
        (function() {
            var hm = document.createElement("script");
            hm.src = "//hm.baidu.com/hm.js?7c0a2fe029631e2d7436151fab071753";
            var s = document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(hm, s);
        })();
    </script>             </head>
<body class="bg-f2 wallet">
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
                <a href="recruitManagement.jsp">招聘管理</a>
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
<div class="mod-container">
    <div class="mod-sidebar">
        <div class="menu">
            <dl>
                <dt ><a
                        href="bussinessManagement.jsp"><i
                        class="icon-companyInfo"></i>企业信息</a></dt>
                <dd><a  href="bussinessManagement.jsp">企业资料</a></dd>
                <dd><a  href="bussinessManagement.jsp">资质认证</a></dd>
            </dl>
            <dl>
                <dt class="active"><a
                        href="businessWallet.jsp"><i
                        class="icon-wallet"></i>企业钱包</a></dt>
            </dl>
            <dl>
                <dt ><a href="businessContract.jsp"><i
                        class="icon-hetong"></i>合同管理</a></dt>
            </dl>
        </div>
    </div>            <div class="mod-content pub-v3 mt20">

    <div class="mod-wallet-list mt20">
        <div class="total-money-wrap">
            <span class="total-money">账户余额：<em>0</em>元</span>
            <a  href="https://vip.doumi.com/employer/wallet/addfund" dmbalog="/jianzhi/vip/wallet/order@atype=click@ca_source=pc@ca_from=charge"  class="ui-btn ui-btn-sm">充值</a>
            <a href="javascript:;" id='widthdraw-button' class="ui-btn ui-btn-gray ui-btn-sm" dmbalog="/jianzhi/vip/wallet/order@atype=click@ca_source=pc@ca_from=cashapply">提现</a>
        </div>
        <div class="record-money-wrap clearfix">
            <span class="fl">记录查询：</span>
            <div class="record-date-group fl">
                <div class="input-group fl">
                    <input type="text" id="from_date" class="ui-input-text-sm" value="" readonly placeholder="开始时间">
                    <i class="record-date-icon"></i>
                </div>
                <span class="fl form-words-bar">至</span>
                <div class="input-group fl">
                    <input id="to_date" type="text" class="ui-input-text-sm" value="" readonly placeholder="结束时间">
                    <i class="record-date-icon"></i>
                </div>
            </div>
            <button class="fl ui-btn ui-btn-sm" id="J_search" type="button"
                    dmbalog="/jianzhi/vip/wallet/order@atype=click@ca_source=pc@ca_from=search">查找</button>
        </div>
    </div>

    <div class="mod-list wallet-list-table mt20">
        <table class="normal-table mod-consum-record">
            <thead>
            <tr>
                <th>日期</th>
                <th>金额变动</th>
                <th>余额</th>
                <th>状态</th>
                <th>说明</th>
            </tr>
            </thead>
            <tbody id="tb_content">
            <tr>
                <td class="text-null" colspan="4">所选时间内没有交易记录</td>
            </tr>
            </tbody>
        </table>
    </div>
    <div class="pageBox"  style="display:none;" >

    </div>
</div>
</div>
<script type="text/javascript">
    var pageDiv = '.pageBox';
    var totalNum = '0';
    var pageNum = 0;
    GJ.use('jquery', function(){
        var showPaginate = function(total,page){
            if(!total){
                $(pageDiv).html('');
                return false;
            }
            if(!page){
                page = 0;
            }
            totalNum = total;
            pageNum = page;
            var maxNum = 10;
            var minNum = 5;
            var leftNum = 8;
            var isMax = false;
            var isMin = false;
            var rightNum = 0;
            var minrightNum = 2;
            if(total > maxNum){
                isMax = true;
                rightNum = totalNum - 3;
            }
            if(page > minNum){
                isMin = true;
            }
            var pageStr = '<ul class="pagination">';
            pageStr += '<li><a rel="prev" page="prev" style="cursor:pointer">&laquo;</a></li>';
            for(var i=0;i<total;i++){
                var num = i + 1;
                var pageStrTmp = '';
                if(i == page){
                    pageStrTmp = '<li class="active"><span>'+num+'</span></li>';
                }else{
                    pageStrTmp = '<li><a page="'+ i +'" style="cursor:pointer">'+num+'</a></li>';
                }
                if(isMax && (num >= parseInt(page)+5) && (i < rightNum)){
                    pageStrTmp = '<li class="disabled"><span>...</span></li>';
                    i = rightNum;
                }
                if(isMin && (num > 2) && (num < page - 2)){
                    pageStrTmp = '<li class="disabled"><span>...</span></li>';
                    i = page - 4;
                }
                pageStr += pageStrTmp;
            }
            pageStr += '<li><a rel="next" page="next" style="cursor:pointer">&raquo;</a></li>';
            pageStr += '</ul>';
            $(pageDiv).html(pageStr);
        };
        $(pageDiv+' a').live('click',function(e){
            var page = $(this).attr('page');
            if(page == 'prev'){
                if(totalNum<=1 || pageNum<=0){
                    return false;
                }
                page = (pageNum > 0)?parseInt(pageNum)-1:0;
            }
            if(page == 'next'){
                if(totalNum<=1 || (pageNum>=totalNum-1)){
                  return false;
                }
                page = (pageNum < totalNum-1)?parseInt(pageNum)+1:parseInt(totalNum)-1;
            }
            pageNum = page;
            showPageData(Number(page)+1);
            showPaginate(totalNum,page);
        });
        showPaginate(totalNum);
    });
</script>   
 <script>
    GJ.use('jquery', function () {
        GJ.use('js/util/datepicker/datepicker.js', function () {
            $(".jz-date-ico").click(function () {
                $(this).prev().focus();
            });

            var date = new Date();
            GJ.datepicker({
                containerId: 'from_date',
                defaultDate: date,
                onSelect: function (dateText, inst) {
                }
            });
            GJ.datepicker({
                containerId: 'to_date',
                defaultDate: date,
                onSelect: function (dateText, inst) {
                }
            });

        });

        $('#J_search').click(function () {
            var from_date = $('#from_date').val();
            var to_date = $('#to_date').val();
            if (!from_date || !to_date) {
                alert('请选择开始时间和结束时间');
                return false;
            }
            window.location.href = 'https://vip.doumi.com/employer/wallet/index/?from_date=' + from_date + '&to_date=' + to_date;
        });
    });

    var showPageData = function (page) {
        var data = {
            page: page,
            from_date: $('#from_date').val(),
            to_date: $('#to_date').val()
        };
        $.ajax({
            type: 'GET',
            url: 'https://vip.doumi.com/employer/wallet/ajaxrecords',
            dataType: 'json',
            data: data,
            success: function (ret) {
                //alert(JSON.stringify(ret));return;
                if (ret.code == 0) {
                    if (ret.data.total) {
                        var content = formatPageData(ret.data.records_data);
                        $('#tb_content').html(content);
                        //showPaginate(ret.data.last_page,ret.data.current_page);
                    } else {
                        $(pageDiv).html('');
                    }
                }
            }
        });
    };

    var formatPageData = function (list) {
        var html = '';
        var record_type = [];
        if (list) {
            for (var i = 0; i < list.length; i++) {
                html += '<tr>';
                html += '<td>' + list[i]['modify_at'] + '</td>';

                html += '<td class="fc-fa">';
                record_type = [7, 8, 9, 10, 17, 18, 20];
                if (record_type.indexOf(Number(list[i]['record_type'])) < 0) {
                    html += Number(list[i]['direction']) == 1 ? '+' : '-';
                }
                html += list[i]['amount'] + '元';
                html += '</td>';

                html += '<td class="fc-4b">';
                record_type = [7, 8, 9, 10, 17, 18, 20];
                if (record_type.indexOf(Number(list[i]['record_type'])) > -1) {
                    html += '-';
                } else {
                    html += Number(list[i]['last_balance']) + '元';
                }
                html += '</td>';

                html += '<td class="fc-4b">';
                record_type = [6, 16];
                if (record_type.indexOf(Number(list[i]['record_type'])) > -1) {
                    if (0 == Number(list[i]['listing_status'])) {
                        html += '提现中';
                    } else if (5 == Number(list[i]['listing_status'])) {
                        html += '提现成功';
                    } else if (2 == Number(list[i]['listing_status'])) {
                        html += '提现失败';
                    } else {
                        html += '未知状态：' + list[i]['listing_status'];
                    }
                } else {
                    record_type = [1, 3];
                    if (record_type.indexOf(Number(list[i]['record_type'])) > -1) {
                        if (0 == Number(list[i]['listing_status'])) {
                            html += '处理中';
                        } else if (5 == Number(list[i]['listing_status'])) {
                            html += '交易成功';
                        } else if (2 == Number(list[i]['listing_status'])) {
                            html += '交易失败';
                        } else {
                            html += '未知状态：' + list[i]['listing_status'];
                        }
                    } else if (Number(list[i]['record_type']) == 17) {
                        if (0 == Number(list[i]['listing_status'])) {
                            html += '处理中';
                        } else if (5 == Number(list[i]['listing_status'])) {
                            html += '支付成功';
                        } else if (2 == Number(list[i]['listing_status'])) {
                            html += '支付失败';
                        } else {
                            html += '未知状态：' + list[i]['listing_status'];
                        }
                    } else if (Number(list[i]['record_type']) == 7) {
                        if (0 == Number(list[i]['listing_status'])) {
                            html += '处理中';
                        } else if (5 == Number(list[i]['listing_status'])) {
                            html += '退款成功';
                        } else if (2 == Number(list[i]['listing_status'])) {
                            html += '退款失败';
                        } else {
                            html += '未知状态：' + list[i]['listing_status'];
                        }
                    } else {
                        record_type = [10, 18];
                        if (record_type.indexOf(Number(list[i]['record_type'])) > -1) {
                            if (0 == Number(list[i]['listing_status'])) {
                                html += '处理中';
                            } else if (5 == Number(list[i]['listing_status'])) {
                                html += '退回成功';
                            } else if (2 == Number(list[i]['listing_status'])) {
                                html += '退回失败';
                            } else {
                                html += '未知状态：' + list[i]['listing_status'];
                            }
                        } else if (Number(list[i]['record_type']) == 20) {
                            html += '支付成功';
                        } else {
                            html += '交易成功';
                        }
                    }
                }
                html += '</td>';

                html += '<td>';
                html += list[i]['memo'];
                record_type = [6, 16];
                if (record_type.indexOf(Number(list[i]['record_type'])) > -1) {
                    html += list[i]['remark'];
                } else {
                    record_type = [1, 3];
                    if (record_type.indexOf(Number(list[i]['record_type'])) > -1) {
                        if (Number(list[i]['listing_status']) == 2) {
                            html += list[i]['remark'];
                        }
                    }
                }
                html += '</td>';

                html += '</tr>';
            }
        } else {
            html += '<tr><td class="text-null" colspan="4">所选时间内没有交易记录</td></tr>';
        }

        return html;
    }

    GJ.use('panel', function () {
        $("#widthdraw-button").live('click', function (e) {
            if (0 >=
                    10
            )
            {
                alert('每日仅限提现 10 次');
                return false;
            }
            if (0 >=
                    10000
            )
            {
                alert('单日提现限额10000 元，请明天再来');
                return false;
            }
            var url = 'https://vip.doumi.com/employer/wallet/withdraw/index';
            var width = 500;
            var height = 460;
            var panel = '';
            panel = GJ.panel({
                title: '余额提现'
                , url: url
                , iframe: true
                , style: 'text'
                , mask: true
                , width: width
                , height: height
                , onClose: function () {
                }
            });
        });
    });
</script>
</body>
</html>
