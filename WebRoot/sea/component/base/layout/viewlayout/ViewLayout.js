define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	require.async("./css/viewLayout.css");
	var String = require("String");
	var Component = require("Component");
	/** * 模块私有数据 ** */
	var ClassName="sea_viewLayout";
	// 默认配置
	var defaults = {
		parent: null,	// 父元素
		id: "",
		name: "",
		record:{},//视图记录集
		title: null,
		buttons: [],
		width: "100%",
		height: "100%",
		cls: "",
		css: {"margin":"0 auto"},
		attr: {},
		cssInner:{"padding":"0 10%"},
		labelWidthPercent: 0.382,// 黄金分割线，必须为数字；fieldWidth=1-labelWidthPercent
		events: {
			click: null,
			change: null
		},
		items: [[{
			//			id: "",
			//			name: "",
			//			label: "",
			//			value: "",
			//			colspan: "",
			//			trCss: "",
			//			tdCss: "",
			//			cls: "",
			//			css: "",
			//			attr: ""
			//			}
		}]]
	};
	/** * 模块私有方法 ** */
	var self = {
		// 初始化
		init: function(me) {
			// 控件封装
		   me.viewLayout=$("<form></form>").addClass(ClassName);
		  if(me.configs.parent){
			  if ($.type(me.configs.parent) == "string") {
					me.parent = $(me.configs.parent);
				} else {
					me.parent = me.configs.parent;
			   }
			  me.parent.append(me.viewLayout)
		   }
		  	//控件类名设置
		    Component.addClass(me.viewLayout,me.configs);
		    //控件样式设置
			Component.css(me.viewLayout, me.configs);
			// 控件属性设置
			Component.attr(me.viewLayout, me.configs);

			if (me.configs.title) {
				$("<div></div>").addClass(ClassName + "_title").append(me.configs.title).appendTo(me.viewLayout);
			}
			var table = $("<div></div>").addClass(ClassName + "_table").appendTo(me.viewLayout).css(me.configs.cssInner);
			var maxColCount = me.configs.items[0].length; // 潜规则1：以首行配置的列数为最大列数(包含hidden类型以及空对象)
			var colWidthInit = Math.floor(100 / maxColCount);
			var rowCount=me.configs.items.length;
			for (var rowIndex = 0; rowIndex < rowCount; rowIndex++) {
				var rowItems = me.configs.items[rowIndex];
				var colCount=rowItems.length;
				var tr = $("<div></div>").addClass(ClassName + "_tr").appendTo(table);
				if(rowItems&&colCount>0 && rowItems[0].trCss){
					tr.css(rowItems[0].trCss)
				}
				for (var colIndex = 0; colIndex < colCount; colIndex++) {
					var item = rowItems[colIndex];
					if(item.colspan){
						colWidth=colWidthInit * item.colspan;
					}else{
						colWidth=colWidthInit;
					}
					var tdLabel = $("<div></div>").addClass(ClassName + "_td").css("width", colWidth * me.configs.labelWidthPercent + '%').appendTo(tr);
					self.appendLabel(tdLabel,Component.createLabel(item));
					var tdField = $("<div></div>").addClass(ClassName + "_td").css("width", colWidth * (1 -me.configs. labelWidthPercent) + '%').appendTo(tr);
					var val=me.configs.record[item.id];
					if(val==null || val==undefined){
						val=item.val;
					}
					self.appendFields(tdField,val);
				}
			}
		},
		appendLabel: function(td, label) {
			$("<div></div>").addClass(ClassName+"_label").append(label).appendTo(td);
		},
		appendFields: function(td, fields) {
			var formFields = $("<div></div>").addClass(ClassName+"_field");
			formFields.append(fields);
			td.append(formFields);
		}
	};
	/** * 类定义 ** */
	var viewLayout = function(configs) {
		this.configs = $.extend(true, {},defaults, configs);
		self.init(this);
	};
	// 类公共方法
	viewLayout.prototype = {
	}
	/** *输出类对象 ** */
	exports.create = function(configs) {
		return new viewLayout(configs);
	};
});