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
	 $(document).ready(function() {
		seajs.use(["Choice"], function(Choice) {
			var cfg = {
					columnLeft: [{
						align: "left",
						name: "id",
						label: "用户ID",
						width:"0px",
						display:"none"
					},{
					align: "left",
					name: "name",
					label: "用户名",
					width:"100px"
				}, {
					align: "left",
					name: "alias",
					label: "用户别名",
					width:"100px"
				}],
				dataLeft: [{
					id: "1",
					name: "aa",
					alias: "AA"
				}, {
					id: "2",
					name: "bb",
					alias: "BB"
				}, {
					id: "3",
					name: "bb",
					alias: "BB"
				}, {
					id: "4",
					name: "bb",
					alias: "BB"
				}],
				columnRight: [{
					align: "left",
					name: "id",
					label: "用户ID",
					width:"0px",
					display:"none"
				},{
					align: "left",
					name: "name",
					label: "用户名",
					width:"100px"
				}, {
					align: "left",
					name: "alias",
					label: "用户别名",
					width:"100px"
				}],
				dataRight: [{
					id: "4",
					name: "aa",
					alias: "AA"
				}, {
					id: "5",
					name: "bb",
					alias: "BB"
				}],
			toRight:function(vals){
				alert(vals.join(","));
				
			},
			toAllRight:function(vals){
				alert(vals.join(","));
			},
			toLeft:function(vals){
				alert(vals.join(","));
			},
			toAllLeft:function(vals){
				alert(vals.join(","));
			}
			};
			choice = Choice.create(cfg);
			$("body").append(choice.choice);
		});
	}); 
	</script>
	</head>
	<body>
	</body>
</html>