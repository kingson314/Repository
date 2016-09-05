<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Repository</title>
	<%@ include file="../../../sea/Session.jsp"%>
	<script>
		$("body").empty();
		var path=Session.basePath+"com/system/sysuser/SysUser.js"
		Session.loadJs(path);
		debugger;
		setTimeout(function(){
			$("body").empty();
			path=Session.basePath+"com/system/sysuser/SysUser1.js"
			Session.loadJs(path);
		},100);
</script>
</body>
</html>