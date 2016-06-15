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
								title: "�޸�����",
								parent:"body",
								width:'500px',
								items: [{
											label: "������",
									 		type: "textfield",
									 		placeholder: "ԭ������:123456",
											isNull:false
								},{
									label: "������",
							 		type: "textfield",
							 		placeholder: "��д����",
									isNull:false
								},{
									label: "ȷ������",
							 		type: "textfield",
							 		placeholder: "�ٴ���дȷ��",
									isNull:false
								},{
									value: "����",
							 		type: "button",
									css:{"background-color":"#48BA9D"},
									click:function(){
										alert(1);
									}
								},{
									value: "ȡ��",
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