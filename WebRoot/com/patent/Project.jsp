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
			var Title="�ص���Ŀ����";
			var ueditor=null;
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
									formEdit();
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
									[{id:"detailcontent",type:"ueditor",colspan:2}],
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
								width: "1600px",
								height: "600px",
								title: Title,
								cancelValue:"�ر�",
								confirmValue:"Ԥ��",
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
						/*** ҳ�沼�� ***/
						var Border = BorderLayout.create({
							width:wWin,
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
