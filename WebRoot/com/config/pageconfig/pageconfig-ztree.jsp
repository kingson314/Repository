<%@ page language="java" import="java.util.*" contentType="text/html; charset=gb2312"
%>
	<!DOCTYPE html>
	<html>
		<head>
			<script type="text/javascript">
			var zTree;
			var utilZtree = {
				startParentId:'34001315D7D7466C9D792822526C187E',
				onRightClick: function(event, treeId, treeNode) {
					if (treeNode == null || isNil(treeNode.type) == '') return;
					if (!treeNode && event.target.tagName.toLowerCase() != 'button' && $(event.target).parents('a').length == 0) {
						zTree.cancelSelectedNode();
					} else if (treeNode && !treeNode.noR) {
						zTree.selectNode(treeNode);
					}
					$('#rMenu').show();
					$('#rMenu').css({
						//'top': event.pageY -$("#tree").parent().position().top-$("#tree").height()+ 'px',
						//'left':event.pageX -$("#tree").parent().position().left	+ 'px'
						'top': event.pageY - 325,
						'left': event.pageX - 220
					});
					$('body').bind('mousedown', this.onBodyMouseDown);
				},
				hideRMenu: function() {
					$('#rMenu').hide();
					$('body').unbind('mousedown', this.onBodyMouseDown);
				},
				onBodyMouseDown: function(event) {
					if ($(event.target).parent().attr("id") != 'rMenu') {
						$('#rMenu').hide();
					}
				},
				operateTreeNode:function(obj,operate) {
					this.hideRMenu();
					var selectNode = zTree.getSelectedNodes()[0];
					if (operate == 'add') {
						$('#operateModall').modal('show');
						setValues($(".modal-body"), selectNode);
						$('#operateModall #id').val('');
						$('#operateModall #parentId').val(selectNode.id);
					} else if (operate == 'edit') {
						$('#operateModall').modal('show');
						setValues($(".modal-body"), selectNode);
					} else if (operate == 'delete') {
						ajax("pageconfig/delete",{"id": selectNode.id},function(result){
							zTree.removeNode(selectNode);
						});
					} else if (operate == 'save') {
						var container=$(obj).parent().parent().parent();
						var params = getValues($(".modal-body",container));
						ajax("pageconfig/saveOrUpdate", params,	function(result) {
							//clear($(".modal-body"));
							if(params.id==""){
								zTree.addNodes(selectNode,result.data);
							}else{
								$.extend(true,selectNode,result.data);
								zTree.updateNode(selectNode);
							}
						});
						//$('#operateModall').modal('hide');
					}else if(operate=='close'){
						var container=$(obj).parent().parent().parent();
						if(container.attr('class').indexOf('center')>=0){
							container.empty();
						}
					}
				},
				ordKeyDown:function(e){
					if(e.keyCode==13){
							this.operateTreeNode("#pageconfig-btnSave","save");
							$("#name").focus();
						}
				}
			};

			var setting = {
				async: {
					enable: true,
					url: "pageconfig/getTree",
					dataType: "json",
					autoParam: [],
					otherParam: {startParentId:utilZtree.startParentId}
				},
				check: {
					enable: false
				},
				view: {
					dblClickExpand: false,
					showLine: true,
					selectedMulti: false
				},
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
						enable: true,
						idKey: "id",
						pIdKey: "parentId",
						rootPId: utilZtree.startParentId
					}
				},
				callback: {
					onClick: function(treeId, treeNode) {
						var selectNode = zTree.getSelectedNodes()[0];
						if (treeNode.isParent) {
							zTree.expandNode(treeNode);
						}
						//alert(selectNode.content);
						$(".main-center").html($(".modal-content").prop("outerHTML"));
						$(".main-center").find("textarea").width(480).height(200);
						
						setValues($(".modal-content"), selectNode);
					},
					onRightClick: utilZtree.onRightClick,
					beforeClick: function(treeId, treeNode) {
						var zTree = $.fn.zTree.getZTreeObj("tree");
						if (treeNode.isParent) {
							zTree.expandNode(treeNode);
						}
					}
				}
			};
			$(document).ready(function() {
				$.fn.zTree.init($("#tree"), setting);
				zTree = $.fn.zTree.getZTreeObj("tree");
			});
			</script>
		</head>
		<body>
		<div class="panel panel-default">
			<div class="panel-heading">
				page settings tree
			</div>
			<div class="panel-body">
				<ul id="tree" class="ztree" style="overflow: auto;">
				</ul>
			</div>
		</div>
		<div  id="rMenu" style="display:none;"class="btn-group btn-group-vertical" role="group" aria-label="...">
			  <button type="button" class="btn btn-default" onclick="utilZtree.operateTreeNode(this,'add')" >新建子节点</button>
		      <button type="button" class="btn btn-default" onclick="utilZtree.operateTreeNode(this,'edit')" >编辑节点</button>
		      <button type="button" class="btn btn-default" onclick="utilZtree.operateTreeNode(this,'delete')" >删除节点</button>
			</div>
			
			<div class="modal fade" id="operateModall" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
			        <h4 class="modal-title" id="exampleModalLabel">节点维护</h4>
			      </div>
			      <div class="modal-body">
			        <form class="form-horizontal">
			          <div class="form-group hidden">
							 <label class="control-label col-md-4" for="parentId">父节点ID:	</label>
							<div class="col-md-8 form-inline">
								<input type="text" class="form-control" id="parentId" >
							</div>
						</div>
						<div class="form-group hidden">
							 <label class="control-label col-md-4" for="id">节点ID:	</label>
							<div class="col-md-8 form-inline">
								<input type="text" class="form-control" id="id" >
							</div>
						</div>
			          <div class="form-group">
							 <label class="control-label col-md-4" for="id">节点名称:	</label>
							<div class="col-md-8 form-inline">
								<input type="text" class="form-control" id="name" >
							</div>
					  </div>
					  <div class="form-group">
							 <label class="control-label col-md-4" for="id">节点顺序:	</label>
							<div class="col-md-8 form-inline">
								<input type="text" class="form-control" value="0" id="ord"  onkeydown="return utilZtree.ordKeyDown(event);">
							</div>
					  </div>
					  <div class="form-group">
							 <label class="control-label col-md-4" for="id">节点路径:	</label>
							<div class="col-md-8 form-inline">
								<input type="text" class="form-control" id="path" >
							</div>
					  </div>
					  <div class="form-group">
							 <label class="control-label col-md-4" for="id">节点内容:	</label>
							<div class="col-md-8 form-inline">
								 <textarea class="form-control" id="content"></textarea>
							</div>
					  </div>
			        </form>
			      </div>
			      <div class="modal-footer">
			        <button type="button" class="btn btn-default" onclick="utilZtree.operateTreeNode(this,'close')" data-dismiss="modal" >Close</button>
			        <button type="button" class="btn btn-default" onclick="utilZtree.operateTreeNode(this,'save')"  id="pageconfig-btnSave">保  存</button>
			      </div>
			    </div>
			  </div>
			</div>
		</body>
	</html>