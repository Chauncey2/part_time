GJ.add('js/util/webuploader/webuploader.js', ['jquery', 'js/util/webuploader/webuploader.fix.js'],function(require, exports, module) {
    var tmpCreate = WebUploader.create;
    WebUploader.create = function(opt) {
        opt.swf = '//sta.doumi.com/src/js/util/webuploader/Uploader.swf';
        var uploadObj = tmpCreate(opt);
        var $container = $(opt.pick.id || opt.pick);
        $container.css('position', 'relative');
        $container.find('.webuploader-pick').css({
            'height': '100%',
            'width' : '100%'
        })
        return uploadObj;
    }
    module.exports = WebUploader;
})