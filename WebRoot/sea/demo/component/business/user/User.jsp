<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>button</title>
		<%@ include file="../../../../Session.jsp"%>
	<style>
	</style>
	<script>
		$(document).ready(function(){
				seajs.use(["ButtonGroup","Ajax"],
					function(ButtonGroup,Ajax){
						var cfgBtnGroup= {
								id: "btnGroup",
								css:{"text-align":"left"},
								align: "1",
								separatorWidth: 20,
								items: [{
									value: "��¼",
									click: function() {
										var data = {
											"id": "1",
											"password": "111"
										};
										Ajax.post("user/login", data,
										function(result) {
											if (result.success == true) {
												alert(("��¼�ɹ�"));
											}
										},
										false);
									}
								},{
									value: "��ҳ��ѯ",
									click: function() {
									}
								},{
									value: "�������ѯ",
									click: function() {
									}
								},
								{
									value: "����",
									click: function() {
										alert("button1  click");
									}
								},
								{
									value: "�޸�",
									click: function() {
										alert("button1  click");
									}
								},
								{
									value: "ɾ��",
									click: function() {
										alert("button1  click");
									}
								},
								{
									value: "����ɾ��",
									click: function() {
										alert("button1  click");
									}
								}]
							};
						var btnGroup=ButtonGroup.create(cfgBtnGroup);
						$("body").append(btnGroup.buttonGroup)
						.css({"margin-top":"100px"});
				});
		});
	</script>
	</head>
	<body>
	</body>
</html> 