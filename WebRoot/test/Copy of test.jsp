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
<script src="<%=basePath%>sea/core/jquery/jquery.js"></script>
  <script type="text/javascript">  
    i = 1;  
    j = 1;  
    $(document).ready(function(){  
        
      $("#btn_add1").click(function(){  
        document.getElementById("newUpload1").innerHTML+='<div id="div_'+i+'"><input  name="file" type="file"  /><input type="button" value="ɾ��"  onclick="del_1('+i+')"/></div>';  
          i = i + 1;  
      });  
        
      $("#btn_add2").click(function(){  
        document.getElementById("newUpload2").innerHTML+='<div id="div_'+j+'"><input  name="file_'+j+'" type="file"  /><input type="button" value="ɾ��"  onclick="del_2('+j+')"/></div>';  
          j = j + 1;  
      });  
    });  
    
    function del_1(o){  
     document.getElementById("newUpload1").removeChild(document.getElementById("div_"+o));  
    }  
      
    function del_2(o){  
       document.getElementById("newUpload2").removeChild(document.getElementById("div_"+o));  
    }  
  </script>  
  </head>  
  <body>  
     <h1>springMVC�ֽ��������ϴ��ļ�</h1>   
    <form name="userForm1" action="<%=basePath %>demo/upload" enctype="multipart/form-data"  method="post">  
      <div id="newUpload1">  
        <input type="file" name="file">  
      </div>  
        
      <input type="button" id="btn_add1" value="����һ��" >  
      <input type="submit" value="�ϴ�" >  
    </form>   
    <br>  
    <br>  
    <hr align="left" width="60%" color="#FF0000" size="3">  
    <br>  
    <br>  
     <h1>springMVC��װ���ϴ��ļ�</h1>   
    <form name="userForm2" action="<%=basePath %>demo/upload1" enctype="multipart/form-data" method="post"">  
      <div id="newUpload2">  
        <input type="file" name="file">  
      </div>  
      <input type="button" id="btn_add2" value="����һ��" >  
      <input type="submit" value="�ϴ�" >  
    </form>   
  </body>  
  </html>