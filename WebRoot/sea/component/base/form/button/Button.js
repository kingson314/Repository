define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	require.async("./css/button.css");
	/** * 模块私有数据 ** */
	var defaults = {
		id : "",
		value : "",
		cls : "",
		css : {},
		attr : {	},
		icon:null,
		events : {
			//click : null
		}
	};
	/** * 类定义 ** */
	var Button = function(configs) {
		// 类的属性定义
		this.configs=$.extend(true,{},defaults,configs);
		this._lang=require("./Button.lang.js");
		this._className="sea_button";
		//初始化
		this._input =$("<div></div>");
		var a=$("<a href='#'>"+this.configs.value+"</a>").appendTo(this._input);
		if(this.configs.icon){
			a.prepend("<span  class='"+this.configs.icon+"'></span>");
		}
		this.button=this._input;
		this.init();
	};
	// 类公共方法
	Button.prototype =  $.extend({},require("Input").create(),{
		/**多态：新增或覆盖父类方法**/
		//检查函数
		check:function(configs){
			return true;
		}
	});
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new Button(configs);
	};
});
