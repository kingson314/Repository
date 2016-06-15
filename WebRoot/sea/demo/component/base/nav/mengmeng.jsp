<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>Repository</title>
		<%@ include  file="../../../../Session.jsp"%>
		
		
<style type="text/css"> 
</style>
		<script>
		$(document).ready(function() {
			seajs.use(["Date"],function(Date) {
				$("#time").html("当前时间："+Date.getNow());
			});
			seajs.use(["BorderLayout","FormLayout","Bread","Json","Grid", "Nav","Menu"	],
			function(Border, FormLayout,Bread,Json) {
				var cfgBread = {
						  id: "bread", 
						  items: [{ 
						    label: "主页",
						    click: function() {
						      alert("button1  click");
						    }
						  },
						  { 
						    label: "系统管理",
						    click: function() {
						      alert("button1  click");
						    }
						  },
						  { 
						    label: "用户管理",
						    click: function() {
						      alert("button1  click");
						    }
						  }]
						};
					var bread=Bread.create(cfgBread);
				var cfgBorder = {
					parent: "#container",
					id: "",
					name: "",
					width: "100%",
					height: "100%",
					north:{
						 height:300
						},
					 center : {
							item:$('#sea_nav-nav').Nav({floating: 'left'}).show()
					}
				};
				var border = Border.create(cfgBorder);
			});
		});
</script>
	</head>
	<body style="background-color:#EEEEEE;overflow:scroll">
	<!-- nav -->
	<div id="sea_nav-nav">
					<ul id="sea_nav-main-nav">
						<li class="sea_nav-dropdown">
							<a href="#">精品荟萃 <i class="icon-angle-down"></i></a>
							<ul class="sea_nav-submenu">
								<li><a href="#">运动旗袍</a></li>
								<li><a href="#">运动服饰</a></li>
							</ul>
						</li>
						<li class="sea_nav-dropdown">
							<a href="#">私人定制 <i class="icon-angle-down"></i></a>
							<ul class="sea_nav-submenu">
								<li><a href="#">产品搭配</a></li>
								<li><a href="#">产品列表</a></li>
							</ul>
						</li>
						<li class="sea_nav-dropdown">
							<a href="#">梦想画廊 <i class="icon-angle-down"></i></a>
							<ul class="sea_nav-submenu">
								<li><a href="#">故事连载</a></li>
							</ul>
						</li>
						<li class="sea_nav-dropdown">
							<a href="#">活动留言 <i class="icon-angle-down"></i></a>
							<ul class="sea_nav-submenu">
								<li><a href="#">二维码</a></li>
								<li><a href="#">留言</a></li>
								<li><a href="#">抽奖</a></li>
								<li><a href="#">优惠活动</a></li>
							</ul>
						</li>
					</ul>
				</div> <!-- nav close -->
	<div id="container"></div>
	</body>
</html>