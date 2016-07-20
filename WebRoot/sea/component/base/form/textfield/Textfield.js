define(function(require, exports, module) {
	/*** 模块外部依赖 ***/
	/** * 模块私有数据 ** */
	//默认配置
	var defaults = {
		id:"",
		validator:'char',
		label:"",
		labelCss:{},
		labelAttr:{},
		value:"",
		isNull:true,
		subtype:"text",
		cls:"",
		css:{},
		attr:{disabled:false,maxLen:0},
		events:{
			click:null,
			change:null
		}
	};
	/** * 类定义 ** */
	var Textfield = function(configs) {
		 //类的属性定义
		this.configs=$.extend(true,{},defaults,configs);
		this._lang=require("./Textfield.lang.js");
		this._className="sea_textfield";
		//初始化
		this.textfield=this._input= $("<input type='"+this.configs.subtype+"'/>");
		this.init();
	};
	//类公共方法
	Textfield.prototype= $.extend({},require("Input").create(),{
		/**多态：新增或覆盖父类方法**/
	});
	/*** 输出类对象 ***/
	exports.create = function(configs) {
		return new Textfield(configs);
	};
});
