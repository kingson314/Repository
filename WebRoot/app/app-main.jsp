<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>Repository</title>
		<%@ include  file="../sea/Session.jsp"%>
		<script>
		$(document).ready(function() {
			seajs.use(["BorderLayout","Bread","Iframe","Ajax" ,"Date","Nav","Menu"	],
			function(BorderLayout,Bread,Iframe,Ajax,Date) {
				var northNav=$('#sea_nav').Nav().show().css({"position":"relative","margin":"0","padding":"0"});
				var westMenu=$(".sea_menu_sys").Menu().show();
				var centerCenterIframe=Iframe.create({id : "centerIframe"}).iframe;
				var Border=BorderLayout.create({
					north:{
						height:115,
						north:{
							height:80,
							//item:"<div style='background:url(<%=basePath%>sea/core/css/images/bg.jpg) no-repeat left 0% bottom 50%;text-align:left;padding:0 50px;height:80px;line-height:80px;width:100%;font-weight:bold;font-size:26px;color:#222;border:1px solid #ddd;background-color:#f8f8f8;'>"
							//	+"<img  style='margin-right:10px;width:40px' src='<%=basePath%>sea/core/css/images/logo.png'/>基于SeaJS模块组件架构</div>"
							item:"<div style='	background-color: #F5F5F5;"
								+"background:-ms-linear-gradient(left,#FFFFFF,#EEEEFF,#F5F5F5);"
								+"background:-moz-linear-gradient(left,#FFFFFF,#EEEEFF,#F5F5F5);"
								+"background:-webkit-linear-gradient(left,#FFFFFF,#EEEEFF,#F5F5F5);text-align:left;padding:0 50px;height:80px;line-height:80px;width:100%;font-weight:bold;font-size:26px;color:#222;border:1px solid #ddd;'>"
								+"<img  style='margin-right:10px;width:40px' src='<%=basePath%>sea/core/css/images/logo.png'/>基于SeaJS模块组件架构</div>"
						},
						center:{
							item:northNav
						}
					},
					west:{
						width:260,
						css:{"overflow-y":"auto"},
						item:westMenu
					},
					center: {
						north:{
							height:30,
							item:Bread.create({
								  items: [{ 
									    label: "主页"
									  }]
									}).bread
						},
						center:{
						 	item:centerCenterIframe
						}
					}
				});

				//设置导航条时间
				setInterval(function(){
					$("#nav_time").text("当前时间："+Date.getNow());
				},1000);
				//绑定菜单事件
				$(".sea_menu a").click(function(){
					var  cftBread={
							 items: [
									  { 
									    label: "主页"
									  }
								]
							};
					var menuUrl=$(this).attr("url");
					if(menuUrl){
						$.merge(cftBread.items,[
								  { 
								    label:$(this).parent().parent().parent().find("a:eq(0)").text().replace("+","")
								  },
								  { 
								    label: $(this).text().replace("+","")
								  }]
						 );
						 centerCenterIframe.attr("src",Ajax.getUrl(menuUrl));
					}else{
						$.merge(cftBread.items,[
								  { 
								    label: $(this).text().replace("+","")
								  }]
						 );
					}
					var  centerNorthBread=Bread.create(cftBread).bread;
					 Border.getCenter().getNorth().empty().append(centerNorthBread);
				});
				//导航事件
				$("#sea_nav_main>li>a").click(function(){
					Border.getWest().css({"overflow-y":"hidden"});
					Border.getWest().find(".sea_menu").hide();
					var curMenu=Border.getWest().find(".sea_menu").find("."+$(this).attr("link"));
					if(curMenu.length>0){
						curMenu.show()
					}else{
						Border.getWest().append($("."+$(this).attr("link")).Menu().show());
					}
					Border.getWest().css({"overflow-y":"auto","overflow-x":"hidden"});
				});
				//$(".sea_menu").height(Border.getWest().height()-50);
			});
		});
	</script>
	</head>
	<body style="background-color:#fff;overflow:hidden;">
		<%@ include  file="app-nav.jsp"%>			
		<%@ include  file="app-menu.jsp"%>			
	</body>
</html>