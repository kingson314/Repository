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
			$(function(){
				var patent;
				$("#query").click(function(){
					$.ajax({
						type : 'POST',
						url : Session.basePath+"wipo/get",
						data : {
							"sqh":$.trim($("#sqh").val())
						},
						async : false,
						dataType : "json",
						success : function(rs) {
							patent=rs;
							$("#result").append('<div class="row"><div class="col-md-2 text-right">申请号</div><div class="col-md-2">'
									+(rs.applicationNumber||"")+'</div><div class="col-md-2 text-right">申请日期</div><div class="col-md-2">'
									+(rs.applicationDate||"")+'</div></div>')
									.append('<div class="row"><div class="col-md-2 text-right">公布号</div><div class="col-md-2">'
									+(rs.publicationNumber||"")+'</div><div class="col-md-2 text-right">公布日期</div><div class="col-md-2">'
									+(rs.publicationDate||"")+'</div></div>')
									.append('<div class="row"><div class="col-md-2 text-right">授权号</div><div class="col-md-2">'
									+(rs.grantNumber||"")+'</div><div class="col-md-2 text-right">授权日期</div><div class="col-md-2">'
									+(rs.grantDate||"")+'</div></div>')
									.append('<div class="row"><div class="col-md-2 text-right">公布种类</div><div class="col-md-6">'
											+(rs.publicationKind||"")+'</div></div>')
									.append('<div class="row"><div class="col-md-2 text-right">IPC</div><div class="col-md-6">'
											+(rs.ipc||"")+'</div></div>')														
									.append('<div class="row"><div class="col-md-2 text-right">PCT参考号</div><div class="col-md-6">'
											+(rs.pctreference||"")+'</div></div>')	
									.append('<div class="row"><div class="col-md-2 text-right">申请人</div><div class="col-md-6">'
											+(rs.applicants||"")+'</div></div>')	
									.append('<div class="row"><div class="col-md-2 text-right">发明人</div><div class="col-md-6">'
											+(rs.inventors||"")+'</div></div>')	
									.append('<div class="row"><div class="col-md-2 text-right">标题</div><div class="col-md-6">'
											+(rs.title||"")+'</div></div>')	
									.append('<div class="row"><div class="col-md-2 text-right">摘要</div><div class="col-md-6">'
											+(rs.memo||"")+'</div></div>');
						}
					});
				});
				$(".nav-tabs li").click(function(){
					$(this).addClass("active").css({"font-weight":"bold"});
					$(this).siblings().removeClass("active").css({"font-weight":"normal"});
					switch ($(".nav-tabs li").index(this)){
					case 0:
						$("#resultFrame").hide();
						$("#result").show();	

						$("#resultFrame").show().find("iframe").attr("src",patent.srcNationalBiblioData).css({height:"550px"});
						$("#result").hide();
						break;
					case 1:
						$("#resultFrame").show().find("iframe").attr("src",patent.srcDescription).css({height:"550px"});
						$("#result").hide();
						break;
					case 2:
						$("#resultFrame").show().find("iframe").attr("src",patent.srcClaims).css({height:"550px"});
						$("#result").hide();
						break;
					case 3:
						$("#resultFrame").show().find("iframe").attr("src",patent.srcDrawings).css({height:"550px"});
						$("#result").hide();
						break;
					case 4:
						$("#resultFrame").show().find("iframe").attr("src",patent.srcDocuments).css({height:"550px"});
						$("#result").hide();	
						break;		
					default:
						break;
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
						WIPO专利信息检索
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
								<input type="text" class="form-control" id="sqh" value='05465390'placeholder="请输入申请号">
							</div>
							<div class="col-sm-2 text-center">
								<input id="query" type='button' class="form-control btn btn-default btn-primary"value='查&nbsp;询'/>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="row">
				<div class="col-md-10">
					<ul class="nav nav-tabs">
					  <li role="presentation" class="active"><a href="#">国家著录事项</a></li>
					  <li role="presentation"><a href="#">说明书</a></li>
					  <li role="presentation"><a href="#">权利要求书</a></li>
					  <li role="presentation"><a href="#">Drawings</a></li>
					  <li role="presentation"><a href="#">文件</a></li>
					</ul>
				</div>
			</div>
			<div class="row" id="result" >
			 
			</div>
			<div class="row" id="resultFrame" >
				<div class="col-md-10">
					<iframe frameborder=0 style="height:100%;width:99%;padding:0;">
					</iframe> 
				</div>
			</div>
		</div>
	</body>
</html>