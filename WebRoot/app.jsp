<%@page language="java" contentType="text/html; charset=GBK" %>
<!DOCTYPE html>
<html>
<head>
	<title>Repository</title>
	<%@ include file="../../../sea/Session.jsp" %>
	<script>
		//http://localhost:90/Repository/app.jsp?link=com/system/SysUser/css/login&script=com/system/SysUser/Login
		seajs.use("Window",function(Window){
			var link="<%=request.getParameter("link")%>";
			var script="<%=request.getParameter("script")%>";
			if(link!="null")Window.loadCss("<%=basePath%>"+link+".css"); 
			if(script!="null")Window.loadJs("<%=basePath%>" +script+".js"); 
		});
		<%--
		var linkPath=Global.basePath + "com/system/SysUser/css/login";
		var script1;
		seajs.use("Window",function(Window){
			setTimeout(function() {
				$("body").empty();
				var path = Global.basePath + "com/system/SysUser/SysUser.js";
				script1= Window.loadJs(path);
				//var link=Window.loadCss(linkPath);
			},1);
			setTimeout(function() {
				Window.remove(script1);
				$("body").empty();
				var path = Global.basePath + "com/system/SysUser/Login.js";
				Window.loadJs(path); 
			},100);
		});
		--%>
	</script>
</head>
<body>
</body>
</html>