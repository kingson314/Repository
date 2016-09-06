<%@page language="java" contentType="text/html; charset=GBK" %>
<!DOCTYPE html>
<html>
<head>
	<title>Repository</title>
	<%@ include file="../../../sea/Session.jsp" %>
	<script>
		var path = Session.basePath + "com/system/sysuser/SysUser.js";
		setTimeout(function() {
			$("body").empty();
			Session.loadJs(path);
		},1);
	</script>
</head>
<body>
</body>
</html>