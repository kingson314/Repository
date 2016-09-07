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
				var pageName=$(obj).html();
				if(pageName.indexOf("(")>0){
					pageName=pageName.substring(pageName.indexOf("(")+1,pageName.indexOf(")"));
				}
				$("#mainframe").attr("src","<%=basePath%>com/search/"+pageName+".jsp");
			}
			function navSubClick(obj){
				$(obj).parent().parent().parent().siblings().removeClass("active");
				$(obj).parent().parent().parent().addClass("active");
			}
			$(function(){
				var hW=$(window).height();
				var hHeaderTool=$(".header-tool").height();
				var hHeader=$(".header").height();
				var hNav=$(".navbar-inverse").height();
				$("#mainframe").height(hW-hHeaderTool-hHeader-hNav-30);
				$("#mainframe").attr("src","<%=basePath%>com/search/Monitor.jsp");
			});
		</script>
	</head>
	<body>
		<%@ include file="app-header.jsp"%>
		<%@ include file="app-nav.jsp"%>
		<iframe id="mainframe" frameborder=0 style="height:100%;width:100%;padding:0;">
		
		</iframe>
	</body>
</html>