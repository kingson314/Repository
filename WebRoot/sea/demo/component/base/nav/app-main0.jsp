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
							css:{"border":"1px solid red"},
							item:$('#sea_nav-nav').Nav({floating: 'right'}).show()
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
						<li>
						<div id="time" style="background-color:transparent;color:white;width:280px;padding-left:20px;font-size:16px;color:#fff"></div>
						</li>
						<li class="sea_nav-active"><a href="#">Home</a></li>
						<li class="sea_nav-dropdown">
							<a href="#">Pages <i class="icon-angle-down"></i></a>
							<ul class="sea_nav-submenu">
								<li><a href="#">Link 1</a></li>
								<li><a href="#">Link 2</a></li>
								<li><a href="#">Link 3</a></li>
								<li class="sea_nav-dropdown">
									<a href="#">Dropdown <i class="icon-angle-right"></i></a>
									<ul class="sea_nav-submenu">
										<li><a href="#">Link 1</a></li>
										<li><a href="#">Link 2</a></li>
										<li><a href="#">Link 3</a></li>
										<li class="sea_nav-dropdown">
											<a href="#">Dropdown <i class="icon-angle-right"></i></a>
											<ul class="sea_nav-submenu">
												<li><a href="#">Link 1</a></li>
												<li><a href="#">Link 2</a></li>
												<li><a href="#">Link 3</a></li>
												<li><a href="#">Link 4</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li><a href="#"><span  class=' icon-glass'></span>Link 5</a></li>
							</ul>
						</li>
						<li><a href="#"><span  class=' icon-glass'></span>Contact</a></li>
						<li><a href="#"><span  class=' icon icon-gear'></span>About</a></li>
					</ul>
				</div> <!-- nav close -->
	<div id="container"></div>
	</body>
</html>