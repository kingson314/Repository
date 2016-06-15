<%@ page language="java" import="java.util.*" contentType="text/html; charset=gb2312"%>
	<!DOCTYPE html>
	<html>
		<head>
			<script type="text/javascript">
				var pageconfigZtree;
				var setting = {
					//check: {
					//	enable: false
					//},
					//view: {
					//	dblClickExpand: false,
					//	showLine: true,
					//	selectedMulti: false
					//},
					edit: {
						enable: false,
						showRemoveBtn: false,
						showRenameBtn: false,
						drag: {
							isCopy: true,
							isMove: true,
							prev: true,
							next: true,
							inner: true
						}
					},
					data: {
						simpleData: {
							enable: true
						}
					},
					callback: {
						onClick: function(){},
						onDrop: function(){},
						onRightClick: function(){}
					}
				};

				$(document).ready(function() {
					$.post(getUrl("pageconfig/tree"), {
					}, function(data) {
						var zNodes=$.parseJSON(data);
						zNodes=[  {id:1, pId:0, name:"[core] 基本功能 演示", open:true},
						              {id:101, pId:1, name:"最简单的树 --  标准 JSON 数据", file:"core/standardData"},
						              {id:102, pId:1, name:"最简单的树 --  简单 JSON 数据", file:"core/simpleData"}];
						$.fn.zTree.init($("#tree"), setting,zNodes);
						pageconfigZtree = $.fn.zTree.getZTreeObj("tree");
					});
				});
			</script>
		</head>
		<body>
			<ul id="tree" class="ztree" style="width: 560px; overflow: auto;">
			</ul>
		</body>
	
	</html>