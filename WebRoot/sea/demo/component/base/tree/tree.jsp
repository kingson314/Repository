<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>SEA-DEMO</title>
		<%@ include file="../../../../Session.jsp"%>
		<style>
</style>
		<script>
	var Tree;var iframe;
	
	
	$(document).ready(function() {
		Session.setBusiType("");
		seajs.use(["BorderLayout","Iframe","Tree"],
		function(Border,Iframe,Tree) {
			var cfgTree = {
					id:"tree",
					async : {
						url : "<%=basePath%>/demo/getTree"
					} ,
					callback : {
						onClick: function(treeId, treeNode) {
							var selectNode = Tree.getTree().getSelectedNodes()[0];
							if (selectNode.isParent) {
								Tree.getTree().expandNode(selectNode);
							}else{
								iframe.attr("src","<%=basePath%>/demo/"+selectNode.src)
							}
							return false;
						}
					}
				};
			Tree = Tree.create(cfgTree);
			var cfgIframe={
						id:"demoIframe"
					};
			iframe=Iframe.create(cfgIframe).iframe
			var cfgBorder = {
				parent: "body",
				id: "",
				name: "",
				width: "100%",
				height: "100%",
				north:{
					height:80,
					css:{"border":"1px solid #eee"},
					item:$("<div style='text-align:center;'><h2>Sea×é¼þ²âÊÔ°¸Àý</h2></div>")
				},
				 west : {
					 width :250,
					 css:{"border":"1px solid #eee","overflow":"auto"},
					 item:Tree.tree
				},
				center: {
					css:{},
					item:iframe
				}
			};
			Tree.getTree();
			var border = Border.create(cfgBorder);
		});
	});
</script>
	</head>
	<body>
	</body>
</html>