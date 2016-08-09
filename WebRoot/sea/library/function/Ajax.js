define(function(require, exports, module) {
	/**
	 * @Description: 获取url
	 * @ param actionName
	 * @ return url
	 * @date 2015-12-31 
	 * @author:kfzx-fenggq
	 */
	var getUrl=function(actionName,data){
		var params="";
		if(data){
			$.each(data,function(key,val){
				if(actionName.indexOf("?")>=0){
					params+="&"
				}else	if(params==""){
					params="?"
				}else{
					params+="&"
				}
				params+=key+"="+val;
			});
		}
		return Session.basePath+actionName+params;
	};
	exports.getUrl=getUrl;
	/**
	 * @Description: ajax请求
	 * @ param url 
	 * @ param params
	 * @ param callback 
	 * @ return 
	 * @date 2015-12-31 
	 * @author:kfzx-fenggq
	 */
	exports.post = function(url, data, callback,async) {
		$.ajax( {
			type : 'POST',
			url : getUrl(url),
			data : data||{},
			async : async,
			dataType : "json",
			success : function(result) {
				if(callback){
					callback.call(window, result);
				}
			}
		});
	}
	
	exports.getParam = function(paramName) {
		var url = document.location.href;
		var arrStr = url.substring(url.indexOf("?") + 1).split("&");
		for ( var i = 0; i < arrStr.length; i++) {
			var loc = arrStr[i].indexOf(paramName + "=");
			if (loc != -1) {
				return arrStr[i].replace(paramName + "=", "").replace("?", "");
				break;
			}
		}
		return "";
	};
});