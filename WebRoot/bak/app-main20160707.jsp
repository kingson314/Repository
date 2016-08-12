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

		<!--[if lt IE 9]>
	        <script src="<%=basePath%>sea/core/bootstrap/html5shiv.js"></script>
        <![endif]-->
		<style type="text/css">
.header-tool,.header-tool .nav a {
	height: 30px;
	line-height: 30px;
	min-height: 30px;
	padding: 0 5px;
	margin: 0 3px;
}

.header-tool .nav .navbar-text {
	height: 30px;
	line-height: 30px;
	min-height: 30px;
	padding: 0;
	margin: 0;
}
.header-tool .navbar-brand {
	width: 15%;
}
.header {
	margin-top: 30px;
}
.header .logo {
	height: 50px;
	widht: 50px;
	line-height: 50px;
	margin-right: 5px;
}

.header .telphone {
	color: red;
	font-weight: bold;
	height: 30px;
	line-height: 90px;
}
#sea_search input {
	height: 25px;
	vertical-align: middle;
	line-height: 25px;
	min-height: 25px;
	margin: 5px 20px;
	padding: 5px;
}

#carousel-example-generic img {
	height: 250px;
	width: 100%;
	text-align: center;
	margin: 0 auto;
}
.row {
	padding: 5px 0;
}
.sea-footer {
	border-top: 3px solid #00c2e3;
	text-align: center;
	margin: 0 auto;
}

.sea_input_warning {
	border: 1px solid #FF0033 !important;
}
#result_div{
	display:none;
}
#result{
	color:bold;
	font-size:20px;
	text-align:left;
}
.result_warning{
	color:red;
}
.result_success{
	color:Green;
}
hr{
  margin-top: 10px;
  margin-bottom: 40px;
  border-top: 1px solid #E2E2E2;
  }
</style>
<script>
$(document).ready(function() {
	$("#query").click(function(){
		$("#result_div").hide();
		if($("#sqh").hasClass("sea_input_warning")){
			$("#sqh").removeClass("sea_input_warning");
		}
		if($.trim($("#sqh").val())==""){
			$("#sqh").addClass("sea_input_warning");
			return;
		}
		$.ajax({
			type : 'POST',
			url : Session.basePath+"casestatus/get",
			data : {
				sqh:$("#sqh").val()
			},
			async : false,
			dataType : "json",
			success : function(result) {
				$("#result_div").show();
				$("#result").html(result.msg);
				if(result.success==true){
					$("#result").addClass("result_success").removeClass("result_warning");
				}else{
					$("#result").addClass("result_warning").removeClass("result_success");
				}
			}
		});
	});
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
				<div class="col-md-2"></div>
				<div class="col-md-8">
					<form class="form-horizontal">
						<div class="form-group">
							<label for="sqh" class="col-sm-2 control-label">
								专利申请号:
							</label>
							<div class="col-sm-6">
								<input type="text" class="form-control" id="sqh" placeholder="请输入申请号">
							</div>
							<div class="col-sm-2 text-center">
								<input id="query" type='button' class="form-control btn btn-default btn-primary"value='查&nbsp;询'/>
							</div>
						</div>
						<div id="result_div" class="form-group">
							<label for="sqh" class="col-sm-2 control-label">
								案件状态:
							</label>
							<div id="result" class="col-sm-6">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</body>
</html>