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
				seajs.use(["FormLayout","Json"], function(Form,Json) {
					var cfgForm = {
							title: "<i class='glyphicon glyphicon-th-list'></i>&nbsp;修改密码",
							width:"80%",
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
							}],[{
								type: "buttonGroup",
								items:[{
									id : "summit",
									value : "提交",
									events : {
										click : function(){
											 if(!form.check()){
												    return;
											    }
											alert(Json.toString(form.val()));
										}
									}
								}]
							}]]
						};
						var form=Form.create(cfgForm);
						$("body").append(form.formLayout);
					});
			});
		</script>		
	</head><%--
	<body style="background-color:#F9F9F9;">
	--%><body>
	</body>
</html>