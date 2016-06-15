define(function(require, exports, module) {
	/*** 模块外部依赖 ***/
	/** * 模块私有数据 ** */
	//默认配置
	var defaults = {
		id:"",
		label:"",
		labelCss:{},
		labelAttr:{},
		value:"",
		isNull:true,
		cls:"",
		css:{},
		attr:{disabled:false,maxLen:0},
		options:[],
		events:{
			click:null,
			change:null
		}
	};
	/** * 类定义 ** */
	var Select = function(configs) {
		 //类的属性定义
		this.configs=$.extend(true,{},defaults,configs);
		this._lang=require("./Select.lang.js");
		this._className="sea_select";
		//初始化
		this.select=this._input= $("<select></select>");
		this.select.append("<option value=''>"+this._lang["please.select"]+"</option>");
		var len=this.configs.options.length;
		for(var i=0;i<len;i++){
			var item=this.configs.options[i];
			this.select.append("<option value='"+item.value+"'>"+item.text+"</option>");
		};
		this.init();
	};
	//类公共方法
	Select.prototype= $.extend({},require("Input").create(),{
		/**多态：新增或覆盖父类方法**/
	});
	/*** 输出类对象 ***/
	exports.create = function(configs) {
		return new Select(configs);
	};
});
