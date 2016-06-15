<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>accordionLayout</title>
		<%@ include file="../../../../../Session.jsp"%>
		<script>
			$(document).ready(function(){
				Session.setBusiType("");

				seajs.use(["AccordionLayout"], function(AccordionLayout) {
						var cfg={
								title: "修改密码",
								parent:"body",
								width:'500px',
								items: [{
											label: "旧密码",
									 		type: "textfield",
									 		placeholder: "原旧密码:123456",
											isNull:false
								},{
									label: "新密码",
							 		type: "textfield",
							 		placeholder: "填写密码",
									isNull:false
								},{
									label: "确认密码",
							 		type: "textfield",
							 		placeholder: "再次填写确认",
									isNull:false
								},{
									value: "保存",
							 		type: "button",
									css:{"background-color":"#48BA9D"},
									click:function(){
										alert(1);
									}
								},{
									value: "取消",
							 		type: "button",
							 		css:{"background-color":"#F14C4E","margin-top": "15px"}
								}]	
						};
						AccordionLayout.create(cfg);
					});
			});
		</script>		
	</head>
	<body style="background-color:#EEEEEE;">
	</body>
</html>