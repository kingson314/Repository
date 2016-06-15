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
				seajs.use(["Select"],
					function(Select){
						var cfgSelect1={
									id:"select1",
									label:"select1",
									value:"",
									options:[{value:"0",text:"ÄÐ"},{value:"1",text:"Å®"}]
								};
						var select1=Select.create(cfgSelect1);
						$("body").append(select1.label).append(select1.select)
						.css({"text-align":"center","margin-top":"10px"});
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>