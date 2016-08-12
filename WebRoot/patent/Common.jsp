<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../sea/Session.jsp"%>
		<style>
		</style>
		<script>
			var Title="��Ȩר��";
			var recType="<%=request.getParameter("recType")%>";	
			$(document).ready(function() {
				seajs.use(["BorderLayout", "FormLayout", "ViewLayout", "Dialog", "Grid", "Toolbar", "Ajax"],
					function(BorderLayout, FormLayout, ViewLayout, Dialog, Grid, Toolbar, Ajax) {
						if(recType==1){
							Title="��Ȩδ��֤ר��";
						}
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
										Ajax.post("common/getCommon", {id:selected[0]},
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
												Ajax.post("common/deleteCommon", {ids:selected.join(",")},
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
									Ajax.post("common/createPage", {"recType":recType},
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
							var form, dialog;
							var cfgForm = {
								css:{
									border:0
								},
								cssInner:{"width":"800px"},
								items: [
									[{id:"id",type:"hidden"}],	
									[{id:"domain",label:"����",type:"textfield",len:"",isNull:true}],
									[{id:"num",label:"�����",type:"textfield",len:"",isNull:true}],
									[{id:"name",label:"ר������",type:"textfield",len:"",isNull:true}],
									[{id:"type",label:"ר������",type:"textfield",len:"",isNull:true}],
									[{id:"status",label:"����״̬",type:"textfield",len:"",isNull:true}],
									[{id:"pdate",label:"��Ȩ������",type:"textfield",isNull:true}],
									[{id:"ord",label:"�����",type:"textfield",value:"0",len:"",isNull:true}],
									[{id:"recType",label:"��¼����",type:"textfield",value:recType,len:"",isNull:true}]
								]
							};
							if(recType==1){
								cfgForm.items[6].label="��ǽ�ֹ��";
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
											{name:"domain",label:"����",width:120,align:"center"},
											{name:"num",label:"�����",width:200,align:"center"},
											{name:"name",label:"ר������",width:250,align:"center"},
											{name:"type",label:"ר������",width:120,align:"center"},
											{name:"status",label:"����״̬",width:120,align:"center"},
											{name:"pdate",label:"��Ȩ������",width:120,align:"center"},
											{name:"ord",label:"�����",width:50,align:"center"},
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
							cfgGrid.columns[6].label="��ǽ�ֹ��";
						}
						$(".grid").Grid(cfgGrid);
					});
			});
			
		</script>
</head>
<body>
</body>
</html>
