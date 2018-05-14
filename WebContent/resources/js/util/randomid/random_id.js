// @file: js/util/random/random_id.js


GJ.add('js/util/randomid/random_id.js', 'jquery', function(){
        $("body").delegate("a","click",function(){
            var attr = $(this).attr('href') || "#";
            if(attr.indexOf("javascript:") == -1 && attr.substring(0,1)!="#"  && ((attr.substring(0,1)=="/" && ((location.href).indexOf("www.ganji.com/pay") != -1 || (location.href).indexOf("www.ganji.com/vip") != -1 || (location.href).indexOf("hrvip.ganji.com") != -1)) || attr.indexOf("www.ganji.com/pay") != -1 || attr.indexOf("www.ganji.com/vip") != -1 || attr.indexOf("hrvip.ganji.com") != -1 )){
                var rand = Math.random();
//                if (attr.indexOf("?") > -1)
//                {
//                    $(this).attr("href", attr + "&_rid=" + rand);
//                }else
//                {
//                    $(this).attr("href", attr + "?_rid=" + rand);
//                }
                if( attr.match(/_rid=[0-9]+\.\d*/) ) {
                    $(this).attr("href",attr.replace(/_rid=[0-9]+\.\d*/,"_rid=" + rand));
                } else {
                    $(this).attr("href",attr.trim()+(attr.indexOf("?") == -1?"?":"&")+"_rid="+rand);
                }
            }
        });
    }
);