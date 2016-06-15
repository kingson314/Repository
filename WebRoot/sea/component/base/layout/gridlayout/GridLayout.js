define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	var Component = require("Component");
	
	/** * 模块私有数据 ** */
	var ClassName="sea_gridLayout";
	var defaults = {
		id : "",
		cls : "container",
		css : {},
		attr : {	},
		items:[{items:[{},{}]},{}]
	};
	 
	/** * 类定义 ** */
	var GridLayout = function(configs) {
		// 类的属性定义
		this.configs = $.extend(true, {}, defaults, configs);
		this.gridLayout==$("<div></div>").addClass(this.configs.cls).addClass(ClassName);
		// 初始化
		if(this.configs.parent){
			  if ($.type(this.configs.parent) == "string") {
					this.parent = $(this.configs.parent);
				} else {
					this.parent =this.configs.parent;
			   }
			  this.parent.append(this.gridLayout);
		   }
	};
	// 类公共方法
	GridLayout.prototype = {
		//检查函数
		check:function(configs){
		
		},
		//白盒测试函数
		test:function(data){
			
		},
		//值获取或赋值函数
		val : function(row,col,val) {
				if(val){
					
				}else{
					return val(row,col);
				}
		},
		//清空函数
		clrear : function() {

		}
	};
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new GridLayout(configs);
	};
});
