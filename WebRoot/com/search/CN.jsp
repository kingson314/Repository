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
			var Interval=3;//间隔三秒爬一次
			var totalPost=0;//总爬虫次数
			var curPostIndex=0;//当前爬的行数
			var timer;//定时器
			//爬状态
			function getStatus(){
				var input=$("#queryTable tbody tr:eq("+curPostIndex+")").find("input[name=sqh]");
					$.ajax({
						type : 'POST',
						url : Session.basePath+"casestatus/get",
						data : {
							"sqh":$.trim(input.val())
						},
						async : false,
						dataType : "json",
						success : function(result) {
							var tdSqh=input.parent();
							var tdStatus=tdSqh.next();
							var tdTime=tdStatus.next();
							var tdTimes=tdTime.next();
							
							var success=result.data["success"];
							var cls=success=="true"?"result_success":"result_warning";
							tdStatus.html(result.data["status"]).removeClass("sea_msg").addClass(cls);
							tdTime.html(result.data["time"]+"ms").removeClass("sea_msg").addClass(cls);
							tdTimes.html(result.data["times"]).removeClass("sea_msg").addClass(cls);
						}
					});
				curPostIndex++;
				totalPost--;
				if(totalPost==0){
					window.clearInterval(timer)
					setBtn(false);
				}
			}
			//设置按钮状态
			function setBtn(status){
				$("#btnAdd").attr("disabled",status);
				$("#btnQuery").attr("disabled",status);
			}
			
			$(document).ready(function() {
				$("#btnQuery").click(function(){
					//初始化数据
					curPostIndex=0;
					//初始化状态
					setBtn(true);
					$.each($("input[name=sqh]"),function(index,item){
						var  sqh=$.trim($(item).val());
						if(sqh==""){
							$(item).parent().parent().remove();
							return;
						}
						var tdSqh=$(item).parent();
						var tdStatus=tdSqh.next().html("").addClass("sea_msg").removeClass("result_success").removeClass("result_warning");
						var tdTime=tdStatus.next().html("").addClass("sea_msg").removeClass("result_success").removeClass("result_warning");
						var tdTimes=tdTime.next().html("").addClass("sea_msg").removeClass("result_success").removeClass("result_warning");
						totalPost++;
					});
					Interval=Math.abs(Number($("#interval").val()));
					timer=setInterval("getStatus()",Interval*1000)
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
			});
		</script>
	</head>
	<body>
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
				<h4 class="col-md-12 text-center text-danger">
					注：每间隔<input type='number' style="width:35px;padding:0 0 0 5px;" min=0  max=9 id='interval'value="3">秒发起一次数据请求
				</h4>
			</div>
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
			          <td width='30%'><input type='text' class='form-control' name='sqh' placeholder='请输入申请号' value="200620015152X"></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			        </tr>
			        <tr>
			          <td width='30%'><input type='text' class='form-control' name='sqh' placeholder='请输入申请号' value="2010205363738"></td>
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