define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	require.async("./css/checkgroup"+Cookie.theme+".css");
	var Component = require("Component");
	
	/** * 模块私有数据 ** */
	var defaults = {
			id:"",
			align:"0",//横排：horizontal  或 0; 竖排：vertical 或 1
			cls : "",
			css : {},
			attr : {	},
			items:[{
				id : "",
				value : "",
				cls : "",
				css : {},
				attr : {	},
				events : {
					//click : null
				}
			}]
	};
	/** * 模块私有方法 ** */
	var self = {
		init : function(me) {
			me.checkGroup=$("<div></div>").addClass(me._className);
			var ul=$("<ul></ul>").appendTo(me.checkGroup);
			$.each(me.configs.items,function(index,item){
				var li=$("<li></li>").appendTo(ul);
				if(me.configs.align=="0"||me.configs.align=="horizontal"){
					li.css("display","inline");
				}
				item.labelCls="sea_checkLabel";
				var checkbox=$("<input type='checkbox'/>").appendTo(li);
				li.append("&nbsp;");
				var label=Component.createLabel(item).appendTo(li);
				// 控件类名设置
				Component.addClass(checkbox, item);
				// 控件样式设置
				Component.css(checkbox, item);
				// 控件的属性设置
				Component.attr(checkbox, item);
				// 控件默认值
				Component.val(checkbox, item);
				// 控件的事件绑定
				Component.bind(checkbox, item);
			});
			// 控件类名设置
			Component.addClass(me.checkGroup, me.configs);
			// 控件样式设置
			Component.css(me.checkGroup, me.configs);
			// 控件的属性设置
			Component.attr(me.checkGroup, me.configs);
		}
	};
	/** * 类定义 ** */
	var CheckGroup = function(configs) {
		// 类的属性定义
		this.configs = $.extend(true, {}, defaults, configs);
		// 初始化
		// 类的属性定义
		this.configs=$.extend(true,{},defaults,configs);
		this._className="sea_checkgroup";
		//初始化
		self.init(this);
	};
	// 类公共方法
	CheckGroup.prototype = {
		 val:function(){
		},
		clear:function(){}
	};
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new CheckGroup(configs);
	};
});
