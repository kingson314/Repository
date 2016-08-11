<%@page language="java" contentType="text/html; charset=GBK"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<%
	String basePath=request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort()+ request.getContextPath() + "/";
	String langue  = request.getParameter("langue");
	String theme   = request.getParameter("theme");
	String userId  = request.getParameter("userId");
	String userName= request.getParameter("userName");
%>
<title>Insert title here</title>
</head>
<body>  
    <form action="<%=basePath %>demo/upload" method="post" enctype="multipart/form-data">  
    选择要上传的图片：<input type="file" name="fileUp" />  
    <input type="submit" value="上传" />  
</form>  
</body>  
</html>  