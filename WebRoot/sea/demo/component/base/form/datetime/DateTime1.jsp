<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>button</title>
		<script src="../../../../../../sea/core/jquery/jquery.js"></script>
		<script src="../../../../../../sea/component/base/form/datetime/jedate/jedate.js"></script>
		<link href="../../../../../../sea/component/base/form/datetime/jedate/skin/jedate.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript">
			$(function() {
				$("body").append($('<input id="indate" type="text" />').attr("placeholder","请选择").attr("readonly","readonly"));
				var cfg1={
						dateCell:"#indate",  
						format:"YYYY年MM月DD日",
						isinitVal:false,
						isTime:true, 
						festival: true
					};
				jeDate(cfg1);
			});
		</script>
	</head>
	<body>
	</body>
</html>
