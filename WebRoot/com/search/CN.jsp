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
			var Interval=3;//���������һ��
			var totalPost=0;//���������
			var curPostIndex=0;//��ǰ��������
			var timer;//��ʱ��
			//��״̬
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
			//���ð�ť״̬
			function setBtn(status){
				$("#btnAdd").attr("disabled",status);
				$("#btnQuery").attr("disabled",status);
			}
			
			$(document).ready(function() {
				$("#btnQuery").click(function(){
					//��ʼ������
					curPostIndex=0;
					//��ʼ��״̬
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
	</head>
	<body>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1 class="text-center">
						ר������״̬��ѯ
					</h1>
				</div>
			</div>
			<hr>
			<div class="row">
				<h4 class="col-md-12 text-center text-danger">
					ע��ÿ���<input type='number' style="width:35px;padding:0 0 0 5px;" min=0  max=9 id='interval'value="3">�뷢��һ����������
				</h4>
			</div>
			<div class="row">
				<div class="col-md-12">
				<table id="queryTable" class="table table-bordered">
			      <thead>
			        <tr>
			          <th>�����</th>
			          <th>����״̬</th>
			          <th>��ѯʱ��</th>
			          <th>��ѯ����</th>
			        </tr>
			      </thead>
			      <tbody>
			        <tr>
			          <td width='30%'><input type='text' class='form-control' name='sqh' placeholder='�����������' value="2014200514388"></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			        </tr>
			        <tr>
			          <td width='30%'><input type='text' class='form-control' name='sqh' placeholder='�����������' value="200620015152X"></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			        </tr>
			        <tr>
			          <td width='30%'><input type='text' class='form-control' name='sqh' placeholder='�����������' value="2010205363738"></td>
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
					<input id="btnQuery" type='button' class="form-control btn btn-default btn-primary"value='��&nbsp;ѯ'/>
				</div>
				<div class="col-md-2 text-center">
					<input id="btnAdd" type='button' class="form-control btn btn-default btn-success"value='����3��'/>
				</div>
			</div>
		</div>
	</body>
</html>