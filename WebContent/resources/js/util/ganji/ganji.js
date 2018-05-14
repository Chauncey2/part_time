/**
 * Created by DELL on 2018/5/10/010.
 */
/**
 * Ganji UI Library����ģ��.
 * ʹ��ȫ�ֱ���GJ��Ϊ�����ռ䣬���԰�װ�������Ӧ��.
 * @module ganji
 * @file js/util/ganji/ganji.js
 * @author lwg_8088@yahoo.com.cn
 * @version 2010-01-05
 */

var GJ = window.GJ || {},
    __GJ_CONFIG__ = window.__GJ_CONFIG__ || {};

(function() {
    var win = window,
        doc = win.document;
    if (win.__GJ_LOADED__) {
        return;
    }
    win.__GJ_LOADED__ = true;

    /**
     * ���ñ���.
     * ������
     * <ul>
     *     <li><strong>debug</strong> &nbsp; &nbsp; �Ƿ���ԡ����Ϊtrue��ʹ��δѹ����δ�ϲ����ļ���</li>
     *     <li><strong>rootDir</strong> &nbsp; &nbsp; ��Ŀ¼����debugΪtrueʱ��'src/'������Ϊ'public/'</li>
     *     <li><strong>addVersion</strong> &nbsp; &nbsp; �Ƿ���Ӱ汾�š�</li>
     *     <li><strong>useCombine</strong> &nbsp; &nbsp; �Ƿ�ʹ�úϲ��ļ���</li>
     *     <li><strong>cookieDomain</strong> &nbsp; &nbsp; ����cookieʱ����Ĭ��Ϊ'ganji.com
     '��</li>
     *     <li><strong>iframeProxyUrl</strong> &nbsp; &nbsp; ʹ�ÿ���iframeʱ�Ĵ����ļ���Ĭ��Ϊ'/iframeproxy.html'�����ļ�Ҫ���ڸ�����ͬ��ĸ�Ŀ¼�¡�</li>
     *     <li><strong>defaultServer</strong> &nbsp; &nbsp; ��̬�ļ�����Ĭ��������Ĭ��ֵ'sat.ganji.com'</li>
     *     <li><strong>servers</strong> &nbsp; &nbsp; ��̬�ļ���������������</li>
     *     <li><strong>fileVersions</strong> &nbsp; &nbsp; �ļ��汾����Ϣ��</li>
     *     <li><strong>fileCombines</strong> &nbsp; &nbsp; �ϲ��ļ���Ӧ��Ϣ��</li>
     *     <li><strong>fileCodes</strong> &nbsp; &nbsp; �ļ����ļ�����š�</li>
     *
     * </ul>
     * @property GJ.config
     * @static
     * @type object
     */
    GJ.config = {
        debug: false,
        rootDir: '', //debug == true ? 'src/' : 'public/'
        addVersion: false,
        useCombine: false, //debugΪtrueʱֻ����false
        cookieDomain: 'doumi.com',
        documentDomain: 'doumi.com',
        iframeProxyUrl: '/iframeproxy.html', //����iframe����ʱ�Ĵ����ļ���������ڵ�ǰ����
        defaultServer: 'sta.doumi.com',
        servers: ["sta.doumi.com"],
        fileVersions: {},
        fileCombines: {},
        fileCodes: {
            autocomplete: '/js/util/autocomplete/autocomplete.js',
            jquery: "js/util/jquery/jquery-1.7.2.js",
            jquery_ui: "js/util/jquery/jquery.ui.js",
            util: "js/util/ganji/util.cmb.js",
            json: "js/util/json/json.js",
            log_tracker: "js/util/log_tracker/log_tracker_simple.js",
            blog_tracker: "js/util/log_tracker/blogtracker.js",
            iframe: ["jquery", "js/util/iframe/iframe.js"],
            panel: ["js/util/panel/panel.css", "iframe", "js/util/dragdrop/dragdrop.js", "js/util/panel/panel.js"],
            flash: ["jquery", "js/util/swfobject/swfobject-2.2.js", "js/util/swfobject/swfloader.js"],
            talk_to_parent: ["jquery", "js/util/window_name/window_name.js", "js/util/iframe/talk_to_parent.js"]
        },
        cdnFiles: {
            'tool/webim/js/webim.cmb.js': 1,
            'tool/webim_v2/js/webim.cmb.js': 1
        }
    };

    /**
     * �Ѿ���������������js��css�ļ���
     * �±�Ϊurl��ֵΪ1��ʾ�������룬Ϊ2��ʾ�������
     * @property GJ.loadedFiles
     * @static
     * @type object
     */
    GJ.loadedFiles = {};

    /**
     * ������־����־������
     *
     * @params <type> {string} type ֵ(������)
     * @params <message> {string} ����(������)
     */
    GJ.tralog = function(type, message) {
        var img = new Image();
        if (GJ.config.debug) {
            return;
        }

        img.src = 'http://tralog.ganji.com/sta/log.gif?' + [
                't=' + type,
                'm=' + message
            ].join('&');
    };

    //���������ж�
    (function() {
        var TYPES = {
                'undefined': 'undefined',
                'number': 'number',
                'boolean': 'boolean',
                'string': 'string',
                '[object Function]': 'function',
                '[object RegExp]': 'regexp',
                '[object Array]': 'array',
                '[object Date]': 'date',
                '[object Error]': 'error'
            },
            L = {
                /**
                 * �ж�һ�������ǲ�������.
                 * @method GJ.isArray
                 * @static
                 * @param o �������Եı���
                 * @return {boolean} ��������鷵��true
                 */
                isArray: function(o) {
                    return L.typeOf(o) === 'array';
                },

                /**
                 * �ж�һ�������ǲ��ǲ���ֵ.
                 * @method GJ.isBoolean
                 * @static
                 * @param o �������Եı���
                 * @return {boolean} ����ǲ���ֵ����true
                 */
                isBoolean: function(o) {
                    return typeof o === 'boolean';
                },

                /**
                 * �ж�һ�������ǲ��Ǻ���.
                 * @method GJ.isFunction
                 * @static
                 * @param o �������Եı���
                 * @return {boolean} ����Ǻ�������true
                 */
                isFunction: function(o) {
                    return L.typeOf(o) === 'function';
                },

                /**
                 * �ж�һ�������ǲ�������.
                 * @method GJ.isDate
                 * @static
                 * @param o �������Եı���
                 * @return {boolean} ��������ڷ���true
                 */
                isDate: function(o) {
                    return L.typeOf(o) === 'date';
                },

                /**
                 * �ж�һ�������ǲ���null.
                 * @method GJ.isNull
                 * @static
                 * @param o �������Եı���
                 * @return {boolean} �����null����true
                 */
                isNull: function(o) {
                    return o === null;
                },

                /**
                 * �ж�һ�������ǲ�������.
                 * @method GJ.isNumber
                 * @static
                 * @param o �������Եı���
                 * @return {boolean} ��������ַ���true
                 */
                isNumber: function(o) {
                    return typeof o === 'number' && isFinite(o);
                },

                /**
                 * �ж�һ�������ǲ��Ƕ���.
                 * @method GJ.isObject
                 * @static
                 * @param o �������Եı���
                 * @param failfn {boolean} �����Ϊtrue����������������Ĭ��ֵ��false
                 * @return {boolean} ����Ƕ��󷵻�true
                 */
                isObject: function(o, failfn) {
                    return (o && (typeof o === 'object' || (!failfn && L.isFunction(o)))) || false;
                },

                /**
                 * �ж�һ�������ǲ����ַ���.
                 * @method GJ.isString
                 * @static
                 * @param o �������Եı���
                 * @return {boolean} ������ַ�������true
                 */
                isString: function(o) {
                    return typeof o === 'string';
                },

                /**
                 * �ж�һ�������ǲ���δ���塣
                 * ֻ���ж�һ�������Ԫ�أ������ǵ����ı�������:
                 * if (GJ.isUndefined(window.name)){
                 *     ...
                 * }
                 * @method GJ.isUndefined
                 * @static
                 * @param o �������Եı���
                 * @return {boolean} �����δ���巵��true
                 */
                isUndefined: function(o) {
                    return typeof o === 'undefined';
                },

                /**
                 * �ж�һ�������Ƿ���null/undefined/NaN.
                 * @method GJ.isValue
                 * @static
                 * @param o �������Եı���
                 * @return {boolean} �������null/undefined/NaN����true
                 */
                isValue: function(o) {
                    var t = L.typeOf(o);
                    switch (t) {
                        case 'number':
                            return isFinite(o);
                        case 'null':
                        case 'undefined':
                            return false;
                        default:
                            return !!(t);
                    }
                },

                /**
                 * ���һ������������.
                 * @method GJ.typeOf
                 * @static
                 * @param o �������ı���
                 * @return {string} ���ر���������
                 */
                typeOf: function(o) {
                    return TYPES[typeof o] || TYPES[Object.prototype.toString.call(o)] || (o ? 'object' : 'null');
                }
            };

        /**
         * �ϲ���������
         * ������supplies�����Ԫ�غϲ�������receive������
         * @method GJ.mix
         * @static
         * @param {object} receive Դ����
         * @param {object} supplies �����ϲ���receive�еĶ���
         * @param {boolean} overwritten �����Ϊtrue��supplies�е�Ԫ�ؽ��滻receive�е�ͬ��Ԫ�أ�Ĭ��ֵΪfalse
         * @param {boolean} recursion �Ƿ�ݹ飬Ĭ��ֵΪfalse
         * @return {object} ����receive���������
         */
        GJ.mix = function(r, s, ov, rec) {
            if (L.isObject(r) && L.isObject(s)) {
                for (var i in s) {
                    if (s.hasOwnProperty(i)) {
                        if (!(i in r)) {
                            r[i] = s[i];
                        } else if (ov) {
                            if (rec && L.isObject(r[i], true) && L.isObject(s[i], true)) {
                                GJ.mix(r[i], s[i], ov, rec);
                            } else {
                                r[i] = s[i];
                            }
                        }
                    }
                }
            }
            return r;
        };

        GJ.mix(GJ, L, true);
    })();

    /**
     * ������������飬��ÿ��Ԫ��Ӧ�ûص�������
     * @method GJ.each
     * @static
     * @param {object|array} o Ҫ�����Ķ��������
     * @param {Function} callback �ص���������Ϊ�˺�����������������valԪ��ֵ��keyԪ���±ꡣ
     * �ں����ڲ�ʹ��return false������ֹ�ݻ�
     */
    GJ.each = function(o, cb) {
        if (GJ.isFunction(cb)) {
            var i, n, r;
            if (GJ.isArray(o)) {
                for (i = 0, n = o.length; i < n; i++) {
                    r = cb(o[i], i);
                    if (r === false) break;
                }
            } else if (GJ.isObject(o)) {
                for (i in o) {
                    if (o.hasOwnProperty(i)) {
                        r = cb(o[i], i);
                        if (r === false) break;
                    }
                }
            }
        }
    };
    GJ.map = function(arr, cb) {
        var ret = [];
        GJ.each(arr, function(v, i) {
            ret.push(cb(v, i));
        });
        return ret;
    }
    GJ.inArray = function(v, arr) {
        var index = -1;
        GJ.each(arr, function(a, i) {
            if (a === v) {
                index = i;
                return false;
            }
        });
        return index;
    }

    /**
     * �������ñ�����
     * ������ʹ�÷�����GJ.setConfig(config)��GJ.setConfig(key, val)
     * @method GJ.setConfig
     * @static
     * @param {object} config �������ݶ���
     */
    GJ.setConfig = function(config) {
        var a = arguments,
            cfg = GJ.config;
        if (a.length == 2) {
            var o = {};
            o[a[0]] = a[1];
            GJ.setConfig(o);
        } else {
            GJ.each(config, function(v, k) {
                if (GJ.isObject(cfg[k])) {
                    GJ.mix(cfg[k], v, true);
                } else cfg[k] = v;
            });
        }

        cfg.rootDir = cfg.debug ? 'src/' : 'public/';
        if (cfg.debug) cfg.useCombine = false;
    };

    (function() {
        if (!window.__GJ_PACK_CONFIG__) return;

        var ret = [],
            o = window.__GJ_PACK_CONFIG__,
            getVal = function(val) {
                if (GJ.isNumber(val)) {
                    return ret[val];
                } else {
                    var r = [];
                    GJ.each(val, function(v, k) {
                        r.push(ret[val[k]]);
                    });
                    return r;
                }
            },
            parseIt = function(val, type) {
                var r = {};
                GJ.each(val, function(v, k) {
                    if (type == 1) {
                        r[ret[k]] = v;
                    } else if (type == 2) {
                        r[ret[k]] = getVal(v);
                    } else if (type == 3) {
                        r[k] = getVal(v);
                    }
                });
                return r;
            };

        GJ.each(o.words, function(v, k) {
            var s = v.split('|');
            ret[k] = s[1] ? ret[s[0]] + s[1] : s[0];
        });
        o.fileVersions = parseIt(o.fileVersions, 1);
        o.fileCombines = parseIt(o.fileCombines, 2);
        o.fileCodes = parseIt(o.fileCodes, 3);
        delete o.words;

        GJ.setConfig(o);
    })();

    GJ.setConfig(__GJ_CONFIG__);

    /**
     * ȡ�ô�from(��from)��to(��to)�������������
     * @method GJ.rand
     * @static
     * @param {int} from ��ʼ����
     * @param {int} to ��������
     * @return {int} �������ɵ������
     */
    GJ.rand = function(from, to) {
        return parseInt(Math.random() * (to - from + 1) + from);
    };

    (function() {
        var count = 0;
        /**
         * ȡ��һ�������sta*.ganji.com��
         * @method GJ.getRandServer
         * @static
         * @return {string} ����ganji_sta������
         */
        GJ.getRandServer = function() {
            var servers = GJ.config.servers;
            return servers[count++ % servers.length];
        };
    })();

    /**
     * ���������ռ䡣
     * ����ͬʱ���ö�������ռ䣬ÿ�������ռ�����Ƕ༶��
     * @method GJ.namespace
     * @static
     * @param {string} o* һ����������
     * @example GJ.namespace('util', 'widget.image');
     */
    GJ.namespace = function() {
        var a = arguments,
            o = null,
            i, n, j, k, d;
        for (i = 0, n = a.length; i < n; i++) {
            d = a[i].split(".");
            o = GJ;

            for (j = (d[0] == "GJ") ? 1 : 0, k = d.length; j < k; j++) {
                o[d[j]] = o[d[j]] || {};
                o = o[d[j]];
            }
        }
        return o;
    };
    GJ.namespace('util', 'apps', 'widget', 'common');

    (function() {
        var _copyFunctions = function(ret, o) {
                GJ.each(o, function(v, k) {
                    if (GJ.isFunction(v)) {
                        ret[k] = function(_v) {
                            return function() {
                                return _v.apply(o, arguments);
                            }
                        }(v);
                    }
                });
            },
            _fromObj = { '**SYS_FROM_INSIDE**': true };

        GJ.f = function(params, cb) {
            if (arguments.length === 1) {
                cb = params;
                params = {};
            }

            var __const = params.__const || {},
                __extends = params.__extends || null;

            function func(_ret, _protected, _from) {
                var isEntry = !_from || !_from['**SYS_FROM_INSIDE**'],
                    ret = isEntry ? {} : _ret,
                    _protec = isEntry ? {} : _protected,
                    parent = null;

                if (__extends) {
                    if (GJ.isArray(__extends)) {
                        for (var i = 0, n = __extends.length; i < n; i++) {
                            if (GJ.isFunction(__extends[i])) {
                                __extends[i](ret, _protec, _fromObj);
                            }
                        }
                    } else if (GJ.isFunction(__extends)) {
                        __extends(ret, _protec, _fromObj);
                    }

                    parent = {};
                    _copyFunctions(parent, ret);
                }

                if (GJ.isFunction(cb)) {
                    var conf = cb.apply(ret, [_protec, parent]);
                    if (GJ.isObject(conf)) {
                        GJ.mix(ret, conf, true);
                    }
                }

                if (isEntry) {
                    if (ret.__construct) {
                        ret.__construct.apply(ret, arguments);
                        delete ret.__construct;
                    }
                }

                return ret;
            }

            if (params.__static) {
                GJ.mix(func, params.__static, true);
            }

            func.getConst = function(k) {
                return __const[k] || null;
            }

            return func;
        };
    })();

    /**
     * ʵ����ļ̳С�
     * @method GJ.extend
     * @static
     * @param {class} r ��ǰ��
     * @param {class} s ����
     * @param {class} px Ҫ��ӵĳ�Ա����
     * @param {class} sx Ҫ��ӵľ�̬����
     */
    GJ.extend = function(r, s, px, sx) {
        if (!s || !r) {
            alert("extend failed, verify dependencies");
        }

        var sp = s.prototype,
            F = function() {};
        F.prototype = sp;
        var rp = new F();

        r.prototype = rp;
        rp.constructor = r;
        r.superclass = sp;

        if (s != Object && sp.constructor == Object.prototype.constructor) {
            sp.constructor = s;
        }

        if (px) {
            GJ.mix(rp, px, true);
        }

        if (sx) {
            GJ.mix(r, sx, true);
        }
    };

    /**
     * ����һ���ࡣ
     * �������÷���<br />
     * 1��GJ.createClass(parentClass, prototypeObject, staticObject);<br />
     * 2��GJ.createClass(prototypeObject, staticObject);<br />
     * 3��GJ.createClass(prototypeObject);<br />
     * ����parentClass��ʾ���࣬prototypeObject�ǳ�Ա������staticObject�Ǿ�̬����<br />
     * ����prototypeObject��Ӧ���±�Ϊinit�ĺ�����Ϊ���캯��
     *
     * @method GJ.createClass
     * @static
     * @param {object} args* ���ࡢ��Ա��������̬����
     * @return {class} ���ش�������
     * @example
     * <script type="text/javascript">
     * GJ.createClass({
     *     init : function(){},
     *     ...
     * });
     * </script>
     */
    GJ.createClass = function() {
        var a = arguments,
            l = a.length;

        function F() {
            this.__inited__ = false;

            if (F.superclass) {
                F.superclass.constructor.apply(this, arguments);
            }

            if (!this.__inited__ && this.init && GJ.isFunction(this.init)) {
                var ret = this.init.apply(this, arguments);
                this.__inited__ = true;
                if (GJ.isObject(ret)) return ret;
            }
        }

        if (GJ.isFunction(a[0])) {
            GJ.extend(F, a[0], a[1] || null, a[2] || null);
        } else {
            if (a[0]) {
                F.prototype = a[0];
            }
            if (a[1]) {
                GJ.mix(F, a[1], true);
            }
        }

        return F;
    };

    (function() {
        var guid_counter = 0;
        /**
         * ȡ��һ�����ظ�������ַ���
         * @method GJ.guid
         * @static
         * @param {string} pre ǰ׺ Ĭ��Ϊ"guid_"
         * @return {string}
         */
        GJ.guid = function(pre) {
            var r = new Date().getTime() + '' + Math.random();
            return (pre ? pre : 'guid_') + guid_counter++ + '_' + r.replace(/\./g, '_');
        }

        var cacheData = {};
        /**
         * ����id��ȡ�û������
         * @method GJ.getCache
         * @static
         * @param {string} id ������������id��
         * @return {object}
         */
        GJ.getCache = function(id) {
            return !GJ.isUndefined(cacheData[id]) ? cacheData[id] : null;
        };
        /**
         * ��һ���ֲ��������뻺�棬�Ա�ͨ��GJ.getCache(id)��ȡ
         * �������÷���<br />
         * 1��ֱ�ӽ��������뻺�棬������id�š��磺var id = GJ.setCache(val);<br />
         * 2�����������뻺���ͬʱ��ָ��id�š��磺GJ.setCache(id, val);
         * @method GJ.setCache
         * @static
         * @param {string} id ������������id��
         * @param {object} data Ҫ�洢�ı���
         * @return {string} ���ع�����������id��
         */
        GJ.setCache = function(id, data) {
            if (arguments.length == 1) {
                data = id;
                id = GJ.guid();
            }
            cacheData[id] = data;
            return id;
        };
        /**
         * ����id���Ƴ��������
         * @method GJ.removeCache
         * @static
         * @param {string} id ������������id��
         * @return {void}
         */
        GJ.removeCache = function(id) {
            if (!GJ.isUndefined(cacheData[id])) {
                delete cacheData[id];
            }
        };
        /**
         * ��ջ�������
         * @method GJ.clearCache
         * @static
         * @return {void}
         */
        GJ.clearCache = function() {
            cacheData = {};
        };
    })();

    /**
     * ����cookie����ȡ��cookieֵ
     * @method GJ.getCookie
     * @static
     * @param {string} name cookie����
     * @return {string}
     */
    GJ.getCookie = function(name) {
        var doc = document,
            val = null,
            regVal;

        if (doc.cookie) {
            regVal = doc.cookie.match(new RegExp("(^| )" + name + "=([^;]*)(;|$)"));
            if (regVal != null) {
                val = decodeURIComponent(regVal[2]);
            }
        }

        return val;
    };

    /**
     * ����cookie
     * @method GJ.setCookie
     * @static
     * @param {string} name cookie����
     * @param {string} value cookieֵ
     * @param {int} expire ����ʱ��(��)��Ĭ��Ϊ��
     * @param {string} path ·����Ĭ��Ϊ��
     * @param {string} domain ��
     * @return {boolean} ���óɹ�����true
     */
    GJ.setCookie = function(name, value, expire, path, domain, s) {
        if (GJ.isUndefined(document.cookie)) {
            return false;
        }

        expire = !GJ.isNumber(expire) ? 0 : parseInt(expire);
        if (expire < 0) {
            value = '';
        }

        var dt = new Date();
        dt.setTime(dt.getTime() + 1000 * expire);

        document.cookie = name + "=" + encodeURIComponent(value) +
            ((expire) ? "; expires=" + dt.toGMTString() : "") +
            "; path=" + (path || '/') +
            "; domain=" + (domain || GJ.config.cookieDomain) +
            ((s) ? "; secure" : "");

        return true;
    };

    /**
     * �Ƴ�cookie
     * @method GJ.removeCookie
     * @static
     * @param {string} name cookie����
     * @param {string} path ·����Ĭ��Ϊ��
     * @param {string} domain ��
     * @return {boolean} �Ƴ��ɹ�����true
     */
    GJ.removeCookie = function(name, path, domain) {
        return GJ.setCookie(name, '', -1, path, domain);
    };

    /**
     * �׳�������ʾ
     * @method GJ.error
     * @static
     * @param {string} msg ��ʾ��Ϣ
     * @return {void}
     */
    GJ.error = function(msg) {
        throw new Error(msg);
    };

    /**
     * ͨ��firebug��ʾ������Ϣ
     * @method GJ.log
     * @static
     * @param {object} data Ҫ���Ե�����
     * @return {void}
     */
    GJ.log = function(data) {
        //if (GJ.isFunction(GJ.jsonEncode)){
        //    data = GJ.jsonEncode(data, '    ');
        //}

        if (typeof console != 'undefined' && console.log) {
            console.log(data);
        } else if (typeof opera != 'undefined') {
            opera.postError(data);
        }
    };

    /**
     * �ӳٶ�ʱִ�лص�����
     * �Ƕ�setTimeout()��setInterval()�İ�װ
     * @method GJ.later
     * @static
     * @param {Function} fn �ص�����
     * @param {int} when �ӳٺ�����
     * @param {boolean} loop �Ƿ�ѭ����Ĭ��Ϊfalse
     * @return {object} ����һ������ͨ���˶����cancel()����������ȡ����ʱ��
     * @example
     * <script type="text/javascript">
     * var i = 0, timer;
     * timer = GJ.later(function(){
     *     alert(i);
     *     i++;
     *     if (i == 10) timer.cancel();
     * }, 2000, true);
     * </script>
     */
    GJ.later = function(fn, when, loop) {
        when = when || 0;
        var r = null,
            run = function() {
                r = r || (loop) ? setInterval(fn, when) : setTimeout(fn, when);
            };
        run();

        return {
            run: run,
            cancel: function() {
                if (r) {
                    if (loop) {
                        clearInterval(r);
                    } else {
                        clearTimeout(r);
                    }
                    r = null;
                }
            }
        };
    };

    /**
     * �Ⱥ�����Ϊ����ִ�лص�����
     * @method GJ.waiter
     * @static
     * @param {Function} check ��������Ƿ�Ϊ��ĺ������Ƿ���õı���
     * @param {Function} callback �ص�����
     * @param {int} speed �����������Ĭ��Ϊ100��ÿ���speed������һ��
     * @param {int} expire ����ʱ��(��)��Ĭ��Ϊ10��
     * @return {void}
     * @example
     * <script type="text/javascript">
     * GJ.waiter(function(){
     *     return !!window.jQuery;
     * }, function(){
     *     $('#id').html('Hello World!');
     * });
     *
     * var check = function(){
     *     return !GJ.isUndefined(window.jQuery);
     * };
     * GJ.waiter(check, function(){
     *     $('#id').html('Hello World!');
     * });
     * </script>
     */
    GJ.waiter = function(check, callback, speed, expire) {
        if (!GJ.isFunction(check) || !GJ.isFunction(callback)) {
            return;
        }

        var _speed = speed || 100,
            _time = 0,
            expire = (expire || 10) * 1000,
            _run = function(ck, cb) {
                if (ck()) {
                    cb();
                    return;
                }
                _time += _speed;
                if (!expire || _time < expire) {
                    GJ.later(function() {
                        _run(ck, cb);
                    }, _speed);
                }
            };

        _run(check, callback);
    };

    /**
     * ΪԪ�ذ��¼�
     * @event GJ.addEvent
     * @static
     * @param {object} el Ҫ���¼�����ҳԪ��
     * @param {string} type �¼��������ƣ���click
     * @param {Function} func Ҫ�󶨵��¼�����
     * @return {void}
     */
    GJ.addEvent = function(el, type, fn) {
        if (el.addEventListener) {
            el.addEventListener(type, fn, false);
        } else if (el.attachEvent) {
            el.attachEvent("on" + type, fn);
        }
    };

    /**
     * ΪԪ���Ƴ��¼���
     * @event GJ.removeEvent
     * @static
     * @param {object} el Ҫ�Ƴ��¼��󶨵���ҳԪ��
     * @param {string} type �¼��������ƣ���click
     * @param {Function} func Ҫ�Ƴ����¼�����
     * @return {void}
     */
    GJ.removeEvent = function(el, type, fn) {
        if (el.removeEventListener) {
            el.removeEventListener(type, fn, false);
        } else if (el.detachEvent) {
            el.detachEvent("on" + type, fn);
        }
    };

    (function() {
        var win = window,
            doc = document,
            domIsReady = false,
            domReadyQueue = [],
            readyState,
            isRunning = false,
            dom_onReady = function() {
                if (isRunning) return;
                isRunning = true;
                dom_onReady = Function.prototype;
                domIsReady = true;
                for (var i = 0; i < domReadyQueue.length; i++) {
                    domReadyQueue[i]();
                }
                domReadyQueue.length = 0;
                isRunning = false;
            };

        if ("readyState" in doc) {
            readyState = doc.readyState;
            domIsReady = readyState == "complete" || (~navigator.userAgent.indexOf('AppleWebKit/') && (readyState == "loaded" || readyState == "interactive"));
        } else {
            domIsReady = !!doc.body;
        }

        if (!domIsReady) {
            if (win.addEventListener) {
                doc.addEventListener("DOMContentLoaded", dom_onReady, false);
            } else {
                doc.attachEvent("onreadystatechange", function() {
                    if (doc.readyState == "complete") {
                        dom_onReady();
                    }
                });
                if (doc.documentElement.doScroll && win === top) {
                    (function doScrollCheck() {
                        if (domIsReady) {
                            return;
                        }
                        try {
                            doc.documentElement.doScroll("left");
                        } catch (e) {
                            setTimeout(doScrollCheck, 1);
                            return;
                        }
                        dom_onReady();
                    }());
                }
            }

            GJ.addEvent(win, "load", dom_onReady);
        }

        /**
         * ҳ���������ʱ�������¼�
         * @event GJ.onDomReady
         * @static
         * @param {Function} func �ص�����
         * @return {void}
         */
        GJ.onDomReady = function(fn, scope) {
            if (domIsReady) {
                fn.call(scope);
                return;
            }
            domReadyQueue.push(function() {
                fn.call(scope);
            });
        };
    })();

    // ������
    (function() {
        GJ.errorStack = [];
        var willSend = !GJ.config.debug && parseInt(Math.random() * 51) === 1;
        var flushedLen = 0;

        GJ.wrap = function(wrapper, fn) {
            if (typeof fn === 'function' && /^function/.test(fn.toString())) {
                return wrapper(fn);
            }

            return fn;
        }

        GJ.guard = function(target, prefix) {
            return function() {
                try {
                    return target.apply(this, arguments);
                } catch (ex) {
                    try {
                        GJ.errorStack.push({
                            'type': prefix || 'GJ_GUARD',
                            'message': ex.message || ex.toString(),
                            'stack': ex.stack,
                            'fn': target.toString().substr(0, 200)
                        });
                    } catch (exx) {}

                    throw ex;
                }
            }
        }

        GJ.goTry = function(prefix, fn) {
            return GJ.guard(fn, prefix);
        }

        var timer;
        GJ.errorManager = {
            send: function(msg, loc, type) {
                GJ.errorStack.push({
                    type: type,
                    message: msg,
                    loc: loc
                });
                clearTimeout(timer);
                timer = setTimeout(sendLog, 3000);
            }
        };

        function sendLog() {
            if (!willSend) {
                return;
            }
            if (flushedLen === GJ.errorStack.length) {
                return;
            }

            GJ.use('jquery', function($) {
                flushedLen = GJ.errorStack.length;
                $.ajax({
                    url: '/jslogs.php',
                    type: 'POST',
                    data: {
                        'data': GJ.jsonEncode({
                            'stack': GJ.errorStack,
                            'url': window.location.href,
                            'referrer': document.referrer
                        })
                    },
                    error: function() {
                        GJ.use('log_tracker', function() {
                            GJ.LogTracker.trackEvent("javascript@atype=view" +
                                "@LOC=" + encodeURIComponent(window.location.href) +
                                "@ERR=" + encodeURIComponent("jslogs interface is not reachable!") +
                                "@TYPE=" + encodeURIComponent("JSLOG_NOT_REACHABLE")
                            );
                        });
                    }
                });
            });
        }
    })();

    + function() {
        GJ.Deferred = function() {
            // state in ['pending', 'done', 'fail']
            var state = "pending";
            var callbacks = {
                'done': [],
                'fail': [],
                'always': []
            };
            // `args` will be the `arguments` of callbacks
            var args = [];

            function dispatch(status, cb) {
                if (typeof cb === 'function') {
                    if (state === status || (status === 'always' && state !== 'pending')) {
                        setTimeout(function() {
                            cb.apply({}, args);
                        }, 0);
                    } else {
                        callbacks[status].push(cb);
                    }
                } else if (state === 'pending') { // only 'pending' can change to 'done' or 'fail'
                    state = status;
                    var cbs = callbacks[status];
                    var always = callbacks['always'];

                    while ((cb = cbs.shift()) || (cb = always.shift())) {
                        setTimeout((function(fn) {
                            return function() {
                                fn.apply({}, args);
                            }
                        })(cb), 0);
                    }
                }
            };

            return {
                state: function() {
                    return state;
                },
                done: function(cb) {
                    if (typeof cb === 'function') {
                        dispatch('done', cb);
                    } else {
                        args = [].slice.call(arguments);
                        dispatch('done');
                    }
                    return this;
                },
                fail: function(cb) {
                    if (typeof cb === 'function') {
                        dispatch('fail', cb);
                    } else {
                        args = [].slice.call(arguments);
                        dispatch('fail');
                    }
                    return this;
                },
                always: function(cb) {
                    if (typeof cb === 'function') {
                        dispatch('always', cb);
                    }
                    return this;
                },
                promise: function() {
                    return {
                        done: function(cb) {
                            if (typeof cb === 'function') {
                                dispatch('done', cb);
                            }
                            return this;
                        },
                        fail: function(cb) {
                            if (typeof cb === 'function') {
                                dispatch('fail', cb);
                            }
                            return this;
                        },
                        always: function(cb) {
                            if (typeof cb === 'function') {
                                dispatch('always', cb);
                            }
                            return this;
                        },
                        state: function() {
                            return state;
                        }
                    }
                }
            };
        };

        GJ.when = function() {
            var ret = GJ.Deferred(),
                defers = [].slice.call(arguments),
                len = defers.length,
                count = 0;
            if (!len) {
                return ret.done().promise();
            }
            for (var i = defers.length - 1; i >= 0; i--) {
                defers[i].fail(function() {
                    ret.fail();
                }).done(function() {
                    if (++count === len) {
                        ret.done();
                    }
                });
            };
            return ret.promise();
        }
    }();
    // GJ.Module
    + function() {
        var headNode = document.getElementsByTagName("head")[0],
            cfg = GJ.config;
        var versions = cfg.fileVersions,
            alias = cfg.fileCodes,
            combines = cfg.fileCombines;
        var debug = GJ.config.debug ? true : false;
        var defers = {};
        var eventList = [];
        var startTime = +new Date;

        GJ.defers = defers;
        GJ.eventList = eventList;
        var STATUS = {
            'ERROR': -2,
            'FAILED': -1,
            'FETCHING': 1, // The module file is fetching now.
            'FETCHED': 2, // The module file has been fetched.
            'SAVED': 3, // The module info has been saved.
            'READY': 4, // The module is waiting for dependencies
            'COMPILING': 5, // The module is in compiling now.
            'PAUSE': 6,
            'COMPILED': 7 // The module is compiled and module.exports is available.
        }
        var require = function(uri) {
            uri = require.resolve(uri)[0];
            if (require.cache[uri] && require.cache[uri].status === STATUS.COMPILED) {
                return require.cache[uri].exports;
            } else {
                throw new Error(uri + '��δ����');
            }
        }
        require.resolve = function(uri) { // �������������Ϊһ��uri����
            var ret = [];
            if (alias[uri]) {
                if (typeof alias[uri] === 'string') {
                    alias[uri] = [alias[uri]];
                }
                GJ.each(alias[uri], function(u) {
                    GJ.each(require.resolve(u), function(i) {
                        ret.push(i);
                    });
                });
            } else {
                ret.push(uri);
            }
            return ret;
        }
        require.cache = {};

        GJ.Module = {
            STATUS: STATUS,
            cache: require.cache,
            fileLoaders: {
                ".js": jsLoader,
                ".css": cssLoader
            },
            find: function(uri) {
                return require.cache[require.resolve(uri)];
            }
        }

        var getAbsoluteUrl = function(uri, server) {
            var _uri = uri.toLowerCase();
            if (_uri.indexOf('http:') === 0 || _uri.indexOf('https:') === 0) {
                return removeProtocol(uri);
            }

            if (uri.indexOf('./') === 0 || uri.indexOf('../') === 0) {
                var loc = window.location,
                    port = (loc.port ? ':' + loc.port : '');
                return loc.protocol + '//' + loc.host + port + '/' + uri;
            } else {
                if (!server) {
                    if (cfg.cdnFiles[uri]) {
                        server = 'http://sta.doumi.com';
                    } else {
                        server = GJ.config.defaultServer;
                    }
                }

                if (server.indexOf('http') !== 0) {
                    server = 'http://' + server;
                }

                var version = getVersion(uri);

                return removeProtocol(server) + '/' + cfg.rootDir + uri.replace(/(\.(js|css|html?|swf|gif|png|jpe?g))$/i, ".__" + getVersion(uri) + "__$1");
            }
        };

        var removeProtocol = function(uri) {
            if(uri.indexOf('http:') === 0){
                uri = uri.substring(5);
            }else if(uri.indexOf('https:') === 0){
                uri = uri.substring(6);
            }
            return uri;
        };

        var now = new Date();
        var defaultVersionTime = new Date(now.getFullYear(), now.getMonth(), now.getDate(), 18, 21, 00).getTime();

        var getVersion = function(uri) {
            var v = new Date().getTime();
            var version;
            if (cfg.fileVersions) {
                version = cfg.fileVersions[uri];
                if (!version) {
                    if (GJ.config.defaultVersion) {
                        version = GJ.config.defaultVersion;
                    } else {
                        if (v < defaultVersionTime) {
                            v = defaultVersionTime - 24 * 3600 * 1000;
                        } else {
                            v = defaultVersionTime;
                        }
                        version = parseInt(v / 1000, 10);
                    }
                }
            }
            return version;
        };

        /**
         * ȡ��һ����ʽ����url
         * ����һ�����url��ȡ�������http://sta*.ganji.com������汾�ŵ�����url
         * @method GJ.getFormatUrl
         * @static
         * @param {string} url �ļ�url�����http://sta*.ganji.com/srcָ��
         * @param {string} hostname ������Ĭ��Ϊ�ա������Ϊ�ս�ʹ�ô������������������sta*.ganji.com����
         * @return {string}
         * @example
         * <script type="text/javascript">
         * var url = GJ.getFormatUrl('js/util/json/json.js');
         * //url��ֵ��http://sta1.ganji.com/src/js/util/json/json.__2343654234__.js
         * var url = GJ.getFormatUrl('js/util/json/json.js', 'sta.doumi.com');
         * //url��ֵ��http://sta.doumi.com/src/js/util/json/json.__2343654234__.js
         * </script>
         */
        GJ.getFormatUrl = function(url, hostname) {
            var urls = require.resolve(url),
                ret = [];
            var ret = GJ.map(urls, function(url) {
                return getAbsoluteUrl(url, hostname);
            });
            return ret.length === 1 ? ret[0] : ret;
        };

        /**
         * ͬ������һ������js��css�ļ�
         * ����document.write()��ʽ���롣<br />����Ҫ��script��ǩ��װ��<br />����ͬ������Ӱ�����ܣ�һ�㲻Ҫʹ��
         * @method GJ.require
         * @static
         * @param {string|array} urls ������js��css�ļ�url��Ҳ������һ���ļ��Ĵ��ţ�������ö��ŷָ���Ҳ�������顣���http://sta*.ganji.com/srcָ��
         * @return {void}
         * @example
         * <script type="text/javascript">
         * GJ.require('jquery,js/util/json/json.js');
         * GJ.require(['js/util/panel/panel.js', 'js/util/panel/panel.css']);
         * </script>
         */
        GJ.require = function(uris, onError) {
            var doc = document;
            var deps = resolveDeps(uris);
            var files = [];
            if (debug) {
                GJ.each(deps, function(dep) {
                    if (combines[dep.uri]) {
                        GJ.each(resolveDeps(combines[dep.uri]), function(d) {
                            files.push(d);
                        });
                    } else {
                        files.push(dep);
                    }
                });
            } else {
                files = deps;
            }
            GJ.each(files, function(dep) {
                var uri = dep.uri;
                dep.status = STATUS.FETCHING;
                if (GJ.isFunction(onError)) {
                    defers[dep.id].fail(onError);
                }
                if (/\.css$/i.test(uri)) {
                    doc.write(unescape("%3Clink href='" + getAbsoluteUrl(uri) + "' type='text/css' rel='stylesheet' /%3E"));
                } else {
                    doc.write(unescape("%3Cscript src='" + getAbsoluteUrl(uri) + "' type='text/javascript'%3E%3C/script%3E"));
                }
            });
        };

        /**
         * �첽����һ������js��css�ļ�
         * @method GJ.use
         * @static
         * @param {string|array} urls ������js��css�ļ�url��Ҳ������һ���ļ��Ĵ��ţ�������ö��ŷָ���Ҳ�������顣���http://sta*.ganji.com/srcָ��
         * @param {Function} onLoad ȫ���������ʱ�Ļص�����
         * @param {Function} onError �������ʱ�Ļص�����
         * @return {void}
         * @example
         * <script type="text/javascript">
         * GJ.use('jquery,js/util/json/json.js', function(){
         *     $('#id').html(GJ.jsonEncode({msg:'Hello World!'}));
         * });
         * </script>
         */
        GJ.use = function(dependencies, func, onError) {
            var id = GJ.guid();
            dependencies = resolveDeps(dependencies);
            var module = require.cache[id] = {
                id: id,
                dependencies: dependencies,
                status: STATUS.SAVED,
                factory: func,
                onError: onError
            }
            var defer = defers[id] = GJ.Deferred();
            if (GJ.isFunction(onError)) {
                defer.fail(onError);
            };
            eventList.push([-(startTime - new Date), 'use', id]);
            moduleWait(id);
        };
        require.async = GJ.use;

        /**
         * ֪ͨ�ļ�������
         * ��Ϊjs�ļ���дģ��
         * @method GJ.add
         * @static
         * @param {string} url ��ǰ�ļ���url�����http://sta*.ganji.com/srcָ��
         * @param {string|array} needUrls �������������ļ���������js��css�ļ�url��Ҳ������һ���ļ��Ĵ��ţ�������ö��ŷָ���Ҳ�������顣���http://sta*.ganji.com/srcָ��
         * @param {Function} func �����������ļ��������Ļص�����������������ڴ˺�����
         * @return {void}
         */
        GJ.add = function(uri, dependencies, func, onError) {
            var module = require.cache[uri],
                defer = defers[uri];
            if (module && module.status >= STATUS.SAVED) { // ��ֹ�ظ�����ģ��
                GJ.log(uri + ' �ظ�����[' + module.status + ']');
                return;
            }

            if (GJ.isFunction(dependencies)) {
                onError = func;
                func = dependencies;
                dependencies = [];
            }

            dependencies = resolveDeps(dependencies);
            if (module) {
                module.dependencies = dependencies;
                module.status = STATUS.SAVED;
                module.factory = func;
                module.onError = onError;
                module.exports = {};
            } else {
                require.cache[uri] = {
                    id: uri,
                    uri: uri,
                    dependencies: dependencies,
                    status: STATUS.SAVED,
                    factory: func,
                    onError: onError,
                    exports: {}
                }
                module = require.cache[uri];
            }
            if (!defer) {
                defer = defers[uri] = GJ.Deferred();
            }
            eventList.push([-(startTime - new Date), 'add', uri]);
            if (GJ.isFunction(onError)) {
                defer.fail(onError);
            };
            moduleWait(uri);
        };

        function moduleWait(uri) {
            var module = require.cache[uri];
            var toFetchDeps = [];
            eventList.push([-(startTime - new Date), 'waiting', uri]);
            GJ.each(module.dependencies, function(dep) {
                if (dep.status < STATUS.FETCHING) { // before fetching
                    toFetchDeps.push(dep.uri);
                }
            });
            GJ.each(toFetchDeps, function(uri) {
                loadFile(uri);
            });
            var depDefers = GJ.map(module.dependencies, function(dep) {
                return defers[dep.id];
            });
            GJ.when.apply({}, depDefers)
                .done(function() {
                    moduleReady(uri);
                });
        }

        function moduleReady(uri) {
            eventList.push([-(startTime - new Date), 'ready', uri]);
            var module = require.cache[uri],
                defer = defers[uri];
            module.exports = {};
            module.status = STATUS.READY;
            if (GJ.isFunction(module.factory)) {
                module.status = STATUS.COMPILING;
                try {
                    if (module.uri) { // GJ.add  =>  function (require, exports, module)
                        module.pause = function() {
                            module.status = STATUS.PAUSE;
                        }
                        module.resume = function() {
                            // keep clean
                            delete module.pause;
                            delete module.resume;

                            module.status = STATUS.COMPILED;
                            defer.done();
                        }
                        var ret = module.factory.call(window, require, module.exports, module);
                        if (ret) {
                            module.exports = ret;
                        }
                    } else { // GJ.use  =>  function (d1, d2, d3, d4)
                        var depExports = GJ.map(module.dependencies, function(dep) {
                            return dep.exports;
                        });
                        module.factory.apply(window, depExports);
                    }
                } catch (ex) {
                    // TODO: ������ĵ�����Ϣ������ģ��ĵ���ջ(module.parent);
                    GJ.log('MOD: ' + uri);
                    GJ.log('DEP: ' + GJ.jsonEncode(GJ.map(module.dependencies, function(dep) {
                            return dep.id;
                        })));
                    GJ.log('ERR: ' + ex.message);
                    module.status = STATUS.ERROR;
                    defer.fail();
                    var fnStr = module.factory.toString();
                    fnStr = fnStr.length > 150 ? fnStr.substr(0, 150) : fnStr;

                    GJ.errorStack.push({
                        'type': 'GJ_MODULE_CALLBACK_ERROR',
                        'message': ex.message,
                        'uri': uri,
                        'dependencies': GJ.jsonEncode(GJ.map(module.dependencies, function(dep) {
                            return dep.id;
                        })),
                        'stack': ex.stack,
                        'fn': fnStr
                    });

                    throw ex;
                }
            }
            if (module.status === STATUS.PAUSE) {
                return;
            } else {
                module.status = STATUS.COMPILED;
                defer.done();
            }
        }

        function cssLoader(uri) {
            // https://github.com/seajs/seajs/blob/master/src/util-fetch.js

            var UA = navigator.userAgent;

            // `onload` event is supported in WebKit since 535.23
            // Ref:
            //  - https://bugs.webkit.org/show_activity.cgi?id=38995
            var isOldWebKit = Number(UA.replace(/.*AppleWebKit\/(\d+)\..*/, '$1')) < 536;

            // `onload/onerror` event is supported since Firefox 9.0
            // Ref:
            //  - https://bugzilla.mozilla.org/show_bug.cgi?id=185236
            //  - https://developer.mozilla.org/en/HTML/Element/link#Stylesheet_load_events
            var isOldFirefox = UA.indexOf('Firefox') > 0 &&
                !('onload' in document.createElement('link'));

            var module = require.cache[uri];
            var node = doc.createElement("link");
            var timer;
            node.setAttribute('type', "text/css");
            node.setAttribute('href', getAbsoluteUrl(uri));
            node.setAttribute('rel', 'stylesheet');

            if (isOldWebKit || isOldFirefox) {
                setTimeout(function() {
                    poll(node, onCSSLoad);
                }, 1) // Begin after node insertion
            } else {
                node.onload = onCSSLoad;
                node.onerror = function() {
                    clearTimeout(timer);
                    headNode.removeChild(node);
                    moduleFail(uri, 'Load Fail');
                }
            }

            module.status = STATUS.FETCHING;
            headNode.appendChild(node);

            timer = setTimeout(function() {
                headNode.removeChild(node);
                moduleFail(uri, 'Load timeout');
            }, 30000); // 30s
            function onCSSLoad() {
                clearTimeout(timer);
                eventList.push([-(startTime - new Date), 'loaded', uri]);
                if (module.status === STATUS.FETCHING) {
                    module.status = STATUS.FETCHED;
                }
                moduleReady(uri);
            }

            function poll(node, callback) {
                var isLoaded;
                if (isOldWebKit) { // for WebKit < 536
                    if (node['sheet']) {
                        isLoaded = true;
                    }
                } else if (node['sheet']) { // for Firefox < 9.0
                    try {
                        if (node['sheet'].cssRules) {
                            isLoaded = true;
                        }
                    } catch (ex) {
                        // The value of `ex.name` is changed from
                        // 'NS_ERROR_DOM_SECURITY_ERR' to 'SecurityError' since Firefox 13.0
                        // But Firefox is less than 9.0 in here, So it is ok to just rely on
                        // 'NS_ERROR_DOM_SECURITY_ERR'
                        if (ex.name === 'NS_ERROR_DOM_SECURITY_ERR') {
                            isLoaded = true;
                        }
                    }
                }

                setTimeout(function() {
                    if (isLoaded) {
                        // Place callback in here due to giving time for style rendering.
                        callback();
                    } else {
                        poll(node, callback);
                    }
                }, 1);
            }

            return node;
        }


        function jsLoader(uri, onLoad) {
            var module = require.cache[uri];
            var timer;

            loadFromRemote();

            function loadFromRemote() {
                var timer = setTimeout(function() {
                    headNode.removeChild(node);
                    moduleFail(uri, 'Load timeout');
                }, 30000); // 30s
                var node = doc.createElement("script");
                var done = false;
                node.setAttribute('type', "text/javascript");
                node.setAttribute('src', getAbsoluteUrl(uri));
                node.setAttribute('async', true);

                node.onload = node.onreadystatechange = function() {
                    if (!done && (!this.readyState || this.readyState == "loaded" || this.readyState == "complete")) {
                        done = true;
                        clearTimeout(timer);
                        eventList.push([-(startTime - new Date), 'loaded', uri]);
                        if (module.status === STATUS.FETCHING) {
                            module.status = STATUS.FETCHED;
                        }
                        if (GJ.isFunction(onLoad)) {
                            onLoad();
                        }
                        // ���һ���ļ���script.onload֮��״̬��δ��ΪSTATUS.SAVED
                        // ��˵������ļ�Ϊ�ⲿ�ļ�
                        if (module.status < STATUS.SAVED) {
                            if (!/^http/.test(uri)) {
                                GJ.log('ģ��ID����: ' + uri);
                                GJ.tralog('GJ_ADD_INVALIDATE', uri);
                                if (!GJ.config.debug) {
                                    GJ.setCookie('use_https', 1, 86400); // 1 ��
                                    GJ.config.defaultServer = 'https://sta.doumi.com';
                                }

                            } else {
                                moduleReady(uri);
                            }
                        }
                    }
                };

                node.onerror = function(e) {
                    clearTimeout(timer);
                    headNode.removeChild(node);
                    moduleFail(uri, 'Load Fail');
                };
                module.status = STATUS.FETCHING;
                headNode.appendChild(node);
            }
        }

        function cmbFileLoader(uri) {
            var deps = combines[uri];
            var loader;
            if (!deps) {
                throw new Error(uri + 'is not a combined js file');
            }
            deps = resolveDeps(deps);
            if (!debug) {
                // ���ϲ��ļ��е�js�ļ����ΪSTATUS.FETCHING����ֹ�ظ�ץȡ
                GJ.each(deps, function(dep) {
                    if (dep.status < STATUS.FETCHING && dep.uri.indexOf('.js') !== -1) {
                        dep.status = STATUS.FETCHING;
                    }
                });

                // ���غϲ��ļ�
                if (uri.indexOf('.css') === -1) {
                    loader = jsLoader;
                } else {
                    loader = cssLoader;
                }

                loader(uri, function() {
                    GJ.add(uri, combines[uri]);
                });
            } else {
                GJ.add(uri, combines[uri]);
            }
        }

        function loadFile(uri) {
            eventList.push([-(startTime - new Date), 'fetching', uri]);
            if (combines[uri]) {
                return cmbFileLoader(uri);
            }
            var loaders = GJ.Module.fileLoaders;
            // TODO: jsonLoader
            for (var t in loaders) {
                if (loaders.hasOwnProperty(t)) {
                    if (uri.indexOf(t) !== -1) {
                        return loaders[t](uri);
                    }
                }
            }
            // default type is JS
            return loaders['.js'].call({
                require: require,
                defers: defers
            }, uri);
        }
        var retryList = {},
            defaultServerIndex = 0;

        function moduleFail(uri, reason) {
            if (retryList[uri]) {
                require.cache[uri].status = STATUS.FAILED;
                defers[uri].fail();
                GJ.errorStack.push({
                    'type': 'GJ_MODULE_FAIL',
                    'message': reason,
                    'uri': uri
                });
                throw new Error(reason + ": " + getAbsoluteUrl(uri));
            } else {
                retryList[uri] = true;

                if (/^http/.test(uri)) {
                    throw new Error(reason + ': ' + uri);
                }

                GJ.tralog('MODULE_LOAD_FAIL', GJ.config.defaultServer + ' - ' + uri);

                defaultServerIndex = defaultServerIndex + 1 >= GJ.config.servers.length ? 0 : defaultServerIndex + 1;
                GJ.config.defaultServer = GJ.config.servers[defaultServerIndex];
                GJ.setCookie('STA_DS', defaultServerIndex);
                loadFile(uri);
            }
        }

        function resolveDeps(dependencies) {
            var deps = [];
            if (dependencies && typeof dependencies === 'string') {
                dependencies = dependencies.replace(/^ */, "");
                dependencies = dependencies.split(/[, \r\n\t\f]+/);
            }
            GJ.each(dependencies, function(uri) {
                GJ.each(require.resolve(uri), function(u) {
                    if (GJ.inArray(u, deps) === -1) {
                        deps.push(u);
                    }
                });
            });
            deps = GJ.map(deps, function(dep) {
                if (!require.cache[dep]) {
                    require.cache[dep] = {
                        id: dep,
                        uri: dep,
                        dependencies: [],
                        status: 0
                    }
                    defers[dep] = GJ.Deferred();
                }
                return require.cache[dep];
            });
            return deps;
        }
    }();
    /**
     * Զ�̿������url��ִ�лص�����
     *
     * @method GJ.jsonp
     * @static
     * @param {string|array} url ���ʵ��ļ�url��url�в��ܰ���callbackName��postData��������
     * @param {object} postData Ҫ���ݵ����ݣ�������json���룬��������ͨ��josn_decode($_GET['postData'])��ȡ
     * @param {Function} onLoad ȫ���������ʱ�Ļص�����
     * @param {Function} onError �������ʱ�Ļص�����
     * @param {string} callbackName Ҫ���ݵĺ�����������Ϊ�գ���������ͨ��$_GET['callbackName']��ȡ
     * @return {void}
     */
    GJ.jsonp = function(url, postData, onLoad, onError, callbackName) {
        if (!url) {
            alert('[GJ.jsonp]url����Ϊ�� ');
            return;
        }

        if (GJ.isFunction(postData)) {
            callbackName = onError;
            onError = onLoad;
            onLoad = postData;
            postData = {};
        }

        if (!callbackName) {
            callbackName = GJ.guid();
        }

        url += url.indexOf('?') === -1 ? '?' : '&';
        url += 'postData=' + encodeURIComponent(GJ.jsonEncode(postData));
        url += '&callbackName=' + encodeURIComponent(callbackName);

        var doc = document,
            n, executed = false,
            doError = function() {
                if (!executed && GJ.isFunction(onError)) {
                    executed = true;
                    onError();
                }
            };

        var head = document.getElementsByTagName("head")[0];

        window[callbackName] = function(ret) {
            executed = true;
            if (GJ.isFunction(onLoad)) {
                onLoad(ret);
            }
        };

        n = doc.createElement("script");
        n.setAttribute('type', "text/javascript");
        n.setAttribute('src', url);
        n.setAttribute('async', true);

        var timer = GJ.later(function() {
            doError();
            GJ.error("�ļ�����ʧ��: '" + url + "'");
            head.removeChild(n);
        }, 30 * 1000, false);

        var done = false;
        n.onload = n.onreadystatechange = function() {
            if (!done && (!this.readyState || this.readyState == "loaded" || this.readyState == "complete")) {
                done = true;
                timer.cancel();
                doError();
            }
        };

        n.onerror = function(e) {
            timer.cancel();
            doError();
            GJ.error(e + ": " + url);
            head.removeChild(n);
        };

        head.appendChild(n);
    };


    /**
     * �������Ϣ
     * ������
     * <ul>
     *     <li><strong>ie</strong> &nbsp; &nbsp; ie�汾�š�0��ʾ��ie�����</li>
     *     <li><strong>opera</strong> &nbsp; &nbsp; Opera�汾�š�</li>
     *     <li><strong>gecko</strong> &nbsp; &nbsp; Gecko����汾�š�</li>
     *     <li><strong>webkit</strong> &nbsp; &nbsp; AppleWebKit�汾�š�</li>
     *     <li><strong>chrome</strong> &nbsp; &nbsp; Chrome�汾�š�</li>
     *     <li><strong>mobile</strong> &nbsp; &nbsp; mobile���ԡ�</li>
     *     <li><strong>air</strong> &nbsp; &nbsp; Adobe AIR�汾�š�</li>
     *     <li><strong>ipad</strong> &nbsp; &nbsp; Apple iPad's OS�汾�š�</li>
     *     <li><strong>iphone</strong> &nbsp; &nbsp; Apple iPhone's OS�汾�š�</li>
     *     <li><strong>ipod</strong> &nbsp; &nbsp; Apple iPod's OS�汾�š�</li>
     *     <li><strong>ios</strong> &nbsp; &nbsp; General truthy check for iPad, iPhone or iPod��</li>
     *     <li><strong>android</strong> &nbsp; &nbsp; Googles Android OS�汾�š�</li>
     *     <li><strong>caja</strong> &nbsp; &nbsp; Google Caja�汾�š�</li>
     *     <li><strong>secure</strong> &nbsp; &nbsp; �Ƿ�ʹ��ssl��ȫЭ�顣</li>
     *     <li><strong>os</strong> &nbsp; &nbsp; ����ϵͳ��</li>
     * </ul>
     * @property GJ.ua
     * @static
     * @type object
     */
    GJ.ua = function() {
        var numberify = function(s) {
                var c = 0;
                return parseFloat(s.replace(/\./g, function() {
                    return (c++ == 1) ? '' : '.';
                }));
            },
            nav = win && win.navigator,
            ua = nav && nav.userAgent,
            loc = win && win.location,
            href = loc && loc.href,
            m,
            o = {
                ie: 0,
                opera: 0,
                gecko: 0,
                webkit: 0,
                chrome: 0,
                mobile: null,
                air: 0,
                ipad: 0,
                iphone: 0,
                ipod: 0,
                ios: null,
                android: 0,
                caja: nav && nav.cajaVersion,
                secure: false,
                os: null,
                isqplus: false,
                is360app: false
            };

        o.secure = href && (href.toLowerCase().indexOf("https") === 0);

        if (ua) {
            if ((/windows|win32/i).test(ua)) {
                o.os = 'windows';
            } else if ((/macintosh/i).test(ua)) {
                o.os = 'macintosh';
            } else if ((/rhino/i).test(ua)) {
                o.os = 'rhino';
            }

            if ((/KHTML/).test(ua)) {
                o.webkit = 1;
            }

            m = ua.match(/AppleWebKit\/([^\s]*)/);
            if (m && m[1]) {
                o.webkit = numberify(m[1]);

                if (/ Mobile\//.test(ua)) {
                    o.mobile = "Apple";

                    m = ua.match(/OS ([^\s]*)/);
                    if (m && m[1]) {
                        m = numberify(m[1].replace('_', '.'));
                    }
                    o.ipad = (navigator.platform == 'iPad') ? m : 0;
                    o.ipod = (navigator.platform == 'iPod') ? m : 0;
                    o.iphone = (navigator.platform == 'iPhone') ? m : 0;
                    o.ios = o.ipad || o.iphone || o.ipod;
                } else {
                    m = ua.match(/NokiaN[^\/]*|Android \d\.\d|webOS\/\d\.\d/);
                    if (m) {
                        o.mobile = m[0];
                    }
                    if (/ Android/.test(ua)) {
                        o.mobile = 'Android';
                        m = ua.match(/Android ([^\s]*);/);
                        if (m && m[1]) {
                            o.android = numberify(m[1]);
                        }
                    }
                }

                m = ua.match(/Chrome\/([^\s]*)/);
                if (m && m[1]) {
                    o.chrome = numberify(m[1]);
                } else {
                    m = ua.match(/AdobeAIR\/([^\s]*)/);
                    if (m) {
                        o.air = m[0];
                    }
                }
            }

            if (!o.webkit) {
                m = ua.match(/Opera[\s\/]([^\s]*)/);
                if (m && m[1]) {
                    o.opera = numberify(m[1]);
                    m = ua.match(/Opera Mini[^;]*/);
                    if (m) {
                        o.mobile = m[0];
                    }
                } else {
                    m = ua.match(/MSIE\s([^;]*)/);
                    if (m && m[1]) {
                        o.ie = numberify(m[1]);
                    } else {
                        m = ua.match(/Gecko\/([^\s]*)/);
                        if (m) {
                            o.gecko = 1;
                            m = ua.match(/rv:([^\s\)]*)/);
                            if (m && m[1]) {
                                o.gecko = numberify(m[1]);
                            }
                        }
                    }
                    var re = new RegExp("Trident/.*rv:([0-9]{1,}[\.0-9]{0,})");
                    if (re.exec(ua) != null) {
                        o.ie = parseFloat(RegExp.$1);
                    }
                }
            }
        }

        try {
            if (win.external && win.external.qplus && GJ.isObject(win.external.qplus)) {
                o.isqplus = true;
            }

            if (!o.isqplus && win.external && win.external.wappGetAppId && win.external.wappGetAppId()) {
                o.is360app = true;
            }
        } catch (e) {}
        return o;
    }();

    /**
     * ȡ�õ�ǰҳ��ɼ�����������볤��
     * @method GJ.getViewPort
     * @static
     * @return {object} ����һ�����󣬰���4���±꣺left��top��width��height
     */
    GJ.getViewPort = function() {
        var doc = document,
            b = doc.body,
            de = doc.documentElement,
            mode = doc.compatMode,
            width = self.innerWidth,
            height = self.innerHeight

        if (mode || GJ.ua.ie) { // IE, Gecko, Opera
            width = (mode == 'CSS1Compat') ? de.clientWidth : b.clientWidth;
            if (!GJ.ua.opera) height = (mode == 'CSS1Compat') ? de.clientHeight : b.clientHeight;
        }

        return {
            left: Math.max(de.scrollLeft, b.scrollLeft),
            top: Math.max(de.scrollTop, b.scrollTop),
            width: width,
            height: height
        };
    };

    /**
     * ȥ���ַ�����β�ո�
     * @method GJ.trim
     * @static
     * @param {string} str Ҫ������ַ���
     * @return {string} ����ȥ����β�ո���ַ���
     */
    GJ.trim = function(s) {
        return s.replace(/^\s+/, '').replace(/\s+$/, '');
    };

    /**
     * ��ʽ���ַ���
     * ���ַ����е�'%s'��ָ�����ַ��������滻
     * @method GJ.sprintf
     * @static
     * @param {string} str Ҫ������ַ���
     * @param {string} var* �����滻�Ķ���ַ���
     * @return {string} �����滻����ַ���
     * @example
     * <script type="text/javascript">
     * var str = GJ.sprintf('1%s2%s3%s', 'a', 'b', 'c');
     * </script>
     */
    GJ.sprintf = function(str, var1, var2) {
        var arg = arguments,
            str = arg[0] || '',
            i, n;
        for (i = 1, n = arg.length; i < n; i++) {
            str = str.replace(/%s/, arg[i]);
        }
        return str;
    };

    /**
     * ����url��ȡ�������Ϣ
     * @method GJ.parseUrl
     * @static
     * @param {string} url Ҫ������url�������Ǿ��Ի����url
     * @return {object} ����һ�����������Ϣ�Ķ���
     * @modify @ 2012/4/24 by huangdegang@ganji.com , fix bug:In IE6, the pathname of an anchor element when set by a relative URL is blank.
     */
    GJ.parseUrl = function(url) {
        var doc = document,
            loc = doc.location,
            a = doc.createElement('a');

        url = url || loc.href;
        if (url.indexOf('://') === -1 && GJ.ua.ie) {
            var _url = loc.protocol + '//' + loc.host;
            if (url.indexOf('/') === 0) {
                _url += url;
            } else {
                _url += loc.pathname.replace(/\/[\w\.]+$/, '/') + url;
            }
            url = _url;
        }

        a.href = url;
        var data = {
            source: url,
            protocol: a.protocol.replace(':', ''),
            host: a.hostname,
            port: a.port,
            query: a.search,
            params: (function() {
                var ret = {},
                //sea = a.search || url.replace(/^[^\?]+/, '').replace(/#.*$/, ''),
                    sea = url.replace(/^[^\?]+/, '').replace(/#.*$/, ''),
                    seg = sea.replace(/^\?/, '').split('&'),
                    len = seg.length,
                    i = 0,
                    s;
                for (; i < len; i++) {
                    if (!seg[i]) {
                        continue; }
                    s = seg[i].split('=');
                    ret[s[0]] = s[1] || '';
                }
                return ret;
            })(),
            file: (a.pathname.match(/\/([^\/?#]+)$/i) || [, ''])[1],
            hash: a.hash.replace('#', ''),
            path: a.pathname.replace(/^([^\/])/, '/$1'),
            relative: (a.href.match(/tps?:\/\/[^\/]+(.+)/) || [, ''])[1],
            segments: a.pathname.replace(/^\//, '').split('/')
        };
        return data;
    };

    /**
     * ���flashplayer�İ汾�Ƿ����
     * @method GJ.checkFlashPlayer
     * @static
     * @param {string} version ��Ҫ��flashplayer�汾��
     * @return {boolean} ����װ��flashplayer���Ұ汾���㹻������true
     */
    GJ.checkFlashPlayer = function(version) {
        var nav = navigator,
            d = null,
            v = version.split("."),
            pv = [0, 0, 0];

        if (typeof nav.plugins != "undefined" && typeof nav.plugins["Shockwave Flash"] == "object") {
            d = nav.plugins["Shockwave Flash"].description;
            if (d && !(typeof nav.mimeTypes != "undefined" && nav.mimeTypes["application/x-shockwave-flash"] && !nav.mimeTypes["application/x-shockwave-flash"].enabledPlugin)) {
                d = d.replace(/^.*\s+(\S+\s+\S+$)/, "$1");
                pv[0] = parseInt(d.replace(/^(.*)\..*$/, "$1"), 10);
                pv[1] = parseInt(d.replace(/^.*\.(.*)\s.*$/, "$1"), 10);
                pv[2] = /[a-zA-Z]/.test(d) ? parseInt(d.replace(/^.*[a-zA-Z]+(.*)$/, "$1"), 10) : 0;
            }
        } else if (typeof window.ActiveXObject != "undefined") {
            try {
                var a = new ActiveXObject("ShockwaveFlash.ShockwaveFlash");
                if (a) {
                    d = a.GetVariable("$version");
                    if (d) {
                        d = d.split(" ")[1].split(",");
                        pv = [parseInt(d[0], 10), parseInt(d[1], 10), parseInt(d[2], 10)];
                    }
                }
            } catch (e) {}
        }

        v[0] = parseInt(v[0], 10);
        v[1] = parseInt(v[1], 10) || 0;
        v[2] = parseInt(v[2], 10) || 0;
        return (pv[0] > v[0] || (pv[0] == v[0] && pv[1] > v[1]) || (pv[0] == v[0] && pv[1] == v[1] && pv[2] >= v[2])) ? true : false;
    };

    (function() {
        var cssNode;
        /**
         * ����css
         * @method GJ.createCSS
         * @static
         * @param {string} name className����
         * @param {string} style classNameֵ
         * @return {void}
         */
        GJ.createCSS = function(name, style) {
            if (GJ.ua.ie && GJ.ua.mac) {
                return; }
            try {
                var doc = document,
                    h = doc.getElementsByTagName("head")[0];
                if (!h) {
                    return; }
                if (!cssNode) {
                    var s = doc.createElement("style");
                    s.setAttribute("type", "text/css");
                    cssNode = h.insertBefore(s, h.firstChild);
                    //cssNode = h.appendChild(s);
                    if (GJ.ua.ie && GJ.ua.os == 'win' && !GJ.isUndefined(doc.styleSheets) && doc.styleSheets.length > 0) {
                        cssNode = doc.styleSheets[doc.styleSheets.length - 1];
                    }
                }

                if (GJ.ua.ie && GJ.ua.os == 'win') {
                    if (cssNode && GJ.isFunction(cssNode.addRule)) {
                        cssNode.addRule(name, style);
                    }
                } else {
                    if (cssNode && GJ.isFunction(doc.createTextNode)) {
                        cssNode.appendChild(doc.createTextNode(name + " {" + style + "}"));
                    }
                }
            } catch (e) {}
        };
    })();

    /**
     * ����һ��loading��ʾ
     * @method GJ.createLoading
     * @static
     * @param {object} el ��λloadingͼ��ʱ��Ե�Ԫ�أ����Ϊ�գ���λ��ҳ���м�
     * @param {position} position �����el�ķ�λ��Ĭ��Ϊcenter��������Ϊleft��right
     * @return {object} ����һ������remove()�����Ķ���
     * @example
     * <script type="text/javascript">
     * $('#btn_id').click(function(){
     *     var loading = GJ.createLoading($('#btn_id'), 'right');
     *     $.get('http://you.domain.com/ajax.php', function(data){
     *         loading.remove();
     *         ...
     *     });
     * });
     * </script>
     */
    GJ.createLoading = function(el, position) {
        var div = 1,
            imgLoading = {
                remove: function() {
                    if (div) {
                        div.hide().remove();
                    }
                    div = null;
                }
            };
        GJ.use('jquery', function() {
            if (div === 1) {
                div = $('<div style="width:16px;height:16px;z-index:9000000;position:absolute;background-image:url(' + GJ.getFormatUrl('js/util/ganji/loading.gif') + ');"></div>');
                $body = $('body');
                if ($body.size() == 0) return;
                $body.append(div);
                if (!el) {
                    var pos = GJ.getViewPort(),
                        left = pos.left + Math.round((pos.width - div.width()) / 2.0),
                        top = pos.top + Math.round((pos.height - div.height()) / 2.0);
                    div.css({ top: Math.max(0, top), left: Math.max(0, left) });
                } else {
                    var $el = $(el),
                        ofs = $el.offset(),
                        left, top;
                    if (!position) position = 'center';
                    if (position == 'center') {
                        left = ofs.left + Math.round(($el.width() - div.width()) / 2.0);
                    } else if (position == 'right') {
                        left = ofs.left + $el.width() + 5;
                    } else if (position == 'left') {
                        left = ofs.left - div.width() - 5;
                    }
                    top = ofs.top + Math.round(($el.height() - div.height()) / 2.0);
                    div.css({ top: top, left: left });
                }
                div.show();
            }
        });
        return imgLoading;
    };

    /**
     * ΪԪ�ذ��¼����¼�����������ļ��󴥷�
     * �ö���ֻ�ᴥ��һ��
     * @method GJ.oneEvent
     * @static
     * @param {string|object} elementId Ҫ���¼���Ԫ�ص�id�ţ������
     * @param {string} type �������ͣ���click
     * @param {string|array} urls ��Ҫ���ص�js��css�ļ�
     * @param {Function} func ��Ҫ�������¼�
     * @param {boolean} stop �Ƿ���ֹð�ݣ�Ĭ����ֹ
     * @return {void}
     * @example
     * <script type="text/javascript">
     * GJ.bindEvent('btn_id', 'click', 'js/util/json/json.js', function(){
     *     GJ.setCookie('cookieName', GJ.jsonEncode({key:'val'}));
     * });
     * </script>
     */
    GJ.oneEvent = function(btnObj, eventType, needUrls, func, stop) {
        GJ.use('jquery', function() {
            var $btnObj = GJ.isString(btnObj) ? $('#' + btnObj) : $(btnObj);
            if (!$btnObj || $btnObj.size() == 0) {
                return;
            }
            $btnObj.one(eventType, function(e) {
                var t = this,
                    loading = GJ.createLoading(t);
                GJ.use(needUrls, function() {
                    loading.remove();
                    func.apply(t, [e]);
                });
                return !!stop;
            });
        });
    };

    (function() {
        var win = window,
            doc = document;

        //IE6����ͼ���棬��ֹff�³�����try..catch
        try {
            doc.execCommand("BackgroundImageCache", false, true);
        } catch (e) {}

        //ȥ��flash�����
        GJ.createCSS('object', 'outline:none;');

        //����document.domain
        var dm = GJ.config.documentDomain;
        if (dm) {
            //var host=win.location.hostname.toLowerCase();
            //if (host.indexOf(dm.toLowerCase()) > -1) {
            doc.domain = dm;
            //}
        }
        //doc.domain = 'ganji.com';

        var _setAllLinkTargetIsSelf = function() {
            GJ.use('jquery', function() {
                $('a').attr('target', '_self');
            });
        }
        //360app�ڵ�ǰ������ʾ
        GJ.addEvent(win, "load", function() {
            var win = window;
            if (GJ.ua.isqplus) {
                GJ.use('app_qplus', function() {
                    GJ.qplus.init();
                });
            } else if (GJ.ua.is360app) {
                _setAllLinkTargetIsSelf();
            }
        });

        //ע����ǰҳ��ʱͳ���ⲿ�ļ���ʹ��
    })();

    GJ.add('js/util/ganji/ganji.js');

})();

(function() {
    if (GJ.jsonEncode) return;

    (function() {
        var _UNICODE_EXCEPTIONS = /[\u0000\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,

            _ESCAPES = /\\(?:["\\\/bfnrt]|u[0-9a-fA-F]{4})/g,

            _VALUES = /"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g,

            _BRACKETS = /(?:^|:|,)(?:\s*\[)+/g,

            _UNSAFE = /[^\],:{}\s]/,

            _escapeException = function(c) {
                return '\\u' + ('0000' + (+(c.charCodeAt(0))).toString(16)).slice(-4);
            },

            _parse = function(s, reviver) {
                s = s.replace(_UNICODE_EXCEPTIONS, _escapeException);

                if (!_UNSAFE.test(s.replace(_ESCAPES, '@').replace(_VALUES, ']').replace(_BRACKETS, ''))) {

                    return eval('(' + s + ')');
                }

                throw new SyntaxError('JSON.parse');
            };

        /**
         * ��json�ַ�������Ϊjs����
         *
         * @method GJ.jsonDecode
         * @param {string} jsonString Ҫ�������ַ���
         * @return {object} ���ؽ���������js����
         * @example
         * <script type="text/javascript">
         * GJ.use('json', function(){
         *     var obj = GJ.jsonDecode('{"key1":"val1","key2":"val2"}');
         * });
         * </script>
         */
        GJ.jsonDecode = function(s) {
            if (!GJ.isString(s)) {
                s += '';
            }

            return _parse(s);
        };
    })();

    (function() {
        var isFunction = GJ.isFunction,
            isObject = GJ.isObject,
            isArray = GJ.isArray,
            _toStr = Object.prototype.toString,
            UNDEFINED = 'undefined',
            OBJECT = 'object',
            NULL = 'null',
            STRING = 'string',
            NUMBER = 'number',
            BOOLEAN = 'boolean',
            DATE = 'date',
            _allowable = {
                'undefined': UNDEFINED,
                'string': STRING,
                '[object String]': STRING,
                'number': NUMBER,
                '[object Number]': NUMBER,
                'boolean': BOOLEAN,
                '[object Boolean]': BOOLEAN,
                '[object Date]': DATE,
                '[object RegExp]': OBJECT
            },

            _SPECIAL_CHARS = /[\\\"\x00-\x1f\x7f-\x9f\u00ad\u0600-\u0604\u070f\u17b4\u17b5\u200c-\u200f\u2028-\u202f\u2060-\u206f\ufeff\ufff0-\uffff]/g,

            _CHARS = {
                '\b': '\\b',
                '\t': '\\t',
                '\n': '\\n',
                '\f': '\\f',
                '\r': '\\r',
                '"': '\\"',
                '\\': '\\\\'
            },

            dateToString = function(d) {
                function _zeroPad(v) {
                    return v < 10 ? '0' + v : v;
                }

                return d.getUTCFullYear() + '-' +
                    _zeroPad(d.getUTCMonth() + 1) + '-' +
                    _zeroPad(d.getUTCDate()) + 'T' +
                    _zeroPad(d.getUTCHours()) + ':' +
                    _zeroPad(d.getUTCMinutes()) + ':' +
                    _zeroPad(d.getUTCSeconds()) + 'Z';
            };


        function _type(o) {
            var t = typeof o;
            return _allowable[t] ||
                _allowable[_toStr.call(o)] ||
                (t === OBJECT ?
                    (o ? OBJECT : NULL) :
                    UNDEFINED);
        }

        function _char(c) {
            if (!_CHARS[c]) {
                _CHARS[c] = '\\u' + ('0000' + (+(c.charCodeAt(0))).toString(16)).slice(-4);
            }
            return _CHARS[c];
        }

        function _string(s) {
            return '"' + s.replace(_SPECIAL_CHARS, _char) + '"';
        }

        function _indent(s, space) {
            return s.replace(/^/gm, space);
        }

        function _stringify(o, space) {
            if (o === undefined) {
                return undefined;
            }

            var w = null;

            var format = _toStr.call(space).match(/String|Number/) || [],
                stack = [];

            space = format[0] === 'Number' ?
                new Array(Math.min(Math.max(0, space), 10) + 1).join(" ") :
                (space || '').slice(0, 10);

            function _serialize(h, key) {
                var value = h[key],
                    t = _type(value),
                    a = [],
                    colon = space ? ': ' : ':',
                    arr, i, keys, k, v;

                if (isObject(value) && isFunction(value.toJSON)) {
                    value = value.toJSON(key);
                } else if (t === DATE) {
                    value = dateToString(value);
                }

                if (value !== h[key]) {
                    t = _type(value);
                }

                switch (t) {
                    case DATE:
                    case OBJECT:
                        break;
                    case STRING:
                        return _string(value);
                    case NUMBER:
                        return isFinite(value) ? value + '' : NULL;
                    case BOOLEAN:
                        return value + '';
                    case NULL:
                        return NULL;
                    default:
                        return undefined;
                }

                for (i = stack.length - 1; i >= 0; --i) {
                    if (stack[i] === value) {
                        throw new Error("JSON.stringify. Cyclical reference");
                    }
                }

                arr = isArray(value);

                stack.push(value);

                if (arr) {
                    for (i = value.length - 1; i >= 0; --i) {
                        a[i] = _serialize(value, i) || NULL;
                    }
                } else {
                    keys = w || value;
                    i = 0;

                    for (k in keys) {
                        if (keys.hasOwnProperty(k)) {
                            v = _serialize(value, k);
                            if (v) {
                                a[i++] = _string(k) + colon + v;
                            }
                        }
                    }
                }

                stack.pop();

                if (space && a.length) {
                    return arr ?
                    '[' + "\n" + _indent(a.join(",\n"), space) + "\n" + ']' :
                    '{' + "\n" + _indent(a.join(",\n"), space) + "\n" + '}';
                } else {
                    return arr ?
                    '[' + a.join(',') + ']' :
                    '{' + a.join(',') + '}';
                }
            }

            return _serialize({ '': o }, '');
        }

        /**
         * ��js�������Ϊjson�ַ���
         *
         * @method GJ.jsonEncode
         * @param {string} jsObject Ҫ�����js����
         * @param {string|int} space ��ʽ����ʾʱ�Ŀո��ո���
         * @return {string} ����json�ַ���
         * @example
         * <script type="text/javascript">
         * GJ.use('json', function(){
         *     var obj = {
         *         key1 : "val1",
         *         key2 : "val2"
         *     },
         *     str = GJ.jsonEncode(obj);
         * });
         * </script>
         */
        GJ.jsonEncode = function(o, ind) {
            return _stringify(o, ind);
        };
    })();

    GJ.add('js/util/json/json.js');


})();

window.onerror = function(err, url, lineNumber) {
    GJ.errorManager.send(err, url + '[' + lineNumber + ']', 'WINDOW_ON_ERROR');
}

if (window.location.href.indexOf('use_https') !== -1) {
    GJ.setCookie('use_https', 1, 86400);
}

if (GJ.getCookie('use_https')) {
    GJ.defaultServer = 'https://sta.doumi.com';
}

if (window.location.href.indexOf('version_test_t') !== -1) {
    GJ.setCookie('version_test_t', 1, 86400);
}
