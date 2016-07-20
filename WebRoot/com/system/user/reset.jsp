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
					}], [{
						value: "保存",
						type: "button",
						css:{
							"width":"100%",
							"border": "none",
							"font-size": "16px",
							"margin-top": "30px",
							 "height":"46px",
							 "line-height":"46px",
							 "background-color": "#4FBA9C",
							  "color": "#fff",
							  "border-radius":"5px",
							  "-webkit-appearance": "none"
							  },
							click:function(){
								alert("保存了");
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
	<body>
	</body>
</html>