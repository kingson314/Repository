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
		<%@ include file="../../../sea/Session.jsp"%>
		<script>
			$(document).ready(function() {
				$("#btnQuery").click(function(){
				});
				$("#btnAdd").click(function(){
					var newRow=3;
					for(var i=0;i<newRow;i++){
						$("table tbody").append("<tr>"
				          +"<td width='30%'><input type='text' class='form-control' name='sqh' placeholder='�����������'></td>"
				          +"<td width='20%'></td>"
				          +"<td width='20%'></td>"
				          +"<td width='20%'></td>"
				          +"</tr>");
					}
					var h = document.documentElement.scrollHeight || document.body.scrollHeight;
					window.scrollTo(h,h);
				});
			});
		</script>
		<style>
			th{
				text-align:center;
				background-color:#5cb85c;
			}
		</style>
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="row">
					<div class="col-md-3"></div>
					<div class="col-md-2 text-center">
						<input id="btnAdd" type='button' class="form-control btn btn-default btn-success"value='����'/>
					</div>
					<div class="col-md-2 text-center">
						<input id="btnEdit" type='button' class="form-control btn btn-default btn-info"value='�޸�'/>
					</div>
					<div class="col-md-2 text-center">
						<input id="btnDel" type='button' class="form-control btn btn-default btn-danger"value='ɾ��'/>
					</div>
				</div>
				<div class="col-md-12">
				<table id="queryTable" class="table table-bordered">
			      <thead>
			        <tr>
		        	  <th>����</th>
			          <th>�����</th>
			          <th>ר������</th>
			          <th>����״̬</th>
			          <th>˵��</th>
			        </tr>
			      </thead>
			      <tbody>
			        <tr>
			          <td width='15%'></td>
			          <td width='15%'></td>
			          <td width='25%'></td>
			          <td width='15%'></td>
			          <td width='30%'></td>
			        </tr>
 			      </tbody>
			    </table>
				</div>
			</div>
			
			<div class="row">
				<div class="col-md-12" id="monitorTip">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" id="monitorRs">
				</div>
			</div>
		</div>
	</body>
</html>