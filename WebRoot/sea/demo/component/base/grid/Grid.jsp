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
						      	{align:"left",name:"name",label:"�û���" },
					           	{align:"left",name:"userAlias",label:"�û�����" },
					           	{align:"left",name:"sex",label:"�Ա�" ,format:{type:"json",content:{"0":"��","1":"Ů"}} },
					           	{align:"left",name:"postId",label:"������ַ" },
					           	{align:"left",name:"birthday",label:"����" },
					           	{align:"left",name:"mobilePhone",label:"�ֻ�����" },
					           	{align:"left",name:"officePhone",label:"�칫�绰" },
					           	{align:"left",name:"email",label:"�����ַ" },
					           	{align:"left",name:"education",label:"ѧ��" },
					           	{align:"left",name:"photoUrl",label:"��Ƭ" },
					           	{align:"left",name:"memo",label:"��ע" }
						         ],
						 ds:{
						 		type:"url",
						 		url:"user/list"
						 },
						 limit:20,
						 pageSizes:[10,20,30,40],
						 height:"100%",
						 title:"�û��б�",
						 indexColumn:true,
						 params:{name:""},
						 loadMsg:"���ݼ����У����Ժ�......"
					}) ;
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>