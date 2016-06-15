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
									value: "登录",
									click: function() {
										var data = {
											"id": "1",
											"password": "111"
										};
										Ajax.post("user/login", data,
										function(result) {
											if (result.success == true) {
												alert(("登录成功"));
											}
										},
										false);
									}
								},{
									value: "分页查询",
									click: function() {
									}
								},{
									value: "下拉框查询",
									click: function() {
									}
								},
								{
									value: "新增",
									click: function() {
										alert("button1  click");
									}
								},
								{
									value: "修改",
									click: function() {
										alert("button1  click");
									}
								},
								{
									value: "删除",
									click: function() {
										alert("button1  click");
									}
								},
								{
									value: "批量删除",
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