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
			seajs.use(["BorderLayout", "FormLayout"],
			function(Border, Form) {
				var cfgForm = {
					title: "�û�ע��",
					width:"80%",
					labelWidthPercent: 0.25,
					items: [[{
						id:"userName",
						type: "textfield",
						placeholder: "�û�����",
						isNull: false
					}], [{
						id: "password",
						type: "textfield",
						placeholder: "��������",
						isNull: false
					}], [{
						id: "buildingName",
						type: "textfield",
						placeholder: "¥������",
						isNull: false
					}], [{
						id: "houseType",
						type: "textfield",
						placeholder: "����",
						isNull: false
					}], [{
						id: "phone",
						type: "textfield",
						placeholder: "�ֻ�����",
						isNull: false
					}], [{
						id: "identifyingCode",
						colspan:0.5,
						type: "textfield",
						placeholder: "��������֤��",
						isNull: false
					},{
						value: "��ȡ��֤��",
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
								alert("��ȡ�ɹ�");
							}
					}],[{
						value: "����",
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
								alert("������");
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