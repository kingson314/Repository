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
				$("#time").html("��ǰʱ�䣺"+Date.getNow());
			});
			seajs.use(["BorderLayout","FormLayout","Bread","Json","Grid", "Nav","Menu"	],
			function(Border, FormLayout,Bread,Json) {
				var cfgBread = {
						  id: "bread", 
						  items: [{ 
						    label: "��ҳ",
						    click: function() {
						      alert("button1  click");
						    }
						  },
						  { 
						    label: "ϵͳ����",
						    click: function() {
						      alert("button1  click");
						    }
						  },
						  { 
						    label: "�û�����",
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
							<a href="#">��Ʒ���� <i class="icon-angle-down"></i></a>
							<ul class="sea_nav-submenu">
								<li><a href="#">�˶�����</a></li>
								<li><a href="#">�˶�����</a></li>
							</ul>
						</li>
						<li class="sea_nav-dropdown">
							<a href="#">˽�˶��� <i class="icon-angle-down"></i></a>
							<ul class="sea_nav-submenu">
								<li><a href="#">��Ʒ����</a></li>
								<li><a href="#">��Ʒ�б�</a></li>
							</ul>
						</li>
						<li class="sea_nav-dropdown">
							<a href="#">���뻭�� <i class="icon-angle-down"></i></a>
							<ul class="sea_nav-submenu">
								<li><a href="#">��������</a></li>
							</ul>
						</li>
						<li class="sea_nav-dropdown">
							<a href="#">����� <i class="icon-angle-down"></i></a>
							<ul class="sea_nav-submenu">
								<li><a href="#">��ά��</a></li>
								<li><a href="#">����</a></li>
								<li><a href="#">�齱</a></li>
								<li><a href="#">�Żݻ</a></li>
							</ul>
						</li>
					</ul>
				</div> <!-- nav close -->
	<div id="container"></div>
	</body>
</html>