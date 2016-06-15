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
				seajs.use(["Textarea"],
					function(Textarea){
						var cfgTextarea={
									id:"textarea",
									label:"textarea",
									value:"textarea-test",
									rows:10,
									cols:100
								};
						var textarea=Textarea.create(cfgTextarea).textarea;
						$("body").append(textarea).css({"text-align":"center","margin-top":"10px"});
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>