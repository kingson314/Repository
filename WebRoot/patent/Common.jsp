<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../sea/Session.jsp"%>
		<style>
		</style>
		<script>
			var Title="授权专利";
			var recType="<%=request.getParameter("recType")%>";	
			$(document).ready(function() {
				seajs.use(["BorderLayout", "FormLayout", "ViewLayout", "Dialog", "Grid", "Toolbar", "Ajax"],
					function(BorderLayout, FormLayout, ViewLayout, Dialog, Grid, Toolbar, Ajax) {
						if(recType==1){
							Title="授权未下证专利";
						}
						/*** 工具栏 ***/
						var cfgToolbar = {
							items: [{
								id:"btnRefresh",icon: "glyphicon glyphicon-refresh",
								value: "刷新",
								click: function() {
									$(".grid").Grid("reload", {});
									return false;
								}
							}, {
								id:"btnAdd",icon: "glyphicon glyphicon-plus",
								value: "新增",
								click: function() {
									formEdit();
									return false;
								}
							}, {
								id:"btnMod",icon: "glyphicon glyphicon-pencil",
								value: "修改",
								click: function() {
									var selected = $('.grid').Grid('getSelected', 'id');
									if(selected.length != 1) {
										Dialog.alert({
											content: '请选择一条记录!'
										});
										return false;
									} else {
										Ajax.post("common/getCommon", {id:selected[0]},
											function(rs) {
												formEdit(rs.data);
											});
									}
								}
							}, {
								id:"btnDel",icon: "glyphicon glyphicon-pencil",
								value: "删除",
								click: function() {
									var selected = $('.grid').Grid('getSelected', 'id');
									if(selected.length == 0) {
										Dialog.alert({
											content: '请选择一条记录!'
										});
										return false;
									} else {
										Dialog.confirm({
											content: '是否删除?',
											confirm: function() {
												Ajax.post("common/deleteCommon", {ids:selected.join(",")},
													function(rs) {
														$(".grid").Grid("reload", {});
													});
												Dialog.alert({
													content: '删除成功!'
												});
												return true;
											}
										});
									}
									return false;
								}
							},{
								id:"btnRefresh",icon: "glyphicon glyphicon-ok-sign",
								value: "创建页面",
								click: function() {
									Ajax.post("common/createPage", {"recType":recType},
											function(rs) {
											Dialog.alert({
												confirmValue: "预览",
												confirm: function(){
													window.open(rs.msg,'_blank')		
													return true;
												}, 
												content: rs.msg
											});
										});
									return false;
								}
							}]
						};
						var toolbar = Toolbar.create(cfgToolbar);
						/*** 新增编辑表单 ***/
						function formEdit(formVal) {
							var form, dialog;
							var cfgForm = {
								css:{
									border:0
								},
								cssInner:{"width":"800px"},
								items: [
									[{id:"id",type:"hidden"}],	
									[{id:"domain",label:"领域",type:"textfield",len:"",isNull:true}],
									[{id:"num",label:"申请号",type:"textfield",len:"",isNull:true}],
									[{id:"name",label:"专利名称",type:"textfield",len:"",isNull:true}],
									[{id:"type",label:"专利类型",type:"textfield",len:"",isNull:true}],
									[{id:"status",label:"法律状态",type:"textfield",len:"",isNull:true}],
									[{id:"pdate",label:"授权公告日",type:"textfield",isNull:true}],
									[{id:"ord",label:"排序号",type:"textfield",value:"0",len:"",isNull:true}],
									[{id:"recType",label:"记录类型",type:"textfield",value:recType,len:"",isNull:true}]
								]
							};
							if(recType==1){
								cfgForm.items[6].label="办登截止日";
							}
							form = FormLayout.create(cfgForm);
							if(formVal){
								form.val(formVal);	
							}
							Dialog.confirm({
								width: "1000px",
								height: "460px",
								title: Title,
								confirm: function() {
									if(!form.check()) {
										return false;
									}
									var vals = form.val();
									Ajax.post("common/svaeCommon", vals,
										function(rs) {
										$(".grid").Grid("reload", {});
									});
									return true;
								},
								content: form.formLayout
							});
						};
						/*** 页面布局 ***/
						var Border = BorderLayout.create({
							width:"70%",
							horizontally:true,//水平居中
							vertically:false,//垂直居中
							north: {
								height: 35,
								item: toolbar.toolbar
							},
							center: {
								cls: "grid"
							}
						});
						/*** 查询列表 ***/
						var cfgGrid={
								columns: [
											{
											align: "center",
											name: "id",
											label: "ID",
											width: "30",
											format: {
												type: "checkbox"
											}
											},
											{name:"domain",label:"领域",width:120,align:"center"},
											{name:"num",label:"申请号",width:200,align:"center"},
											{name:"name",label:"专利名称",width:250,align:"center"},
											{name:"type",label:"专利类型",width:120,align:"center"},
											{name:"status",label:"法律状态",width:120,align:"center"},
											{name:"pdate",label:"授权公告日",width:120,align:"center"},
											{name:"ord",label:"排序号",width:50,align:"center"},
										],
										ds: {
											url: "common/listCommon"
										},
										params:{
											"recType":recType
										},	
										pageSizes: [10, 20, 30, 40,50]
									};										
						if(recType==1){
							cfgGrid.columns[6].label="办登截止日";
						}
						$(".grid").Grid(cfgGrid);
					});
			});
			
		</script>
</head>
<body>
</body>
</html>
