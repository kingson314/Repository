define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	require("./jquery.dialogBox");
	require.async("./css/dialog.css");
	var Component = require("Component");
	/** * 模块私有数据 ** */
	var  defaults = {
			id:"",
 			width: null, //弹出层宽度
 			height: null,  //弹出层高度
 			zIndex: 99999,  //弹出层定位层级
 			confirm: function(){}, //点击确定后回调函数
 			cancel: function(){},  //点击取消后回调函数，默认关闭弹出框
 			title: '',  //标题内容，如果不设置，则连同关闭按钮（不论设置显示与否）都不显示标题
 			content: ''  //正文内容，可以为纯字符串，html标签字符串，以及URL地址，当content为URL地址时，将内嵌目标页面的iframe（未实现）。
	    };
	/** * 模块私有方法 ** */
	 
	/** * 类定义 ** */
	var Dialog = function(configs) {
		// 类的属性定义
		this.configs = $.extend(true, {}, defaults, configs);
		// 初始化
		this.dialog=$("<div style='display:none;'></div>").appendTo($("body")).dialogBox(this.configs);
	};
	// 类公共方法
	Dialog.prototype = {
		//白盒测试函数
		test:function(data){
		}
	};
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new Dialog(configs);
	};
});
