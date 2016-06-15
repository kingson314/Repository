<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>Repository</title>
		<%@ include file="/sea/Session.jsp"%>
		<style>
		body {
			font: 13px/ 1.42857143 "微软雅黑";
			color: #000;
			background-color: #fff;
		}
		
		#sea_formLayout_td_forget {
			width: 100%;
			height: 20px;
			float: left;
			font-size: 18px;
			color: #898989;
			text-align: center;
			line-height: 20px;
			margin-top: 15px;
		}
		</style>
		<script>
		$(document).ready(function() {
			Session.setBusiType("");
			seajs.use(["BorderLayout", "FormLayout","Ajax","Json"],
			function(Border, Form,Ajax,Json) {
				var cfgForm = {
					id:"loginform",
					width:"80%",
					labelWidthPercent: 0.25,
					items: [[{
						id:"logo",
						type: "img",
						tdCss: {
							"text-align":"center", "float": "left"
						},
						css:{"height":"80px","left":"50%"},
						src: "<%=request.getContextPath()%>/com/system/user/images/login_logo.png" 
					}],[], [{
						type: "label",
						tdCss:{ "width": "100%",
						 "height": "30px",
						 "float": "left",
						 "text-align": "center",
						 "line-height": "30px",
						 "font-size": "22px",
						 "color":"#433E3D",
						 "margin-top": "10px"},
						label: "Lumin Home 度假居",
						css: {}
					}], [{
						type: "label",
						label: "为您的家人订制5星度假空间",
						tdCss: {"width":"100%",
						"height":"30px",
						"float":"left",
						"text-align":"center",
						"line-height":"30px",
						"font-size":"18px",
						"color":"#888",
						"margin-top":"10px"}
					}], [],[{
						id: "phone",
						type: "textfield",
						placeholder: "请输入您的手机号码",
						isNull: true
					}],  [{
						id: "password",
						type: "textfield",
						placeholder: "请输入您的密码",
						isNull: false
					}],[{
						value: "登录",
						type: "button",
						css:{
							"width":"100%",
							"border": "none",
							"font-size": "16px",
							 "height":"40px",
							 "line-height":"40px",
							 "background-color": "#4FBA9C",
							  "color": "#fff",
							  "border-radius":"5px",
							  "-webkit-appearance": "none"
							  },
							click:function(){
								  var data={"id":"1","password":"111"};
								  Ajax.post("user/login",data,function(result){
									  if(result.success==true){
										    if(!form.check()){
											    return;
										    }
										  	form.val({phone:"15914475509",memo:"fenggq"});
											alert(Json.toString(form.val()));
											  form.clear();
											  alert(("登录成功"));
									  		window.location.href =Ajax.getUrl("app/app-main.jsp",data);
									  }
								  	},false
								  );
							}
					}],[{
						id:"forget",
						type: "button",
						value: "忘记密码？",
						css: {"color": "#000","text-decoration": "none","font-size":"18px"},
						click:function(){
							window.location.href =Ajax.getUrl("user/forget");
						}
					}],[{
						type: "label",
						label: "还没有账号吗？",
						colspan:0.5,
						css: {"color":"#898989","text-decoration": "none","height":"42px","margin-top":"10px",
						 "line-height":"40px","font-size":"18px"}
					},{
						value: "注册",
						type: "button",
						colspan:0.5,
						css:{
							"width":"132px",
							"border": " solid 1px #D5D5D5",
							"font-size": "22px",
							 "height":"40px",
							 "line-height":"40px",
							 "background-color": "transparent",
							  "color": "#8A8A8A",
							  "border-radius":"5px",
							  "-webkit-appearance": "none",
							  "float":"right",
							  "margin-top":"10px"
							  },
							click:function(){
									window.location.href =Ajax.getUrl("user/register");
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
	<body style="background-color: #EEEEEE;">
	</body>
</html>