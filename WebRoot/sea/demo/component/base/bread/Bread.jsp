<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>button</title>
		<%@ include file="../../../../Session.jsp"%>
	<style>
	</style>
	<script>
		$(document).ready(function(){
				seajs.use(["Bread"],
					function(Bread){
					var cfgBread = {
							  id: "bread1", 
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
						$("body").append(bread.bread)
						.css({"text-align":"left","margin-top":"10px"});
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>