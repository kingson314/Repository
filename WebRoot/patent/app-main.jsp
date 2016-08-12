<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv='cache-control' content='no-cache' />
		<meta http-equiv='expires' content='0' />
		<meta name="viewport"
			content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>Repository</title>
		<%@ include file="../sea/Session.jsp"%>
		<script>
		function navClick(obj){
			$(obj).parent().siblings().removeClass("active");
			$(obj).parent().addClass("active");
			var pageName=$(obj).attr("title");
			var recType=$(obj).attr("recType");
			$("#mainframe").attr("src","<%=basePath%>patent/"+pageName+".jsp?recType="+recType);
		}
		
		$(function(){
			var hW=$(window).height();
			var hHeaderTool=$(".header-tool").height();
			var hHeader=$(".header").height();
			var hNav=$(".navbar-inverse").height();
			$("#mainframe").height(hW-hHeaderTool-hHeader-hNav-30);
			$("#mainframe").attr("src","<%=basePath%>patent/Common.jsp?recType=0");
		});
		</script>
		<style type="text/css">
			.navbar{
				margin-bottom:0px;
			}
		</style>
	</head>
	<body>
		<%@ include file="app-header.jsp"%>
		<%@ include file="app-nav.jsp"%>
		<iframe id="mainframe" frameborder=0 style="height:100%;width:100%;padding:0;margin:0;">
		
		</iframe>
	</body>
</html>