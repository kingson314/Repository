<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>Repository</title>
		<%@ include  file="../sea/Session.jsp"%>
		<style>
			#sea_main_header{
				background-color: #F8F8FC;
				background: -ms-linear-gradient(bottom, #FFFFFF, #F8F8FC, #D6E0F5);
				background: -mo-linear-gradient(bottom, #FFFFFF, #F8F8FC, #D6E0F5);
				background: -webkit-linear-gradient(bottom, #FFFFFF, #F8F8FC, #D6E0F5);
				text-align: left;
				padding: 0 50px 0 20px;
				height: 80px;
				line-height: 80px;
				width: 100 % ;
				font-weight: bold;
				font-size: 26px;
				color: #0b74bf;
				border: 0;
				text-shadow:1px 1px rgba(0,0,0,.3);
			}
			#sea_main_header_buttonGroup{
				float:right;
				height: 80px;
				line-height: 70px;
			}
			#sea_main_header_buttonGroup ul li a{
				padding:12px 20px;
				color:#666;
				background-color: #F8F8FC;
				text-shadow:none;
				background: -ms-linear-gradient(top, #FFFFFF, #F8F8FC, #D6E0F5);
				background: -mo-linear-gradient(top, #FFFFFF, #F8F8FC, #D6E0F5);
				background: -webkit-linear-gradient(top, #FFFFFF, #F8F8FC, #D6E0F5);
			}
		</style>
		<script>
		$(document).ready(function() {
			seajs.use(["BorderLayout","Bread","Iframe","Ajax" ,"Date"	,"Thumbnail","ButtonGroup","Dialog","Nav","Menu"],
			function(BorderLayout,Bread,Iframe,Ajax,Date,Thumbnail,ButtonGroup,Dialog,Nav) {
				var northNav=Nav.create({selector:".sea_nav"}).nav;
				var westMenu=$(".sea_menu").Menu().show();
				var centerCenterIframe=Iframe.create({id : "centerIframe"}).iframe;
				var Thumbnail=Thumbnail.create({
												imgSrc:"<%=basePath%>sea/core/css/images/man.png",
												title:"欢迎登陆",
												content:"Glyphicon Halflings",
												css:{
													'padding':'10px 0 0 10px',
													height:'40px',
													width:'100%',
													'line-height':'40px'
												},
												imgCss:{
													height:'40px',
													width:'40px',
													'border-radius':'40px'
													}						
											});
				var header=$("<div id='sea_main_header'><img  style='margin-right:10px;width:40px' src='<%=basePath%>sea/core/css/images/logo.png'/>基于SeaJS模块组件架构</div>");
				ButtonGroup.create({
					 id:"sea_main_header_buttonGroup",
					 separatorWidth:5,
					  items: [{
					    value: "请登录",
					    css:{
						},
					    icon:"glyphicon glyphicon-user",
					    click: function() {
							var loginIframe=Iframe.create({
																id : "loginIframe",
																src:"../com/system/user/login.jsp",	
																css : {"overflow":"hidden"},
															}).iframe;
							Dialog.alert({
							      hasButtonGroup:false,
							      title:"用户登录",
						          width: "600px",
						          height: "420px",
				                  content:loginIframe
				                }).content.css({"overflow":"hidden","border-radius":"0 0 10px 10px"});
					    }
					  },
					  {
					    value: "提醒",
					    css:{
						},
					    icon:"glyphicon glyphicon-envelope",
					    click: function() {
					      alert("button1  click");
					    }
					  },
					  {
						    icon: "glyphicon glyphicon-cog",
						    value: "设置",
						    css:{
							},
						    click: function() {
						      alert("button1  click");
						    }
						  }]
				}).buttonGroup.appendTo(header);
				
				var Border=BorderLayout.create({
					north:{
						height:80,
						north:{
							height:80,
							item:header
						}
					},
					west:{
						width:260,
						css:{"overflow-y":"auto"},
						item:westMenu
					},
					center: {
						north:{
							height:35,
							item:northNav
						},
						center:{
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
					}
				});

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
						 //centerCenterIframe.attr("src","http://www.pss-system.gov.cn/sipopublicsearch/imageviewer/showDocuments.shtml?params=CA86804A750D8F6090D6C730DE658177055F3BC83B9DF8EE");
					}else{
						$.merge(cftBread.items,[
								  { 
								    label: $(this).text().replace("+","")
								  }]
						 );
					}
					var  centerNorthBread=Bread.create(cftBread).bread;
					 Border.getCenter().getCenter().getNorth().empty().append(centerNorthBread);
				});
				//导航事件
				northNav.find(".sea_nav_main>li>a").click(function(){
					Border.getWest().css({"overflow-y":"hidden"});
					Border.getWest().find(".sea_menu>ul").hide();
					var curMenu=Border.getWest().find(".sea_menu").find("."+$(this).attr("link"));
					if(curMenu.length>0){
						curMenu.show();
						var subMenu=curMenu.find(".sea_submenu:first");
						if(subMenu.css("display")=="none"){
							curMenu.find("li:first").click();
						}
					}else{
						Border.getWest().append($("."+$(this).attr("link")).Menu().show());
					}
					Border.getWest().css({"overflow-y":"auto","overflow-x":"hidden"});
				});
				$(".sea_menu_header").append(Thumbnail.thumbnail);
				setTimeout(function(){
					$(".sea_menu_sys").show().find("li:first").find("a:first").click();
				},100);
			});
		});
	</script>
	</head>
	<body style="background-color:#fff;overflow:hidden;">
		<%@ include  file="app-nav.jsp"%>			
		<%@ include  file="app-menu.jsp"%>			
	</body>
</html>