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
		<script src="<%=basePath%>sea/core/bootstrap/bootstrap.min.js"></script>
		<link rel="stylesheet"
			href="<%=basePath%>sea/core/bootstrap/css/bootstrap.css" />
		<link rel="stylesheet"
			href="<%=basePath%>sea/core/css/main.css" />
		<!--[if lt IE 9]>
	        <script src="<%=basePath%>sea/core/bootstrap/html5shiv.js"></script>
        <![endif]-->
<script>
$(document).ready(function() {
	$("#btnQuery").click(function(){
		setBtn(true);
		
		var sqh=[];
		$.each($("input[name=sqh]"),function(index,item){
			if($.trim($(item).val())==""){
				$(item).parent().parent().remove();
			}else{
				sqh.push($.trim($(item).val()));
			}
		});
		$.ajax({
			type : 'POST',
			url : Session.basePath+"casestatus/get",
			data : {
				"sqh":sqh.join(",")
			},
			async : false,
			dataType : "json",
			success : function(result) {
				var trs=$("#queryTable tbody tr");
				$.each(result.data,function(index,item){
					var success=item["success"];
					var cls=success=="true"?"result_success":"result_warning";
					$(trs[index]).find("td:eq(1)").html(item["status"]).removeClass("result_success").removeClass("result_warning").addClass(cls);
					$(trs[index]).find("td:eq(2)").html(item["time"]+"ms").removeClass("result_success").removeClass("result_warning").addClass(cls);
					$(trs[index]).find("td:eq(3)").html(item["times"]).removeClass("result_success").removeClass("result_warning").addClass(cls);
				});
			}
		});
		setBtn(false);
	});
	$("#btnAdd").click(function(){
		var newRow=3;
		for(var i=0;i<newRow;i++){
			$("table tbody").append("<tr>"
	          +"<td width='30%'><input type='text' class='form-control' name='sqh' placeholder='请输入申请号'></td>"
	          +"<td width='20%'></td>"
	          +"<td width='20%'></td>"
	          +"<td width='20%'></td>"
	          +"</tr>");
		}
		var h = document.documentElement.scrollHeight || document.body.scrollHeight;
		  window.scrollTo(h,h);
		
	});

	function setBtn(status){
		$("#btnAdd").attr("disabled",status);
		$("#btnQuery").attr("disabled",status);
	}
});
</script>
	</head>
	<body>
		<%@ include file="app-header.jsp"%>
		<%@ include file="app-nav.jsp"%>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="text-center">
						专利案件状态查询
					</h1>
				</div>
			</div>
			<hr>
			<div class="row">
				<div class="col-md-12">
				<table id="queryTable" class="table table-bordered">
			      <thead>
			        <tr>
			          <th>申请号</th>
			          <th>案件状态</th>
			          <th>查询时间</th>
			          <th>查询次数</th>
			        </tr>
			      </thead>
			      <tbody>
			        <tr>
			          <td width='30%'><input type='text' class='form-control' name='sqh' placeholder='请输入申请号' value="2014200514388"></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			        </tr>
			        <tr>
			          <td width='30%'><input type='text' class='form-control' name='sqh' placeholder='请输入申请号'></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			        </tr>
			        <tr>
			          <td width='30%'><input type='text' class='form-control' name='sqh' placeholder='请输入申请号'></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			        </tr>
 			      </tbody>
			    </table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4"></div>
				<div class="col-md-2 text-center">
					<input id="btnQuery" type='button' class="form-control btn btn-default btn-primary"value='查&nbsp;询'/>
				</div>
				<div class="col-md-2 text-center">
					<input id="btnAdd" type='button' class="form-control btn btn-default btn-success"value='新增3行'/>
				</div>
			</div>
		</div>
	</body>
</html>