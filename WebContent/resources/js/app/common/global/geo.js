/**
 * 地标相关的常用方法
 * 注意此处使用的是id，非script_index
 * @file js/app/common/global/geo.js
 * @author maxin maxin@ganji.com
 * @version 2011-02-15
 */
GJ.add(
'js/app/common/global/geo.js',
['jquery', 'js/app/pub/ajax_helper.js', 'js/app/pub/jquery.select.js'],
function() {
	GJ.common = GJ.common || {};
	GJ.common.geo = GJ.common.geo || {};

	/**
	 * 给指定下拉选框绑定change事件
	 * 使得可以根据选定区域异步获取街道列表
	 * @method GJ.common.geo.initStreet
	 * @param {object} o 配置参数
	 * 包括
	 * <ul>
	 * 	  <li>districtEl 区域select框的选择字符，如：'#id_district','.class_district'</li>
	 * 	  <li>streetEl 街道select框</li>
	 *    <li>domain 城市domain</li>
	 * 	  <li>callback 获取数据后的回调函数</li>
	 * @return {void}
	 */
	GJ.common.geo.initStreet = function(o) {
		o =  $.extend({
			districtEl : '#id_district_id',
			streetEl : '#id_street_id',
			domain: '',
			callback : null
		}, o);
		var $district = $(o.districtEl), 
			$street = $(o.streetEl),
			districtId = -1;
		
		$district.bind('change', function() {
			districtId = parseInt($(this).val());
			if (districtId > -1) {
                GJ.ajaxHelper.post('/ajax.php?module=streetOptions', {domain:o.domain, district_id:districtId, with_all_option:1}, function(data) {
                    $street.removeOption(/.*/);
                    for(var i=0; i<data.length; i++){
                        //由于有的地方还需要script_index,暂时加入到option的属性里面
                        value = (o.withText && parseInt(data[i][0])>=0) ? data[i][0] + ',' + data[i][1] : data[i][0];
                        text  = data[i][1];
                        selected = (data[i][2]) ? 'selected' : '';
                        opt = "<option value='" + value + "' script_index='" + data[i][3] + "'>" + text + "</option>";
                        $street.append(opt);
                        //$street.addOption(o.withText && parseInt(data[i][0])>=0 ? data[i][0] + ',' + data[i][1] : data[i][0], data[i][1], data[i][2]);
                    }
                    o.callback();
                }, 'json'); 				
            } else {
            	$street.removeOption(/.*/);
            	$street.addOption(-1,'不限');
            }  
		});	
	};
});
