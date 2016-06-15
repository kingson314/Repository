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
						zNodes=[  {id:1, pId:0, name:"[core] �������� ��ʾ", open:true},
						              {id:101, pId:1, name:"��򵥵��� --  ��׼ JSON ����", file:"core/standardData"},
						              {id:102, pId:1, name:"��򵥵��� --  �� JSON ����", file:"core/simpleData"}];
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