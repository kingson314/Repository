define(function(require, exports, module) {
	/*** 模块外部依赖 ***/
	require("./jedate/jedate");
	var Component = require("Component");
	/** * 模块私有数据 ** */
	//默认配置
	var defaults = {
//		id:"",
		//dateCell:"#id",                 //目标元素。由于jedate.js封装了一个轻量级的选择器，因此dateCell还允许你传入class、tag这种方式 '#id .class'  
//		isDisplay:false,                //是否直接显示日期层，false不直接显示，true直接显示需要displayCell配合
		//displayCell:"#id",              //直接显示日期层的容器，可以是ID  CLASS
//		format:"YYYY-MM-DD",   //日期格式
//		minDate:"1900-01-01",  //最小日期
//		maxDate:"2099-12-31",  //最大日期
//		isinitVal:false,                //是否初始化时间
//		isTime:false,                   //是否开启时间选择
//		ishmsLimit:false,               //时分秒限制
//		isClear:false,                  //是否显示清空
//		festival:false,                 //是否显示节日
//		zIndex:999,                     //弹出层的层级高度
//		marks:null,                     //给日期做标注
//		choosefun:function(val) {},     //选中日期后的回调
//		clearfun:function(val) {},      //清除日期后的回调
//		okfun:function(val) {}          //点击确定后的回调
	};
	/** * 类定义 ** */
	var DateTime = function(configs) {
		 //类的属性定义
		this.configs=$.extend(true,{},defaults,configs);
		this._className="sea_datetime";
		//初始化
		this.label=Component.createLabel(this.configs);
		this.datetime= $("<input type='text'/>").attr("id","indate").attr("placeholder","请选择").attr("readonly","readonly");
//		this.configs.dateCell="#"+this.configs.id;
//		this.configs.displayCell="#"+this.configs.id;
		alert(JSON.stringify(this.configs));	
		//setTimeout(jeDate(this.configs),1000);
	};
	/*** 输出类对象 ***/
	exports.create = function(configs) {
		return new DateTime(configs);
	};
});
