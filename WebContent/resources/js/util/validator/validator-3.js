/**
 * 表单验证
 *
 * @module json
 * @file js/util/validator/validator-2.js
 * @requires jquery,js/util/validator/validator.css,js/util/validator/validator-2.js
 * @author lwg_8088@yahoo.com.cn
 * @version 2010-01-05
 */
GJ.add(
'js/util/validator/validator-3.js',
['jquery', 'js/util/event/event.js'],
function(){
    if (GJ.validator) return;
    var win = window, doc = document, loc = win.location,
    $focusInput = $('<input type="text" />').css('width', 1),

    tipSpanIds = [],

    validators = {},

    getByFieldName = function(n){
        var $el, ns;
        if (n.indexOf('::')!= -1){
            ns = n.split('::');
            $el = $("[name='" + ns[1] + "']", $("#" + ns[0]));
        }
        else {
            $el = $("[name='" + n + "']");
        }
        return $el;
    },

    FormInfo = GJ.createClass({
        init : function(formId){
            this.formId = formId;
            this.hasError      = false;
            this.firstErrorId  = null;
            this.formCallbacks = [];
            this.formErrorCallbacks = [];
            this.oldSubmitFunc = null;
            this.submitClicked = false;
        }
    }),

    formInfos = [],

    formIdCounter = 1,
    formIdData = [],
    getFormId = function($form)
    {
        if ($form && $form.size()== 0){
            return null;
        }

        var formId = $form.data("validatorFormId");
        if (!formId){
            formId = formIdCounter++;
            $form.data("validatorFormId", formId);
            formIdData[formId] = {};

            $('[name]', $form).each(function(k, v){
                var $v = $(v), tagN=$v[0].tagName.toLowerCase();
                if (tagN == 'input' || tagN == 'select' || tagN == 'textarea'){
                    formIdData[formId][$v.attr('name')] = null;
                }
            });
        }
        return formId;
    },

    getCompareString = function(val)
    {
        if (val == '')return '""';
        if (!isNaN(val)){
            if (/^0[0-9]+$/.test(val)){
                return '"' + val + '"';
            }
            return val;
        }
        var lower = val.toLowerCase;
        if (lower == 'false' || lower == 'true' || lower == 'null')return lower;
        return '"' + val + '"';
    },

    checkPhoneNumber = function(phoneNumber) {
        return /(^13\d{9}$)|(^15[0,1,2,3,5,6,7,8,9]\d{8}$)|(^18[0,2,5,6,7,8,9]\d{8}$)|(^147\d{8}$)|(^170\d{8}$)/.test(phoneNumber);
    },

    checkEmpty = function (vObj)
    {
        var $el=vObj.$el, val=$el.val(), size=$el.size();
        if ((vObj.type == 'radio' || vObj.type == 'checkbox')&& $("[name='" + vObj.fieldName + "']:checked", vObj.$parent).size()== 0){
            return true;
        }
        if (size == 1){
            if (val == '' || val == vObj.emptyValue || val == vObj.focusValue || val == vObj.defaultDbValue){
                return true;
            }
        }
        else if (size > 1){
            var empty = true;
            $el.each(function(){
                val = $(this).val();
                if (val != '' && val != vObj.emptyValue && val != vObj.focusValue && val != vObj.defaultDbValue){
                    empty = false;
                }
            });
            return empty;
        }
        return false;
    },

    countByte = function(val)
    {
        var cnRegex = /[^\x00-\xff]/g;
        var strLength = val.replace(cnRegex,"**").length;
        return strLength;
        /*
        var len = 0;
        for (var i = 0; i < val.length; i++)
        {
            if (val.charCodeAt(i)>= 0x4e00 && val.charCodeAt(i)<= 0x9fa5){
                len += 2;
            }else {
                len++;
            }
        }
        return len;
        */
    },

    PhoneValidator = function(vObj, msg, disabledCallback) {
        this.vObj = vObj;
        this.msg = msg;
        this.mode = 'tel';
        this.disabledCallback = disabledCallback;
        this.isDisabled = function(){
            if (this.vObj.disabled) return true;
            return GJ.isFunction(this.disabledCallback) && this.disabledCallback();
        };
        this.validate = function(){
            if (!this.msg || this.isDisabled()) {
                return true;
            }

            return checkPhoneNumber(this.vObj);
        };
    },

    RequiredValidator = function(vObj, msg, disabledCallback){
        this.vObj = vObj;
        this.mode = 'required';
        this.msg = msg;
        this.disabledCallback = disabledCallback;
        this.isDisabled = function(){
            if (this.vObj.disabled) return true;
            return GJ.isFunction(this.disabledCallback) && this.disabledCallback();
        };
        this.validate = function(){
            if (!this.msg || this.isDisabled())
                return true;
            return checkEmpty(this.vObj) ? false : true;
        };
    },

    RegExpValidator = function(vObj, regexp, msg, exclude, disabledCallback){
        this.vObj = vObj;
        this.mode = 'regexp';
        this.regexp = regexp;
        this.msg = msg;
        this.exclude = exclude;
        this.disabledCallback = disabledCallback;
        this.isDisabled = function(){
            if (this.vObj.disabled) return true;
            return GJ.isFunction(this.disabledCallback) && this.disabledCallback();
        };
        this.validate = function(){
            var vObj = this.vObj;
            if (vObj.valid || vObj.isEmpty || this.isDisabled())
                return true;

            var val = vObj.$el.val(), match = new RegExp(this.regexp).test(val);
            if ((!this.exclude && !match)|| (this.exclude && match)){
                return false;
            }
            return true;
        }
    },

    CompareFieldValidator = function(vObj, operator, compareField, msg, disabledCallback){
        this.vObj = vObj;
        this.mode = 'compareField';
        this.operator = operator;
        this.compareField = compareField;
        this.msg = msg;
        this.disabledCallback = disabledCallback;
        this.isDisabled = function(){
            if (this.vObj.disabled) return true;
            return GJ.isFunction(this.disabledCallback) && this.disabledCallback();
        };
        this.validate = function(){
            var vObj = this.vObj, toObj = GJ.validator(this.compareField);
            if (toObj.$el.length == 0){
                alert("Input '" + this.compareField + "' is not exists");
                return false;
            }

            if (vObj.isEmpty && checkEmpty(toObj) || this.isDisabled())
                return true;

            var val = vObj.$el.val();
            eval('var compare = ' + getCompareString(val)+ ' ' + this.operator + ' ' + getCompareString(toObj.$el.val())+ ' ? true : false;');
            return compare;
        }
    },

    CompareValueValidator = function(vObj, operator, compareValue, msg, disabledCallback){
        this.vObj = vObj;
        this.mode = 'compareValue';
        this.operator = operator;
        this.compareValue = compareValue;
        this.msg = msg;
        this.disabledCallback = disabledCallback;
        this.isDisabled = function(){
            if (this.vObj.disabled) return true;
            return GJ.isFunction(this.disabledCallback) && this.disabledCallback();
        };
        this.validate = function(){
            var vObj = this.vObj;
            if (vObj.valid || vObj.isEmpty || this.isDisabled())
                return true;

            var val = vObj.$el.val();
            eval('var compare = ' + getCompareString(val)+ ' ' + this.operator + ' ' + getCompareString(this.compareValue)+ ' ? true : false;');
            return compare;
        }
    },

    LengthValidator = function(vObj, minValue, maxValue, msg, disabledCallback){
        this.vObj = vObj;
        this.mode = 'length';
        this.minValue = minValue;
        this.maxValue = maxValue;
        this.msg = msg;
        this.disabledCallback = disabledCallback;
        this.isDisabled = function(){
            if (this.vObj.disabled) return true;
            return GJ.isFunction(this.disabledCallback) && this.disabledCallback();
        };
        this.validate = function(){
            var vObj = this.vObj;
            if (vObj.valid || vObj.isEmpty || this.isDisabled())
                return true;

            var val = vObj.$el.val();

            // 对于服务富文本验证，去除标签后判断长度 fuwu-4544
            if(maxValue == 40000) {
                val = val.replace(/<[^>].*?>/g,"");
            }

            var  length = vObj.strlenType.toLowerCase()== 'symbol' ? val.length : countByte(val);

            eval('var compare = ' + length + ' >= ' + this.minValue + ' && ' + length + ' <= ' + this.maxValue + ' ? true : false;');
            return compare;
        }
    },

    MinLengthValidator = function(vObj, minValue, msg, disabledCallback){
        this.vObj = vObj;
        this.mode = 'minLength';
        this.minValue = minValue;
        this.msg = msg;
        this.disabledCallback = disabledCallback;
        this.isDisabled = function(){
            if (this.vObj.disabled) return true;
            return GJ.isFunction(this.disabledCallback) && this.disabledCallback();
        };
        this.validate = function(){
            var vObj = this.vObj;
            if (vObj.valid || vObj.isEmpty || this.isDisabled())
                return true;

            var val = vObj.$el.val(),
                length = vObj.strlenType.toLowerCase()== 'symbol' ? val.length : countByte(val);

            eval('var compare = ' + length + ' >= ' + this.minValue + ' ? true : false;');
            return compare;
        }
    },

    MaxLengthValidator = function(vObj, maxValue, msg, disabledCallback){
        this.vObj = vObj;
        this.mode = 'maxLength';
        this.maxValue = maxValue;
        this.msg = msg;
        this.disabledCallback = disabledCallback;
        this.isDisabled = function(){
            if (this.vObj.disabled) return true;
            return GJ.isFunction(this.disabledCallback) && this.disabledCallback();
        };
        this.validate = function(){
            var vObj = this.vObj;
            if (vObj.valid || vObj.isEmpty || this.isDisabled())
                return true;

            var val = vObj.$el.val(),
                length = vObj.strlenType.toLowerCase()== 'symbol' ? val.length : countByte(val);

            eval('var compare = ' + length + ' <= ' + this.maxValue + ' ? true : false;');
            return compare;
        }
    },

    CallbackValidator = function(vObj, funcName, msg, disabledCallback){
        this.vObj = vObj;
        this.mode = 'callback';
        this.funcName = funcName;
        this.msg = msg || 'Unknown error';
        this.disabledCallback = disabledCallback;
        this.isDisabled = function(){
            if (this.vObj.disabled) return true;
            return GJ.isFunction(this.disabledCallback) && this.disabledCallback();
        };
        this.validate = function(){
            var vObj = this.vObj, funcName = this.funcName;
            if (!GJ.isFunction(funcName) || this.isDisabled())
                return true;

            var val = vObj.$el.val(),
                func_ret = funcName(val);

            if (func_ret === true){
                return true;
            }
            else if (func_ret === false){
                this.msg = msg;
                return false;
            }
            else {
                this.msg = func_ret;
                return false;
            }
        }
    },

    AjaxValidator = function(vObj, url, msg, postData, disabledCallback){
        this.vObj = vObj;
        this.mode = 'ajax';
        this.url = url;
        this.msg = msg;
        this.postData = postData || {};
        this.disabledCallback = disabledCallback;
        this.isDisabled = function(){
            if (this.vObj.disabled) return true;
            return GJ.isFunction(this.disabledCallback) && this.disabledCallback();
        };
        this.validate = function(){
            var t=this, vObj = t.vObj, val = vObj.$el.val();
            if (vObj.valid || !t.url || t.isDisabled())
                return true;

            if (!vObj.ajaxLoading){
                vObj.displayLoading();
                vObj.ajaxLoading = true;
                vObj.ajaxLoadStart = new Date().getTime();
                t.postData[vObj.shortInputName] = val;
                $.ajax({
                    type: "post",
                    url: t.url,
                    data: t.postData,
                    dataType: 'text',
                    success: function(data, textStatus){
                        vObj.ajaxLoading = false;
                        var json = '';
                        try{
                            json = GJ.jsonDecode(data);
                        }
                        catch(e){
                            formInfos[vObj.formId].submitClicked = false;
                            vObj.displayError(data);
                        }
                        if (json.error == 0){
                            if (!checkSameTipValidators(vObj)){
                                return ;
                            }

                            vObj.valid = true;
                            vObj.displayValid();

                            if (vObj.formId && formInfos[vObj.formId].submitClicked){
                                vObj.$parent.submit();
                            }
                        }
                        else {
                            formInfos[vObj.formId].submitClicked = false;
                            vObj.displayError(json.message ? json.message : (t.msg || 'Unknown error'));
                        }
                    },
                    complete: function(XMLHttpRequest, textStatus){
                        vObj.ajaxLoading = false;
                    },
                    error: function(XMLHttpRequest, textStatus, errorThrown){
                        vObj.ajaxLoading = false;
                        if (textStatus == 'timeout'){
                            textStatus = '超时，请重试。 ';
                        }
                        formInfos[vObj.formId].submitClicked = false;
                        vObj.displayError(textStatus);
                    },
                    timeout: 10000
                });
            }
        }
    },

    checkSameTipValidators = function(vObj)
    {
        vObj.sameTipsIsEmpty = true;
        if (vObj.checkSameTipField && tipSpanIds[vObj.tipSpanId].length > 1)
        {
            var i, fieldName, obj, $el;
            for (i=0; i<tipSpanIds[vObj.tipSpanId].length; i++)
            {
                fieldName = tipSpanIds[vObj.tipSpanId][i];
                if (fieldName != vObj.fullFieldName)
                {
                    $el = getByFieldName(fieldName);
                    if ($el.size()> 0){
                        obj = GJ.validator(fieldName);
                        if (obj.focused == false){
                            if (!checkEmpty(obj)){
                                vObj.sameTipsIsEmpty = false;
                            }
                            obj.checkSameTipField = false;
                            obj.validate();
                            obj.checkSameTipField = true;
                            if (!obj.valid){
                                vObj.sameTipsIsValid = false;
                                return false;
                            }
                        }
                    }
                }
            }
            vObj.sameTipsIsValid = true;
        }
        if (!vObj.sameTipsIsEmpty){
            vObj.displayValid();
        }
        return true;
    },

    doFocus = function(vObj)
    {
        if (vObj.focused){
            return true;
        }
        if (vObj.type !== 'radio') {
            vObj.valid = false;
        }
        vObj.focused = true;

        if (vObj.focusChangeMsg)vObj.displayFocus();
        else vObj.focusChangeMsg = true;

        var $el=vObj.$el, val=$el.val();
        if ((vObj.type == 'text' || vObj.tagName == 'textarea')&& (val == '' || val == vObj.emptyValue || val == vObj.defaultDbValue))
        {
            if (vObj.focusValue != ''){
                if ((vObj.focusValue != vObj.emptyValue)){
                    $el.val(vObj.focusValue);
                }
            }
            else $el.val('');

            if (vObj.emptyValue != ''){
                $el.removeClass('validatorEmptyValue');
            }
        }
        vObj.trigger('focus');
        return true;
    },

    doBlur = function(vObj)
    {
        vObj.trigger('blur');
        var $el = vObj.$el, val = $el.val();
        if (typeof val == 'string'){
            var trimVal = val.replace(/(^\s*)|(\s*$)/g, "");
            if (vObj.isNumber) {
                val_trim = val_trim.replace(/^0+([1-9])/, "$1");
            }
            if (val != trimVal) {
                $el.val(trimVal);
                val = trimVal;
            }
        }

        if (vObj.emptyValue != '' && (vObj.type == 'text' || vObj.tagName == 'textarea')&& (val == '' || val == vObj.focusValue || val == vObj.defaultDbValue))
        {
            $el.val(vObj.emptyValue);
            $el.addClass('validatorEmptyValue');
        }

        var compare, i, setting, toObj, match, funcName, msg;
        vObj.isEmpty=false;

        vObj.focused = false;

        var required = vObj.rules.required;
        if (required && !required.isDisabled()) {
            if (!required.validate()) {
                vObj.displayError(required.msg);
                return ;
            }

            if ($el.size() > 1) {
                if (!checkSameTipValidators(vObj)){
                    return ;
                }

                vObj.valid = true;
                vObj.displayValid();
                return ;
            }
        }
        else if (checkEmpty(vObj)){
            if (!vObj.hasCallback && !vObj.hasCompareField) {
                if (!checkSameTipValidators(vObj)){
                    return ;
                }

                vObj.valid = true;

                if (vObj.sameTipsIsValid && !vObj.sameTipsIsEmpty){
                    vObj.displayValid();
                }
                else {
                    vObj.displayDefault();
                }
                return ;
            }

            vObj.isEmpty = true;
        }

        for (i=0; i<vObj.rules.others.length; i++)
        {
            setting = vObj.rules.others[i];
            if (!setting.validate())
            {
                vObj.displayError(setting.msg || 'Unknown error');
                return ;
            }
        }

        var ajax = vObj.rules.ajax;
        if (!vObj.valid && ajax && ajax.url && !ajax.isDisabled()){
            ajax.validate();
        }
        else {
            if (!checkSameTipValidators(vObj)){
                return ;
            }

            vObj.valid = true;
            if (vObj.isEmpty && !vObj.sameTipsIsValid){
                vObj.displayDefault();
            }
            else {
                vObj.displayValid();
            }
        }
    },

    validateAll = function(formId)
    {
        var id, vObj, firstErrorObj;
        if (formIdData[formId]){
            GJ.each(formIdData[formId], function(v, id){
                vObj = validators[v];
                if (vObj && vObj.formId && vObj.formId == formId && (!vObj.hasAjax || !vObj.valid)){
                    vObj.$el.blur();
                    if (!vObj.isValid() && !firstErrorObj){
                        firstErrorObj = vObj;
                        if (!vObj.ajaxLoading){
                            formInfos[formId].submitClicked = false;
                        }
                    }
                }
            });
        }

        if (firstErrorObj){
            firstErrorObj.setFocus(false);
            return false;
        }
        return true;
    },

    isLoading = function(formId)
    {
        var id, vObj;
        GJ.each(formIdData[formId], function(v, id){
            vObj = validators[id];
            if (vObj && vObj.formId && vObj.formId == formId && vObj.valid == false && vObj.rules.ajax && vObj.ajaxLoading && new Date().getTime()- vObj.ajaxLoadStart < 3000){
                vObj.setFocus(false);
                return true;
            }
        });
        return false;
    },

    resetById = function(formId)
    {
        var id, vObj;
        if (formIdData[formId]){
            GJ.each(formIdData[formId], function(v, id){
                vObj = validators[id];
                if (vObj && vObj.formId && vObj.formId == formId){
                    vObj.displayDefault();
                    vObj.setValid(false);
                }
            });
        }
    },

    submitHandler = function(e)
    {
        var jqForm = $(e.target);
        var formId = jqForm.data('validatorFormId');
        var vForm = formInfos[formId];

        var errorCallbacks = vForm.formErrorCallbacks, errorCallbackLength = errorCallbacks.length;
        if (!formId || !formInfos[formId]){
            return true;
        }

        if (jqForm.data('forceSubmit')) {
            return true;
        }

        formInfos[formId].submitClicked = true;

        if (isLoading(formId)){
            return false;
        }

        if (!validateAll(formId)){
            var fd = formIdData[formId];
            var reasons = [];
            GJ.each(fd, function (v_key, id) {
                var v = validators[v_key];
                if (v && !v.valid) {
                    reasons.push(v.fieldName);
                }
            });
            for (var i=0; i<errorCallbackLength; i++) {

                if (GJ.isFunction(errorCallbacks[i])) {
                    errorCallbacks[i](reasons);
                }
            }
            return false;
        }

        for (i=0; i<vForm.formCallbacks.length; i++){
            var funcName = vForm.formCallbacks[i];
            if (funcName && funcName()=== false){
                return false;
            }
        }

        if (vForm.oldSubmitFunc){
            var func = vForm.oldSubmitFunc;
            if (func()=== false){
                return false;
            }
        }

        formInfos[formId].submitClicked = false;

        resetById(formId);

        return true;
    },

    addForm = function($form)
    {
        var $form = GJ.isString($form)? $('#' + $form): $($form),
            formId = getFormId($form);

        if (!formId){
            return null;
        }

        try {
            $form.attr('novalidate', 'novalidate');
        } catch(e) { }

        if (!formInfos[formId]){
            var formInfo = new FormInfo(formId), form = $form.get(0);

            if (form && GJ.isFunction(form.onsubmit)){
                formInfo.oldSubmitFunc = form.onsubmit;
                form.onsubmit = null;
            }
            $form.bind('submit', submitHandler);

            formInfos[formId] = formInfo;
        }

        return formInfos[formId];
    },

    focusHandler = function(){
        var t = $(this).data('validator_instance');
        if (t){
            doFocus(t);
        }
    },

    blurHandler = function(){
        var t = $(this).data('validator_instance');
        if (t){
            doBlur(t);
        }
    },

    //VE = ValidatorElement
    VE = GJ.createClass({
        init : function(fieldName)
        {
            var t=this, fullFieldName = fieldName, fieldNames, $el, form, formId, $parent, jFieldV, tagN, type;

            if (validators[fullFieldName]){
                return validators[fullFieldName];
            }
            validators[fullFieldName] = t;

            $el = getByFieldName(fieldName);
            if ($el.size()== 0){
                alert('没有找到表单元素“' + fieldName + '”');
            }
            else {
                fieldName = $el.attr('name');
            }

            form = $el.size()> 0 ? $el.get(0).form : null;
            if (form){
                $parent = $(form);
                formId = getFormId($parent);
                formIdData[formId][fieldName] = fullFieldName;
                addForm($parent);
            }
            else {
                $parent = $(doc);
            }

            try{
                type = $el.attr('type');
                if (type != 'text'){
                    $el.attr('autocomplete', 'off');
                }

                $el.data('validator_instance', t);

                $el.bind('focus', focusHandler);

                $el.bind('blur', blurHandler);

                if (type == 'radio' || type == 'checkbox'){
                    $el.bind('mouseup', function(){
                        t.focused = false;
                        this.focus();
                    });
                }
            }
            catch(e){ }

            t.fullFieldName     = fullFieldName;
            t.fieldName         = fieldName;
            t.shortInputName    = fieldName.split("[")[0];
            t.formId            = formId;
            t.$parent           = $parent;
            t.$el               = $el;
            t.type              = type;
            t.tagName           = $el[0].tagName.toLowerCase();

            t.defaultMsg        = '';
            t.focusMsg          = '';
            t.emptyValue        = '';
            t.focusValue        = '';
            t.defaultDbValue    = null;
            t.isNumber          = false;
            t.rules             = {required:null, ajax:null, others:[]};
            t.showErrorMode     = 'inline', //alert、inline
            t.hasCompareField   = false;
            t.hasCallback       = false;
            t.hasAjax           = false;
            t.valid             = false;
            t.lastErrorMessage  = '';
            t.focused           = false;
            t.strlenType        = 'symbol';
            t.ajaxLoading       = false;
            t.ajaxLoadStart     = 0;
            t.checkSameTipField = true;
            t.sameTipsIsValid   = false;
            t.sameTipsIsEmpty   = true;
            t.focusChangeMsg    = true;
            t.isEmpty           = false;
            t.disabled          = false;

            t.tipSpanId         = '';
            t.$tipSpan          = null;

            t.setTipSpanId('tip_validator_' + (t.formId ? t.formId : '')+ '_' + t.shortInputName);
        },

        setTipSpanId : function (id)
        {
            var t = this;
            if (id != t.tipSpanId){
                if (!tipSpanIds[id]){
                    tipSpanIds[id] = [];
                }
                tipSpanIds[id].push(t.fullFieldName);

                t.tipSpanId = id;
                if (t.$tipSpan){
                    var html = t.$tipSpan.html();
                    t.$tipSpan.remove();
                    t.$tipSpan = null;
                    t.getTipSpan();
                    t.$tipSpan.html(html);
                }
            }
            return t;
        },

        getTipSpan : function()
        {
            var t = this, $el = t.$el;
            if (!t.$tipSpan){
                var $tipSpan = $("#" + t.tipSpanId);
                if($tipSpan.size()== 0){
                    $('<div id="' + t.tipSpanId + '" class="ui-select-tip"></span>').insertAfter($el.get($el.size()- 1));
                    $tipSpan = $('#' + t.tipSpanId);
                }
                t.$tipSpan = $tipSpan;
            }

            return t.$tipSpan;
        },

        setDefaultMsg : function (msg)
        {
            if (msg){
                this.defaultMsg = msg;
                this.setInit();
            }
            return this;
        },

        setFocusMsg : function (msg)
        {
            if (msg){
                this.focusMsg = msg;
            }
            return this;
        },


        setEmptyValue : function (emptyValue)
        {
            var t=this, $el=t.$el, val = $el.val();
            t.emptyValue = emptyValue;

            if (emptyValue != ''
                && (t.type == 'text' || t.tagName == 'textarea')
                && (val == '' || val == emptyValue || val == t.focusValue))
            {
                $el.val(emptyValue);
                $el.addClass('validatorEmptyValue');
            }
            t.setInit();
            return t;
        },

        setFocusValue : function (focusValue)
        {
            this.focusValue = focusValue;
            this.setInit();
            return this;
        },

        setDefaultDbValue : function (defaultDbValue)
        {
            this.defaultDbValue = defaultDbValue;
            this.setInit();
            return this;
        },

        setShowErrorMode : function (showErrorMode)
        {
            this.showErrorMode = showErrorMode == 'alert' ? 'alert' : 'inline';
            return this;
        },

        setStrlenType : function (strlenType)
        {
            this.strlenType = strlenType || 'symbol';
            return this;
        },

        setPhone : function ()
        {
            this.rules.phone = new PhoneValidator();
            return this;
        },

        setRequired : function (requiredMsg, disabledCallback)
        {
            if (requiredMsg){
                this.rules.required = new RequiredValidator(this, requiredMsg, disabledCallback);
            }
            return this;
        },

        checkSize : function(func)
        {
            if (this.$el.size()> 1)   {
                alert("Name属性相同的多个表单字段，只支持检测是否为空。不支持'" + func + "()'");
                return false;
            }
            return true;
        },

        setRegexp : function(regexp, msg, exclude, disabledCallback)
        {
            if (this.checkSize('setRegexp'))   {
                this.rules.others.push(new RegExpValidator(this, regexp, msg, exclude, disabledCallback));
            }
            return this;
        },

        setCompareField : function(operator, compareField, msg, disabledCallback)
        {
            if (this.checkSize('setCompareField'))   {
                this.rules.others.push(new CompareFieldValidator(this, operator, compareField, msg, disabledCallback));
                this.hasCompareField = true;
            }
            return this;
        },

        setCompareValue : function(operator, compareValue, msg, disabledCallback)
        {
            if (this.checkSize('setCompareValue'))   {
                this.rules.others.push(new CompareValueValidator(this, operator, compareValue, msg, disabledCallback));
            }
            return this;
        },

        setLength : function(minValue, maxValue, msg, disabledCallback)
        {
            if (this.checkSize('setLength'))   {
                this.rules.others.push(new LengthValidator(this, minValue, maxValue, msg, disabledCallback));
            }
            return this;
        },

        setMinLength : function(minValue, msg, disabledCallback)
        {
            if (this.checkSize('setMinLength')){
                this.rules.others.push(new MinLengthValidator(this, minValue, msg, disabledCallback));
            }
            return this;
        },

        setMaxLength : function(maxValue, msg, disabledCallback)
        {
            if (this.checkSize('setMaxLength')){
                this.rules.others.push(new MaxLengthValidator(this, maxValue, msg, disabledCallback));
            }
            return this;
        },

        setCallback : function(funcName, msg, disabledCallback)
        {
            if (this.checkSize('setCallback')){
                this.rules.others.push(new CallbackValidator(this, funcName, msg, disabledCallback));
                this.hasCallback = true;
            }
            return this;
        },

        setAjax : function(url, msg, postData, disabledCallback)
        {
            if (this.checkSize('setAjax')){
                this.rules.ajax = new AjaxValidator(this, url, msg, postData, disabledCallback);
                this.hasAjax = true;
            }
            return this;
        },

        setIsNumber : function(bool)
        {
            this.isNumber = bool ? true : false;
        },

        setDisabled : function(bool)
        {
            this.disabled = bool;
            return this;
        },

        displayError : function(errMsg)
        {
            var t = this, $el = t.$el;
            this.valid = false;
            if (!errMsg){
                errMsg = this.lastErrorMessage;
            }
            if (this.showErrorMode == 'alert'){
                alert(errMsg);
            }
            else {
                this.getTipSpan().html(errMsg);
                $el.parent('div').addClass('error');
            }
            this.lastErrorMessage = errMsg;
            this.trigger('error');
            return this;
        },

        displayValid : function()
        {
            var t = this, $el = t.$el;
            if (this.showErrorMode != 'alert'){
                this.getTipSpan().html('&nbsp;');
                $el.parent('div').removeClass('error');
            }
            this.trigger('valid');
            return this;
        },

        displayFocus : function()
        {
            if (this.showErrorMode != 'alert'){
                if (this.focusMsg){
                    this.getTipSpan().html(this.focusMsg );
                }
                else {
                    if(this.type === 'radio' && this.valid > 0) {
                        return this;
                    }
                    this.displayEmpty();
                }
            }

            return this;
        },

        displayDefault : function()
        {
            if (this.showErrorMode != 'alert'){
                if (this.defaultMsg){
                    this.getTipSpan().html(this.defaultMsg);
                }
                else {
                    this.displayEmpty();
                }
            }

            return this;
        },

        displayLoading : function()
        {
            if (this.showErrorMode != 'alert'){
                this.getTipSpan().html('正在检测，请稍候...');
            }

            return this;
        },

        displayEmpty : function()
        {
            var t = this, $el = t.$el;
            if (this.showErrorMode != 'alert'){
                //this.getTipSpan().html('<span class="validatorMsg">&nbsp;</span>');
                this.getTipSpan().html('');
                $el.parent('div').removeClass('error');
            }

            return this;
        },

        setInit : function()
        {
            if (this.type == 'radio' || this.type == 'checkbox'){
                if ($("[name='" + this.fieldName + "']:checked", this.$parent).size()> 0){
                    return true;
                }
            }
            else {
                var val = $(this.$el.get(0)).val();
                if (val != '' && val != this.emptyValue && val != this.focusValue && val != this.defaultDbValue){
                    return true;
                }
            }

            if (!this.defaultMsg){
                this.displayEmpty();
            }
            else {
                this.displayDefault();
            }
        },

        validate : function()
        {
            if (this.hasCompareField || this.hasCallback || this.valid == false){
                doBlur(this);
            }
            return this.valid;
        },

        setValid : function(bool)
        {
            if (bool){
                this.valid = true;
                this.displayValid();
            } else {
                this.valid = false;
            }
            return this;
        },

        setFocus : function(showFocusMsg)
        {
            this.focusChangeMsg = showFocusMsg ? true : false;
            $(this.$el.get(0)).focus();

            if (this.type == 'hidden'){
                this.scrollToTop();
            }
            return this;
        },

        scrollToTop : function()
        {
            var $el = this.$el;
            $($el[0]).after($focusInput);
            $focusInput.show().focus().hide().blur();
            return this;
        },

        remove : function()
        {
            this.$el.unbind('focus', focusHandler);
            this.$el.unbind('blur', blurHandler);
            this.displayEmpty();

            if (this.formId){
                delete formIdData[this.formId][this.fieldName];
            }

            delete validators[this.fullFieldName];
        },

        isValid : function()
        {
            return this.valid;
        }
    });
    var addValidator = function(fieldName, defaultMsg, focusMsg, emptyValue, tipSpanId)
    {
        if (validators[fieldName]){
            return validators[fieldName];
        }

        var vObj = new VE(fieldName);
        GJ.Event(vObj);
        if (GJ.isValue(defaultMsg)){
            vObj.setDefaultMsg(defaultMsg);
        }
        if (GJ.isValue(focusMsg)){
            vObj.setfocusMsg(focusMsg);
        }
        if (GJ.isValue(tipSpanId)){
            vObj.setTipSpanId(tipSpanId);
        }
        if (GJ.isValue(emptyValue)){
            vObj.setEmptyValue(emptyValue);
        }

        vObj.setInit();

        return vObj;
    },

    getForm = function(form)
    {
        if (!form)return null;

        var formEl;

        if (typeof form == 'object'){
            formEl = $(form);
        }
        else if (typeof form == 'string'){
            formEl = $('#' + form);
            if (formEl.size()== 0){
                formEl = $("form[name='" + form + "']");
                if (formEl.size()== 0){
                    formEl = null;
                }
            }
        }
        return formEl;
    },

    resetForm = function(form)
    {
        var formEl = getForm(form);
        if (!formEl){
            alert("'resetForm():'未检测到form");
            return false;
        }
        var newForm = addForm(formEl);
        resetById(newForm.formId);
    },

    addFormCallback = function(form, successFn, errorFn)
    {
        var formEl = getForm(form);
        if (!formEl){
            alert("'addFormCallback():'表单检测程序必须置于form表单之后");
            return false;
        }

        var newForm = addForm(formEl),
            formId  = newForm.formId;
        if (successFn) {
            formInfos[formId].formCallbacks.push(successFn);
        }
        if (errorFn) {
            formInfos[formId].formErrorCallbacks.push(errorFn);
        }
    },

    setFormSubmitClicked = function(form, bool)
    {
        var formEl = getForm(form);
        if (!formEl){
            alert("'addFormCallback():'表单检测程序必须置于form表单之后");
            return false;
        }

        var newForm = addForm(formEl);
        var formId  = newForm.formId;

        formInfos[formId].submitClicked = bool;
    };

    $('form').each(function(){
        getFormId($(this));
    });

    /*$.fn.extend({
        validator:function(defaultMsg, focusMsg, emptyValue, tipSpanId)
        {
            return addValidator($(this), defaultMsg, focusMsg, emptyValue, tipSpanId);
        },
        addFormCallback:function(funcName)
        {
            addFormCallback($(this), funcName);
            return $;
        }
    });*/

    GJ.validator = function(fieldName, defaultMsg, focusMsg, emptyValue, tipSpanId){
        return addValidator(fieldName, defaultMsg, focusMsg, emptyValue, tipSpanId);
    };
    GJ.validator.checkPhoneNumber = function(phoneNumber) {
        return checkPhoneNumber(phoneNumber);
    };
    GJ.validator.addFormCallback = function(formId, successFn, errorFn){
        addFormCallback(formId, successFn, errorFn);
    };
    GJ.validator.setFormSubmitClicked = function(formId, bool){
        setFormSubmitClicked(formId, bool);
    };
    GJ.validator.resetForm = function(formId){
        resetForm(formId);
    };
    GJ.validator.convSBCToDBC = function (fieldName) { // 全角数字转换位半角数字
        GJ.validator(fieldName).bind('blur', function (e) {
            var $el = GJ.validator(fieldName).$el;
            var val = $el.val();
            if (val) {
                val = GJ.CtoH(val);
                $el.val(val);
            }
            $el.val(val);
        });
    };
    GJ.validator.getFormSubmitClicked = function(form){
        var formEl = getForm(form);
        var newForm = addForm(formEl);
        var formId  = newForm.formId;
        return formInfos[formId].submitClicked;
    };
});
