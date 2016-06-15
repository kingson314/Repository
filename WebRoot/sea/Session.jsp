<%@page language="java" contentType="text/html; charset=gbk"%>
<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<%
	String basePath=request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/";
	String langue  = request.getParameter("langue");
	String theme   = request.getParameter("theme");
	String userId  = request.getParameter("userId");
	String userName= request.getParameter("userName");
%>
<script src="<%=basePath%>sea/core/jquery/jquery.js"></script>
<script src="<%=basePath%>sea/core/sea/sea.js"></script>
<script src="<%=basePath%>sea/core/sea/sea.css.js"></script>
<link href="<%=basePath %>sea/core/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css"/>
<%--<link href="<%=basePath%>sea/core/css/css.css" rel="stylesheet" type="text/css"/>
<link href="<%=basePath%>sea/core/css/icon.css" rel="stylesheet" type="text/css"/>
--%><script>
		var Cookie={
				//theme: "-touch"
				theme: ""
		}
		var Session = {
			basePath: "<%=basePath%>",
			langue: <%=langue%>|| "zh_CN" ,
			userId: <%=userId%>||"",
			userName: <%=userName%>||"",
			//获取全局唯一序列
			getSeq:(function(){
					var seq=0;
					return function(){
							if(seq>Number.MAX_VALUE){
										seq=0;
										return seq;
								}else{
									return seq++;
								}
						};
				}()),
				Seq:(function(){
					var seq=0;
					return{ 
							get:function(){
								if(seq>Number.MAX_VALUE){
											seq=0;
											return seq;
									}else{
										return seq++;
									}
							},
							set:function(val){
								seq=val;
							}
					}
				}()),
			setBusiType: function(businessType) {
				var seaPath="<%=basePath%>sea/";
				seajs.config({
					alias: {
						/***业务组件件库***/
						XX: "<%=basePath%>sea/component/"+businessType+"/",
					},
					charset: 'utf-8'
				});
			}
		};
		seajs.config({
			alias: {
				/***核心库***/
				/***核心库——公共国际化***/
				LibLang     :"<%=basePath%>sea/library/library.lang",
				/***核心库——基础类型***/
				Array       :"<%=basePath%>sea/library/datatype/Array",
				Boolean     :"<%=basePath%>sea/library/datatype/Boolean",
				Date        :"<%=basePath%>sea/library/datatype/Date",
				Function    :"<%=basePath%>sea/library/datatype/Function",
				Json        :"<%=basePath%>sea/library/datatype/Json",
				Number      :"<%=basePath%>sea/library/datatype/Number",
				Object      :"<%=basePath%>sea/library/datatype/Object",
				Regular     :"<%=basePath%>sea/library/datatype/Regular",
				String      :"<%=basePath%>sea/library/datatype/String",
				/***核心库——核心功能库——系统功能类库***/
				Ajax        :"<%=basePath%>sea/library/function/Ajax",
				Conver      :"<%=basePath%>sea/library/function/Conver",
				File        :"<%=basePath%>sea/library/function/File",
				Format      :"<%=basePath%>sea/library/function/Format",
				Log         :"<%=basePath%>sea/library/function/Log",
				Math        :"<%=basePath%>sea/library/function/Math",
				Component      :"<%=basePath%>sea/library/function/Component",
				Window      :"<%=basePath%>sea/library/function/Window",
				/***核心库——核心功能库——业务功能类库***/

				/***插件库***/
				/***插件库——公共国际化***/
				ComponentLang  :"<%=basePath%>sea/component/Component.lang",
				/***插件库——基础插件***/
				Bread       : "<%=basePath%>sea/component/base/bread/Bread",
				Dialog       : "<%=basePath%>sea/component/base/dialog/Dialog",
				Table        : "<%=basePath%>sea/component/base/table/Table",
				Grid        : "<%=basePath%>sea/component/base/grid/Grid",
				Iframe : "<%=basePath%>sea/component/base/iframe/Iframe",
				Menu        : "<%=basePath%>sea/component/base/menu/Menu",
				Nav        : "<%=basePath%>sea/component/base/nav/Nav",
				Navbar        : "<%=basePath%>sea/component/base/navbar/Navbar",
				Node        : "<%=basePath%>sea/component/base/node/Node",						
				Pager       : "<%=basePath%>sea/component/base/pager/Pager",
				Tip         : "<%=basePath%>sea/component/base/tip/Tip",
				Toolbar       : "<%=basePath%>sea/component/base/toolbar/Toolbar",
				Tree        : "<%=basePath%>sea/component/base/tree/Tree",
				/***插件库——基础插件库——图表插件***/
				Bar         : "<%=basePath%>sea/component/base/chart/bar/Bar",
				Chord       : "<%=basePath%>sea/component/base/chart/chord/Chord",
				Eventriver  : "<%=basePath%>sea/component/base/chart/eventriver/Eventriver",
				Force       : "<%=basePath%>sea/component/base/chart/force/Force",
				Funnel      : "<%=basePath%>sea/component/base/chart/funnel/Funnel",
				Gauge       : "<%=basePath%>sea/component/base/chart/gauge/Gauge",
				Kline       : "<%=basePath%>sea/component/base/chart/kline/Kline",
				Line        : "<%=basePath%>sea/component/base/chart/line/Line",
				Map         : "<%=basePath%>sea/component/base/chart/map/Map",
				Pie         : "<%=basePath%>sea/component/base/chart/pie/Pie",
				Radar       : "<%=basePath%>sea/component/base/chart/radar/Radar",
				Scatter     : "<%=basePath%>sea/component/base/chart/scatter/Scatter",
				/***插件库——基础插件库——表单插件***/
				Input      : "<%=basePath%>sea/component/base/form/Input",
				Button      : "<%=basePath%>sea/component/base/form/button/Button",
				ButtonGroup : "<%=basePath%>sea/component/base/form/buttongroup/ButtonGroup",
				Checkbox       : "<%=basePath%>sea/component/base/form/checkbox/Checkbox",
				CheckGroup  : "<%=basePath%>sea/component/base/form/checkgroup/CheckGroup",
				Color       : "<%=basePath%>sea/component/base/form/color/Color",
				DateTime    : "<%=basePath%>sea/component/base/form/datetime/DateTime",
				Hidden      : "<%=basePath%>sea/component/base/form/hidden/Hidden",
				Img      : "<%=basePath%>sea/component/base/form/img/Img",
				Label       : "<%=basePath%>sea/component/base/form/label/Label",
				Radio       : "<%=basePath%>sea/component/base/form/radio/Radio",
				RadioGroup  : "<%=basePath%>sea/component/base/form/radiogroup/RadioGroup",
				Select      : "<%=basePath%>sea/component/base/form/select/Select",
				Textarea    : "<%=basePath%>sea/component/base/form/textarea/Textarea",
				Textfield   : "<%=basePath%>sea/component/base/form/textfield/Textfield",
				/***插件库——基础插件库——布局插件***/
				AccordionLayout: "<%=basePath%>sea/component/base/layout/accordionlayout/AccordionLayout",
				BorderLayout: "<%=basePath%>sea/component/base/layout/borderlayout/BorderLayout",
				FormLayout  : "<%=basePath%>sea/component/base/layout/formlayout/FormLayout",
				TabLayout   : "<%=basePath%>sea/component/base/layout/tablayout/TabLayout",
				GridLayout : "<%=basePath%>sea/component/base/layout/tablelayout/GridLayout"
			},
			charset: 'utf-8'
		});
</script>
