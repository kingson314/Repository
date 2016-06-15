define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	require("./css/accordionlayout.css");
	var String = require("String");
	var Component = require("Component");
	/** * 模块私有数据 ** */
	var ClassName="sea_accordionLayout";
	// 默认配置
	var defaults = {
		parent: null,
		// 父元素
		id: "",
		name: "",
		title: null,
		buttons: [],
		width: null,
		height: null,
		cls: "",
		css: {"margin":"0 auto"},
		attr: {},
		labelWidthPercent: 0.382,// 黄金分割线，必须为数字；fieldWidth=1-labelWidthPercent
		events: {
			click: null,
			change: null
		},
		items: [{//只支持一维数组--> 嵌套一维数组
			//			id: "",
			//			name: "",
			//			label: "",
			//			type: "",
			//			format: "",
			//			value: "",
			//			isNull: "",
			//			cls: "",
			//			css: "",
			//			attr: "",
			//			options: [{
			//				value: "",
			//				text: ""
			//			}],
			//			events: {
			//				click: null,
			//				change: null
			//			}
		}]
	};
	/** * 模块私有方法 ** */
	var self = {
		// 初始化
		init: function(me) {
			// 控件封装
		   me.accordionLayout=$("<ul></ul>").addClass(ClassName);
		  if(me.configs.parent){
			  if ($.type(me.configs.parent) == "string") {
					me.parent = $(me.configs.parent);
				} else {
					me.parent = me.configs.parent;
			   }
			  me.parent.append(me.accordionLayout)
		   }
		  	//控件类名设置
		    Component.addClass(me.accordionLayout,me.configs);
		    //控件样式设置
			Component.css(me.accordionLayout, me.configs);
			// 控件属性设置
			Component.attr(me.accordionLayout, me.configs);

			if (me.configs.title) {
				$("<li></li>").addClass(ClassName + "_title").append(me.configs.title).appendTo(me.accordionLayout);
			}
			for (var rowIndex = 0; rowIndex < me.configs.items.length; rowIndex++) {
				var tr = $("<li></li>").addClass(ClassName + "_tr").appendTo(me.accordionLayout);
				var item = me.configs.items[rowIndex];
				if (!item.type) {
					continue;
				}
				switch (item.type.toLowerCase()) {
				/***分组显藏控制***/
				case "group":
					break;
				case "item":
					break;
				/***对表单提供单列支持***/
				case "hidden":
					var hidden = $("<input type='hidden' />").after(me.accordionLayout);
					Component.attr(hidden, item);
					Component.val(hidden, item);
					break;
				case "textfield":
					item._module=require("Textfield").create(item);
					if(item._module.label){
						item._module.label.addClass(ClassName+"_label").appendTo(tr);
					}
					item._module.textfield.addClass(ClassName+"_field").appendTo(tr);
					break;
				case "button":
					item._module=require("Button").create(item);
					item._module.button.addClass(ClassName + "_btn").appendTo(tr);
					break;
				default:
					break;
				}
			}
		}
	};
	/** * 类定义 ** */
	var AccordionLayout = function(configs) {
		this.configs = $.extend(true, {},defaults, configs);
		self.init(this);
	};

	// 类公共方法
	AccordionLayout.prototype = {
	}
		
	/** *输出类对象 ** */
	exports.create = function(configs) {
		return new AccordionLayout(configs);
	};
});