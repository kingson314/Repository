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
							title: "�޸�����",
							labelWidthPercent: 0.25,
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
							}],[],[{
								type: "button",
								id : "summit",
								value : "�ύ",
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