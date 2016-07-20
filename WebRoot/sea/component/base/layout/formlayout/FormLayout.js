define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	require.async("./css/formLayout.css");
	var Lang = require("./FormLayout.lang");
	var String = require("String");
	var Component = require("Component");
	/** * 模块私有数据 ** */
	var ClassName="sea_formLayout";
	// 默认配置
	var defaults = {
		parent: null,	// 父元素
		id: "",
		name: "",
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
			//			type: "",
			//			format: "",
			//			value: "",
			//			isNull: "",
			//			colspan: "",
			//			trCss: "",
			//			tdCss: "",
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
		}]],
		after:function(){
			
		}
	};
	/** * 模块私有方法 ** */
	var self = {
		// 初始化
		init: function(me) {
			// 控件封装
		   me.formLayout=$("<form></form>").addClass(ClassName);
		  if(me.configs.parent){
			  if ($.type(me.configs.parent) == "string") {
					me.parent = $(me.configs.parent);
				} else {
					me.parent = me.configs.parent;
			   }
			  me.parent.append(me.formLayout)
		   }
		  	//控件类名设置
		    Component.addClass(me.formLayout,me.configs);
		    //控件样式设置
			Component.css(me.formLayout, me.configs);
			// 控件属性设置
			Component.attr(me.formLayout, me.configs);

			if (me.configs.title) {
				$("<div></div>").addClass(ClassName + "_title").append(me.configs.title).appendTo(me.formLayout);
			}
			var table = $("<div></div>").addClass(ClassName + "_table").appendTo(me.formLayout).css(me.configs.cssInner);
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
					if (!item.type) {
						continue;
					}
					switch (item.type.toLowerCase()) {
					case "button":
						item._Component=require("Button").create(item);
						$("<div></div>").append(item._Component.button).addClass(ClassName + "_td").css("width", colWidth + '%').css(item.tdCss||{}).appendTo(tr);
						break;
					case "buttongroup":
						item._Component=require("ButtonGroup").create(item);
						$("<div></div>").append(item._Component.buttonGroup).addClass(ClassName + "_td").css("width", colWidth + '%').css(item.tdCss||{}).appendTo(tr);
						break;
					case "checkbox":
						item._Component=require("Checkbox").create(item);
						if(item._Component.label){
							var tdLabel = $("<div></div>").addClass(ClassName + "_td").css("width", colWidth * me.configs.labelWidthPercent + '%').appendTo(tr);
							//self.appendLabel(tdLabel,item._Component.label );
						}else{
							me.configs. labelWidthPercent=0;
						}
						var tdField = $("<div></div>").addClass(ClassName + "_td").css("width", colWidth * (1 -me.configs. labelWidthPercent) + '%').appendTo(tr);
						self.appendFields(tdField,[item._Component.checkbox,,item._Component.label ]);
						break;
					case "checkgroup":
						item._Component=require("CheckGroup").create(item);
						$("<div></div>").append(item._Component.checkGroup).addClass(ClassName + "_td").css("width", colWidth + '%').css(item.tdCss||{}).appendTo(tr);
						break;
					case "color":
						break;
					case "date":		
					case "time":	
					case "datetime":
						break;				
					case "hidden":
						var hidden = $("<input type='hidden' />").append(me.formLayout);
						item._Component=require("Hidden").create(item).hidden;
						me.formLayout.append(item._Component);
						break;
					case "img":
					case "imgage":
						item._Component=require("Img").create(item);
						$("<div></div>").append(item._Component.img).addClass(ClassName + "_td").css("width", colWidth + '%').css(item.tdCss||{}).appendTo(tr);
						break;						
					case "label":
						item._Component=require("Label").create(item);
						$("<div></div>").append(item._Component.label).addClass(ClassName + "_td").css("width", colWidth + '%').css(item.tdCss||{}).appendTo(tr);
						break;
					case "radio":
						item._Component=require("Radio").create(item);
						if(item._Component.label){
							var tdLabel = $("<div></div>").addClass(ClassName + "_td").css("width", colWidth * me.configs.labelWidthPercent + '%').appendTo(tr);
							//self.appendLabel(tdLabel,item._Component.label );
						}else{
							me.configs. labelWidthPercent=0;
						}
						var tdField = $("<div></div>").addClass(ClassName + "_td").css("width", colWidth * (1 -me.configs. labelWidthPercent) + '%').appendTo(tr);
						self.appendFields(tdField,[item._Component.radio,,item._Component.label ]);
						break;
					case "radiogroup":
						item._Component=require("RadioGroup").create(item);
						var tdField = $("<div></div>").addClass(ClassName + "_td").css("width", colWidth * (1 -me.configs. labelWidthPercent) + '%').appendTo(tr);
						self.appendFields(tdField,item._Component.radioGroup);
						break;
					case "select":
						item._Component=require("Select").create(item);
						if(item._Component.label){
							var tdLabel = $("<div></div>").addClass(ClassName + "_td").css("width", colWidth * me.configs.labelWidthPercent + '%').appendTo(tr);
							self.appendLabel(tdLabel,item._Component.label );
						}else{
							me.configs. labelWidthPercent=0;
						}
						var tdField = $("<div></div>").addClass(ClassName + "_td").css("width", colWidth * (1 -me.configs. labelWidthPercent) + '%').appendTo(tr);
						self.appendFields(tdField,item._Component.select);
						break;
					case "textarea":
						item._Component=require("Textarea").create(item);
						if(item._Component.label){
							var tdLabel = $("<div></div>").addClass(ClassName + "_td").css("width", colWidth * me.configs.labelWidthPercent + '%').appendTo(tr);
							self.appendLabel(tdLabel,item._Component.label );
						}else{
							me.configs. labelWidthPercent=0;
						}
						var tdField = $("<div></div>").addClass(ClassName + "_td").css("width", colWidth * (1 -me.configs. labelWidthPercent) + '%').appendTo(tr);
						self.appendFields(tdField,item._Component.textarea);
						break;		
					case "textfield":
						item._Component=require("Textfield").create(item);
						if(item._Component.label){
							var tdLabel = $("<div></div>").addClass(ClassName + "_td").css("width", colWidth * me.configs.labelWidthPercent + '%').appendTo(tr);
							self.appendLabel(tdLabel,item._Component.label );
						}else{
							me.configs. labelWidthPercent=0;
						}
						var tdField = $("<div></div>").addClass(ClassName + "_td").css("width", colWidth * (1 -me.configs. labelWidthPercent) + '%').appendTo(tr);
						self.appendFields(tdField,item._Component.textfield);
						break;
					case "navbar":
						if(item.obj){
							$("<div></div>").append(item.obj).addClass(ClassName + "_td").css("width", colWidth + '%').css(item.tdCss||{}).appendTo(tr);
						}else{
							item._Component=require("Navbar").create(item);
							$("<div></div>").append(item._Component.navbar).addClass(ClassName + "_td").css("width", colWidth + '%').css(item.tdCss||{}).appendTo(tr);
						}
						break;
					default:
						continue;
					}
				}
			}
		},
		appendLabel: function(td, label) {
			$("<div></div>").addClass(ClassName+"_label").append(label).appendTo(td);
		},
		appendFields: function(td, fields) {
			var formFields = $("<div></div>").addClass(ClassName+"_field");
			if($.type(fields)=="array"){
				var fieldCount=fields.length;
				for (var i = 0; i < fieldCount; i++) {
					formFields.append(fields[i]);
				}
			}else{
				formFields.append(fields);
			}
			td.append(formFields);
		}
	};
	/** * 类定义 ** */
	var FormLayout = function(configs) {
		this.configs = $.extend(true, {},defaults, configs);
		self.init(this);
		this.configs.after();
	};

	// 类公共方法
	FormLayout.prototype = {
		//检查函数
		check:function(){
			var rowCount=this.configs.items.length;
			for (var rowIndex = 0; rowIndex < rowCount; rowIndex++) {
				var rowItems = this.configs.items[rowIndex];
				var colCount= rowItems.length;
				for (var colIndex = 0; colIndex <colCount; colIndex++) {
					var item = rowItems[colIndex];
					if (!item.type) {
						continue;
					}
					if(!item._Component){
						continue;
					}
					if(item._Component.check){
						if(!item._Component.check()){
							 item._Component.focus();
							return false;
						}
					}
				}
			}
			return true;
		},
		//值获取或赋值函数
		val:function(data){
			if(data){
					var rowCount=this.configs.items.length;
					for (var rowIndex = 0; rowIndex < rowCount; rowIndex++) {
						var rowItems = this.configs.items[rowIndex];
						var colCount= rowItems.length;
						for (var colIndex = 0; colIndex <colCount; colIndex++) {
							var item = rowItems[colIndex];
							if (!item.type) {
								continue;
							}
							switch (item.type.toLowerCase()) {
								case "checkbox":
								case "checkgroup":
								case "color":
								case "date":
								case "time":
								case "datetime":
								case "hidden":
								case "radio":
								case "radiogroup":
								case "textarea":
								case "textfield":
								case "select":
									item._Component.val(data[item.id]);
									break;
								default:
									continue;
							}
						}
					}
				}else{
					var data={};
					var rowCount=this.configs.items.length;
					for (var rowIndex = 0; rowIndex < rowCount; rowIndex++) {
						var rowItems = this.configs.items[rowIndex];
						var colCount= rowItems.length;
						for (var colIndex = 0; colIndex <colCount; colIndex++) {
							var item = rowItems[colIndex];
							if (!item.type) {
								continue;
							}
							switch (item.type.toLowerCase()) {
								case "checkbox":
								case "checkgroup":
								case "color":
								case "date":
								case "time":
								case "datetime":
								case "hidden":
								case "radio":
								case "radiogroup":
								case "textarea":
								case "textfield":
								case "select":
									data[item.id]=item._Component.val();
									break;
								default:
									continue;
							}
						}
					}
					return data;
				}
			},
			//清空函数
			clear:function(){
				var rowCount=this.configs.items.length;
				for (var rowIndex = 0; rowIndex < rowCount; rowIndex++) {
					var rowItems = this.configs.items[rowIndex];
					var colCount= rowItems.length;
					for (var colIndex = 0; colIndex <colCount; colIndex++) {
						var item = rowItems[colIndex];
						if (!item.type) {
							continue;
						}
						switch (item.type.toLowerCase()) {
							case "checkbox":
							case "checkgroup":
							case "color":
							case "date":
							case "time":
							case "datetime":
							case "hidden":
							case "radio":
							case "radiogroup":
							case "textarea":
							case "textfield":
							case "select":
								item._Component.clear();
								break;
							default:
								continue;
						}
					}
				}
			}
	}
	/** *输出类对象 ** */
	exports.create = function(configs) {
		return new FormLayout(configs);
	};
});