<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../sea/Session.jsp"%>
	<!--<script src="<%=basePath%>sea/core/jquery/jquery-form.js"></script> -->
	<script src="<%=basePath%>sea/core/ueditor/ueditor.config.js"></script>
	<script src="<%=basePath%>sea/core/ueditor/ueditor.all.min.js"></script>
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
		</style>
		<script>
			var Title="�ص���Ŀ����";
			$(document).ready(function() {
				seajs.use(["BorderLayout", "FormLayout", "ViewLayout", "Dialog", "Grid", "Toolbar", "Ajax"],
					function(BorderLayout, FormLayout, ViewLayout, Dialog, Grid, Toolbar, Ajax) {
						/*** ������ ***/
						var cfgToolbar = {
							items: [{
								id:"btnRefresh",icon: "glyphicon glyphicon-refresh",
								value: "ˢ��",
								click: function() {
									$(".grid").Grid("reload", {});
									return false;
								}
							}, {
								id:"btnAdd",icon: "glyphicon glyphicon-plus",
								value: "����",
								click: function() {
									formEdit({type:"add"});
									return false;
								}
							}, {
								id:"btnMod",icon: "glyphicon glyphicon-pencil",
								value: "�޸�",
								click: function() {
									var selected = $('.grid').Grid('getSelected', 'id');
									if(selected.length != 1) {
										Dialog.alert({
											content: '��ѡ��һ����¼!'
										});
										return false;
									} else {
										Ajax.post("project/getProject", {id:selected[0]},
											function(rs) {
												rs.data.type="mod";
												formEdit(rs.data);
											});
									}
								}
							}, {
								id:"btnDel",icon: "glyphicon glyphicon-pencil",
								value: "ɾ��",
								click: function() {
									var selected = $('.grid').Grid('getSelected', 'id');
									if(selected.length == 0) {
										Dialog.alert({
											content: '��ѡ��һ����¼!'
										});
										return false;
									} else {
										Dialog.confirm({
											content: '�Ƿ�ɾ��?',
											confirm: function() {
												Ajax.post("project/deleteProject", {ids:selected.join(",")},
													function(rs) {
														$(".grid").Grid("reload", {});
													});
												Dialog.alert({
													content: 'ɾ���ɹ�!'
												});
												return true;
											}
										});
									}
									return false;
								}
							},{
								id:"btnRefresh",icon: "glyphicon glyphicon-ok-sign",
								value: "����ҳ��",
								click: function() {
								Ajax.post("project/createPage", {},
										function(rs) {
										Dialog.alert({
											confirmValue: "Ԥ��",
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
						/*** �����༭�� ***/
						function formEdit(formVal) {
							var cfgForm = {
								id:"formEdit",
								css:{
									border:"0",
									height:"400px"
								},
								items: [
									[{id:"name",label:"��Ŀ����",type:"textfield",len:"",isNull:true},{id:"level",label:"��Ŀ�����",type:"textfield",len:"",isNull:true}],
									[{id:"relative",label:"���ר��",type:"textarea",css:{"width":"100%"},len:"",isNull:true},{id:"memo",label:"��Ŀ���",type:"textarea",css:{"width":"100%"},len:"",isNull:true}],
									[{id:"ord",label:"�����",type:"textfield",value:"0",len:"",isNull:true}],
									[{id:"detailcontent",type:"ueditor"}],
									[{id:"files",label:"�ļ��б�",type:"hidden",len:"",isNull:true}],
									[{id:"detailurl",label:"����url",type:"hidden",len:"",isNull:true}],
									[{id:"id",type:"hidden"},{id:"type",type:"hidden"}],	
								 	[{id:"detailcontent",type:"hidden"}]	
								]
							};
							form = FormLayout.create(cfgForm);
							if(formVal){
								form.val(formVal);	
							}
							Dialog.confirm({
								width: "1000px",
								height: "500px",
								title: Title,
								cancelValue:"�ر�",
								confirmValue:"Ԥ��",
								confirm: function() {
									if(!form.check()) {
										return false;
									}
									var vals = form.val();
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
							var ue = UE.getEditor('detailcontent');
						};
						/*** ҳ�沼�� ***/
						var Border = BorderLayout.create({
							width:"70%",
							horizontally:true,//ˮƽ����
							vertically:false,//��ֱ����
							north: {
								height: 35,
								item: toolbar.toolbar
							},
							center: {
								cls: "grid"
							}
						});
						/*** ��ѯ�б� ***/
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
							{name:"name",label:"��Ŀ����",width:150,align:"center"},
							{name:"level",label:"��Ŀ�����",width:120,align:"center"},
							{name:"relative",label:"���ר��",width:150,align:"center"},
							{name:"memo",label:"��Ŀ���",width:100,align:"center"},
							{name:"files",label:"�ļ��б�",width:200,align:"left"},
							{name:"detailurl",label:"��������",width:200,align:"left"},
							{name:"ord",label:"�����",width:50,align:"center"},
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
