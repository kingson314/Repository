<%@page language="java" contentType="text/html; charset=GBK" %>
<!DOCTYPE html>
<html>
<head>
	<title>Repository</title>
	<%@ include file="../../../sea/Session.jsp" %>
	<script>
		var linkPath=Session.basePath + "com/system/SysUser/css/login.css";
		var path = Session.basePath + "com/system/SysUser/SysUser.js";
		path = Session.basePath + "com/system/SysUser/Login.js";
		seajs.use("Window",function(Window){
			setTimeout(function() {
				$("body").empty();
				Window.loadJs(path);
				var link=Window.loadCss(linkPath);
			},1);
		});
		
	</script>
</head>
<body>
</body>
</html>