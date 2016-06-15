<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>button</title>
		<%@ include file="../../../../Session.jsp"%>
	<style>
	</style>
	<script>
		$(document).ready(function(){
			Session.setBusiType("");
				seajs.use(["Table"],
					function(Table){
					var cfgTable = {
							id: "test",
							url: "user/list",
							cardview: true,
							columns: [{
								field: 'id',
								title: 'ID',
								align: 'center',
								valign: 'middle',
								sortable: true
							},
							{
								field: 'name',
								title: 'Ãû³Æ',
								align: 'center',
								valign: 'middle',
								sortable: true
							},
							{
								field: 'state',
								title: '×´Ì¬',
								align: 'right',
								valign: 'middle'
							}]
						}
						var table=Table.create(cfgTable);
						$("body").append(table.table).css({"text-align":"center","margin-top":"30px"});
				});
		});
	</script>
	</head>
	<body style='width:100%;height:100%;'>
	</body>
</html>