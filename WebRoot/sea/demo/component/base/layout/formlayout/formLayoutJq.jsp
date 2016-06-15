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
							title: "<i class='glyphicon glyphicon-th-list'></i>&nbsp;�޸�����",
							width:"80%",
							items: [[{
								id:"old",
								label: "������",
								type: "textfield",
								placeholder: "ԭ������:123456",
								isNull: false
							}], [{
								id:"new",
								label: "������",
								type: "textfield",
								placeholder: "��д����",
								isNull: false
							}], [{
								id:"confirm",
								label: "ȷ������",
								type: "textfield",
								placeholder: "�ٴ���дȷ��",
								isNull: false
							}],[{
								type: "buttonGroup",
								items:[{
									id : "summit",
									value : "�ύ",
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