<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>formLayout</title>
		<%@ include file="../../../../../Session.jsp"%>
		<script>
			$(document).ready(function(){
				Session.setBusiType("");
				seajs.use(["TabLayout"], function(TabLayout) {
						var cfgTabLayout = {
								id : "",
								cls : "",
								css : {},
								attr : {	},
								position:"top",//title��λ�ã�top,right,bottom,left
								items:[{
								       label:"tab1",
								       active:true,
								       img:null,//Img.js:Img.img
								       click:null,
								       url:"",//����url,��Ϊ��ʱ����Ƕһ��iframe
								       item:""//����jquery����
								} ,{
								       label:"tab2",
								       active:false,
								       img:null,//Img.js:Img.img
								       click:null,
								       url:"",//����url,��Ϊ��ʱ����Ƕһ��iframe
								       item:""//����jquery����
								} ]
							};
 						var tabLayout=TabLayout.create(cfgTabLayout);
						$("body").append(tabLayout.tabLayout);
					});
			});
		</script>		
	</head>
	<body style="background-color:#EEEEEE;">
	</body>
</html>