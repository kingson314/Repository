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
			var timerMonitor;
			var curMonitorListIndex=0;//当前模拟申请号索引
			var MonitorList=["2014200514388", "2014100382913","2012101206549","2015110170056", "2012102022627",
			     			"2012200050473",
							"2010205363738", "200620015152X", "2006200589680",
							"2015100189183","2012103105010","2013103512882",
							"2007101984775","2014104581583","2015104904936",
							"2014108551587","2016101900622","2011102110801",
							"2016100690928","2012105515289","201410793660X",
							"201410418431X","2013102925568","2013102026707",
							"2010106207021","2013102026707","2013800139959",
							"2015101181795","2012105781499","2014101433768",
							"201510723369X","2015107233346","2013102925568",
							"201010285895X","2013101899180","2007800321994",
							"2013102819592","2015101084418","2012103965981",
							"2012105710794","2012104624429","2008102052039",
							"2013105663641","2014800344089","2012105721479",
							"2014100028952","2013102925568","2009100117813",
							"2008102369180","2009100714091","2012105137092",
							"2010800538828","201010558097X","2010800538828",
							"200710134958X","2013103345911","2011103194113",
							"2005800414913","2008100179478","2015108909695"]
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

				$("#btnMonitor").click(function(){
					if($("#queryTable tbody tr").length<10){
						var newRow=7;
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
					}
					var total=0;
					if($("#btnMonitor").val()=="开始模拟"){
						$("#btnMonitor").val("暂停模拟");
						timerMonitor=setInterval(function(){
							if(!$("#btnQuery").attr("disabled")||$("#btnQuery").attr("disabled")==false){
								var inputs=$("#queryTable input[name=sqh]");
								for(var i=0;i<inputs.length;i++){
									$(inputs[i]).val(MonitorList[curMonitorListIndex]);
									curMonitorListIndex++;
									if(curMonitorListIndex>=MonitorList.length){
										curMonitorListIndex=0;
									}
								}
								total+=10;
								$("#monitorTip").html("开始新一轮模拟:"+curMonitorListIndex+" 总次数："+total);
								$("#btnQuery").click();
							}
						},3000)
					}else{
						$("#btnMonitor").val("开始模拟");
						window.clearInterval(timerMonitor);	
					}
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
					注：每间隔<input type='number' style="width:35px;padding:0 0 0 5px;" min=0  max=9 id='interval'value="1">秒发起一次数据请求
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
			          <td width='30%'><input type='text' class='form-control' name='sqh' placeholder='请输入申请号' value="2014100028952"></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			        </tr>
			        <tr>
			          <td width='30%'><input type='text' class='form-control' name='sqh' placeholder='请输入申请号' value=""></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			        </tr>
			        <tr>
			          <td width='30%'><input type='text' class='form-control' name='sqh' placeholder='请输入申请号' value=""></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			          <td width='20%'></td>
			        </tr>
 			      </tbody>
			    </table>
				</div>
			</div>
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-2 text-center">
					<input id="btnQuery" type='button' class="form-control btn btn-default btn-primary"value='查&nbsp;询'/>
				</div>
				<div class="col-md-2 text-center">
					<input id="btnAdd" type='button' class="form-control btn btn-default btn-success"value='新增3行'/>
				</div>
				<div class="col-md-2 text-center">
					<input id="btnMonitor" type='button' class="form-control btn btn-default btn-danger"value='开始模拟'/>
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