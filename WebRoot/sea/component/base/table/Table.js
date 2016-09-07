define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	require.async("./css/table"+Session.theme+".css");
	var Component = require("Component"); 
	/** * 模块私有数据 ** */
	var defaults = {
		id:"",
		width: "100%",
		height: '100%',
		cls: "",
		css: {
		},
		attr : {} ,
		title:null,
		columnKey:"uuid",
		columns:[],
		url:null,
		params:{},
		data:[],
		rowClick:null
	};
		/** * 模块私有方法 ** */
	var self = {
		init : function(me) {
			me.table=$("<div></div>").addClass(me._className);
			if(me.configs.title){
				me.table.append("<div class='"+me._className+"_title'>"+me.configs.title+"</div>");
			}
			me.header=$("<div class='"+me._className+"_header'></dvi>").appendTo(me.table);
			me.tableHeader=$("<table class='"+me._className+"_tableHeader'></table>").appendTo(me.header);
			var trHeader=$("<tr></tr>").appendTo(me.tableHeader);
			$.each(me.configs.columns,function(index,item){
				var td=$("<td class='"+me._className+"_td' align='"+(item.align||"left")+"' title='"+(item.label||'')+"'>"+(item.label||'&nbsp;')+"</td>");
				td.css({"width":(item.width||100)+'px',"min-width":(item.width||100)+'px'});
				td.css(item.css||{});
				trHeader.append(td);
			});
			/**urldata**/
			if(me.configs.url){
				Ajax=require("Ajax");
				Ajax.post(me.configs.url, me.configs.params, function(result){
					me.configs.data=result.listMap||result.retVal;
					},false);
			}
			/****/
			me.mainBody=$("<div class='"+me._className+"_mainBody'></dvi>").appendTo(me.table);
			/**begin**/
			me.tableBody=$("<table class='"+me._className+"_tableBody'></table>").appendTo(me.mainBody);
			if(me.configs.data&& me.configs.data.length>0){
				$.each(me.configs.data,function(index,itemData){
					var tr=$("<tr></tr>").addClass(me._className+"_tr").appendTo(me.tableBody);
					$.each(me.configs.columns,function(index,item){
						var td=$("<td class='"+me._className+"_td' align='"+(item.align||"left")+"' title='"+(itemData[item.name]||'')+"'></td>").addClass(item.name);
						td.css({"width":(item.width||100)+'px',"min-width":(item.width||100)+'px'});
						td.css(item.css||{});
						if(item.format=="textfield"){
							td.append("<input class='"+me._className+"_text' type='text' value='"+(itemData[item.name]||'')+"'/>");
						}else if(item.format=="buttonGroup"){
							td.append(require("ButtonGroup").create(item).buttonGroup);
						}else if($.isFunction(item.format)==true){
							var val =item.format(itemData[item.name],itemData)||'&nbsp;';
							td.html(val).attr("title",val);
						}else if(item.format&& item.format.type=='json'){
							var val =item.format.content[itemData[item.name],itemData]||'&nbsp;';
							td.html(val).attr("title",val);
						}else{
							td.html((itemData[item.name]||'&nbsp;'));
						}
						td.css(item.css||{});
						tr.append(td);
					});
				});
			}else{
					var tr=$("<tr></tr>").addClass(me._className+"_tr").appendTo(me.tableBody);
					$.each(me.configs.columns,function(index,item){
						var td=$("<td class='"+me._className+"_td' align='"+(item.align||"left")+"'></td>").addClass(item.name).css({"width":(item.width||100)+'px',"min-width":(item.width||100)+'px'});
							td.html('&nbsp;');
							td.css(item.css||{});
						tr.append(td);
					});
			}
			/**end**/
		 	me.tableBody.delegate("tr",'click', function(el){
		 		if(me.configs.rowClick){
					me.configs.rowClick(me.configs.data[this.rowIndex]);
				}
				var cls=me._className+"_selected";
				$(this).siblings().removeClass(cls);
				if($(this).hasClass(cls)){
					$(this).removeClass(cls);
				}else{
					$(this).addClass(cls);
				}
			} ) ;
		 	me.mainBody.scroll(function(){
		 		me.header.scrollLeft(me.mainBody.scrollLeft()) ;
			});
			// 控件样式设置
			Component.css(me.table , me.configs);
			// 控件类名设置
			Component.addClass(me.table, me.configs);
			// 控件的属性设置
			Component.attr(me.table, me.configs);
			me.mainBody.height((me.table.height()-60)+'px');
		}
	}; 
	/** * 类定义 ** */
	var Table = function(configs) {
		// 类的属性定义
		this.configs = $.extend(true, {}, defaults, configs);
		this._className="sea_table";
		// 初始化
		self.init(this);
	};
	// 类公共方法
	Table.prototype = {
		 getSelected:function(key){
			var vals=[]; 
			var me=this;
			var selector="."+me._className+" ."+me._className+"_tableBody tr";
			me.table.find(selector).each(function(index,item){
				if($(item).hasClass(me._className+"_selected")){
					$(item).remove();
					vals.push(me.configs.data[index][key]);
				}
			});
			return vals;
		},
		 getSelectedAll:function(key){
			var vals=[]; 
			var me=this;
			$.each(me.configs.data,function(index,item){
				vals.push(item[key]);
			});
			return vals;
		},
		getData:function(){
			var list=[];
			var me=this;
			$.each(me.tableBody.find("tr"),function(index,item){
				var tds=$(item).find("td");
				var data={};
				for(var i=0;i<tds.length;i++){
					var td=$(tds[i]);
					if(td.find("input").length>0){
						data[me.configs.columns[i].name]=td.find("input").val()
					}else{
						data[me.configs.columns[i].name]=td.attr("title")
					}
				}
				list.push(data);
			});
			return list;
		},
		getList:function(){
			var list=[];
			var me=this;
			$.each(me.tableBody.find("tr"),function(index,item){
				var tds=$(item).find("td");
				var data=[];
				for(var i=0;i<tds.length;i++){
					var td=$(tds[i]);
					if(td.find("input").length>0){
						data.push(td.find("input").val());
					}else{
						data.push(td.attr("title"))
					}
				}
				list.push(data.join("$|$"));
			});
			return list;
		},
		reload:function(params){
			/**urldata**/
			var me=this;
			me.tableBody.empty();
			if(me.configs.url){
				var param;
				if(params){
					param=params;
				}else{
					param=me.configs.params;
				}
				Ajax=require("Ajax");
				Ajax.post(me.configs.url, param, function(result){
					me.configs.data=result.listMap||result.retVal;
				},false);
			}
			/****/
			if(me.configs.data&& me.configs.data.length>0){
				$.each(me.configs.data,function(index,itemData){
					var tr=$("<tr></tr>").addClass(me._className+"_tr").appendTo(me.tableBody);
					$.each(me.configs.columns,function(index,item){
						var td=$("<td class='"+me._className+"_td' align='"+(item.align||"left")+"' title='"+(itemData[item.name]||'')+"'></td>").addClass(item.name);
						td.css({"width":(item.width||100)+'px',"min-width":(item.width||100)+'px'});
						td.css(item.css||{});
						if(item.format=="textfield"){
							td.append("<input class='"+me._className+"_text' type='text' value='"+(itemData[item.name]||'')+"'/>");
						}else if(item.format=="buttonGroup"){
							td.append(require("ButtonGroup").create(item).buttonGroup);
						}else if($.isFunction(item.format)==true){
							var val =item.format(itemData[item.name],itemData)||'&nbsp;';
							td.html(val).attr("title",val);
						}else if(item.format&& item.format.type=='json'){
							var val =item.format.content[itemData[item.name],itemData]||'&nbsp;';
							td.html(val).attr("title",val);
						}else{
							td.html((itemData[item.name]||'&nbsp;'));
						}
						td.css(item.css||{});
						tr.append(td);
					});
				});
			}else{
				var tr=$("<tr></tr>").addClass(me._className+"_tr").appendTo(me.tableBody);
				$.each(me.configs.columns,function(index,item){
					var td=$("<td class='"+me._className+"_td' align='"+(item.align||"left")+"'></td>").addClass(item.name).css({"width":(item.width||100)+'px',"min-width":(item.width||100)+'px'});
						td.html('&nbsp;');
						td.css(item.css||{});
					tr.append(td);
				});
			}
		}
	};
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new Table(configs);
	};
});
