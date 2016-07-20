<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>formLayout</title>
		<%@ include file="../../../../../Session.jsp"%>
		<script>
			$(document).ready(function(){
				Session.setBusiType("");
				seajs.use(["BorderLayout","FormLayout","Json"], function(Border,Form,Json) {
					var cfgForm = {
							id:"form",
							title: "修改密码",
							labelWidthPercent: 0.25,
							items: [[{
								id:"old",
								label: "旧密码",
								type: "textfield",
								placeholder: "原旧密码:123456",
								isNull: false
							}], [{
								id:"new",
								label: "新密码",
								type: "textfield",
								placeholder: "填写密码",
								isNull: false
							}], [{
								id:"confirm",
								label: "确认密码",
								type: "textfield",
								placeholder: "再次填写确认",
								isNull: false
							}],[],[{
								type: "button",
								id : "summit",
								value : "提交",
								cls : "",
								css : {"width":"100%"},
								attr : {	},
								icon:null,
								events : {
									click : function(){
										 if(!form.check()){
											    return;
										    }
										alert(Json.toString(form.val()));
									}
								}}]] 
						};
						var form=Form.create(cfgForm);
						var cfgBorder={
									parent: "body",
									id: "",
									name: "",
									width: "500",
									height: "100%",
									// north : {
									//	 height : 100,
									//},
									south : {
										height : 100
									}, 
									center: {
										item:form.formLayout
										//,css:{"border":"1px solid red"}
									}
								};
							var border=Border.create(cfgBorder);
							setTimeout(function(){
								var cfg1={
										dateCell:"#form #old",  
										format:"YYYY-MM-DD",
										isinitVal:false,
										isTime:false, 
										festival: true
									};
								jeDate(cfg1);
								},500);
					});
				
			});
		</script>		
	</head>
<body>
	</body>
</html>