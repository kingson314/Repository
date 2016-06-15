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
	require.async("./css/ui.css");
	require.async("./css/grid.css");
	Ajax=require("Ajax");
(function($){
	function createTemplate(target,options){
		var html = [] ;
		html.push('<div class="sea_grid ui-widget ui-widget-content ui-corner-all">');
		html.push('	<div class="sea_grid-caption ui-widget-header ui-corner-top ui-helper-clearfix"><span></span></div>');
		html.push('	<div class="sea_grid-content">');
		if(options.forzenColumn.length>0){
			html.push('<div class="sea_grid-1 ui-widget-content">');
			//1 head start
			html.push('<div class="sea_grid-head sea_grid-1-head ui-state-default">');
			html.push("<div>")
			html.push('<table cellspacing="0" cellpadding="0"><thead></thead></table>');
			html.push("</div>");
			html.push("</div>");
			//1head end
			//1body start
			html.push('<div class="sea_grid-body sea_grid-1-body"  style="height:'+options.height+';">');
			html.push("<div class='sea_grid-scroll-y'>")
			html.push('<table cellspacing="0" cellpadding="0"><tbody></tbody></table>');
			html.push("</div>");
			html.push("</div>");
			//1body end
			html.push('</div>');
		}
		html.push('<div class="sea_grid-2 ui-widget-content">');
		//2head start
		html.push('<div class="sea_grid-head sea_grid-2-head  ui-state-default ui-widget-content">');
		html.push("<div  class='sea_grid-scroll-x'>")
		html.push('<table cellspacing="0" cellpadding="0"><thead></thead></table>');
		html.push("</div>")
		html.push("</div>") ;
		//2head end
		//2body start
		html.push('<div class="sea_grid-body sea_grid-2-body"  style="height:'+options.height+'">');
		html.push('<table cellspacing="0" cellpadding="0"><tbody></tbody></table>');
		html.push("</div>");
		//2body end
		html.push('</div>');
		html.push('<div style="clear:both"></div>');
		html.push('</div>');
		html.push('<div class="sea_grid_pager ui-state-default ui-corner-bottom"></div>');
		html.push('<div class="sea_grid-mask ui-widget-overlay"></div><div class="sea_grid-mask-msg  ui-state-default ui-state-active"></div>');
		html.push('</div>');
		target.append(html.join(""));
	}
	function createHead(target,options){
		var width = 0 ;
		createHeadRow() ;
		if(options.forzenColumn.length>0){
			createHeadRow("sea_grid-1-head") ;
			createHeadCell(options.forzenColumn,"sea_grid-1-head") ;
		}
		createHeadRow("sea_grid-2-head") ;
		createHeadCell(options.bodyColumn,"sea_grid-2-head") ;
		width = width + (options.bodyColumn.length)  ;
		$(".sea_grid-2-head table",target).width( width  )
		$(".sea_grid-2-body > table",target).width( width ) ;
		setTimeout(function(){
			adjustWidth(target) ;
		},0) ;
		function createHeadRow(container){
			$("<tr idx='_colwidth_' class='ui-widget-content' style='height:0px;'></tr>").appendTo( $("."+container+" table thead",target) ) ;
			for(var i =0 ;i<options.headRowNum ;i++){
				$("<tr idx='"+i+"' class='ui-widget-content'></tr>").appendTo( $("."+container+" table thead",target) ) ;
			}
		}
		function createHeadCell(columns,container){
			var groupCols = options.groupCols ;
			$(columns).each(function(index,col){
				var rowspan = options.headRowNum ;
				var sort = this.sort?"sea_sort_col":"" ;
				var styles = ['width:'+this.width+'px'] ;
				$("<th class='sea_grid_header' style='"+styles.join("")+";height:0px;border-bottom:none;border-top:none;'></th>")
								.appendTo( $("."+container+" table thead tr[idx='_colwidth_']",target)) ;
				if( this.group ){
					var gs = this.group.split("|");
					rowspan = rowspan - gs.length ;
					for(var i = gs.length ;i>0 ;i--){//1,2
						var g = gs[i-1] ;
						var colspan = groupCols[g].length ;
						if( !$(".sea_grid-2-head table thead th[group='"+g+"']",target)[0]  ){
							$("<th class='sea_grid_header' colSpan='"+colspan+"' group='"+g+"'>"+g+"</th>")
								.appendTo( $("."+container+" table thead tr[idx='"+(gs.length-i)+"']",target)) ;
						}
					}
				}
				var sort = this.sort?"sea_sort_col":"" ;
				var rowSpanHtml = rowspan>1?"rowspan='"+rowspan+"'":"" ;
				$("<th "+rowSpanHtml+" name='"+this.name+"' colIndex='"+index+"'  class='sea_grid_header' style='border-bottom:0px;'>" +
						"<div class='"+sort+" cell-div'>"+headCellRender(col)+ 
						"</div> </th>").appendTo( $("."+container+" table thead tr[idx='"+(options.headRowNum - rowspan  )+"']",target)) ;
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
			forzenWidth = $(".sea_grid-1-head",target).outerWidth(true);
			if( forzenWidth == $(".sea_grid-content",target).width()){
				setTimeout(function(){ adjustWidth(target) },100) ;
			}else{
				$(".sea_grid-content .sea_grid-2",target).width( $(".sea_grid-content",target).width() - forzenWidth )  ;
			}
	}
	function createBody(target,records,params){
		var options = target.data("options") ;
		var columns = options.columns ;
		if(options.forzenColumn.length>0){
			var html = [] ;
			$(records).each(function(index,record){
				html.push("<tr class='ui-widget-content'>");
				$(options.forzenColumn).each(function(cindex,col){
					var val = col.name == '__index__'?(params.start+index+1):record[col.name] ;
					var clz = col.name == '__index__'?"lg-index-column ui-state-default":"";
					var styles = ['width:'+col.width+'px'] ;
					colPropRender(this,styles) ;
					html.push("<td name='"+col.name+"' style='"+styles.join(";")+"' class='"+clz+" sea_grid-body-column '><div class='cell-div'>"+cellRender(val,record,col)+"</div></td>") ;	
				});
				html.push("</tr>");
			}) ;
			$(".sea_grid-1-body table tbody",target).html(html.join("")) ;
		}
		html = [] ;
		$(records).each(function(){
			var record = this ;
			html.push("<tr class='ui-widget-content'>");
			$(options.bodyColumn).each(function(index,col){
				var width = $(".sea_grid-2-head table thead th:first:eq("+index+")",target).attr("colwidth")||col.width ;
				var styles = ['width:'+width+'px'] ;
				colPropRender(col,styles) ;
				html.push("<td name='"+col.name+"'  style='"+styles.join(";")+"' class='sea_grid-body-column'><div class='cell-div'>"+cellRender(record[col.name],record,col)+"</div></td>") ;
			});
			html.push("</tr>");
		}) ;
		$(".sea_grid-2-body table tbody",target).html(html.join("")) ;
		$(".sea_grid-1-body table tr:even,.sea_grid-2-body table tr:even",target).addClass("sea_grid-row sea_grid-even") ;
		$(".sea_grid-1-body table tr:odd,.sea_grid-2-body table tr:odd",target).addClass("sea_grid-row sea_grid-odd") ;
		$(".sea_grid-body table tr",target).hover(function(){
			getRow(target,this).addClass("sea_grid_hover") ;
		},function(){
			getRow(target,this).removeClass("sea_grid_hover") ;
		}) ;
		function cellRender(val , record , col){
			var format = col.format ;
			var _val = "" ;
			if(format){
				if($.isFunction(format)){
					_val = format(val , record,col) ;
				}else if(format.type){
					var _ = $.Grid.format[format.type] ;
					if( _ && _.body ){
						_val = _.body(val,record,col ) ;
					}else _val = val ;
				}else _val = val ;
			}else{
				_val = val ;
			}
			var title = (_val+"").replace(/<[^>]*>/g, "") ;
			var html = ["<span title='"+title+"'>"] ;
			html.push(_val||"&nbsp;") ;
			html.push("</span>")
			return html.join("") ;
		}
		function colPropRender(col,styles,clz){
			if(col.align){
				styles.push("text-align:"+col.align) ;
			}
		}
	}
	function loadMask(target , isShow){
		if(!isShow) {
			$('.sea_grid-mask',target).hide();
			$('.sea_grid-mask-msg').hide() ;
			return ;
		}
		$('.sea_grid-mask',target).css({
			border:"none",top:"0px",bottom:"0px",right:"0px",left:"0px"
		}).show() ;
		$('.sea_grid-mask-msg',target).html(target.data("options").loadMsg).css({
					left:(target.find(".sea_grid").width()-$('.sea_grid-mask-msg',target).outerWidth())/2,
					top:(target.find(".sea_grid").height()-$('.sea_grid-mask-msg',target).outerHeight())/2
		}).show();
	}
	
	function formatColumns(target,options){
		var forzenColumn = [] ,bodyColumn = [] ,width = target.width() , totalWidth = 0 ;
		if( options.indexColumn){
			forzenColumn.push({align:"center",name:"__index__",width:options.indexColumnWidth||"25"}) ;
		}
		var headRowNum = 1 ;
		var groupCols = {} ;
		$(options.columns).each(function(index,col){
			col.width = col.width || (((1/options.columns.length)*100)+"%")
			if( (col.width+"").indexOf("%")!=-1){
				col.width =( width - 25) * parseInt( col.width.replace("%",""))/100 ;
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
			totalWidth += 25*totalWidth/(width - 25 ) ;
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
		return $(".sea_grid-1-body table tr:eq("+index+"),.sea_grid-2-body table tr:eq("+index+")",target) ;
	}
	function setResize(target){
		var lineMove = false;
 		var currTh = null;
 		var isMove = false ;
		$(".sea_grid-content",target).append("<div class='split' style=\"width:0px;border-left:1px solid blue; position:absolute;display:none\" ></div> ");
		$(".sea_grid .sea_grid-2",target).mousemove(function(event){
			if( lineMove == true ){
				isMove = true ;
				resizeBefore() ;
				$(".split",target).css({ "left": event.clientX , "top": "0px"}).show();
			}
		}).mouseup(function(event){
			resizeAfter();
			if (lineMove == true && isMove == true) {
   	             resizeHandler(event) ;
   	         }
		}).mouseleave(function(event){
			resizeAfter();
			$(".split",target).hide();
   	        lineMove = false;
		}) ;
		$(".sea_grid .sea_grid-2-head",target).find("th").mousemove( function(event) {
   	         var th = $(this);
   	         var left = th.offset().left;
   	         if ( (th.width() - (event.clientX - left)) < 8) {
   	         	resizeBefore() ;
   	        	var height = th.parents(".sea_grid-content").height();
   	            th.css({ 'cursor': 'e-resize' });
   	         }else {
   	         	if( lineMove ){
   	         		isMove = true ;
   	         		resizeBefore();
   	         		var height = th.parents(".sea_grid-content").height();
   	        		$(".split",target).css({ "left": event.clientX, "height": height, "top": "0px"}).show();
   	         	}else{
   	         		$(".split",target).hide();
   	            	th.css({ 'cursor': 'default' });
   	         	}
   	         }
   	     }).mousedown(function(event) {
   	         var th = $(this);
   	         var pos = th.offset();
   	         if ( th.css("cursor") == 'e-resize' ) {
   	             var height = th.parents(".sea_grid-content").height();
   	             $(".split",target).css({ "height": height, "top": "0px","left":event .clientX,"display":"" });
   	             lineMove = true;
   	             currTh = th ;
   	         }
   	     }).mouseup(function(event) {
   	     	 resizeAfter() ;
   	         if (lineMove == true && isMove == true) {
   	             resizeHandler(event) ;
   	         }
   	     }).mouseleave(function(event){
			resizeAfter();
			if(lineMove == false){
				$(".split",target).hide();
			}
		}) ; ;
   	    function resizeHandler(event){
   	    	$(".split",target).hide();
             lineMove = false;
             var pos = currTh.offset();
             //同步宽度
             var tWidth = currTh.parents("table").width() -currTh.width()  ;
             var ctWidth = event.clientX - pos.left ;
             var colIndex = currTh.attr("colIndex");
             var resizeTh = currTh.parents("table").find("tr:first th:eq("+colIndex+")") ;
             resizeTh.width(ctWidth) ;
             resizeTh.attr("colwidth",ctWidth) ;
             currTh.parents("table").width( tWidth + ctWidth ) ;
             var bodytable = currTh.parents("table").parent().parent().next().find("table") ;
             bodytable.width( tWidth + ctWidth ) ;
             $("tr",bodytable).find("td:eq("+colIndex+")").width(ctWidth) ;
   	    }
   	    function resizeBefore(){
			$(document).bind("selectstart",function(){return false;});
		}
		function resizeAfter(){
			$(document).unbind("selectstart");
		}
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
		var start = parseInt(params.limit)*( parseInt(params.curPage) - 1) ;
		var end = parseInt(start) + parseInt(params.limit) ;
		//构造参数
		params = $.extend({},params,{start:start,end:end}) ;
		var cacheDs = target.data("cacheDs") ;
		loadMask(target,true) ;
		if(cacheDs){
			records = cacheDs.records.slice( params.start - cacheDs.params.start ,(params.start - cacheDs.params.start)+ parseInt(params.limit)  ) ;
			if( records.length < params.limit ){
				cacheDs = null ;//重新请求数据
			}else{
				renderPage(records , cacheDs.totalRecord , params) ;
				return ;
			}
		}
		var ds= options.ds;
		var handle = $.Grid.dsHandle[ds.type ] ;
		handle( ds , params , options , function(records , totalRecord){
			if( !cacheDs ){
				target.data("cacheDs" , { records:records , totalRecord:totalRecord , params:params} ) ;
			}
			renderPage(records , totalRecord , params) ;
		} ) ;
		function renderPage(records , totalRecord , params){
			var options = target.data("options") ;
			var _ = records.slice(0,params.limit) ;
			createBody(target,_ , params) ;
			$(".sea_grid_pager",target).Pager({
				totalRecord:totalRecord,
				curPage:params.curPage,
				pageSizes:options.pageSizes,
				limit:params.limit,
				selectPage:function(curPage , limit ){
					reload(target,{curPage:curPage,limit:limit }) ;
				}
			}) ;
			renderAfter() ;
			$(".sea_grid-2-body",target).scroll() ;
			setTimeout(function(){loadMask(target,false)},200) ;
		}
		function renderAfter(){
			$(options.columns).each(function(index,col){
				var _ = null ;
				if( col.format && col.format.type &&(_ = $.Grid.format[col.format.type] )&& _.bindEvent ){
					_.bindEvent(col,target) ;
				}
			}) ;
			if(options.loadAfter){
				options.loadAfter() ;
			}
		}
	}
	function bindEvent(target){
		$(".sea_grid-2-body",target).scroll(function(){
			$(".sea_grid-1-body",target).scrollTop( $(".sea_grid-2-body",target).scrollTop() ) ;
			$(".sea_grid-2-head",target).scrollLeft( $(".sea_grid-2-body",target).scrollLeft() ) ;
		});
		$(target).delegate(".sea_sort_col",'click',function(){
			var span = $(this).find("span[sort]") ;
			var sort = "desc" ;
			if( span[0] ){
				sort = span.attr("sort")=="desc"?"asc":"desc" ;
				var clz = sort=="asc"?"ui-icon-triangle-1-n":"ui-icon-triangle-1-s" ;
				span.attr("sort",sort).removeClass("ui-icon-desc ui-icon-asc ui-icon-triangle-1-n ui-icon-triangle-1-s").addClass("ui-icon-"+sort+" "+clz);
			}else{
				$('<span sort="desc" class="sea_sort ui-icon-desc ui-icon ui-icon-triangle-1-s"></span>').appendTo($(this));
			}
			reload(target,{sortField:$(this).parent().attr("name"),sortType:sort},true) ;
			return false ;
		}) ;
		$(target).delegate(".sea_grid-body table tr",'click', function(){
			$("div.sea_grid-content .sea_grid_selected",target).removeClass("sea_grid_selected") ;
			getRow(target,this).addClass("sea_grid_selected") ;
		} ) ;
	}
	function setTitle(target,title){
		title&&target.find(".sea_grid-caption span").html(title) ;
		!title&&target.find(".sea_grid-caption").hide() ;
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
			var opts = options ;
			options = me.data("options") ;
			var events = me.data("events") ;
			if(events[opts]){
				return events[opts](params) ;
			}
			switch(opts){
				case "reload":
					reload(me,params) ;
					break ;
				case "addEvent":
					addEvent(me,params.eventName , params.func ) ;
			}
			return ;
		}
		formatColumns(me,options) ;
		var params = $.extend({},options.params,{limit:options.limit,curPage:1}) ;
		options = $.extend({},$.Grid.defaults,options) ;
		me.data("options",options)
		  .data("params",params)
		  .data("rquerys",params)
		  .data("events",{});
		createTemplate(me , options) ;
		createHead(me, options) ;
		setTitle(me,options.title);
		bindEvent(me) ;
		setResize(me) ;
		load( me, me.data("params")) ;
		$(window).bind("resize" , function(){
			adjustWidth(me);
		});
	}
	$.Grid = {
		defaults:{
			title: null,
			autoWidth:true,
			columns: null,
			loadMsg: 'Processing, please wait ...',
			pager: false,
			indexColumn: false,
			pageNumber: 1,
			limit: 10,
			pageSizes: null,
			params: {},
			loadSuccess: function(){},
			loadError: function(){},
			rowClick: function(rowIndex, rowData){},
			cellClick: function(rowIndex, rowData){},
			rowDblClick: function(sort, order){},
			cellDblClick: function(rowIndex, rowData){}
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
					grid.find("input[name='cb_"+col.name+"_head']").click(function(){
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
	$.fn.Pager = function(settings){//pageSizes,curPage,totalRecord,limit,selectPage
		var me = $(this) ;
		var _id = null;
		var ec = null;
		settings = settings||{} ;
		var pageSizes = settings.pageSizes||[ settings.limit ] ;
		var curPage   = settings.curPage||0;
		var totalRecord = settings.totalRecord||0 ;
		var limit    = settings.limit ;
		var totalPage = calcTotalPage(totalRecord , limit) ;
		var selectPage = settings.selectPage ;
		template() ;
		render()   ;
		event() ;
		function calcTotalPage(totalRecord , limit){
			return totalRecord % limit == 0? (totalRecord / limit): (Math.floor(totalRecord / limit) + 1);
		}
		function render(){
			me.find(".sea_totalpage").html(totalPage||0) ;
			me.find(".sea_totalnumber").html(totalRecord||0) ;
			me.find(".sea_jumpinput").val(curPage||0) ;
			me.find(".sea_limitselect").html("").change(function(){
				selectPageHandler(curPage ,$(this).val() ) ;
			}) ;
			$(pageSizes).each(function(){
				me.find(".sea_limitselect").append("<option value='"+this+"' "+(this==limit?"selected":"")+">"+this+"</option>") ;
			}) ;
			var split = 6;
			var jg = Math.floor(split / 2);
			var cp = curPage;
			var tp = totalPage;
			var start = cp - jg < 1 ? 1 : (cp - jg);
			var end = Number(start) + Number(split - 1) > tp? tp: (Number(start) + Number(split - 1));
			if (end - start < split && start > 0) {
				start = end - split + 1;
			}
			var html = [] ;
			for (var i = start; i <= end; i++) {
				if (i <= 0) continue;
				var active = (i==curPage)?"ui-state-active":"ui-state-default" ;
				html.push('<a href="#" class="sea_page sea_numpage ui-button ui-widget '+active+' ui-corner-all" pn="'+i+'"><span>'+i+'</span></a>');
			}
			me.find(".sea_grid_navig").html(html.join("")) ;
		}
		function event(){
			me.find("[pn]").click(function(event){
				if( $(this).hasClass("ui-state-disabled") ) return false ;
				var pn = $(this).attr("pn");
				var to = pn ;
				switch(pn){
					case "pre"	: to = Math.max(curPage - 1,1) ;break ;
					case "next"	: to = Math.min(curPage + 1,totalPage) ; break ;
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
			if(curPage <= 1){
				me.find(".sea_firstpage,.sea_prepage").addClass("ui-state-disabled") ;
			}
			if(curPage >= totalPage ){
				me.find(".sea_nextpage,.sea_lastpage").addClass("ui-state-disabled") ;
			}
			me.find(".sea_page:not(.ui-state-disabled)").hover(function(){
				$(this).addClass("sea_grid_hover") ;
			},function(){
				$(this).removeClass("sea_grid_hover") ;
			}) ;
		}
		function selectPageHandler(curPage , limit ){
			var cp = curPage>0 ? Math.min( curPage , calcTotalPage(totalRecord , limit) ):1 ;
			selectPage&&selectPage(cp , limit) ;
		}
		function template(){
			var html = [] ;
			html.push('<div class="sea_grid_toolbar_div">');
			html.push('<div style="float:right">');
			html.push('	<table  cellspacing="0" cellpadding="0">');
			html.push('		<tbody>');
			html.push('			<tr>');
			html.push('				<td></td>');
			html.push('				<td> <span>共<span class="sea_totalpage"></span>页/<span class="sea_totalnumber"></span>条记录</span> &nbsp;&nbsp;每页</td>');
			html.push('				<td>');
			html.push('					<select class="sea_limitselect"></select>');
			html.push('				</td>');
			html.push('				<td>条 &nbsp;跳转<span><input type="text" class="sea_jumpinput" pn="input" style="width:20px;" value=""></span>页</td>');
			html.push('				<td>');
			html.push('					<a href="#" class="sea_page sea_firstpage ui-button ui-widget ui-state-default ui-corner-all" pn="first"><span class="ui-icon ui-icon-seek-first"></span></a>');
			html.push('					<a href="#" class="sea_page sea_prepage ui-button ui-widget ui-state-default ui-corner-all" pn="pre"><span class="ui-icon ui-icon-seek-prev"></span></a>');
			html.push('				</td>');
			html.push('				<td>');
			html.push('					<span class="sea_grid_navig"></span>');
			html.push('				</td>');
			html.push('				<td>');
			html.push('					<a href="#" class="sea_page sea_nextpage ui-button ui-widget ui-state-default ui-corner-all" pn="next"><span class="ui-icon ui-icon-seek-next"></span></a>');
			html.push('					<a href="#" class="sea_page sea_lastpage ui-button ui-widget ui-state-default ui-corner-all" pn="last"><span class="ui-icon ui-icon-seek-end"></span></a>');
			html.push('				</td>');
			html.push('			</tr>');
			html.push('		</tbody>');
			html.push('	</table>');
			html.push('</div>');
			html.push('<div style="clear:both;"></div>');
			html.push('</div>');
			$(me).html(html.join('')) ;
	  	}
	}
})(jQuery) ;
});