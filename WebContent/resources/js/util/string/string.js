/*
 * 字符处理
 * 
 * @author longweiguo
 * @version 20100428
 */

GJ.add(
'js/util/string/string.js',
[],
function(){
    var S = {
        htmlEncode : function (s) {
            return s ? ('' + s).replace(/[<>&\"]/g, function (c, b) {
                switch (c) {
                    case '&': return '&amp;';
                    case '"': return '&quot;';
                    case '<': return '&lt;';
                    case '>': return '&gt;';
                }
                return c;
            }) : s;
        },

        urlEncode : function(i, f) {
            var m = encodeURIComponent;
            if (m instanceof Function) {
                try {
                    return f ? encodeURI(i) : m(i);
                } catch(e){}
            }
            return escape(i);
        },
        
        urlDecode : function(i, f) {
            var m = decodeURIComponent;
            i = i.split("+").join(" ");
            if (m instanceof Function) {
                try {
                    return f ? decodeURI(i) : m(i);
                } catch(e){} 
            }
            
            return unescape(i);
        },

        //rand : function() {
        //    return Math.round(Math.random() * 2147483647);
        //},

        trim : function(s, l, r){
            if (GJ.isString(s)) {
                s = s.replace(/^\s+/, '').replace(/\s+$/, '');
                var m, n;
                if (s && l && (m=l.length) && (n=s.length) && s.substr(0, m) == l){
                    s = s.substr(m, n-m);
                }
                if (s && r && (m=r.length) && (n=s.length) && s.substr(n-m, m) == r){
                    s = s.substr(0, n-m);
                }
            }
            return s;
        },

        //全角转半角
        CtoH : function(s){
            var str = '';
            for (var i = 0; i < s.length; i++){
                if (s.charCodeAt(i)==12288){
                    str += String.fromCharCode(s.charCodeAt(i)-12256);
                    continue;
                }
                if (s.charCodeAt(i)>65280 && s.charCodeAt(i)<65375)
                    str += String.fromCharCode(s.charCodeAt(i)-65248);
                else
                    str += String.fromCharCode(s.charCodeAt(i));
            }
            return str;            
        },

        //计算字符串的字节数
        byteNum : function(s){
            return s.replace(/[^\x00-\xff]/g, "**").length; 
        },

        //格式化字符串，如
        format : function(s, p){
            if (arguments.length == 0) return;
            if (arguments.length == 1) return s;
            for (var i = 1; i < arguments.length; i++) {
                var reg = new RegExp('\\{' + (i-1) + '\\}', 'gm');
                s = s.replace(reg, arguments[i]);
            }
            return s;
        },
         
        // 2012/9/19
        // bravfing@126.com
        // format2("姓名:{name}, 年龄:{age}", {"name":"张三", "age":18})
        // format2("姓名:{name}, 年龄:{age}", [{"name":"张三", "age":18}, {"name":"李四", "age":19}])
        format2 : function (tmpl, datas){
            if (arguments.length == 0) return;
            if (arguments.length == 1) return tmpl;

            var ret = [];
            datas = [].concat(datas);

            for (var i=0,s,v; i<datas.length; i++){
                s = tmpl.replace(/{([^{}]+)}/g, function (match, val){
                    v = datas[i][val];
                    return v === undefined ? match : v;
                });
                ret.push(s);
            }
            return ret.join("");
        }
    };

    GJ.mix(GJ, S);
});
