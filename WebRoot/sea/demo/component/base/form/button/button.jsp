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
				seajs.use(["Button"],
					function(Button){
						var cfgButton1={
									id:"button1",
									icon:"icon-flag",
									value:"button1",
									click:function(){
										alert("button1  click");
									}
								};
						var button1=Button.create(cfgButton1);
						var cfgButton2={
								id:"button2",
								value:"ÇëµÇÂ¼.......",
								css:{"border-radius":"100px"}
							};
						var button2=Button.create(cfgButton2);
						$("body").append(button1.button).append("<br><br>")
						.append(button2.button)
						.css({"text-align":"center","margin-top":"10px"});
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>