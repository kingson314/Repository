define(function(require, exports, module) {
	/**
	 * @Description: 获取数组字段的值，用于清单显示 
	 * @ param filedValue 
	 * @ param index 
	 * @ return 数组字段的值 
	 * @date 2015-12-31 
	 * @author:kfzx-fenggq
	 */
	exports.getArrayFieldValue = function(fieldValue, index) {
		var rs = "";
		if (fieldValue && fieldValue != null) {
			var arr = fieldValue.split("$|$")
			{
				if (arr.length > index) {
					rs = atrr[index];
				}
			}
		}
		return rs;
	}

	/**
	 * @Description: 获取字符串一维数组的索引 
	 * @ param arr 
	 * @ param item 
	 * @ return int @date
	 * 2015-12-31 @author:kfzx-fenggq
	 */
	exports.getIndex(arr, item)
	{
		var rs = -1;
		if (!arr || arr.length <= 0) {
			return rs;
		}
		for ( var i = 0; i < arr.length; i++) {
			if (arr[i] == item) {
				rs = i;
				break;
			}
		}
		return rs;
	}	;
});
