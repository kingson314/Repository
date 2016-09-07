<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../sea/Session.jsp"%>
	<script src="<%=basePath%>sea/core/ueditor/ueditor.config.js"></script>
	<script src="<%=basePath%>sea/core/ueditor/ueditor.all.js"></script>
	<script src="<%=basePath%>sea/core/ueditor/lang/zh-cn/zh-cn.js"></script>
		<style>
			input[type=file],input[type=submit],input[type=button]{
				height:35px;
				line-height:20px;
				width:100%;
			}
			.sea_table_tableHeader td{
				font-weight:bold;
				text-align:center;
			}
			@media screen and (min-width: 768px) {
				body{
					width:70%;
					}
			}
			@media screen and (max-width: 767px) {
				body{
					width:100%;
				}
			}
		</style>
		<script>
			var Title="重点项目销售";
			var ueditor=null;
			$(document).ready(function() {
				seajs.use(["BorderLayout", "FormLayout", "ViewLayout", "Dialog", "Grid", "Toolbar", "Ajax"],
					function(BorderLayout, FormLayout, ViewLayout, Dialog, Grid, Toolbar, Ajax) {
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
										Ajax.post("project/getProject", {id:selected[0]},
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
												Ajax.post("project/deleteProject", {ids:selected.join(",")},
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
								Ajax.post("project/createPage", {},
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
							var cfgForm = {
								id:"formEdit",
								css:{
									border:"0",
									height:"400px"
								},
								items: [
									[{id:"name",label:"项目名称",type:"textfield",len:"",isNull:true},{id:"level",label:"项目成熟度",type:"textfield",len:"",isNull:true}],
									[{id:"relative",label:"相关专利",type:"textarea",css:{"width":"100%"},len:"",isNull:true},{id:"memo",label:"项目简介",type:"textarea",css:{"width":"100%"},len:"",isNull:true}],
									[{id:"ord",label:"排序号",type:"textfield",value:"0",len:"",isNull:true}],
									[{id:"detailcontent",type:"ueditor",colspan:2}],
									[{id:"detailurl",label:"详情url",type:"hidden",len:"",isNull:true}],
									[{id:"id",type:"hidden"},{id:"type",type:"hidden"}],	
								 	[{id:"detailcontent",type:"hidden"}]	
								]
							};
							form = FormLayout.create(cfgForm);
							if(formVal){
								form.val(formVal);	
							}
							Dialog.confirm({
								width: "1600px",
								height: "600px",
								title: Title,
								cancelValue:"关闭",
								confirmValue:"预览",
								confirm: function() {
									if(!form.check()) {
										return false;
									}
									var vals = form.val();
									vals.detailcontent=UE.getEditor('detailcontent').getContent();
									Ajax.post("project/svaeProject", vals,
										function(rs) {
										$("#formEdit #id").val(rs.msg);
										$(".grid").Grid("reload", {});
										window.open("<%=basePath%>"+rs.msg+".jsp",'_blank')	
									});
									return false;
								},
								content: form.formLayout
							});
							try{
								UE.getEditor('detailcontent').destroy();
							}catch(e){}
							UE.getEditor('detailcontent');
							setTimeout(function(){
								if(formVal){
									UE.getEditor('detailcontent').setContent(formVal.detailcontent, false);
								}
							},200);
						};
						var wWin=$(window).width();
						if(wWin>=768){
							wWin="70%";
						}else{
							wWin="100%";
						}
						/*** 页面布局 ***/
						var Border = BorderLayout.create({
							width:wWin,
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
						$(".grid").Grid({
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
							{name:"name",label:"项目名称",width:150,align:"center"},
							{name:"level",label:"项目成熟度",width:120,align:"center"},
							{name:"relative",label:"相关专利",width:150,align:"center"},
							{name:"memo",label:"项目简介",width:100,align:"center"},
							{name:"detailurl",label:"详情链接",width:200,align:"left"},
							{name:"ord",label:"排序号",width:50,align:"center"},
							],
							ds: {
								url: "project/listProject"
							},
							params:{
							},	
							pageSizes: [10, 20, 30, 40,50,100]
						});
					});
			});
		</script>
</head>
<body>
</body>
</html>
