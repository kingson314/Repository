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
				seajs.use(["Textfield"],
					function(Textfield){
						var cfgTextfield1={
									id:"textfield1",
									label:"textfield1",
									value:"textfield1"
								};
						var textfield1=Textfield.create(cfgTextfield1);
						var cfgTextfield2={
								id:"textfield2",
								label:"textfield2",
								value:"textfield2",
								isNull:false 
							};
						var textfield2=Textfield.create(cfgTextfield2);
						$("body").append(textfield1.label).append(textfield1.textfield).append("<br>")
						.append(textfield2.label).append(textfield2.textfield)
						.css({"text-align":"center","margin-top":"10px"});
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>