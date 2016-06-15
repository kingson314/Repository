define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	var Component = require("Component");
	//require("./template.css");
	/** * 模块私有数据 ** */
	var defaults = {
		id : "",
		//subtype : '',
		//value : "",
		//isNull : true,
		cls : "",
		css : {},
		attr : {	},
		events : {
			//click : null,
			//change : null
		}
	};
	/** * 模块私有方法 ** */
	var self = {
		init : function(me) {
			me.label = Component.createLabel(me.configs);
			// 控件封装
			me.fields = [];
			me.fields[0] = $("<input type='" + me.configs.subtype + "'/>")
					.addClass(Class.textfield);
			// 控件类名设置
			Component.addClass(me.fields[0], me.configs);
			// 控件样式设置
			Component.css(me.fields[0], me.configs);
			// 控件默认值
			Component.val(me.fields[0], me.configs);
			// 控件的属性设置
			Component.attr(me.fields[0], me.configs);
			// 控件的事件绑定
			Component.bind(me.fields[0], me.configs);
		}
	};
	/** * 类定义 ** */
	var Kline = function(configs) {
		// 类的属性定义
		this.configs = $.extend(true, {}, defaults, configs);
		// 初始化
		self.init(this);
	};
	// 类公共方法
	Kline.prototype = {
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
					return val(row,col)
				}
		},
		//清空函数
		clrear : function() {
		}
	};
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new Kline(configs);
	}
});
