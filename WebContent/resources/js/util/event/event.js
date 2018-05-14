/*
 * 事件处理
 * 
 * @author chan.jianbin@gmail.com
 * @example
 * var A = function () {}
 * var cb = function () {console.log('this is callback');}
 * GJ.Event(A.prototype);
 * var a = new A;
 * a.on('test', test2);
 * a.trigger('test');
 *
 * >>> this is callback
 */
GJ.add(
'js/util/event/event.js',
['jquery'],
function( require, exports, module ){
    var EventEmitter = function (obj) {
        var $handler = $({});

        obj = obj || {};

        obj.on = function () {
            $handler.bind.apply($handler, Array.prototype.slice.call(arguments));
            return obj;
        }
        obj.trigger = function () {
            $handler.trigger.apply($handler, Array.prototype.slice.call(arguments));
            return obj;
        }
        obj.off = function () {
            $handler.unbind.apply($handler, Array.prototype.slice.call(arguments));
            return obj;
        }
        obj.one = function () {
            $handler.one.apply($handler, Array.prototype.slice.call(arguments));
            return obj;
        }
        obj.bind = obj.on;
        obj.unbind = obj.off;
        return obj;
    };
    GJ.Event = EventEmitter;
    module.exports = EventEmitter;
});