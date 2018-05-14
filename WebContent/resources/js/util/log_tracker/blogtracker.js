
GJ.add(
'js/util/log_tracker/blogtracker.js',
['jquery', 'js/util/uuid/uuid.js', 'js/util/randomid/random_id.js'],
function(require, exports, module){
    if (GJ.BLogTracker && GJ.BLogTracker.trackPageView) {
        return ;
    }
    var $ = require('jquery');
    var reqid = GJ.config.reqid || '-';
    var gjadOrderCount = 0;
    var isLanding = false;
    var win = window, doc = document, nav = win.navigator, ua=nav && nav.userAgent, loc = win.location,
        guid = function(){
            var d1=new Date(), time=d1.getTime(),
                d2=new Date(d1.getFullYear(), d1.getMonth(), d1.getDate(), 0, 0, 0);

            return (time - d2.getTime()) * 1000 + GJ.rand(1000, 9999);
        },
        counter = 0,
        pageViewTracked = false,
        speedEventTracked = false,
        speedEventBinded = false,
        viewEvents = {},
        pageTypes = {
            home      : 1,
            index     : 1,
            list      : 1,
            detail    : 1,
            order     : 1,
            query     : 1,
            other     : 1
        },

        _encodeURI = function(k, l) {
            var g = encodeURIComponent;
            if (g instanceof Function) return l ? encodeURI(k) : g(k);
            else {
                return escape(k)
            }
        },

        initData = {
            flashPlayerVersion : function() {
                var playerVersion = [0,0,0],
                    d = null;
                if (typeof nav.plugins != 'undefined' && typeof nav.plugins['Shockwave Flash'] == 'object') {
                    d = nav.plugins['Shockwave Flash'].description;
                    if (d && !(typeof nav.mimeTypes != 'undefined' && nav.mimeTypes["application/x-shockwave-flash"] && !nav.mimeTypes["application/x-shockwave-flash"].enabledPlugin)) {
                        d = d.replace(/^.*\s+(\S+\s+\S+$)/, "$1");
                        playerVersion[0] = parseInt(d.replace(/^(.*)\..*$/, "$1"), 10);
                        playerVersion[1] = parseInt(d.replace(/^.*\.(.*)\s.*$/, "$1"), 10);
                        playerVersion[2] = /[a-zA-Z]/.test(d) ? parseInt(d.replace(/^.*[a-zA-Z]+(.*)$/, "$1"), 10) : 0;
                    }
                }
                else if (typeof window.ActiveXObject != 'undefined') {
                    try {
                        var a = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
                        if (a) {
                            d = a.GetVariable("$version");
                            if (d) {
                                d = d.split(" ")[1].split(",");
                                playerVersion = [parseInt(d[0], 10), parseInt(d[1], 10), parseInt(d[2], 10)];
                            }
                        }
                    }
                    catch(e) {}
                }
                return playerVersion.join('.');
            }(),

            uaFormat : function(){
                // "on:-|ov:-|bn:UCWEB|bv:9.7|dv:-|rl:-"操作系统类别 操作系统版本 浏览器名称 浏览器版本 设备型号 分辨率
                var data = ['os:' + (GJ.ua.os || '-')];
                var match;

                var osVersion = /Windows NT ([\d\.]*)/i.exec(navigator.userAgent) ||
                                /Mac OS X ([\d\.]*)/i.exec(navigator.userAgent) ||
                                /OS ([\d_]*)/i.exec(navigator.userAgent);

                osVersion = osVersion ? osVersion[1] : '-';
                data.push('ov:' + (osVersion || '-'));

                if (GJ.ua.ie) {
                    data.push('bn:ie');
                    data.push('bv:' + GJ.ua.ie);
                } else if (GJ.ua.webkit) {
                    data.push('bn:webkit');
                    data.push('bv:' + GJ.ua.webkit);
                } else if (GJ.ua.gecko) {
                    data.push('bn:gecko');
                    data.push('bv:' + GJ.ua.gecko);
                } else {
                    data.push('bn:-');
                    data.push('bv:-');
                }

                data.push('dv:' + (window.navigator.platform || '-'));
                data.push('rl:' + window.screen.width + ',' + window.screen.height);
                return data.join('|');
            }(),

            screenFormart : function(){
                if (self.screen) {
                    return screen.width + "," + screen.height;
                } else if (self.java) {
                    var j = java.awt.Toolkit.getDefaultToolkit();
                    var s = j.getScreenSize();
                    return s.width + "," + s.height;
                }
                return '';
            }(),

            domain : function(){
                //var d = document.domain.replace(/^\w+\./, '');
                var d = 'doumi.com';
                return d.toLowerCase();
            }()
        },

        uuid = '', getUuid = function(){ //取得uuId
            if (!uuid) {
                uuid = GJ.getCookie(L.uuidName);
            }
            return uuid;
        },
        powResult = {
            "53": "9007199254740992",
            "54": "18014398509481984",
            "55": "36028797018963968",
            "56": "72057594037927936",
            "57": "144115188075855872",
            "58": "288230376151711744",
            "59": "576460752303423488",
            "60": "1152921504606846976",
            "61": "2305843009213693952",
            "62": "4611686018427387904",
            "63": "9223372036854775808",
            "64": "18446744073709551616"
        },
        getCity = function(){
        	return  '-';
        },
        getFrom = function(){
            var from = null;
            if (window.PAGE_CONFIG && window.PAGE_CONFIG.fromInfo) {
                from = window.PAGE_CONFIG.fromInfo.from;
            } 
            return from || GJ.getCookie('dmb_from') || 'direct_visits';
        },
        getLoginFrom = function(){
            return GJ.getCookie('dmb_loginfrom') || '-';
        },
        getBDId = function() {
            return GJ.getCookie('bdid') || 0;
        },
        getCompanyId = function() {
            return GJ.getCookie('cid') || 0;
        },
        getIsFirst = function() {
            return GJ.getCookie('is_first') || 0;
        },
        getIsActive = function() {
            return GJ.getCookie('is_active') || 0;
        },
        getRelatedBdId = function() {
            return GJ.getCookie('related_bd_id') || 0;
        },
        getUserID = function (){
		    return GJ.getCookie('dmb_userid') || '-';
        },
        getOriginUserAgent = function (){
            return window.navigator.userAgent; 
        },
        xor = function (a, b) {
            if (b.length > a.length) {
                var temp = b;
                b = a;
                a = temp;
            }

            a = a.split(''), b = b.split('');
            var al, bl = b.pop(), ret = [];

            while(bl !== undefined) {
                al = a.pop();

                ret.unshift(bl ^ al);
                bl = b.pop();
            }

            return a.concat(ret).join('');
        },
        pow2 = function (n) {
            if (n <= 53) {
                return Math.pow(2, n).toString();
            } else {
                return powResult[n.toString()];
            }
        },
        plus = function (a, b) {
            if (a.length < 14 && b.length < 14) {
                return (parseInt(a) + parseInt(b)).toString();
            }
            if (b.length > a.length) {
                var temp = b;
                b = a;
                a = temp;
            }

            a = a.split(''), b = b.split('');

            var len = b.length;
            var ret = [];
            var i = 0;
            var al, bl = b.pop(), r;
            while(bl !== undefined) {
                al = a.pop();

                if (al === undefined) {
                    ret.unshift(1);
                    break;
                }

                r = parseInt(al) + parseInt(bl) + i;
                ret.unshift(r % 10);

                i = r >= 10 ? 1 : 0;

                if (!b.length) {
                    if (i) {
                        bl = i;
                        i = 0;
                    } else {
                        bl = undefined;
                    }
                } else {
                    bl = b.pop();
                }
            }

            return a.concat(ret).join('');
        },
        reduceRight = function (fn /*, initial*/) {
            if (typeof fn !== 'function') {
                throw new TypeError(fn + ' is not an function');
            }

            var len = this.length >>> 0, i = len - 1, result;

            if (arguments.length > 1) {
                result = arguments[1];
            } else {
                do {
                    if (i in this) {
                        result = this[i--];
                        break;
                    }
                    // if array contains no values, no initial value to return
                    if (--i < 0)
                        throw new TypeError('reduce of empty array with on initial value');
                } while (true);
            }

            for (; i >= 0; i--) {
                if (i in this) {
                    result = fn.call(null, result, this[i], i, this);
                }
            }

            return result;
        },

        sessionId = '', getSessionId = function(){ //取得sessionId
            if (!sessionId) {
                sessionId = GJ.getCookie('sid');
                if (!sessionId) {
                    sessionId = guid();
                    GJ.setCookie('sid', sessionId);
                    isLanding = true;
                }
            }
            return sessionId;
        },

        getOrganics = function(){ //分析默认的搜索引擎
            //var s = "baidu:wd,baidu:wd,daum:q,eniro:search_word,naver:query,images.google:q,google:q,yahoo:p,msn:q,bing:q,aol:query,aol:encquery,lycos:query,ask:q,altavista:q,netscape:query,cnn:query,about:terms,mamma:query,alltheweb:q,voila:rdata,virgilio:qs,live:q,baidu:wd,alice:qs,yandex:text,najdi:q,aol:q,mama:query,seznam:q,search:q,wp:szukaj,onet:qt,szukacz:q,yam:k,pchome:q,kvasir:q,sesam:q,ozu:q,terra:query,mynet:q,ekolay:q,rambler:words";
            return [
                ["baidu"         , "wd"],
                ["baidu"         , "word"],
                ["images.google" , "q"],
                ["google"        , "q"],
                ["yahoo"         , "p"],
                ["msn"           , "q"],
                ["live"          , "q"],
                ["soso"          , "w"],
                ["sogou"         , "query"],
                ["bing"          , "q"],
                ["so.360.cn"     , "q"],
                ["so.com"        , "q"],
                ["haosou.com"    , "q"],
                ["haoso.com"     , "q"]
            ];
        },

        searchEngineHostMap = {
            'baidu.com': 'baidu',
            'google.com': 'google',
            'sogou.com': 'sogou',
            'soso.com': 'soso',
            'so.com': '360',
            'haoso.com': '360',
            'haosou.com': '360',
            'youdao.com': 'youdao',
            'bing.com': 'bing'
        },

        addIgnoredKeyword = function(keyword){
            L.ignoredKeywords[keyword+' '] = 1;
        },

        getOrganicInfo = function(){ //取得并保存搜索引擎（推广）信息
            //var ref = document.referrer && !/(ganji|mayi|guazi).(com|cn)/i.test(GJ.parseUrl(document.referrer).host) ? document.referrer : null;
            var ref = document.referrer && !/(doumi).(com|cn)/i.test(GJ.parseUrl(document.referrer).host) ? document.referrer : null;
            var caSource, caFrom, caName, caKw, caId, caS, caN, caI;

            var refUrlData = GJ.parseUrl(document.referrer);
            var selfUrlData = GJ.parseUrl(window.location.href);
            var organics = getOrganics();
            var isUtf8 = /[\?&]\w+=utf/i.test(document.referrer)

            if(!ref) {
                caSource = selfUrlData.params['ca_source'];
                caFrom = selfUrlData.params['ca_from'] || GJ.getCookie('ca_from') || '-';
                caName = selfUrlData.params['ca_name'];
                caKw = selfUrlData.params['ca_kw'];
                caId = selfUrlData.params['ca_id'];
                caN = selfUrlData.params['ca_n'] || GJ.getCookie('dm_caN');
                caI = selfUrlData.params['ca_i'] || GJ.getCookie('ca_i');
                caS = selfUrlData.params['ca_s'] || GJ.getCookie('ca_s');

                if(!caS || caS === '-') {
                    caS = 'self';
                }
            } else {
                // 存在站外referrer
                //caSource = selfUrlData.params['ca_source'] || refUrlData.host;
                caSource = selfUrlData.params['ca_source'];
                caFrom = selfUrlData.params['ca_from'] || selfUrlData.params['from'] || '-';
                caName = selfUrlData.params['ca_name'] ||'';
                caKw = selfUrlData.params['ca_kw'] || '';
                caId = selfUrlData.params['ca_id'] || '';
                caN = selfUrlData.params['ca_n'] || '';
                caS = selfUrlData.params['ca_s'];
                caI = selfUrlData.params['ca_i'];
            }

            caSource = caSource || '-';
            caName = caName || '-';
            caKw = caKw || '-';
            caId = caId || '-';
            caS = caS || '-';
            caN = caN || '-';
            caI = caI || '-';

            GJ.setCookie('ca_source', caSource);
            GJ.setCookie('ca_name', caName);
            GJ.setCookie('ca_kw', caKw);
            GJ.setCookie('ca_id', caId);
            GJ.setCookie('ca_s', caS);
            GJ.setCookie('ca_n', caN);
            GJ.setCookie('ca_i', caI);
            GJ.setCookie('ca_from', caFrom);

            return [caSource, caName, caKw, caId, caS, caN, caI, caFrom];
        },

        getInnerFromId = function(){
            var ifid_1 = GJ.getCookie('ifid');

            if (document.referrer){
                var selfUrlData = GJ.parseUrl(window.location.href),
                    ifid_2 = selfUrlData.params[L.innerFromIdName] || '';

                if (ifid_2 && ifid_2 != ifid_1) {
                    ifid_1 = ifid_2;
                    GJ.setCookie('ifid', ifid_1);
                }
            }

            return ifid_1 || '';
        },

        submitHandler = function(){
            var EO = $(this).data('gl_EO_click');
            EO.trackEvent();
            return true;
        },

        clickHandler = function(e){
            var EO = $(this).data('gl_EO_click');
            EO.trackEvent(null, e);
            if (EO.redirectUrl){
                GJ.later(function(){
                    window.location.href = EO.redirectUrl;
                }, 300);
                return false;
            }
            return true;
        },

        mouseoverHandler = function(){
            if (!$(this).data('gl_over_tracked')) {
                var EO = $(this).data('gl_EO_mouseover');
                EO.trackEvent();
                $(this).data('gl_over_tracked', 1);
            }
            return true;
        },

        bindTrackEvent = function($el, o){
            var tagName = $el[0].tagName.toLowerCase();
            if (tagName == 'a' && $el[0].target.toLowerCase() == '_self'){
                o.redirectUrl = $el.attr('href');
            }

            if (o.actionType == L.ACTION_TYPE_CLICK){
                var EO = new E(o);
                $el.data('gl_EO_click', EO);

                if (tagName == 'form'){
                    $el.unbind('submit', submitHandler);
                    $el.bind('submit', submitHandler);
                }
                else {
                    $el.unbind('click', clickHandler);
                    $el.bind('click', clickHandler);
                }
            }
            else if (o.actionType == L.ACTION_TYPE_HOVER){
                var EO = new E(o);
                $el.data('gl_EO_mouseover', EO);


                $el.unbind('mouseover', mouseoverHandler);
                $el.bind('mouseover', mouseoverHandler);
            }
        };

    var firstLogSent = false;
    var LOG_NO_UUID = GJ.getCookie('LOG_NO_UUID');

    function postByImg(url, callback){
        var img = new Image();

        img.onload = img.onerror = function() {
            img.onload = null;
            img.onerror = null;
            if (callback) {
                callback();
            }
        };

        if (!firstLogSent) {
            firstLogSent = true;
            if (!getUuid() && !LOG_NO_UUID) {
                GJ.setCookie('LOG_NO_UUID',  getSessionId() + '_'+ GJ.rand(0, 999999), 86400);
            } else if (LOG_NO_UUID){
                if (getUuid()) {
                    GJ.BLogTracker.trackEvent('/LOG_NO_UUID/ev2/' + LOG_NO_UUID);
                    GJ.removeCookie('LOG_NO_UUID');
                } else {
                    GJ.BLogTracker.trackEvent('/LOG_NO_UUID/ev1/' + LOG_NO_UUID);
                }
            }
        }

        img.src = url;
    };

    function Code (o){
        this.code        = o.code || '';
        this.params      = o.params || {};                        //构成code的参数
        this.showId      = o.showId || '';
        this.actionType  = o.actionType || L.ACTION_TYPE_CLICK;
        this.redirectUrl = o.redirectUrl || '';
        this.business    = o.business;
        this.bdShow      = o.bdShow;
    };

    var E = Code;

    Code.prototype = {
        trackEvent : function(callback, e){
            var org, img, urls;

            org = getOrganicInfo();

            if (this.business) {
                img = 'b.gif';
            } else if (this.bdShow) {
                img = 'd.gif';
            } else {
                img = 'be.gif';
            }

            if(this.params && this.params.show_type === "direction") {
                try {
                    GJ.webim.cometMgr.setNeedComet(1);
                } catch(err) {}
            }

            //  获取点击坐标
            var posX, posY;
            if(e && e.clientY) {
                posX = Math.floor(e.clientX - document.body.clientWidth / 2);
                posY = e.clientY;
            }

            var actionInfo = this.getActionInfo();
            if(actionInfo) {
                if(posY) {
                    actionInfo += '@clickx=' + posX + '@clicky=' + posY + '@clientw=' + document.body.clientWidth;
                }
            } else {
                actionInfo = '-';
            }

            var compatibleGjalog = 'dmalog=';
            if(this.isUsingGe()){
                compatibleGjalog = 'ge=';
            }
            compatibleGjalog += (actionInfo + '@reqid=' + reqid);

            urls = [
                L.server + "/" + img + "?dmch=" + (L.getDmch() || '-'),
                "gc=" + (L.dmchNew || '-'),
                compatibleGjalog,
                "uuid=" + (getUuid() || '-'),
                "dmuser=" + getUserID(),
                "sid=" + getSessionId(),
                "ca_source=" + (org[0] || '-'),
                "ca_name=" + (org[1] || '-'),
                "ca_kw=" + (org[2] || '-'),
                "ca_id=" + (org[3] || '-'),
                "ca_s=" + (org[4] || '-'),
                "ca_n=" + (org[5] || '-'),
                "ca_i=" + (org[6] || '-'),
                "ca_from=" + (org[7] || '-'),
                "loginfrom=" + getLoginFrom(),
                "bd_id=" + getBDId(),
                "ifid=" + (getInnerFromId() || '-'),
                "label=" + ('-'),
                "r=" + counter++,              //用于防止浏览器缓存
                "company_id=" + getCompanyId(),
                "related_bd_id=" + getRelatedBdId(),
                "is_first=" + getIsFirst(),
                "is_active=" + getIsActive(),
                "oua=" + getOriginUserAgent()
            ];


            if (L.dmchver){
                urls.push("dmchver=" + L.dmchver);
            }
            postByImg(urls.join('&'), callback);

        },
        getActionInfo : function(){
            var t=this, p=[];

            if (t.code&&t.actionType){
                if(t.isUsingGe()){
                    var newCode = t.code.slice(0, t.code.length - 8);
                    newCode += '00000';
                    newCode += t.actionType === L.ACTION_TYPE_HOVER?'1':'0';
                    newCode += t.actionType === L.ACTION_TYPE_CLICK?'1':'0';
                    newCode += t.actionType === L.ACTION_TYPE_SHOW?'1':'0';
                    t.code = newCode;
                }
            }

            if (t.code) {
                p.push(t.code);
            }

            GJ.each(t.params, function(v, k){
                p.push(k+"="+v);
            });

            if (t.actionType){
                p.push("atype=" + t.actionType);
            }

            if (t.showId) {
                p.push("showid=" + t.showId);
            }

            return p.join(L.paramSeparator);
        },
        isUsingGe: function(){
            if(/\D+/.test(this.code)||this.business||this.bdShow){
                return false;
            }
            return true;
        }
    };
    Code.parse = function(dmalog){
        dmalog = $.trim(dmalog);
        var p = dmalog.replace('&', L.paramSeparator).split(L.paramSeparator),
            o = {
                code : p.shift(),
                params : {},
                actionTypes : '',
                showId : '',
                business : false,
                bdShow: false
            };

        GJ.each(p, function(v){
            v = v.split('=');
            if (v[0]) {
                if (v[0] === 'atype') {
                    o.actionTypes = v[1].split("|");
                } else if (v[0] === 'showid') {
                    o.showId = v[1];
                } else if (v[0] === 'business') {
                    if (v[1] && v[1] !== 'false') {
                        o.business = true;
                    }
                } else if (v[0] === 'bd_show') {
                    if (v[1] && v[1] !== 'false') {
                        o.bdShow = true;
                    }
                } else {
                    o.params[v[0]] = v[1];
                }
            }
        });

        if (!/\D+/.test(o.code)) {
            // 只影响EV
            if (!o.business && !o.bdShow) {
                if (!o.actionTypes) {
                    o.actionTypes = [];
                }
                var codeStr = o.code.toString();
                var actionTypeStr = codeStr.slice(codeStr.length - 3, codeStr.length);
                if (actionTypeStr.charAt(0) === '1') {
                    o.actionTypes.push(L.ACTION_TYPE_HOVER);
                }
                if (actionTypeStr.charAt(1) === '1') {
                    o.actionTypes.push(L.ACTION_TYPE_CLICK);
                }
                if (actionTypeStr.charAt(2) === '1') {
                    o.actionTypes.push(L.ACTION_TYPE_SHOW);
                }
            }
        }
        return o;
    };
    Code.parseCode = Code.parse;
    /**
     * 日志记录
     * 收集页面信息，通过远程请求保存日志
     *
     * @class GJ.LogTracker
     */
    var L = {
        ACTION_TYPE_SHOW   : 'show',
        ACTION_TYPE_CLICK  : 'click',
        ACTION_TYPE_HOVER  : 'hover',

        /**
         * 页面属性
         * 如：/wu/jiaju/list@seller=1@deal_type=1@pn=1
         *
         * @property dmch
         * @type string
         */
        dmch : '',
        getDmch : function(){
            var dmch = L.dmch.replace('&', L.paramSeparator).replace('@360app=1', '');
            if (!dmch) {
                dmch = $('body').data('dmch') || '-';
                if (dmch === '-' && window.PAGE_CONFIG && window.PAGE_CONFIG.blogTracker) {
                    dmch = window.PAGE_CONFIG.blogTracker.dmbch;
                }
                L.dmch = dmch;
            }
            return dmch;
        },

        /**
         * AB测试版本号
         *
         * @property dmchver
         * @type string
         * @default A
         */
        dmchver         : 'A',
        server          : '//analytics.doumi.com',

        /**
         * 用来设置cookie的域名
         *
         * @property domain
         * @type string
         */
        domain          : initData.domain,

        uuidName        : 'dmb_uuid',
        innerFromIdName : 'ifid',
        actionAttrName  : 'dmbalog',
        paramSeparator  : '@',

        ignoredKeywords : {
            'ganji ' : 1,
            "赶集 " : 1,
            "赶集网 " : 1
        },
        addIgnoredKeyword : addIgnoredKeyword,

        /**
         * 对需要点击或悬停统计的元素绑定事件，可多次绑定，只有最后一次绑定有效
         * 写在页面尾部或远程载入完成的回调函数中
         * 对于商业广告，统一加business=true
         * 商业广告的数据格式：gjaddata={广告类型:{广告位置:{顺序号:广告id,...},...},...}
         * 广告类型：1:crm投放广告，2:自助置顶，3:端口帖，4:帮帮帖，5:ppc，6:cpc，20:临时代码
         *
         * @method bindAllTrackEvent
         * @return {void}
         * @example
         * <a href="*" dmalog="/ppc@atype=click|hover@tels=13800138000&ids=23">广告一</a>
         * <a href="*" dmalog="/ppc@atype=click|hover@tels=13800138000&ids=24">广告二</a>
         *
         * <script type="text/javascript">
         * GJ.use('log_tracker', function(){
         *     GJ.LogTracker.dmch = "/wu/jiaju/list@seller=1@deal_type=1@pn=1";
         *     GJ.LogTracker.bindAllTrackEvent();
         * });
         * </script>
         */
        bindAllTrackEvent : function() {
            var newViewEvents = [];
            var ads =  [];
            $("["+L.actionAttrName+"]").each(function(){
                var $el=$(this),
                    dmalog = $el.attr(L.actionAttrName),
                    o = E.parseCode(dmalog);

                GJ.each(o.actionTypes, function(atype){
                    var _o = GJ.mix({}, o);
                    _o.actionType = atype;
                    delete _o.actionTypes;

                    if (atype == L.ACTION_TYPE_SHOW && !viewEvents[dmalog]){
                        viewEvents[dmalog] = 1;
                        if (_o.params.gjaddata) {
                            newViewEvents.push(_o);
                            ads.push([$el, _o.params.gjaddata]);
                        } else {
                            var e = new E(_o);
                            e.trackEvent();
                        }
                    } else {
                        bindTrackEvent($el, _o);
                    }
                });
            });

            //商业广告与帖子显示统计
            if (newViewEvents.length > 0) {
                var _data = {};
                var _dmalog = '/site_tuiguang/trace@atype=show@business=true&gjaddata=';

                // gjaddata格式:
                // 1. gjaddata = "{1:{1:{1:123456677}}}"
                // 2. gjaddata = "{1:{1:{1:xxxxnoxxxnumberxxx}}}"
                // 3. gjaddata = "{1:{1:{1:xxxxnoxxxnumberxxx}}}, {2:{2:{2:12345667}}}"

                newViewEvents = GJ.map(newViewEvents, function (val) {
                    return eval('(' + val.params.gjaddata.replace(/\{(\d*\:)([^\{\}]*?)\}/g, '{$1"$2"}') + ')');
                });

                var _data = $.extend.apply($, [true, {}].concat(newViewEvents));

                // 热点推荐单独发送
                if (_data['10']) {
                    L.trackEvent(_dmalog + GJ.jsonEncode({10: _data['10']}).replace(/[\'\" ]+/g, ''));
                    delete _data['10'];
                }

                _dmalog += GJ.jsonEncode(_data).replace(/[\'\" ]+/g, '');
                L.trackEvent(_dmalog);
            }

            ads.sort(function (a, b) {
                return a[0].offset().top < b[0].offset().top ? -1 : 1;
            });

            var adOrder = $.map(ads, function (ad) {
                var gjaddata = ad[1];
                gjaddata = gjaddata.replace(/(\d*):\{(\d*):\{\d*:(.*?)\}\}/g, '$1|$2|$3')
                                   .replace('{', '')
                                   .replace('}', '')
                                   .replace(',', '+');

                return gjaddata;
            });

            if (adOrder.length) {
                (function () {
                    var splice;
                    while(adOrder.length) {
                        splice = adOrder.splice(0, 60);
                        L.trackEvent('/site_tuiguang/trace@atype=show@business=true&gjadorder=' + splice.join(',') + '@seg=' + gjadOrderCount++);
                    }
                })();
            }
        },

        /**
         * 发起pv统计请求
         *
         * @method trackPageView
         * @param {string} dmch 页面属性，也可以通过GJ.LogTracker.dmch指定
         * @return {void}
         * @example
         * <script type="text/javascript">
         * GJ.use('log_tracker', function(){
         *     GJ.LogTracker.dmch = "/wu/jiaju/list@seller=1@deal_type=1@pn=1";
         *     GJ.LogTracker.trackPageView();
         * });
         * </script>
         */
        trackPageView : function(dmch)
        {
            if (pageViewTracked) return false;
            pageViewTracked  = true;
            if (dmch) L.dmch = dmch;

            var org = getOrganicInfo(),
                urls = [
                    L.server + "/bp.gif?dmch=" + (L.getDmch() || '-'),
                    "city=" + getCity(),
                    "from=" + getFrom(),
                    "gc=" + (L.dmchNew || '-'),
                    "uuid=" + (getUuid() || '-'),
                    "reqid=" + reqid,
                    "dmuser=" + getUserID(),
                    "sid=" + getSessionId(),
                    "ca_source=-",
                    "ca_name=-",
                    "ca_kw=-",
                    "ca_id=-",
                    "ca_s=-",
                    "ca_n=-",
                    "ca_i=-",
                    "ca_from=-",
                    "ifid=-",
                    "refer=" + (document.referrer ? _encodeURI(document.referrer) : '-'),
                    "ua=" + initData.uaFormat,
                    "fv=" + initData.flashPlayerVersion,
                    "sc=" + initData.screenFormart,
                    "landing=" + (isLanding ? 1 : 0),
                    "loginfrom=" + getLoginFrom(),
                    "bd_id=" + getBDId(),
                    "company_id=" + getCompanyId(),
                    "related_bd_id=" + getRelatedBdId(),
                    "is_first=" + getIsFirst(),
                    "is_active=" + getIsActive(),
                    "oua=" + getOriginUserAgent()
                ];

            if (L.dmchver){
                urls.push("dmchver=" + L.dmchver);
            }
            postByImg(urls.join('&'));

            var protocol = location.protocol;
            if(protocol != 'https:') {
                urls.shift();
                urls.unshift("dmch=" + (L.getDmch() || '-'));

                var host = location.host;
                var cityArr =host.split(".");
                if(cityArr[0] && cityArr[0] != 'www') {
                    urls.push("city=" + cityArr[0]);
                }
            }

        },

        /**
         * 发起行为统计请求
         *
         * @method trackEvent
         * @param {string} dmalog 行为属性
         * @return {void}
         * @example
         * <script type="text/javascript">
         * GJ.use('log_tracker', function(){
         *     GJ.LogTracker.dmch = "/wu/jiaju/list@seller=1@deal_type=1@pn=1";
         *     GJ.LogTracker.trackEvent("/ppc@atype=view@tels=13800138000&ids=25");
         * });
         * </script>
         */
        trackEvent : function(dmalog, callback)
        {
            var o = E.parseCode(dmalog);
            o.actionType = o.actionTypes[0] || L.ACTION_TYPE_SHOW;
            delete o.actionTypes;
            var t = new E(o);
            t.trackEvent(callback);
        },

        /**
         * 为网页中的链接绑定性能监控动作
         *
         * @method bindSpeedEvent
         * @return {void}
         * @example
         * <script type="text/javascript">
         * GJ.use('log_tracker', function(){
         *     GJ.LogTracker.bindSpeedEvent();
         * });
         * </script>
         * @demo http://sta.doumi.com/src/js/util/log_tracker/sample/speed_parent.html
         */
        bindSpeedEvent : function()
        {
            if (speedEventBinded) return false;
            speedEventBinded = true;

            $('body').click(function(e){
                var $el = $(e.target);
                if ($el[0].tagName != 'A'){
                    $el = $el.parent();
                }
                if (!$el[0] || $el[0].tagName != 'A'){
                    return true;
                }

                var href = $el.attr('href') || '';
                if (!href || /^(#|javascript:)/i.test(href)){
                    return true;
                }
                //记录cookie，60秒后过期
                var d = new Date(), cookieVal = GJ.jsonEncode([href, d.getTime()]);
                GJ.setCookie('_gl_speed', cookieVal, 60);

                return true;
            });
        },

        /**
         * 在打开的页面触发性能监控动作
         * 在页面顶部<head>标签最上面加变量var SPEED_RENDER_BEGIN = new Date().getTime();
         * 在页面底部载入外部js文件前加变量var SPEED_RENDER_END = new Date().getTime();
         * 一共有4个时间提交到接口
         *
         * @method trackSpeedEvent
         * @return {boolean}
         * @example
         * <html>
         * <head>
         * <title>page title</title>
         * <script type="text/javascript">
         * var SPEED_RENDER_BEGIN = new Date().getTime();
         * </script>
         *
         * ...... //<head>区的其他设置
         * </head>
         * <body>
         * ...... //页面内容元素
         *
         * <script type="text/javascript">
         * var SPEED_RENDER_END = new Date().getTime();
         * </script>
         *
         * ...... //载入外部js以及相关功能处理
         *
         * <script type="text/javascript">
         * GJ.use('log_tracker', function(){
         *     GJ.LogTracker.dmch = "/wu/jiaju/list@seller=1@deal_type=1@pn=1";
         *     GJ.LogTracker.trackSpeedEvent();
         * });
         * </script>
         * </body>
         * </html>
         */
        trackSpeedEvent : function(dmch)
        {
            if (speedEventTracked) return false;
            speedEventTracked = true;

            if (dmch) L.dmch = dmch;

            var cookieVal = GJ.getCookie('_gl_speed') || '[]',
                cookieVal = GJ.jsonDecode(cookieVal),
                href = window.location.href,
                s = href.split(cookieVal[0]),
                beginTime = window['SPEED_RENDER_BEGIN'] || 0,
                endTime = window['SPEED_RENDER_END'] || 0,
                random,
                cityDomain=GJ.getCookie('citydomain');

            random = GJ.rand(1, 100);

            if (!cookieVal[0] || s.length != 2 || s[1] != '') {
                return false;
            }

            GJ.removeCookie('_gl_speed');

            if (random != 1 || cookieVal[1] < 1 || beginTime < cookieVal[1] || endTime < beginTime){
                return false;
            }

            //记录CDN、sta以及主站连接性能
            var now = function(){
                    return new Date().getTime();
                };
            var cdnType = GJ.rand(0, 1);
            var imgs = {
                    cdn: [
                        'http://image101.ganjistatic1.com/logo.jpg',
                        "http://image.ganjistatic1.com/logo.jpg"
                    ][cdnType]
                }

            var times = {};
            var imgDefer = $.Deferred();
            var len = 0;

            if (cityDomain) {
                imgs.ms = 'http://'+cityDomain+'.doumi.com/empty.gif?' + GJ.rand(1,99999999);
            }

            $.each(imgs, function () {
                len ++;
            });
            $.each(imgs, function (key, url) {
                var time = +now();
                var defer = $.Deferred();

                // 10s 超时
                var timer = setTimeout(function () {
                    defer.reject();
                }, 10000);

                defer
                    .fail(function () {
                        times[key] = -1;
                    })
                    .always(function () {
                        clearTimeout(timer);

                        len --;
                        if (!len) {
                            imgDefer.resolve();
                        }
                    });

                $(new Image())
                    .error(function () {
                        defer.reject();
                    })
                    .load(function () {
                        times[key] = now() - time;
                        defer.resolve();
                    })
                    .attr('src', url);
            });
            $(window).load(function(){
                var windowLoadTime = now();
                imgDefer
                    .done(function () {
                        var time = [
                            cookieVal[1] || 0, // 点击链接的时间
                            beginTime,         // 开始渲染的时间
                            endTime,           // 结束渲染的时间
                            windowLoadTime,    // 整个外部文件载入完成的时间
                            times.cdn || 0,    // cdn访问时间
                            0,                 // nfs访问时间
                            times.ms || 0      // 主站连接时间
                        ],
                        urls = [
                            L.server + "/s.gif?dmch=" + (L.getDmch() || '-'),
                            "times=" + time.join(','),
                            "cdn=" + (cdnType ? '' : 101)
                        ];
                        postByImg(urls.join('&'));
                    });
            });
        },

        /**
         * 获取帖子浏览次数
         * @method getPvCount
         * @param config
         */
        getPvCount: function(config) {
            var o = GJ.mix({
                textFormat : '&nbsp;&nbsp;该信息被浏览 %s 次 ',
                containerId : '',
                serverUrl   : 'http://analytics.doumi.com/rta/'
            }, config, true);

            var refer = _encodeURI(window.location.href);
            var count = 1; // 默认为1；
            var $container = $('#'+o.containerId);

            if ($container.size() > 0) {
                var url = o.serverUrl + "?dmch="+L.getDmch()+"&refer="+refer+"&callback=?";
                $.getJSON(url)
                    .done(function(data){
                        if (data && data.value) {
                            count = data.value;
                        }
                    })
                    .always(function () {
                        $container.html(o.textFormat.replace('%s', count));
                    });
            }
        },

        /**
         * 触发用户鼠标轨迹统计，每秒统计一次
         * @method trackMouseEvent
         * @param config
         */
        trackMouseEvent : function(o) {
            o = o || {};
            var data = [],
                $doc = $(document),
                time = 0,
                trackCount = 0,
                onClick = function(e){
                    //时间（毫秒）、鼠标点击、鼠标x轴、鼠标y轴
                    data.push([e.timeStamp, 2, e.pageX, e.pageY]);
                },
                onMove = function(e) {
                    if (e.timeStamp - time > 100) {
                        time = e.timeStamp;
                        //时间（毫秒）、鼠标移动、鼠标x轴、鼠标y轴
                        data.push([e.timeStamp, 1, e.pageX, e.pageY]);
                    }
                    if (trackCount >= 5) {
                        $doc.unbind('mousemove', onMove).unbind('click', onClick);
                    }
                },
                timer,
                trackIt = function(){
                    if (trackCount >= 10) {
                        timer.cancel();
                        return;
                    }
                    trackCount++;
                    var rdata = [],
                        dmalog = "/mousevent",
                        vp = GJ.getViewPort();
                    if (data.length > 0) {
                        GJ.each(data, function(v){
                            rdata.push(v.join(','));
                        });
                        data = [];
                    }

                    dmalog += "@view=" + vp.left + "," + vp.top + "," + vp.width + "," + vp.height +
                              "@data=" + rdata.join('|') +
                              "@atype=hover";
                    L.trackEvent(dmalog);
                };

            timer = GJ.later(trackIt, 3000, true);

            $doc.bind('mousemove', onMove).bind('click', onClick);
            GJ.addEvent(window, "unload", function(){
                timer.cancel();
                trackIt();
                $doc.unbind('mousemove', onMove).unbind('click', onClick);
            });
        }
    };

    GJ.BLogTracker = L;

    GJ.BLogTracker.innerFromIdName = 'ifid';
    GJ.BLogTracker.domain = 'doumi.com';

    GJ.addEvent(window, "load", function(){
        GJ.BLogTracker.bindAllTrackEvent();
    });

    //登录退出后的统计
    (function(){
        var loginactInfo = GJ.getCookie('loginact');
        var server = window.PAGE_CONFIG && window.PAGE_CONFIG.logTracker && window.PAGE_CONFIG.logTracker.server ? PAGE_CONFIG.logTracker.server : L.server;
        if (loginactInfo) {
            GJ.removeCookie('loginact');

            try {
                loginactInfo = GJ.jsonDecode(loginactInfo);
                if (loginactInfo && loginactInfo.type) {
                    if (loginactInfo.type == 'Login') {
                        var username = loginactInfo.username ? _encodeURI(loginactInfo.username) : '',
                            email = loginactInfo.email ? _encodeURI(loginactInfo.email) : '',
                            user_id = loginactInfo.user_id ? _encodeURI(loginactInfo.user_id) : '',
                            city = loginactInfo.city ? _encodeURI(loginactInfo.city) : '',
                            gender = loginactInfo.gender ? _encodeURI(loginactInfo.gender) : '',
                            jiaoyou = loginactInfo.jiaoyou ? 1 : 0,
                            is_register = loginactInfo.is_register ? 1 : 0,
                            org = getOrganicInfo(),
                            urls = [
                                server + "/be.gif?dmch=/user/login@user_id="+user_id+"@username="+username+"@email="+email+"@city="+city+"@gender="+gender+"@jiaoyou="+jiaoyou+"@is_register="+is_register,
                                "dmalog=-",
                                "uuid=" + (getUuid() || '-'),
                                "sid=" + getSessionId(),
                                "ca_source=" + (org[0] || '-'),
                                "ca_name=" + (org[1] || '-'),
                                "ca_kw=" + (org[2] || '-'),
                                "ca_id=" + (org[3] || '-'),
                                "ca_i=" + (org[6] || '-'),
                                "ca_from=" + (org[7] || '-'),
                                "loginfrom=" + getLoginFrom(),
                                "bd_id=" + getBDId(),
                                "company_id=" + getCompanyId(),
                                "related_bd_id=" + getRelatedBdId(),
                                "is_first=" + getIsFirst(),
                                "is_active=" + getIsActive(),
                                "oua=" + getOriginUserAgent(),
                                "ifid=" + (getInnerFromId() || '-'),
                                "label=" + ('-'),
                                "r=" + counter++
                            ];

                        if (L.dmchver){
                            urls.push("dmchver=" + L.dmchver);
                        }

                        postByImg(urls.join('&'));
                    } else if (loginactInfo.type == 'Logout') {
                        var username = loginactInfo.username ? _encodeURI(loginactInfo.username) : '',
                            email = loginactInfo.email ? _encodeURI(loginactInfo.email) : '',
                            user_id = loginactInfo.user_id ? _encodeURI(loginactInfo.user_id) : '',
                            org = getOrganicInfo(),
                            urls = [
                                server + "/be.gif?dmch=/user/logout@user_id="+user_id+"@username="+username+"@email="+email,
                                "dmalog=-",
                                "uuid=" + (getUuid() || '-'),
                                "sid=" + getSessionId(),
                                "ca_source=" + (org[0] || '-'),
                                "ca_name=" + (org[1] || '-'),
                                "ca_kw=" + (org[2] || '-'),
                                "ca_id=" + (org[3] || '-'),
                                "ca_i=" + (org[6] || '-'),
                                "ca_from=" + (org[7] || '-'),
                                "loginfrom=" + getLoginFrom(),
                                "bd_id=" + getBDId(),
                                "ifid=" + (getInnerFromId() || '-'),
                                "label=" + ('-'),
                                "r=" + counter++,
                                "company_id=" + getCompanyId(),
                                "related_bd_id=" + getRelatedBdId(),
                                "is_first=" + getIsFirst(),
                                "is_active=" + getIsActive(),
                                "oua=" + getOriginUserAgent()
                            ];

                        if (L.dmchver){
                            urls.push("dmchver=" + L.dmchver);
                        }

                        postByImg(urls.join('&'));
                    }
                }
            }
            catch (e) { }
        }
    })();
});
