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
				seajs.use(["Checkbox"],
					function(Checkbox){
						var cfgCheckbox1={
									id:"checkbox1",
									label:"checkbox1",
									value:"checkbox1"
								};
						var checkbox1=Checkbox.create(cfgCheckbox1);
						var cfgCheckbox2={
								id:"checkbox2",
								label:"checkbox2",
								value:"checkbox2",
								isNull:false 
							};
						var checkbox2=Checkbox.create(cfgCheckbox2);
						$("body").append(checkbox1.label).append(checkbox1.checkbox).append("<br>")
						.append(checkbox2.label).append(checkbox2.checkbox)
						.css({"text-align":"center","margin-top":"10px"});
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>