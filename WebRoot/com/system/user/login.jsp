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
			seajs.use(["FormLayout","Ajax","Json"],
			function( Form,Ajax,Json) {
				var cfgForm = {
					parent: "body",
					width:"80%",
					"height":"100%",
					css:{"border":0},
					labelWidthPercent: 0.25,
					items: [[{
						id:"logo",
						type: "img",
						tdCss: {
							"text-align":"center", "float": "left","margin-bottom":"15px"
						},
						css:{"height":"80px","left":"50%"},
						src: "<%=request.getContextPath()%>/sea/core/css/images/logo.png" 
					}],[],[],[{
						id: "phone",
						type: "textfield",
						placeholder: "«Î ‰»Îƒ˙µƒ’À∫≈",
						isNull: true
					}],  [{
						id: "password",
						type: "textfield",
						placeholder: "«Î ‰»Îƒ˙µƒ√‹¬Î",
						isNull: false
					}],[{
						value: "µ«¬º",
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
											  alert(("µ«¬º≥…π¶"));
									  		window.location.href =Ajax.getUrl("app/app-main.jsp",data);
									  }
								  	},false
								  );
							}
					}]]
				};
				var form = Form.create(cfgForm);
			});
		});
		</script>
	</head>
	<body style="overflow:hidden;">
	</body>
</html>