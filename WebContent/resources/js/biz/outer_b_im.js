/**
 * Created by DELL on 2018/5/10/010.
 */
!function(e){function t(n){if(o[n])return o[n].exports;var s=o[n]={exports:{},id:n,loaded:!1};return e[n].call(s.exports,s,s.exports,t),s.loaded=!0,s.exports}var o={};return t.m=e,t.c=o,t.p="",t(0)}([function(e,t,o){"use strict";function n(e){dmim.setUnReadMsgCount(JSON.parse(e.content.extra).job_id,e.senderUserId,e.content.content)}function s(){var e=arguments,t=JSON.parse(localStorage.getItem("unReadMessage")),o={msg:{},totalMsgNum:0,totalJobNum:0};$.each(t,function(e,t){var n=0;$.each(t,function(e,t){n+=t.length}),o.msg[e]=n,o.totalMsgNum+=n}),c(o),i=setTimeout(function(){e.callee()},3e3)}function a(){setTimeout(function(){var e=localStorage.getItem("open-im-window");if(e){var o=(new Date).getTime(),n=+localStorage.getItem("im-heart-time");n&&(4e3>o-n?a():(clearTimeout(i),window.localStorage.removeItem("open-im-window"),console.warn("重连咯!!!!!!!"),t.connect(r,c)))}},5e3)}window.dmim=o(5);var r,i,c=null,u={outer:!0,reconnectCallback:function(){console.warn("其他设备登录，链接断开"),a()},receiveMessage:n,initCompleteCallback:function(){s()}};t.connect=function(e,t){c=t,r=e,u.uid=e,localStorage.getItem("open-im-window")?(s(),a()):dmim.connect(u)}},,,,function(e,t){"use strict";function o(e){return String(e).replace(/</g,"&lt;").replace(/>/g,"&gt;")}t.htmlEscape=o},function(e,t,o){"use strict";function n(){RongIMClient.init(D.appKey),RongIMClient.registerMessageType("CardReceiptMsg","doumi:CardReceiptMsg",new RongIMLib.MessageTag(!0,!0),["content","job_id","msg_id"]),RongIMClient.setConnectionStatusListener({onChanged:function(e){switch(e){case RongIMLib.ConnectionStatus.CONNECTED:console.log("链接成功");break;case RongIMLib.ConnectionStatus.CONNECTING:console.log("正在链接");break;case RongIMLib.ConnectionStatus.DISCONNECTED:console.log("断开连接");break;case RongIMLib.ConnectionStatus.KICKED_OFFLINE_BY_OTHER_CLIENT:console.log("其他设备登陆"),D.reconnectCallback();break;case RongIMLib.ConnectionStatus.NETWORK_UNAVAILABLE:console.log("网络不可用")}}}),RongIMClient.connect(D.token,y),RongIMClient.setOnReceiveMessageListener({onReceived:function(e){switch(console.debug("接收到新消息:",e),e.messageType){case RongIMClient.MessageType.TextMessage:D.receiveMessage&&D.receiveMessage(e)}}})}function s(){RongIMClient.reconnect(y)}function a(e,t){var o=$.Deferred(),n=new RongIMLib.TextMessage(t);return i(RongIMLib.ConversationType.DISCUSSION,e,n).done(function(e){o.resolve(e)}),o.promise()}function r(e,t){var o=$.Deferred(),n=new RongIMClient.RegisterMessage.CardReceiptMsg(t);return i(RongIMLib.ConversationType.DISCUSSION,e,n).done(function(e){o.resolve(e)}),o.promise()}function i(e,t,o){var n=$.Deferred();return RongIMClient.getInstance().sendMessage(e,t,o,{onSuccess:function(e){console.log("Send successfully"),n.resolve(!0)},onError:function(e,t){var o="";switch(e){case RongIMLib.ErrorCode.TIMEOUT:o="超时";break;case RongIMLib.ErrorCode.UNKNOWN_ERROR:o="未知错误";break;case RongIMLib.ErrorCode.REJECTED_BY_BLACKLIST:o="在黑名单中，无法向对方发送消息";break;case RongIMLib.ErrorCode.NOT_IN_DISCUSSION:o="不在讨论组中";break;case RongIMLib.ErrorCode.NOT_IN_GROUP:o="不在群组中";break;case RongIMLib.ErrorCode.NOT_IN_CHATROOM:o="不在聊天室中";break;default:o=x}console.log("发送失败:"+o),n.resolve(!1)}}),n.promise()}function c(e,t,o){var n=$.Deferred();return RongIMClient.getInstance().getHistoryMessages(e,t,o?0:null,20,{onSuccess:function(e,t){console.debug("获取的历史消息：",e,"是否还有历史消息：",t),window.aaaa=e,n.resolve(e,t)},onError:function(e){n.reject(e)}}),n.promise()}function u(e,t){var o=$.Deferred();return c(RongIMLib.ConversationType.DISCUSSION,e,t).done(function(e,t){o.resolve(e,t)}),o.promise()}function d(e,t){var o=$.Deferred();return RongIMClient.getInstance().createDiscussion(e.toString(),t,{onSuccess:function(e){console.debug("新创建的讨论组id：",e),o.resolve(e)},onError:function(e){o.reject(e),console.error("创建讨论组失败:"+e)}}),o.promise()}function l(e,t,o,n){var s=$.Deferred(),a=[];$.each(o,function(){a.push(d(n,[this]))});var r={};return $.when.apply($.when,a).done(function(){var n=arguments;$.each(o,function(e){r[this]=n[e]}),E.saveJobDiscussion(e,t,r).done(function(e){s.resolve(e),console.debug("创建并保存讨论组：",e)})}),s.promise()}function g(){var e=$.Deferred();return RongIMClient.getInstance().getConversationList({onSuccess:function(t){console.debug("会话列表：",t),e.resolve(t)},onError:function(t){console.error(t),e.reject(t)}},null,1e3),e.promise()}function p(){function e(e,t){console.debug("构建初始数据：",e,t);var o=j.sortForJobCon.data,n=j.sortForJobCon.rdData,s=j.sortForDiscussion.data;$.each(e,function(){if("2"==this.conversationType&&("RC:TxtMsg"==this.objectName||"doumi:CardReceiptMsg"==this.objectName)){var e=this.latestMessage.content.content;if(this.latestMessage.content.extra||(this.latestMessage.content.extra={}),"string"==typeof this.latestMessage.content.extra)try{this.latestMessage.content.extra=JSON.parse(this.latestMessage.content.extra)}catch(a){console.log(a,"extra字符串转json错误，extra内容为：",this.latestMessage.content.extra)}var r=this.latestMessage.content.extra.job_id||this.latestMessage.content.job_id,i=this.targetId;if(t.data[r]){var c={jobId:r,title:t.data[r].title,isInterview:t.data[r].is_interview};n[r]||o.push(c),n[r]=!0,j.jobCon.data[r]=c,delete t.data[r]}s.push(i),j.jobDiscussion.data[i]={latestMessage:e,sentTime:I.timeAgo(this.latestMessage.sentTime)}}}),$.each(t.data,function(e,t){var n={jobId:e,title:t.title,isInterview:t.is_interview};o.push(n),j.jobCon.data[e]=n}),console.log("数据初始化完成！"),D.initCompleteCallback&&D.initCompleteCallback(o)}return window.localStorage.getItem("unReadMessage")||window.localStorage.setItem("unReadMessage",JSON.stringify({})),j.unReadMessage.data=JSON.parse(window.localStorage.getItem("unReadMessage")),D.outer?void(D.initCompleteCallback&&D.initCompleteCallback()):void $.when(g(),E.getJobList(D.uid)).done(e)}function f(e){function t(e){var t=j.jobDiscussion.data,n=j.userCon.data,s={},a=j.sortForDiscussion.data,r=[];$.each(e,function(e,o){var a=t[o.group_id],r={sendWay:o.send_way,statusOpt:o.status_oper,applyId:o.id,discussionId:o.group_id,uid:o.user_id,userName:o.user_name,mobile:o.user_mobile,remark:o.remark,statusShow:o.listing_status_show,statusCode:o.listing_status};a&&(r.latestMessage=C(a.latestMessage),r.sentTime=a.sentTime),n[o.user_id]=r,s[o.group_id]=r}),$.each(a,function(){var e=s[this];e&&(r.push(e),delete s[this])}),$.each(s,function(e,t){r.push(t)}),s=null,o.resolve(r)}var o=$.Deferred();return E.getUserList(e).done(t),o.promise()}function m(e,t,o){var n=j.unReadMessage.data;n[e]||(n[e]={}),n[e][t]||(n[e][t]=[]),n[e][t].push(o),window.localStorage.setItem("unReadMessage",JSON.stringify(n))}function b(e){var t=j.unReadMessage.data;return $.each(e,function(){var e=this.jobId;t[e]?this.hasUnReadMsg=!0:this.hasUnReadMsg=!1}),e}function v(e,t){var o=j.unReadMessage.data,n=o[e];return n?($.each(t,function(){var e,t=this.uid,o=n[t];e=o?o.length:0,this.unReadMsgCount=e}),t):t}function h(e,t){var o=j.unReadMessage.data,n=o[e];n&&(delete n[t],0==Object.keys(n).length&&delete o[e],window.localStorage.setItem("unReadMessage",JSON.stringify(o)))}function R(){j.sortForDiscussion.currJobUserConData=[],j.userCon.data={},j.massApplyUsers.data={},j.massInterviewUsers.data={},j.massHireUsers.data={},j.massRefuseUsers.data={},j.massScreenUsers.data={}}var M="function"==typeof Symbol&&"symbol"==typeof Symbol.iterator?function(e){return typeof e}:function(e){return e&&"function"==typeof Symbol&&e.constructor===Symbol&&e!==Symbol.prototype?"symbol":typeof e};o(6);var I=o(7),C=o(4).htmlEscape,S="im_tokens";if(window.localStorage){var w=window.localStorage.getItem(S);w||window.localStorage.setItem(S,"{}")}var D={appKey:window.imAppKey},y={onSuccess:function(e){console.log("Login successfully."+e),D.connectSuccessCallback&&D.connectSuccessCallback(),console.log("数据初始化"),D.dataInit()},onTokenIncorrect:function(){if(window.localStorage){var e=JSON.parse(window.localStorage.getItem(S));delete e[D.uid],window.localStorage.setItem(S,JSON.stringify(e))}console.log("token无效")},onError:function(e){var t="";switch(e){case RongIMLib.ErrorCode.TIMEOUT:t="超时";break;case RongIMLib.ErrorCode.UNKNOWN_ERROR:t="未知错误";break;case RongIMLib.ErrorCode.UNACCEPTABLE_PaROTOCOL_VERSION:t="不可接受的协议版本";break;case RongIMLib.ErrorCode.IDENTIFIER_REJECTED:t="appkey不正确";break;case RongIMLib.ErrorCode.SERVER_UNAVAILABLE:t="服务器不可用"}console.log(e)}},j={sortForJobCon:{data:[],rdData:{}},sortForDiscussion:{data:[],currJobUserConData:[]},unReadMessage:{dataStructure:"json",cashCount:0,localstorage:!0,data:{},dataPool:[]},jobDiscussion:{dataStructure:"json",cashCount:0,localstorage:!1,data:{},dataPool:[]},jobCon:{dataStructure:"array",cashCount:0,localstorage:!1,data:{},unShowData:{},searchDataForId:{},searchDataForName:{}},userCon:{dataStructure:"json",cashCount:0,localstorage:!1,data:{},dataPool:[]},massApplyUsers:{data:{},allData:{}},massInterviewUsers:{data:{},allData:{}},massHireUsers:{data:{},allData:{}},massRefuseUsers:{data:{},allData:{}},massScreenUsers:{data:{},allData:{}}};window.dataDefine=j;var E={getToken:function(e){var t=$.Deferred();if(window.localStorage){var o=JSON.parse(window.localStorage.getItem(S)),n=o[e];if(n)return t.resolve(n),t.promise()}return $.post(dm.beApiRootPath+"/base/token",{uid:e},null,"json").done(function(o){if(0==o.code){if(t.resolve(o.data.token),window.localStorage){var n=JSON.parse(window.localStorage.getItem(S));n[e]=o.data.token,window.localStorage.setItem(S,JSON.stringify(n))}console.debug("token:",o)}else console.error("获取token：",o)}).fail(function(e){console.error("token获取失败,状态码："+e.status)}),t.promise()},getJobList:function(e){var t=$.Deferred();return $.post(dm.beApiRootPath+"/singlechat/plist",{uid:e},function(e){console.debug("根据商户id获取的职位列表：",e),t.resolve(e)},"json"),t.promise()},getUserList:function(e){var t=$.Deferred();return $.post(dm.beApiRootPath+"/singlechat/ulist",{pid:e},function(e){console.debug("根据职位id获取已报名该职位的用户列表：",e),t.resolve(e.data)},"json"),t.promise()},setReadState:function(e,t,o){var n=$.Deferred();return $.post(dm.beApiRootPath+"/apply/setreadphone",{pid:e,uid:t,applys:o},function(e){n.resolve(e.data)},"json"),n.promise()},getUserInfo:function(e,t){var o=$.Deferred();return $.post(dm.beApiRootPath+"/singlechat/udetail",{pid:e,uids:t},null,"json").done(function(e){0==e.code?(console.debug("获取用户简历：",e),o.resolve(e.data)):(o.reject(),console.error("获取用户信息失败：",e))}).fail(function(){o.reject(),console.error("获取用户信息失败：",data)}),o.promise()},getJobInfo:function(e){var t=$.Deferred();return $.post(dm.beApiRootPath+"/base/getpostinfo",{pid:e},null,"json").done(function(e){0==e.code?(console.debug("获取职位简历：",e),t.resolve(e.data)):(t.reject(),console.error("获取职位信息出错：",e))}).fail(function(){t.reject(),console.error("获取职位信息接口报错：",data)}),t.promise()},getMassRecords:function(e){var t=$.Deferred();return $.post(dm.beApiRootPath+"/groupchat/records",{pid:e},function(o){console.debug("获取"+e+"群聊记录：",o),t.resolve(o.data)},"json"),t.promise()},getMassFeedbacks:function(e){var t=$.Deferred();return $.post(dm.beApiRootPath+"/groupchat/feedbacks",{gid:e},function(o){console.debug("获取"+e+"群聊记录：",o),t.resolve(o.data)},"json"),t.promise()},getMassUserList:function(e){var t=$.Deferred();return $.post(dm.beApiRootPath+"/groupchat/ulist",{pid:e},function(o){console.debug("获取"+e+"群发有效用户列表：",o),0==o.code?(o.data[0]&&(j.massApplyUsers.data={list:o.data[0],total:Object.keys(o.data[0]).length}),o.data[3]&&(j.massInterviewUsers.data={list:o.data[3],total:Object.keys(o.data[3]).length}),o.data[5]&&(j.massHireUsers.data={list:o.data[5],total:Object.keys(o.data[5]).length}),o.data[-5]&&(j.massRefuseUsers.data={list:o.data[-5],total:Object.keys(o.data[-5]).length}),o.data[12]&&(j.massScreenUsers.data={list:o.data[12],total:Object.keys(o.data[12]).length}),t.resolve()):t.reject("获取群发用户列表失败，失败：",o)},"json"),t.promise()},getRemainMassCount:function(e){var t=$.Deferred();return $.post(dm.beApiRootPath+"/groupchat/ustat",{pid:e},function(o){console.debug("获取职位"+e+"剩余群发条数记录：",o),t.resolve(o.data)},"json"),t.promise()},saveJobDiscussion:function(e,t,o){var n=$.Deferred();return $.post(dm.beApiRootPath+"/base/savedisgroups",{buid:e,pid:t,gids:JSON.stringify(o)},function(e){n.resolve(e)},"json"),n.promise()},sendMassTalkMsg:function(e,t,o,n,s,a){var r=$.Deferred(),i={fromUid:e,pid:t,content:o,isConfirm:n,msgType:s,msgInfo:JSON.stringify(a)};return $.post(dm.beApiRootPath+"/groupchat/sendmsg",i,function(e){0==e.code?r.resolve(e.data):r.reject(e)},"json"),r.promise()},setApplyStatus:function(e,t,o,n,s){var a=$.Deferred();return $.post(dm.beApiRootPath+"/apply/operstatus",{aid:e,ouid:t,status:o,tuid:n,pid:s},null,"json").done(function(e){a.resolve(e.data)}).fail(function(){a.reject()}),a.promise()},setApplyRemark:function(e,t){var o=$.Deferred();return $.post(dm.beApiRootPath+"/apply/operremark",{aid:e,remark:t},null,"json").done(function(e){o.resolve(e.data)}).fail(function(){o.reject()}),o.promise()},getApplyEvaluate:function(e,t,o){var n=$.Deferred();return $.post(dm.beApiRootPath+"/apply/getevaluate",{post_id:e,user_id:t,apply_id:o},function(e){n.resolve(e.data)},"json"),n.promise()},setApplyEvaluate:function(e,t,o,n,s){var a=$.Deferred();return $.post(dm.beApiRootPath+"/apply/operevaluate",{applyId:t,tag:s,content:n,type:o,ouid:e},null,"json").done(function(e){0==e.code?a.resolve(e.data):(console.log("评价设置失败！",e),a.reject(e))}).fail(function(){a.reject()}),a.promise()},sendShortMsg:function(e,t,o,n,s){var a=$.Deferred();return $.post(dm.beApiRootPath+"/singlechat/sendmsg",{pid:e,tuid:t,applyId:o,mobile:n,content:s},function(e){0==e.code?a.resolve(e):a.reject(e)},"json"),a.promise()},queryMassEnsureMsgStatus:function(e,t){var o=$.Deferred();return $.post(dm.beApiRootPath+"/groupchat/getfedback",{grid:e,tuid:t},function(e){o.resolve(e.data)},"json"),o.promise()},getDiscuss:function(e,t){var o=$.Deferred();return $.post(dm.beApiRootPath+"/base/getdisgroups",{pid:e,uids:t},function(e){o.resolve(e.data)},"json"),o.promise()}};t.connect=function(e){e&&"object"==("undefined"==typeof e?"undefined":M(e))||console.log("请传入合理参数"),D=$.extend(D,e),D.dataInit=p,E.getToken(D.uid).done(function(e){D.token=e,n()})},t.createDiscussion=d,t.getUserConList=f,t.getDiscussionHistoryMessage=u,t.sendJobDiscussionTxtMsg=a,t.sendJobDiscussionEnsureTxtMsg=r,t.setUnReadMsgCount=m,t.getJobsUnReadMsgCount=b,t.getUsersUnReadMsgCount=v,t.cleanUnReadMsg=h,t.bulkCreateJobDiscussion=l,t.bSerApi=E,t.dataDefine=j,t.cleanData=R,t.reconnect=s},function(e,t){"use strict";Object.keys=Object.keys||function(e){var t=[];for(t[t.length]in e);return t},window.console=window.console||function(){var e={};return e.log=e.warn=e.debug=e.info=e.error=e.time=e.dir=e.profile=e.clear=e.exception=e.trace=e.assert=function(){},e}(),console.debug=function(){window.dm.debug&&Function.prototype.apply.call(console.log,console,arguments)}},function(e,t){"use strict";function o(e){var t=new Date,o=t.getTime();t.setHours(0),t.setMinutes(0),t.setSeconds(0),t.setMilliseconds(0);var r=t.getTime(),i=o-r,c=o-e;return i>c?new Date(e).format("hh:mm"):n+i>c?"昨天 "+new Date(e).format("hh:mm"):s>c?parseInt(c/n)+"天前":a>c?parseInt(c/s)+"月前":parseInt(c/a)+"年前"}Date.prototype.format=function(e){var t={"M+":this.getMonth()+1,"d+":this.getDate(),"h+":this.getHours(),"m+":this.getMinutes(),"s+":this.getSeconds(),"q+":Math.floor((this.getMonth()+3)/3),S:this.getMilliseconds()};/(y+)/.test(e)&&(e=e.replace(RegExp.$1,(this.getFullYear()+"").substr(4-RegExp.$1.length)));for(var o in t)new RegExp("("+o+")").test(e)&&(e=e.replace(RegExp.$1,1==RegExp.$1.length?t[o]:("00"+t[o]).substr((""+t[o]).length)));return e};var n=864e5,s=30*n,a=365*n;t.timeAgo=o}]);