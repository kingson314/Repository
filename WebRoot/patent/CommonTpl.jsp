<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv='cache-control' content='no-cache' />
		<meta http-equiv='expires' content='0' />
		<meta name="viewport"
			content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title><%-- dyn Title --%></title>
		<%@ include file="../../../sea/Session.jsp"%>
		<style>
			th{
				text-align:center;
				background-color:#5cb85c;
				color:#fff;
			}
			.title{
				text-align:center;
				font-weight:bold;
				font-size:24px;
			}
			#queryTable tr:nth-child(even) td {
				background-color:#d9edf7;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="title col-md-12">
					<%-- dyn Title --%>
				</div>
			</div>	
			<div class="row">
				<div class="col-md-12">
				<table id="queryTable" class="table table-bordered">
			      <thead>
			        <tr>
		        	  <th>领域</th>
			          <th>申请号</th>
			          <th>专利名称</th>
			          <th>专利类型</th>
			          <th>法律状态</th>
			          <th><%-- dyn pdateTitle --%></th>
			        </tr>
			      </thead>
			      <tbody>
			        <%-- dyn html --%>
 			      </tbody>
			    </table>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-2"></div>
				<div class="col-md-4 footer_contactUs">
                    <h4>联系方式</h4>
                    <p>
                       	地址：广东省珠海市横琴金融产业服务基地18号楼B区
                        <br> 邮政编码：519031
                        <br/> 电话:400-806-3777
                        <br/> 传真：0756-8843326
                        <br/> 七弦琴官方微信号：qixianqinipr
                    </p>
                </div>
                <div class="col-xs-6 col-md-3">
			      <img  style="height:138px;width:140px;"src="<%=basePath%>patent/images/code.jpg"" alt="...">
		  		</div>
            </div>
		</div>
	</body>
</html>