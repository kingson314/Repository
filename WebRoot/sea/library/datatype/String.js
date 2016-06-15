define(function(require, exports, module) {
	/* @Description: undefined字符串返回空，否则返回原字符串
 	* @ param str 
 	* @ return str
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	exports.isNil = function(str) { 
		if ( str == undefined||str==null)
			str = ''; 
		return str;
	};

	/* @Description: undefined字符串返回then，否则返回原字符串
 	* @ param str 
 	* * @ return str
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	exports.isNil = function(str, then) {
		if ( str == undefined||str==null)
			str = then;
		return str;
	};


	/* @Description: 判断字符串是否为空
 	* @ param str 
 	* @ return boolean 
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	exports.isBlank = function(str) {
		if($.type(str)=='boolean')
			return false;
		if(str==undefined||str==null||str=='')
			return true;
		return false;
	};
	
	/* @Description: 使用参数替换指定字符串中的参数标志，字符串中的参数标识形如（数字1：对应的参数以分号隔开，第一个对应的参数标识0，后面的逐个加1
 	* @ param str 
 	* @ return String 
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/	
	exports.stringUseParam=function(str,params){
		var replaceStr="";
		var separator=";";
		var paramArr=params.toString().split(separator);
		for(var i=0;i<paramArr.length;i++){
			replaceStr=new RegExp("\\["+i+"\\]","g");
			str=str.replace(replaceStr,paramArr);
		}
		return str;
	}
	/* @Description: 字符串的第一个字母大写
 	* @ param str 
 	* @ return String 
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/	
	exports.uppeFirst=function(str){
		if(str.length>0){
			str=str.substring(0,1).toUpperCase()+str.substring(1);
		}
		return str;
	}
});