<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>Repository</title>
		<%@ include  file="../../../../Session.jsp"%>
		<script>
		$(document).ready(function() {
			seajs.use(["Date"],function(Date) {
				$("#time").html("当前时间："+Date.getNow());
			});
			seajs.use(["BorderLayout","Nav"],
			function(BorderLayout) {
				var nav=$('#sea_nav-nav').Nav();

				var cfgBorder = {
						parent: "#layout",
						width: "100%",
						height: "300px",
						center: {
							 item:""
						}
					};
					var border = BorderLayout.create(cfgBorder);
			});
		});
		</script>		
	</head>
	<body style="background-color:#EEEEEE;overflow:scroll">
	<!-- nav -->
	<div id="sea_nav-nav" style="margin:0;position:relative;">
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
								<li><a href="#">Link 5</a></li>
							</ul>
						</li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">About</a></li>
					</ul>
				</div> 
				<div id="layout" style='position:relative;display:block;width:100%;height:300px;border:1px solid red;'></div>
	</body>
</html>