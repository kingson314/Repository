define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	require.async("./css/choice"+Cookie.theme+".css");
	var Component = require("Component"); 
	/** * 模块私有数据 ** */
	var defaults = {
			id:"",
			width: "50%",
			height: "300px",//无效
			cls: "",
			css: {
				"margin":"0 auto",
				"text-align":"center",
			},
			attr : {	} ,
			titleLeft:"未选列表",
			titleRight:"已选列表",
			columnKey:"id",
			columnLeft:[],
			urlLeft:null,
			paramLeft:{},
			dataLeft:[],
			columnRight:[],
			urlRight:null,
			paramRight:{},
			dataRight:[],
			toRight:function(vals){
				
			},
			toAllRight:function(vals){
				
			},
			toLeft:function(vals){
				
			},
			toAllLeft:function(vals){
				
			}
			
	};
		/** * 模块私有方法 ** */
	var self = {
		init : function(me) {
			me.choice=$("<div></div>").addClass(me._className);
			var left=$("<div></div>").addClass(me._className+"_left").css({}).appendTo(me.choice).append("<div class='"+me._className+"_title'>"+me.configs.titleLeft+"</div>");
			var btnChoice=$("<div></div>").addClass(me._className+"_btnChoice").css({}).appendTo(me.choice);
			var right=$("<div></div>").addClass(me._className+"_right").css({}).appendTo(me.choice).append("<div class='"+me._className+"_title'>"+me.configs.titleRight+"</div>");
			var btnOrder=$("<div></div>").addClass(me._className+"_btnOrder").css({}).appendTo(me.choice);
			
			var btnChoice_toRight=$("<input type='button' value='>'/>").css({"width":"30px"}).appendTo(btnChoice).click(function(){
				var vals=me.getLeftSelected(me.configs.columnKey);
				me.configs.toRight(vals); 
				me.reload();
			});
			var btnChoice_toAllRight=$("<input type='button' value='>>'/>").css({"width":"30px"}).appendTo(btnChoice).click(function(){
				var vals=me.getLeftSelectedAll(me.configs.columnKey);
				me.configs.toAllRight(vals);
				me.reload();
			});
			var btnChoice_toLeft=$("<input type='button' value='<'/>").css({"width":"30px"}).appendTo(btnChoice).click(function(){
				var vals=me.getRightSelected(me.configs.columnKey);
				me.configs.toLeft(vals);
				me.reload();
			});
			var btnChoice_toAllLeft=$("<input type='button' value='<<'/>").css({"width":"30px"}).appendTo(btnChoice).click(function(){
				var vals=me.getRightSelectedAll(me.configs.columnKey);
				me.configs.toAllLeft(vals);
				me.reload();
			});
			var tableHeaderLeft=$("<table class='"+me._className+"_tableHeader'></table>").appendTo(left);
			var trHeaderLeft=$("<tr></tr>").appendTo(tableHeaderLeft);
			$.each(me.configs.columnLeft,function(index,item){
				var td="<th";
				if(item.display){
					td+=" style='display:"+item.display+"'";
				}
				td+=" class='"+me._className+"_th' algin='"+item.align+"' width='"+item.width+"'>"+item.label+"</th>";
				trHeaderLeft.append(td);
			});

			/**urldata**/
			if(me.configs.urlLeft){
				Ajax=require("Ajax");
				Ajax.post(me.configs.urlLeft, me.configs.paramLeft, function(result){
						me.configs.dataLeft==result.data;
					},false);
				Ajax.post(me.configs.urlRight, me.configs.paramRight, function(result){
					me.configs.dataRight==result.data;
				},false);
			}
			/****/
			var mainBodyLeft=$("<div class='"+me._className+"_mainBody'></dvi>").appendTo(left);
			/**begin**/
			me.tableBodyLeft=$("<table class='"+me._className+"_tableBody'></table>").appendTo(mainBodyLeft);
			$.each(me.configs.dataLeft,function(index,itemData){
				var tr=$("<tr></tr>").appendTo(me.tableBodyLeft);
				$.each(me.configs.columnLeft,function(index,item){
					var td="<td";
					if(item.display){
						td+=" style='display:"+item.display+"'";
					}
					td+=" class='"+me._className+"_td' algin='"+item.align+"' width='"+item.width+"'>"+itemData[item.name]||'&nbsp;'+"</td>";
					tr.append(td);
				});
			});
			/**end**/
			var tableHeaderRight=$("<table  class='"+me._className+"_tableHeader'></table>").appendTo(right);
			var trHeaderRight=$("<tr></tr>").appendTo(tableHeaderRight);
			$.each(me.configs.columnRight,function(index,item){
				var td="<th";
				if(item.display){
					td+=" style='display:"+item.display+"'";
				}
				td+=" class='"+me._className+"_th' algin='"+item.align+"' width='"+item.width+"'>"+item.label+"</th>";
				trHeaderRight.append(td);
			});
			var mainBodyRight=$("<div class='"+me._className+"_mainBody'></dvi>").appendTo(right);
			/**begin**/
			me.tableBodyRight=$("<table class='"+me._className+"_tableBody'></table>").appendTo(mainBodyRight);
			$.each(me.configs.dataRight,function(index,itemData){
				var tr=$("<tr></tr>").appendTo(me.tableBodyRight);
				$.each(me.configs.columnRight,function(index,item){
					var td="<td";
					if(item.display){
						td+=" style='display:"+item.display+"'";
					}
					td+=" class='"+me._className+"_td' algin='"+item.align+"' width='"+item.width+"'>"+itemData[item.name]||'&nbsp;'+"</td>";
					tr.append(td);
				});
			});
			/**end**/
			me.tableBodyLeft.delegate("tr",'click', function(){
				var cls=me._className+"_selected";
				if($(this).hasClass(cls)){
					$(this).removeClass(cls);
				}else{
					$(this).addClass(cls);
				}
				 //alert(this.rowIndex)
			} ) ;
			me.tableBodyRight.delegate("tr",'click', function(){
				var cls=me._className+"_selected";
				if($(this).hasClass(cls)){
					$(this).removeClass(cls);
				}else{
					$(this).addClass(cls);
				}
			} ) ;
			// 控件样式设置
			Component.css(me.choice , me.configs);
			// 控件类名设置
			Component.addClass(me.choice, me.configs);
			// 控件的属性设置
			Component.attr(me.choice, me.configs);
			mainBodyLeft.height((me.choice.height()-60)+'px');
			mainBodyRight.height((me.choice.height()-60)+'px');
		},
		load:function(me){
			
		}
	}; 
	/** * 类定义 ** */
	var Choice = function(configs) {
		// 类的属性定义
		this.configs = $.extend(true, {}, defaults, configs);
		this._className="sea_choice";
		// 初始化
		self.init(this);
	};
	// 类公共方法
	Choice.prototype = {
		 getLeftSelected:function(key){
			var vals=[]; 
			var me=this;
			var selector="."+me._className+"_left ."+me._className+"_tableBody tr";
			me.choice.find(selector).each(function(index,item){
				if($(item).hasClass(me._className+"_selected")){
					$(item).remove();
					vals.push(me.configs.dataLeft[index][key]);
				}
			});
			return vals;
		},
		 getLeftSelectedAll:function(key){
			var vals=[]; 
			var me=this;
			$.each(me.configs.dataLeft,function(index,item){
				vals.push(item[key]);
			});
			return vals;
		},
		getRightSelected:function(key){
			var vals=[]; 
			var me=this;
			var selector="."+me._className+"_right ."+me._className+"_tableBody tr";
			me.choice.find(selector).each(function(index,item){
				if($(item).hasClass(me._className+"_selected")){
					vals.push(me.configs.dataRight[index][key]);
				}
			});
			return vals;
		},
		 getRightSelectedAll:function(key){
			var vals=[]; 
			var me=this;
			$.each(me.configs.dataRight,function(index,item){
				vals.push(item[key]);
			});
			return vals;
		},
		reload:function(){
			/**urldata**/
			var me=this;
			if(me.configs.urlLeft){
				Ajax=require("Ajax");
				Ajax.post(me.configs.urlLeft, me.configs.paramLeft, function(result){
						me.configs.dataLeft==result.data;
					},false);
				Ajax.post(me.configs.urlRight, me.configs.paramRight, function(result){
					me.configs.dataRight==result.data;
				},false);
			}
			/****/
			me.tableBodyLeft.empty();
			$.each(me.configs.dataLeft,function(index,itemData){
				var tr=$("<tr></tr>").appendTo(me.tableBodyLeft);
				$.each(me.configs.columnLeft,function(index,item){
					var td="<td";
					if(item.display){
						td+=" style='display:"+item.display+"'";
					}
					td+=" class='"+me._className+"_td' algin='"+item.align+"' width='"+item.width+"'>"+itemData[item.name]||'&nbsp;'+"</td>";
					tr.append(td);
				});
			});
			//
			me.tableBodyRight.empty();
			$.each(me.configs.dataRight,function(index,itemData){
				var tr=$("<tr></tr>").appendTo(me.tableBodyRight);
				$.each(me.configs.columnRight,function(index,item){
					var td="<td";
					if(item.display){
						td+=" style='display:"+item.display+"'";
					}
					td+=" class='"+me._className+"_td' algin='"+item.align+"' width='"+item.width+"'>"+itemData[item.name]||'&nbsp;'+"</td>";
					tr.append(td);
				});
			});
		}
	};
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new Choice(configs);
	};
});
