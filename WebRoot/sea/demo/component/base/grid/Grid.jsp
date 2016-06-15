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
				seajs.use(["Grid"],
					function(Grid){
					$("body").Grid({
						columns:[
						      	{align:"left",name:"name",label:"用户名" },
					           	{align:"left",name:"userAlias",label:"用户别名" },
					           	{align:"left",name:"sex",label:"性别" ,format:{type:"json",content:{"0":"男","1":"女"}} },
					           	{align:"left",name:"postId",label:"邮政地址" },
					           	{align:"left",name:"birthday",label:"生日" },
					           	{align:"left",name:"mobilePhone",label:"手机号码" },
					           	{align:"left",name:"officePhone",label:"办公电话" },
					           	{align:"left",name:"email",label:"邮箱地址" },
					           	{align:"left",name:"education",label:"学历" },
					           	{align:"left",name:"photoUrl",label:"照片" },
					           	{align:"left",name:"memo",label:"备注" }
						         ],
						 ds:{
						 		type:"url",
						 		url:"user/list"
						 },
						 limit:20,
						 pageSizes:[10,20,30,40],
						 height:"100%",
						 title:"用户列表",
						 indexColumn:true,
						 params:{name:""},
						 loadMsg:"数据加载中，请稍候......"
					}) ;
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>