<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>Repository</title>
		<%@ include file="/sea/Session.jsp"%>

		<script>
		$(document).ready(function() {
			Session.setBusiType("");
			seajs.use(["BorderLayout", "FormLayout","Ajax"],
			function(Border, Form,Ajax) {
				var cfgForm = {
					title: "忘记密码",
					width:"80%",
					labelWidthPercent: 0.25,
					items: [[{
						id: "phone",
						type: "textfield",
						placeholder: "手机号码",
						isNull: false
					}], [{
						id: "identifyingCode",
						colspan:0.5,
						type: "textfield",
						placeholder: "请输入验证码",
						isNull: false
					},{
						value: "获取验证码",
						type: "button",
						colspan:0.5,
						css:{
							"width":"90%",
							"border": "none",
							"font-size": "16px",
							 "height":"35px",
							 "line-height":"35px",
							 "background-color": "#898A89",
							  "color": "#fff",
							  "border-radius":"5px",
							  "-webkit-appearance": "none",
							  "margin-left":"5%"
							  },
							click:function(){
								alert("获取成功");
							}
					}],[{
						value: "下一步",
						type: "button",
						css:{
							"width":"100%",
							"border": "none",
							"font-size": "16px",
							"margin-top": "30px",
							 "height":"40px",
							 "line-height":"40px",
							 "background-color": "#4FBA9C",
							  "color": "#fff",
							  "border-radius":"5px",
							  "-webkit-appearance": "none"
							  },
							click:function(){
								  Ajax.post("user/newpsw",{},function(result){
									  if(result.success==true){
									  		window.location.href =Ajax.getUrl("com/system/user/newpsw.jsp",{'name':'fgq','password':'123'});
									  }
								  	},false
								  );
							}
					}]]
				};
				var form = Form.create(cfgForm);
				var cfgBorder = {
					parent: "body",
					id: "",
					name: "",
					width: "500",
					height: "100%",
					// north : {
					//	 height : 100,
					//},
					south: {
						height: 100
					},
					center: {
						item: form.formLayout,
						css:{overflow:"auto"}
						//,css:{"border":"1px solid red"}
					}
				};
				var border = Border.create(cfgBorder);
			});
		});
		</script>
	</head>
	<%--
	<body style="background-color:#F9F9F9;">
	--%>
	<body style="background-color: #EEEEEE;">
	</body>
</html>