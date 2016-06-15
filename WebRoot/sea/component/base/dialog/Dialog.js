define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	require("./jquery.dialogBox");
	require.async("./css/dialog.css");
	var Component = require("Component");
	/** * 模块私有数据 ** */
	var  defaults = {
			id:"",
	        width: 500,
	        //弹出层宽度
	        height:300,
	        //弹出层高度
	        autoSize: true,
	        //是否自适应尺寸,默认自适应
	        autoHide: false,
	        //是否自自动消失，配合time参数共用
	        time: 3000,
	        //自动消失时间，单位毫秒
	        zIndex: 99999,
	        //弹出层定位层级
	        hasMask: true,
	        //是否显示遮罩层
	        hasClose: true,
	        //是否显示关闭按钮
	        hasBtn: true,
	        //是否显示操作按钮，如取消，确定
	        confirmValue: "",
	        //确定按钮文字内容
	        confirm: function() {},
	        //点击确定后回调函数
	        cancelValue: "关闭",
	        //取消按钮文字内容
	        cancel: function() {},
	        //点击取消后回调函数，默认关闭弹出框
	        effect: '',
	        //动画效果：fade(默认),newspaper,fall,scaled,flip-horizontal,flip-vertical,sign,
	        type: 'normal',
	        //对话框类型：normal(普通对话框),correct(正确/操作成功对话框),error(错误/警告对话框)
	        title: '提示',
	        //标题内容，如果不设置，则连同关闭按钮（不论设置显示与否）都不显示标题
	        content: '' //正文内容，可以为纯字符串，html标签字符串，以及URL地址，当content为URL地址时，将内嵌目标页面的iframe。
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
