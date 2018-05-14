/**
 * 在客户机设置uuid
 *
 * @exclude 不编入文档
 * @module uuid
 * @file js/util/uuid/uuid.js
 * @requires js/util/uuid/uuid.js
 * @author lwg_8088@yahoo.com.cn
 * @version 2011-01-18
 */

GJ.add(
'js/util/uuid/uuid.js',
['js/util/uuid/unvalid_uuids.js'],
function(require, exports, module){
    if (GJ._uuid) {
        module.exports = GJ._uuid;
        return;
    }

    var cookieName      = 'ganji_uuid',
        inner_acc       = GJ.getCookie('gj_inner_acc'),
        cookieExpire    = 365*24*60*60,
        uuid            = '',
        doc             = document,
        callbacks       = [],
        loaded          = {},
        info            = {},
        first           = true,
        reset           = false,

        inner_acc = inner_acc ? inner_acc.split('-') : null,

        isValidUuid = function (uuid) {
            if (uuid && GJ.isString(uuid)) {
                if (inner_acc) {
                    if (inner_acc.length !== 2
                     || uuid.length < 23
                     || uuid.indexOf("-") === -1
                     || uuid.substr(uuid.length-1) !== inner_acc[0]
                     || GJ.unvalidUuids[uuid.split('-')[0]]) {
                        return false;
                    }
                    var u = uuid.split('-'), s = u[0], a = u[1].substr(0, u[1].length-1);
                    var t = s.substr(s.length-8);
                    if (parseInt(inner_acc[1])+parseInt(t) === parseInt(a)) {
                        return true;
                    }
                } else {
                    if (uuid.length > 20
                     && uuid.indexOf('-') === -1) {
                        return true;
                    }
                }
            }
            return false;
        },

        triggerCallback = function(){
            if (isValidUuid(uuid) && GJ.isArray(callbacks)){
                GJ.each(callbacks, function(callback){
                    if (GJ.isFunction(callback))
                        callback(uuid);
                });
            }
        },

        createUuid = function(){
            var tm = +new Date(),
                rm = GJ.rand(10000000, 99999999),
                strSwitch = function(str){
                    var ret = '', i, len = str.length;
                    while (len > 0){
                        len--;
                        ret += str.substr(len, 1);
                    }
                    return ret;
                },
                str = strSwitch(tm + '' + GJ.rand(1, 9));
            str = (str * 1 + rm) + '' + rm;
            if (inner_acc) {
                if (inner_acc.length === 2) {
                    str = str + "-" + (inner_acc[1]*1 + rm) + "" +inner_acc[0];
                }
            }
            return str;
        },

        uuidFromSwf = function(){
            GJ.use('flash', function () {
                if (!GJ.checkFlashPlayer('9.0.0')){
                    loaded.swf = true;
                    return;
                }

                var place_holder_id = GJ.guid(),
                    timeoutTimer = null;

                $('body').append('<div style="position:absolute; top:100px; left:200px; width:1px; height:1px; z-index:1000000;"><div id="'+place_holder_id+'"></div></div>');

                new GJ.SwfLoader({
                    flash_url : GJ.getFormatUrl("swf/cache.swf", GJ.config.defaultServer),
                    flash_player_version : '9.0.0',
                    place_holder_id : place_holder_id,
                    width : 1,
                    height : 1,
                    debug : false,
                    prevent_swf_caching : true,
                    allow_script_access : 'always',
                    onPreload : function(){
                        //10秒钟后超时
                        timeoutTimer = GJ.later(function(){
                            loaded.swf = true;
                        }, 1000 * 10);
                    },
                    onFlashReady : function (){
                        timeoutTimer.cancel();

                        var swfObj = this,
                            tmp_uuid = reset ? null : swfObj.callFlash('get', ['uuid']);
                        if (isValidUuid(tmp_uuid) && !uuid) {
                            uuid = tmp_uuid;
                        } else {
                            GJ.waiter(
                                function(){
                                    return !!uuid;
                                },
                                function(){
                                    swfObj.callFlash('set', ['uuid', uuid]);
                                }
                            );
                        }

                        loaded.swf = true;
                    }
                });
            });
        },

        uuidFromWinName = function(){
            GJ.use('js/util/window_name/window_name.js', function () {
                tmp_uuid = reset ? null : GJ.windowName.get(cookieName);
                if (isValidUuid(tmp_uuid) && !uuid) {
                    uuid = tmp_uuid;
                } else {
                    GJ.waiter(
                        function(){
                            return !!uuid;
                        },
                        function(){
                            GJ.windowName.set(cookieName, uuid);
                        }
                    );
                }

                loaded.winName = true;
            });
        },

        uuidFromStorage = function(){
            var timer = GJ.later(function(){
                loaded.storage = true;
            }, 3000);

            GJ.use('js/util/storage/storage2.js', function (LocalStore) {
                clearTimeout(timer);
                var storage=new LocalStore();
                var tmp_uuid = reset ? null : storage.get(cookieName);
                if (isValidUuid(tmp_uuid) && !uuid) {
                    uuid = tmp_uuid;
                } else {
                    GJ.waiter(
                        function(){
                            return !!uuid;
                        },
                        function(){
                            storage.set(cookieName, uuid);
                        }
                    );
                }

                loaded.storage = true;
            });
        };

    /**
     * 在客户机设置uuid
     *
     * @method GJ.uuid
     * @for uuid
     * @param {Function} callback 当获取到uuid时的回调函数，uuid作为函数的参数
     * @return {string|boolean} cookie中有uuid时返回该uuid，否则返回false
     * @example
     * <script type="text/javascript">
     * GJ.use('js/util/uuid/uuid.js', function(){
     *     GJ.uuid(function(uuid){
     *         alert(uuid);
     *     });
     * });
     * </script>
     */
    GJ._uuid = function(callback){
        uuid = GJ.getCookie(cookieName);
        if (uuid) {
            if (isValidUuid(uuid)) {
                if (GJ.isFunction(callback)){
                    callback(uuid);
                }
                return uuid;
            } else {
                reset = true;
            }
        }

        if (GJ.isFunction(callback)){
            callbacks.push(callback);
        }

        if (!first) return;
        first = false;

        GJ.use('jquery', function(){
            uuid = null;
            uuidFromWinName();
            uuidFromStorage();
            uuidFromSwf();
            GJ.waiter(
                function(){
                    return !!(loaded.swf && loaded.storage && loaded.winName);
                },
                function(){
                    if (!uuid) {
                        uuid = createUuid();
                    }
                }
            );

            GJ.waiter(
                function(){
                    return !!uuid;
                },
                function(){
                    GJ.setCookie(cookieName, uuid, cookieExpire);
                    triggerCallback();
                }
            );
        });

        return false;
    };

    module.exports = GJ._uuid;

	if (!GJ.uuid) GJ.uuid = GJ._uuid;

    if (!GJ.getCookie('ganji_uuid')) {
        module.pause();
        GJ._uuid(function (uuid) {
            module.resume();
        });
    }
});
