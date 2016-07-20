/**
 * 兼容主流浏览器：IE6+ ，firefox，chrome
 * 主要功能：支持冻结列
 * 			支持复合表头
 * 			支持点击表头排序
 * 			支持列宽调整
 * 			支持纯前端数据
 * 			支持单元格显示自定义
 * 			支持数据源自定义扩展
 */
define(function(require,exports,module){
	require.async("./css/grid.css");
	Ajax=require("Ajax");
(function($){
	function createTemplate(target,options){
		var html = [] ;
		html.push('<div class="sea_grid">');
		html.push('	<div class="sea_grid_title"><span></span></div>');
		html.push('	<div class="sea_grid_content">');
		if(options.forzenColumn.length>0){
			html.push('<div class="sea_grid_1">');
			//1 head start
			html.push('<div class="sea_grid_head sea_grid_1_head">');
			html.push("<div>");
			html.push('<table cellspacing="0" cellpadding="0"><thead></thead></table>');
			html.push("</div>");
			html.push("</div>");
			//1head end
			//1body start
			html.push('<div class="sea_grid_body sea_grid_1_body">');
			html.push("<div class='sea_grid_scroll_y'>");
			html.push('<table cellspacing="0" cellpadding="0"><tbody></tbody></table>');
			html.push("</div>");
			html.push("</div>");
			//1body end
			html.push('</div>');
		}
		html.push('<div class="sea_grid_2">');
		//2head start
		html.push('<div class="sea_grid_head sea_grid_2_head ">');
		html.push("<div  class='sea_grid_scroll_x'>");
		html.push('<table cellspacing="0" cellpadding="0"><thead></thead></table>');
		html.push("</div>");
		html.push("</div>") ;
		//2head end
		//2body start
		html.push('<div class="sea_grid_body sea_grid_2_body">');
		html.push('<table cellspacing="0" cellpadding="0"><tbody></tbody></table>');
		html.push("</div>");
		//2body end
		html.push('</div>');
		html.push('<div style="clear:both"></div>');
		html.push('</div>');
		html.push('<div class="sea_grid_pager"></div>');
		html.push('<div class="sea_grid_mask"></div><div class="sea_grid_mask_msg"></div>');
		html.push('</div>');
		target.append(html.join(""));
	}
	function createHead(target,options){
		var width = 0 ;
		createHeadRow() ;
		if(options.forzenColumn.length>0){
			createHeadRow("sea_grid_1_head") ;
			createHeadCell(options.forzenColumn,"sea_grid_1_head") ;
		}
		createHeadRow("sea_grid_2_head") ;
		createHeadCell(options.bodyColumn,"sea_grid_2_head") ;
		width = width + (options.bodyColumn.length)  ;
		$(".sea_grid_2_head table",target).width( width  )
		$(".sea_grid_2_body > table",target).width( width ) ;
		setTimeout(function(){
			adjustWidth(target) ;
		},0) ;
		function createHeadRow(container){
			$("<tr idx='_colwidth_' style='height:0px;'></tr>").appendTo( $("."+container+" table thead",target) ) ;
			for(var i =0 ;i<options.headRowNum ;i++){
				$("<tr idx='"+i+"'></tr>").appendTo( $("."+container+" table thead",target) ) ;
			}
		}
		function createHeadCell(columns,container){
			var groupCols = options.groupCols ;
			$(columns).each(function(index,col){
				var rowspan = options.headRowNum ;
				var sort = this.sort?"sea_grid_sort_col":"" ;
				var styles=[];
				if(col.align){
					styles.push("text-align:"+col.align) ;
				}
				if(col.width){
					styles.push("width:"+col.width+"px") ;
				}
				if(col["border"]){
					styles.push("border:"+col["border"]) ;
				}
				//该行确定列宽
				$("<th class='sea_grid_th' style='"+styles.join(";")+";height:0px;border-bottom:none;border-top:none;'></th>").appendTo( $("."+container+" table thead tr[idx='_colwidth_']",target)) ;
				if( this.group ){
					var gs = this.group.split("|");
					rowspan = rowspan - gs.length ;
					for(var i = gs.length ;i>0 ;i--){//1,2
						var g = gs[i-1] ;
						var colspan = groupCols[g].length ;
						if( !$(".sea_grid_2_head table thead th[group='"+g+"']",target)[0]  ){
							$("<th class='sea_grid_th' colSpan='"+colspan+"' group='"+g+"'>"+g+"</th>")
								.appendTo( $("."+container+" table thead tr[idx='"+(gs.length-i)+"']",target)) ;
						}
					}
				}
				var sort = this.sort?"sea_grid_sort_col":"" ;
				var rowSpanHtml = rowspan>1?"rowspan='"+rowspan+"'":"" ;
				$("<th  class='sea_grid_th "+sort+"'"+rowSpanHtml+" name='"+this.name+"' colIndex='"+index+"'  style='"+styles.join(";")+"'>" +
					headCellRender(col)+ "</th>").appendTo( $("."+container+" table thead tr[idx='"+(options.headRowNum - rowspan  )+"']",target)) ;
				width += parseInt(this.width) ;
			}) ;
		}
		function headCellRender(col){
			var format = col.format ;
			var _val = "" ;
			var _ = null ;
			if(format&&(_ = format.type )&&(_ = $.Grid.format[_] ) && _.head ){
				_val = _.head(col) ;
			}else{
				_val = col.label ;
			}
			return _val||"&nbsp;" ;
		}
	}
	function adjustWidth(target){
			var forzenWidth = $(".sea_grid_1_head",target).outerWidth(true);
			if( forzenWidth == $(".sea_grid_content",target).width()){
				setTimeout(function(){ adjustWidth(target) },100) ;
			}else{
				$(".sea_grid_content .sea_grid_2",target).width( $(".sea_grid_content",target).width() - forzenWidth )  ;
			}
	}
	function createBody(target,records,params){
		var options = target.data("options") ;
		var columns = options.columns ;
		if(options.forzenColumn.length>0){
			var html = [] ;
			$(records).each(function(index,record){
				html.push("<tr class='sea_grid_tr'>");
				$(options.forzenColumn).each(function(cindex,col){
					var val = col.name == '__index__'?(params.start+index+1):record[col.name] ;
					col.cls = col.name == '__index__'?"index_column":"";
					html.push(cellRender(val,record,col)) ;	
				});
				html.push("</tr>");
			}) ;
			$(".sea_grid_1_body table tbody",target).html(html.join("")) ;
		}
		html = [] ;
		$(records).each(function(){
			var record = this ;
			html.push("<tr class='sea_grid_tr'>");
			$(options.bodyColumn).each(function(index,col){
				col.width = $(".sea_grid_2_head table thead th:first:eq("+index+")",target).attr("colwidth")||col.width ;
				html.push(cellRender(record[col.name],record,col)) ;
			});
			html.push("</tr>");
		}) ;
		$(".sea_grid_2_body table tbody",target).html(html.join("")) ;
		$(".sea_grid_body table tr",target).hover(function(){
			getRow(target,this).addClass("sea_grid_hover") ;
		},function(){
			getRow(target,this).removeClass("sea_grid_hover") ;
		}) ;
		function cellRender(val , record , col){
			var format = col.format ;
			var _val = "" ;
			if(format){
				if($.isFunction(format)){
					_val = format((val||"") , record,col) ;
				}else if(format.type){
					col.cls=col.cls+" td_"+format.type;
					var _ = $.Grid.format[format.type] ;
					if( _ && _.body ){
						_val = _.body(val,record,col ) ;
					}else _val = val ;
				}else _val = val ;
			}else{
				_val = val ;
			}
			if(_val==null || _val=="null"){
				_val="&nbsp;";
			}
			var title = (_val+"").replace(/<[^>]*>/g, "") ;
			var styles=[];
			if(col.align){
				styles.push("text-align:"+col.align) ;
			}
			if(col.width){
				styles.push("width:"+col.width+"px") ;
			}
			if(col["border"]){
				styles.push("border:"+col["border"]) ;
			}
			return "<td name='"+col.name+"' title='"+title+"' style='"+styles.join(";")+"' class='"+(col.cls||"")+"'>"+_val+"</td>";
		}
	}
	function loadMask(target , isShow){
		 var mask=$('.sea_grid_mask',target);
		 var maskMsg=$('.sea_grid_mask_msg',target);
		if(!isShow) {
			mask.hide();
			maskMsg.hide() ;
			return ;
		}
		mask.show() ;
		maskMsg.css({
					"left":"45%",
					"top":"45%"
		}).show();//.html(target.data("options").loadMsg);
	}
	
	function formatColumns(target,options){
		var forzenColumn = [] ,bodyColumn = [] ,width = target.width() , totalWidth = 0 ;
		if( options.indexColumn){
			forzenColumn.push({align:"center",name:"__index__",width:options.indexColumnWidth}) ;
		}
		var headRowNum = 1 ;
		var groupCols = {} ;
		$(options.columns).each(function(index,col){
			col.width = col.width || (((1/options.columns.length)*100)+"%")
			if( (col.width+"").indexOf("%")!=-1){
				col.width =( width - options.indexColumnWidth) * parseInt( col.width.replace("%",""))/100 ;
			}
			totalWidth += parseInt(col.width) ;
			if( col.group ){
				headRowNum = Math.max( headRowNum , 1+(this.group.split("|").length) ) ;
				$(this.group.split("|")).each(function(){
					groupCols[this] = groupCols[this]||[]
					groupCols[this].push(col) ;
				})
			}
		}) ;
		options.groupCols = groupCols ;
		options.headRowNum = headRowNum ;
		if( options.indexColumn ){
			totalWidth += options.indexColumnWidth*totalWidth/(width - options.indexColumnWidth ) ;
		}
		$(options.columns).each(function(index){
			for(var o in $.Grid.format){
				if( this[o] && !this.format){
					this.format = {type:o,content:this[o]} ;
				}
			}
			options.autoWidth&&(this.width = parseInt( this.width/(totalWidth+options.columns.length )*width -1 ) ) ;
			this.forzen?forzenColumn.push(this):bodyColumn.push(this) ;
		}) ;
		options.forzenColumn = forzenColumn ;
		options.bodyColumn = bodyColumn ;
	}
	function getRow(target,el){
		var index = el.rowIndex ;
		return $(".sea_grid_1_body table tr:eq("+index+"),.sea_grid_2_body table tr:eq("+index+")",target) ;
	}
	 //绑定事件到列表
	function addEvent(target ,eventName,func){
		var events = target.data("events") ;
		events[eventName] = func ;
		target.data("events",events)
	}
	function load(target , params){
		var options = target.data("options") ;
		var records = null ;
		var totalRecord = 0 ;
		var start = parseInt(params.pageSize)*( parseInt(params.pageIndex) - 1) ;
		var end = parseInt(start) + parseInt(params.pageSize) ;
		//构造参数
		params = $.extend({},params,{start:start,end:end}) ;
		var cacheDs = target.data("cacheDs") ;
		loadMask(target,true) ;
		if(cacheDs){
			records = cacheDs.records.slice( params.start - cacheDs.params.start ,(params.start - cacheDs.params.start)+ parseInt(params.pageSize)  ) ;
			if( records.length < params.pageSize ){
				cacheDs = null ;//重新请求数据
			}else{
				renderPage(records , cacheDs.totalRecord , params) ;
				return ;
			}
		}
		var ds= options.ds;
		var handle = $.Grid.dsHandle[ds.type ] ;
		handle( ds , params , options , function(records , totalRecord){
			//if( !cacheDs ){
				target.data("cacheDs" , { records:records , totalRecord:totalRecord , params:params} ) ;
			//}
			renderPage(records , totalRecord , params) ;
		} ) ;
		function renderPage(records , totalRecord , params){
			var options = target.data("options") ;
			createBody(target,records.slice(0,params.pageSize)  , params) ;
			$(".sea_grid_pager",target).Pager({
				totalRecord:totalRecord,
				pageIndex:params.pageIndex,
				pageSizes:options.pageSizes,
				pageSize:params.pageSize,
				selectPage:function(pageIndex , pageSize ){
					reload(target,{pageIndex:pageIndex,pageSize:pageSize }) ;
				}
			}) ;
			renderAfter() ;
		}
		function renderAfter(){
			$(options.columns).each(function(index,col){
				var _ = null ;
				if( col.format && col.format.type &&(_ = $.Grid.format[col.format.type] )&& _.bindEvent ){
					_.bindEvent(col,target) ;
				}
			}) ;
			$(".sea_grid_th input[type=checkbox]").removeAttr("checked") ;
			$(".sea_grid_2_body",target).scroll() ;
			$(".sea_grid_body",target).height($(target).height()-$(".sea_grid_title",target).height()-$(".sea_grid_head",target).height()-$(".sea_grid_pager",target).height())
			setTimeout(function(){loadMask(target,false)},200) ;
			if(options.loadAfter){
				options.loadAfter() ;
			}
		}
	}
	function bindEvent(target){
		$(".sea_grid_2_body",target).scroll(function(){
			$(".sea_grid_1_body",target).scrollTop( $(".sea_grid_2_body",target).scrollTop() ) ;
			$(".sea_grid_2_head",target).scrollLeft( $(".sea_grid_2_body",target).scrollLeft() ) ;
		});
		$(target).delegate(".sea_grid_body table tr",'click', function(){
			//$("div.sea_grid_content .sea_grid_selected",target).removeClass("sea_grid_selected") ;
			var tr=$(this);
			if(tr.hasClass("sea_grid_selected")){
				tr.removeClass("sea_grid_selected");
			}else{
				tr.addClass("sea_grid_selected");
			}
			//getRow(target,this).addClass("sea_grid_selected");
			var options = target.data("options") ;
			if(options.rowClick){
				options.rowClick(this) ;
			}
		} ) ;
		$(target).delegate(".sea_grid_body table tr td:not(.td_checkbox)",'click', function(){
			$(this).parent().find(".td_checkbox").find("input[type=checkbox]").click() ;
			return false;
		} ) ;
		if(target.data("options").rowDblClick){
			$(target).delegate(".sea_grid_body table tr",'dblclick', function(){
				var index=this.rowIndex ;
				var records=target.data("cacheDs")["records"];
				target.data("options").rowDblClick(records[index]);
			}) ;
		}
	}
	function reload(target , ps,isAdd){
		var qs = isAdd?target.data("rquerys"):target.data("params") ;
		var params = $.extend({}, qs ,ps) ;
		target.data("rquerys",params) ;
		load(target,params) ;
	}
	//Grid 控件
	$.fn.Grid = function(options,params){
		var me = $(this) ;
		if( typeof options == 'string' ){
			var events = me.data("events") ;
			if(events[options]){
				return events[options](params) ;
			}
			switch(options){
				case "reload":
					reload(me,params) ;
					break ;
				case "addEvent":
					addEvent(me,params.eventName , params.func ) ;
			}
			return ;
		}
		options = $.extend(true,{},$.Grid.defaults,options) ;
		var params = $.extend({},options.params,{pageSize:options.pageSize,pageIndex:1}) ;
		formatColumns(me,options) ;
		me.data("options",options) .data("params",params).data("rquerys",params) .data("events",{});
		createTemplate(me , options) ;
		createHead(me, options) ;
		bindEvent(me) ;
		load( me, me.data("params")) ;
		$(window).bind("resize" , function(){
			adjustWidth(me);
		});
	}
	$.Grid = {
		defaults:{
			autoWidth:false,
			columns: null,//[{align:"center",name:"id",label:"ID",width:"20",cls:"",format:{type:"checkbox"}},...]
			//loadMsg: "数据加载中，请稍候......",
			pager: false,
			indexColumn: true,
			indexColumnWidth:30,
			pageSize: 20,
			ds:{
				type: "url",
				url:""
			},
			pageSizes: [10,20,30,40,50,100],
			params: {}
//			loadSuccess: function(){},
//			loadError: function(){},
//			rowClick: function(rowIndex, rowData){},
//			cellClick: function(rowIndex, rowData){},
//			,rowDblClick: function(sort, order){}
//			cellDblClick: function(rowIndex, rowData){},
		},
		format:{
			"json":{
				body:function(val,record ,col){
					return col.format.content[val]||val  ;
				}
			},
			"checkbox":{
				head:function(col){
					return "<input type='checkbox' value='_' target='cb_"+col.name+"' name='cb_"+col.name+"_head'>" ;
				},
				body:function(val,record,col){
					return "<input type='checkbox' value='"+val+"' name='cb_"+col.name+"'>" ;
				},
				bindEvent:function(col,grid){
					grid.find("input[name='cb_"+col.name+"_head']").unbind("click").click(function(){
						if(!$(this).attr("checked")){ 
							$(this).attr("checked","checked");
							grid.find("input[name='cb_"+col.name+"']").not(":checked").click().attr("checked","checked");
						}else{
							$(this).removeAttr("checked");
							grid.find("input[name='cb_"+col.name+"']:checked").removeAttr("checked") ;
						}
					});
					grid.find("input[name='cb_"+col.name+"']").click(function(){
						if(!$(this).attr("checked")){ 
							$(this).attr("checked","checked"); 
						}else{
							$(this).removeAttr("checked"); 
						}
					});
					grid.Grid("addEvent" , {
						eventName:"getSelected",
						func:function(name){
							var vals = [] ;
							grid.find(":input[name='cb_"+name+"'][checked]").each(function(){
								vals.push( $(this).val() ) ;
							}) ;
							return vals ;
						}
					},{
						eventName:"del",
						func:function(name){
							grid.find(".sea_grid_selected").remove()
						}
					})
				}
			},
			"href":{
				body:function(val,record,col){
					var href = col.format.href||col.format.content ;
					for(var o in record){
						href = href.replace("{"+o+"}",encodeURIComponent(record[o])) ;
					}
					var target = col.format.target||'_blank' ;
					return "<a href='"+href+"' target='"+target+"'>"+val+"</a>" ;
				}
			}
		},
		dsHandle:{
			data:function(ds , params , options , callback){
				if( !ds.records && !ds.content ){
					ds = {records:ds} ;
				}else
					ds.records = ds.records||ds.content ;
				if( typeof ds.records == 'string' ){
					ds.records = $.parseJSON( ds.records ) ;
				}
				var records = ds.records.slice(params.start,params.end) ;
				var totalRecord = ds.totalRecord||ds.records.length ;
				callback(records , totalRecord) ;
			},
			url:function(ds , params , options , callback){
				$.ajax({
					type:"get",
					url:Ajax.getUrl(ds.url)||ds.content,
					data:params,
					cache:false,
					dataType:"json",
					success:function(result,status,xhr){
						callback(result.data , result.rowcount ) ;
					}
				}); 
			}
		}
	} ;
	$.fn.Pager = function(settings){//pageSizes,pageIndex,totalRecord,pageSize,selectPage
		var me = $(this) ;
		settings = settings||{} ;
		var pageSizes = settings.pageSizes ;
		var pageIndex   = settings.pageIndex||0;
		var totalRecord = settings.totalRecord||0 ;
		var pageSize    = settings.pageSize ;
		var totalPage = totalRecord % pageSize == 0? (totalRecord / pageSize): (Math.floor(totalRecord / pageSize) + 1);
		var selectPage = settings.selectPage ;
		template() ;
		render()   ;
		event() ;
		function render(){
			me.find(".sea_totalpage").html(totalPage) ;
			me.find(".sea_totalnumber").html(totalRecord) ;
			me.find(".sea_jumpinput").val(pageIndex) ;
			me.find(".sea_limitselect").html("").change(function(){
				selectPageHandler(pageIndex ,$(this).val() ) ;
			}) ;
			$(pageSizes).each(function(){
				me.find(".sea_limitselect").append("<option value='"+this+"' "+(this==pageSize?"selected":"")+">"+this+"</option>") ;
			}) ;
			var split = 5;
			var jg = Math.floor(split / 2);
			var start = pageIndex - jg < 1 ? 1 : (pageIndex - jg);
			var end = Number(start) + Number(split - 1) > totalPage? totalPage: (Number(start) + Number(split - 1));
			if (end - start < split && start > 0) {
				start = end - split + 1;
			}
			var html = [] ;
			for (var i = start; i <= end; i++) {
				if (i <= 0) continue;
				var active = (i==pageIndex)?"sea_state_active":"sea_state_default" ;
				html.push('<a href="#" class="sea_grid_pager_btn sea_numpage '+active+'" pn="'+i+'"><span>'+i+'</span></a>');
			}
			me.find(".sea_grid_navig").html(html.join("")) ;
		}
		function event(){
			me.find("[pn]").click(function(event){
				if( $(this).hasClass("sea_state_disabled") ) return false ;
				var pn = $(this).attr("pn");
				var to = pn ;
				switch(pn){
					case "pre"	: to = Math.max(pageIndex - 1,1) ;break ;
					case "next"	: to = Math.min(pageIndex + 1,totalPage) ; break ;
					case "last"	: to = totalPage ; break ;
					case "first": to = 1 ; break ;
					case "input": return ; break;
					default:
						if(pn.indexOf("target:")==0){
							pn = pn.split("target:")[1] ;
							to = me.find(pn).val() ;
						}
				}
				selectPageHandler(to ,me.find(".sea_limitselect").val() ) ;
				return false ;
			}) ;
			me.find("[pn='input']").keydown(function(event){
				if(event.keyCode==13){
					selectPageHandler($(this).val() ,me.find(".sea_limitselect").val() ) ;
				}
			}) ;
			if(pageIndex <= 1){
				me.find(".sea_firstpage,.sea_prepage").addClass("sea_state_disabled") ;
			}
			if(pageIndex >= totalPage ){
				me.find(".sea_nextpage,.sea_lastpage").addClass("sea_state_disabled") ;
			}
		}
		function selectPageHandler(pageIndex , pageSize ){
			var totalPage = totalRecord % pageSize == 0? (totalRecord / pageSize): (Math.floor(totalRecord / pageSize) + 1);
			pageIndex = Math.min( pageIndex , totalPage);
			selectPage(pageIndex , pageSize) ;
		}
		function template(){
			var html = [] ;
			html.push('<div style="float:right">');
			html.push('	<table  cellspacing="0" cellpadding="0">');
			html.push('		<tbody>');
			html.push('			<tr>');
			html.push('				<td> <span>共<span class="sea_totalpage"></span>页/<span class="sea_totalnumber"></span>条记录</span> &nbsp;&nbsp;&nbsp;每页</td>');
			html.push('				<td>');
			html.push('					<select class="sea_limitselect"></select>');
			html.push('				</td>');
			html.push('				<td>条 &nbsp;&nbsp;&nbsp;跳转<span><input type="text" class="sea_jumpinput" pn="input" style="width:30px;text-align:center" value=""></span>页&nbsp;&nbsp;&nbsp;</td>');
			html.push('				<td>');
			html.push('					<a href="#" class="sea_grid_pager_btn sea_firstpage" pn="first"><i class="glyphicon glyphicon-fast-backward"></i></a>');
			html.push('					<a href="#" class="sea_grid_pager_btn sea_prepage" pn="pre"><i class="glyphicon glyphicon-backward"></i></a>');
			html.push('				</td>');
			html.push('				<td>');
			html.push('					<span class="sea_grid_navig"></span>');
			html.push('				</td>');
			html.push('				<td>');
			html.push('					<a href="#" class="sea_grid_pager_btn sea_nextpage" pn="next"><i class="glyphicon glyphicon-forward"></i>&nbsp;</a>');
			html.push('					<a href="#" class="sea_grid_pager_btn sea_lastpage" pn="last"><i class="glyphicon glyphicon-fast-forward"></i>&nbsp;</a>');
			html.push('				</td>');
			html.push('			</tr>');
			html.push('		</tbody>');
			html.push('	</table>');
			html.push('</div>');
			html.push('<div style="clear:both;"></div>');
			$(me).html(html.join('')) ;
	  	}
	}
})(jQuery) ;
});