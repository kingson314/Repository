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
				seajs.use(["Toolbar"],
					function(Toolbar){
						var cfgToolbar = {
								  id: "toolbar",
								  //align:"0",
								  separatorWidth:0,
								  items: [{
								    icon: "icon-flag",
								    value: "button1",
								    click: function() {
								      alert("button1  click");
								    }
								  },
								  {
								    icon: "icon-flag",
								    value: "button1",
								    click: function() {
								      alert("button1  click");
								    }
								  },
								  {
								    icon: "icon-flag",
								    value: "button1",
								    click: function() {
								      alert("button1  click");
								    }
								  }]
								};
							var toolbar=Toolbar.create(cfgToolbar);
						$("body").append(toolbar.toolbar).append("<br><br><br>")
						.css({"text-align":"left","margin-top":"10px"});
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>