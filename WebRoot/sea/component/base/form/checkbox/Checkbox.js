define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	/** * 模块私有数据 ** */
	var defaults = {
			id : "",
			value : "",
			cls : "",
			checked:false,
			css : {},
			attr : {	},
			events : {
				//click : null,
				//change : null
			}
	};
	/** * 模块私有方法 ** */
	/** * 类定义 ** */
	var Checkbox = function(configs) {
		 //类的属性定义
		this.configs=$.extend(true,{},defaults,configs);
		this._lang=require("./Checkbox.lang.js");
		this._className="sea_checkbox";
		//初始化
		this.checkbox=this._input= $("<input type='checkbox'/>");
		this.configs.labelCls="sea_checkLabel";
		this.init();
	};
	//类公共方法
	Checkbox.prototype= $.extend({},require("Input").create(),{
		/**多态：新增或覆盖父类方法**/
		val:function(data){
			if(data){
				this._input.attr("checked",data);
			}else{ 
				return this._input.attr("checked");
			}
		}
	});
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new Checkbox(configs);
	};
});
