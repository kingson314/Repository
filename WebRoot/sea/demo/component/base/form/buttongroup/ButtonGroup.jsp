<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>button</title>
		<%@ include file="../../../../../Session.jsp"%>
	<style>
	</style>
	<script>
		$(document).ready(function(){
				seajs.use(["ButtonGroup"],
					function(ButtonGroup){
					var cfgButtonGroup1 = {
							  id: "buttongroup1",
							  //align:"0",
							  separatorWidth:100,
							  items: [{
							    icon: "icon-flag",
							    value: "button1",
							    css:{"background-color":"red"},
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
						var buttongroup1=ButtonGroup.create(cfgButtonGroup1);
						var cfgButtonGroup2= {
								  id: "buttongroup1",
								  align:"1",
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
						var buttongroup2=ButtonGroup.create(cfgButtonGroup2);

						var cfgToolbar3 = {
								  id: "toolbar3",
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
							var toolbar3=ButtonGroup.create(cfgToolbar3);

							
						$("body").append(buttongroup1.buttonGroup).append("<br><br><br>")
						.append(buttongroup2.buttonGroup)
						.append("<br><br><br>")
						.append(toolbar3.buttonGroup)
						.css({"text-align":"left","margin-top":"10px"});
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>