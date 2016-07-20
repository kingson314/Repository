define(function(require, exports, module) {
	/*** 模块外部依赖 ***/
	var Json=require("Json");
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
		attr:{},
		url:null,//返回[{value:"",text:""},{...}]
		params:{},//url时生效
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
		this.select=this._input= $("<select>");
		this.init();
		this.select.append("<option value=''>"+this._lang["please.select"]+"</option>");
		if(this.configs.url){
			Ajax=require("Ajax");
			var me=this;
			Ajax.post(me.configs.url, me.configs.params, function(result){
					var len=result.data.length;
					for(var i=0;i<len;i++){
						var item=result.data[i];
						me.select.append("<option value='"+item.value+"'>"+item.text+"</option>");
					};
				},false);
		}else{
			var len=this.configs.options.length;
			for(var i=0;i<len;i++){
				var item=this.configs.options[i];
				this.select.append("<option value='"+item.value+"'>"+item.text+"</option>");
			};
		}
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
