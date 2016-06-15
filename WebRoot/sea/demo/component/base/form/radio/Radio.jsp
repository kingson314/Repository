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
				seajs.use(["Radio"],
					function(Radio){
						var cfgRadio1={
									id:"radio1",
									label:"radio1",
									value:"radio1"
								};
						var radio1=Radio.create(cfgRadio1);
						var cfgRadio2={
								id:"radio2",
								label:"radio2",
								value:"radio2",
								isNull:false 
							};
						var radio2=Radio.create(cfgRadio2);
						$("body").append(radio1.label).append(radio1.radio).append("<br>")
						.append(radio2.label).append(radio2.radio)
						.css({"text-align":"center","margin-top":"10px"});
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>