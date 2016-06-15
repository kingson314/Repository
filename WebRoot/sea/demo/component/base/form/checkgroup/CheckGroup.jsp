<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>check</title>
		<%@ include file="../../../../../Session.jsp"%>
	<style>
	</style>
	<script>
		$(document).ready(function(){
				seajs.use(["CheckGroup"],
					function(CheckGroup){
					var cfgCheckGroup1 = {
							  id: "checkgroup1",
							  //align:"0",
							  items: [{
							    label: "check1",
							    click: function() {
							      alert("check1  click");
							    }
							  },
							  {
							    label: "check1",
							    click: function() {
							      alert("check1  click");
							    }
							  },
							  {
							    label: "check1",
							    click: function() {
							      alert("check1  click");
							    }
							  }]
							};
						var checkgroup1=CheckGroup.create(cfgCheckGroup1);
						var cfgCheckGroup2= {
								  id: "checkgroup1",
								  align:"1",
								  items: [{
								    label: "check1",
								    click: function() {
								      alert("check1  click");
								    }
								  },
								  {
								    label: "check1",
								    click: function() {
								      alert("check1  click");
								    }
								  },
								  {
								    label: "check1",
								    click: function() {
								      alert("check1  click");
								    }
								  }]
								};
						var checkgroup2=CheckGroup.create(cfgCheckGroup2);
						$("body").append(checkgroup1.checkGroup).append("<br><br><br>")
						.append(checkgroup2.checkGroup)
						.css({"text-align":"center","margin-top":"10px"});
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>