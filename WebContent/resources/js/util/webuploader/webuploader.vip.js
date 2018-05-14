GJ.add('js/util/webuploader/webuploader.vip.js', ['jquery','js/util/webuploader/webuploader.js'],function(require, exports, module) {
    if (GJ.VipUploader) return;
    var VipUploader = {};
    VipUploader.Uploadconfig = {
        auto : true,
        // 文件接收服务端。
        server: '//vip.doumi.com/imgupload',
        // 选择文件的按钮。
        pick: '#uploadImgBtn',
        // 只允许选择图片文件,可选。
        accept: {
            title: 'Images',
            extensions: 'gif,jpg,jpeg,bmp,png',
            mimeTypes: 'image/gif,image/jpg,image/jpeg,image/bmp,image/png'
        },
        //单个文件大小限制
        fileSingleSizeLimit : 5*1024*1024,
    };
    VipUploader.init = function(uploadConfig){
        VipUploader.Uploadconfig = GJ.mix(uploadConfig, VipUploader.Uploadconfig);
    };

    VipUploader.create = function(config) {
        var config = GJ.mix(config, VipUploader.Uploadconfig);
        config.server = config.server + '?type=' + config.pick.substring(1);
        var uploader = WebUploader.create(config).on('uploadSuccess', function(file, res) {
            file.pick = config.pick;
            config.Success && config.Success(file, res);
        }).on('uploadError', function(file, res){
            file.pick = config.pick;
            config.Error && config.Error(file, res);
        }).on('uploadComplete', function(file, res){
            file.pick = config.pick;
            config.Complete && config.Complete(file, res);
        }).on('fileQueued', function(file){
            file.pick = config.pick;
            config.FileQueued && config.FileQueued(file);
        }).on('uploadProgress', function(file, percentage ){
            file.pick = config.pick;
            config.Progress && config.Progress(file, percentage );
        }).on('beforeFileQueued', function(file) {
            file.pick = config.pick;
            config.BeforeFileQueued && config.BeforeFileQueued(file);
        });
        return uploader;
    };
    GJ.VipUploader = VipUploader;
    module.exports = VipUploader;
});
