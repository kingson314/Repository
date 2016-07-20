<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>Repository</title>
	<%@ include file="../../../sea/Session.jsp"%>
		<script>
			$(document).ready(function() {
				seajs.use(["BorderLayout", "FormLayout", "ViewLayout", "Dialog", "Grid", "Toolbar", "Ajax"],
					function(BorderLayout, FormLayout, ViewLayout, Dialog, Grid, Toolbar, Ajax) {
						/*** ��ѯ�� ***/
						var cfgFormQuery = {
							items: [
								[{
									id: "name",
									label: "�û���",
									type: "select",
									url:"user/select",
									isNull: true
								}, {
									id: "mobilePhone",
									label: "�绰����",
									type: "textfield",
									isNull: true
								}],
								[{
									id: "sex",
									type: "checkgroup",
									css: {
										"text-align": "right"
									},
									items: [{
										label: "��",
										id: "man"
									}, {
										label: "Ů",
										id: "women"
									}]
								}, {
									id: "email",
									label: "�����ַ",
									type: "textfield",
									isNull: true
								}],
								[{
									type: "buttongroup",
									css:{"margin-top":"10px"},
									colspan: 2,
									items: [{
										icon: "icon-ok",
										value: "��ѯ",
										click: function() {
											if(!formQuery.check()) {
												return false;
											}
											var params = formQuery.val();
											$(".grid").Grid("reload", params);
											return false;
										}
									}, {
										icon: "icon-remove",
										value: "����",
										click: function() {
											formQuery.clear();
											return false;
										}
									}]
								}]
							]
						};
						var formQuery = FormLayout.create(cfgFormQuery);
						/*** ������ ***/
						var cfgToolbar = {
							items: [{
								icon: "glyphicon glyphicon-refresh",
								value: "ˢ��",
								click: function() {
									$(".grid").Grid("reload", {});
									return false;
								}
							}, {
								icon: "glyphicon glyphicon-plus",
								value: "����",
								click: function() {
									formEdit("add");
									return false;
								}
							}, {
								icon: "glyphicon glyphicon-pencil",
								value: "�޸�",
								click: function() {
									var selected = $('.grid').Grid('getSelected', 'id');
									if(selected.length != 1) {
										Dialog.alert({
											content: '��ѡ��һ����¼!'
										});
										return false;
									} else {
										var params = {
											id: selected[0]
										};
										Ajax.post("user/get", params,
											function(rs) {
												if(rs.success == true) {
													var val = rs.data;
													formEdit("update", val);
												}
											});
									}
									return false;
								}
							}, {
								icon: "glyphicon glyphicon-eye-open",
								value: "�鿴",
								click: function() {
									var selected = $('.grid').Grid('getSelected', 'id');
									if(selected.length != 1) {
										Dialog.alert({
											content: '��ѡ��һ����¼!'
										});
										return false;
									} else {
										var params = {
											id: selected[0]
										};
										Ajax.post("user/get", params,
											function(rs) {
												if(rs.success == true) {
													var val = rs.data;
													formView(val);
												}
											});
									}
									return false;
								}
							}, {
								icon: "glyphicon glyphicon-minus",
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
											confirmValue: "ȷ��",
											confirm: function() {
												var params = {
													"id": selected
												};
												Ajax.post("user/delete", params,
													function(rs) {
														if(rs.success == true) {
															Dialog.alert({
																content: 'ɾ���ɹ�!'
															});
														} else {
															Dialog.alert({
																content: 'ɾ��ʧ��!'
															});
														}
														$(".grid").Grid("reload", {});
													});
											}
										});
									}
									return false;
								}
							}, {
								icon: "glyphicon glyphicon-floppy-disk",
								value: "����",
								css: {
									"display": "none"
								},
								click: function() {
									var params = {
										id: selected[0]
									};
									Ajax.post("user/export", params,
										function(rs) {
											if(rs.success == true) {}
										});
									return false;
								}
							}, {
								icon: "glyphicon glyphicon-wrench",
								value: "����",
								css: {},
								click: function() {
									var params = {};
									Ajax.post("user/db", params,
										function(rs) {
											if(rs.success == true) {}
										});
									return false;
								}
							}]
						};
						var toolbar = Toolbar.create(cfgToolbar);
						/*** �����༭�� ***/
						function formEdit(opType, val) {
							var form, dialog;
							var cfgForm = {
								css:{
									border:0
								},
								items: [
									[{
										id: "name",
										type: "textfield",
										label: "�û���",
										isNull: true
									}, {
										id: "userAlias",
										type: "textfield",
										label: "�û�����",
										isNull: true
									}],
									[{
										id: "password",
										type: "textfield",
										label: "�û�����",
										isNull: true
									}, {
										id: "sex",
										type: "textfield",
										label: "�Ա�",
										isNull: true
									}],
									[{
										id: "birthday",
										type: "textfield",
										label: "��������",
										isNull: true
									}, {
										id: "education",
										type: "textfield",
										label: "ѧ��",
										isNull: true
									}],
									[{
										id: "mobilePhone",
										type: "textfield",
										label: "�ֻ�����",
										isNull: true
									}, {
										id: "officePhone",
										type: "textfield",
										label: "�칫�绰",
										isNull: true
									}],
									[{
										id: "email",
										type: "textfield",
										label: "�����ַ",
										isNull: true
									}, {
										id: "photoUrl",
										type: "textfield",
										label: "������Ƭ",
										isNull: true
									}],
									//�����Լ���Ϊnull�ֶ�����������������ʾ���ֶ�ҲӦ�������򣬴��Ż�
									[{
										id: "id",
										type: "hidden"
									}, {
										id: "state",
										type: "hidden"
									}, {
										id: "createDate",
										type: "hidden"
									}, {
										id: "modifyDate",
										type: "hidden"
									}, {
										id: "version",
										type: "hidden"
									}, {
										id: "ord",
										type: "hidden"
									}]
								]
							};
							form = FormLayout.create(cfgForm);
							form.val(val || {});
							Dialog.confirm({
								width: "80%",
								height: "80%",
								title: '�û�����',
								confirm: function() {
									if(!form.check()) {
										return false;
									}
									var url;
									var params = form.val();
									Ajax.post("user/" + opType, params,
										function(rs) {
											if(rs.success == true) {
												Dialog.alert({
													content: '�����ɹ�!'
												});
											} else {
												Dialog.alert({
													content: '����ʧ�ܣ�'
												});
											}
											$(".grid").Grid("reload", {});
										});
								},
								content: form.formLayout
							});
						};
						/*** �鿴����� ***/
						function formView(record) {
							var form, dialog;
							var cfgForm = {
								record: record,
								css: {
									"border": 0
								},
								items: [
									[{
										id: "name",
										label: "�û���"
									}, {
										id: "userAlias",
										label: "�û�����"
									}],
									[{
										id: "password",
										label: "�û�����"
									}, {
										id: "sex",
										label: "�Ա�"
									}],
									[{
										id: "birthday",
										label: "��������"
									}, {
										id: "education",
										label: "ѧ��"
									}],
									[{
										id: "mobilePhone",
										label: "�ֻ�����"
									}, {
										id: "officePhone",
										label: "�칫�绰"
									}],
									[{
										id: "email",
										label: "�����ַ"
									}, {
										id: "photoUrl",
										label: "������Ƭ"
									}]
								]
							};
							form = ViewLayout.create(cfgForm);
							Dialog.alert({
								width: "80%",
								height: "80%",
								title: '�û�����',
								content: form.viewLayout
							});
						};
						/*** ҳ�沼�� ***/
						var Border = BorderLayout.create({
							north: {
								height: 160,
								item: formQuery.formLayout
							},
							center: {
								north: {
									height: 35,
									item: toolbar.toolbar
								},
								center: {
									cls: "grid"
								}
							}
						});

						/*** ��ѯ�б�-���ڲ��� ***/
						gridOperation = {
								view: function(val) {
									var params = {
										id: val
									};
									Ajax.post("user/get", params,
										function(rs) {
											if(rs.success == true) {
												var val = rs.data;
												formView(val);
											}
										});
								}
							}
							/*** ��ѯ�б� ***/
						$(".grid").Grid({
							columns: [{
								align: "center",
								name: "id",
								label: "ID",
								width: "20",
								format: {
									type: "checkbox"
								}
							}, {
								align: "center",
								name: "name",
								label: "�û���"
							}, {
								align: "left",
								name: "userAlias",
								label: "�û�����"
							}, {
								align: "left",
								name: "sex",
								label: "�Ա�",
								format: {
									type: "json",
									content: {
										"0": "��",
										"1": "Ů"
									}
								}
							}, {
								align: "left",
								name: "postId",
								label: "ְλ"
							}, {
								align: "left",
								name: "birthday",
								label: "����"
							}, {
								align: "left",
								name: "mobilePhone",
								label: "�ֻ�����"
							}, {
								align: "left",
								name: "officePhone",
								label: "�칫�绰"
							}, {
								align: "left",
								name: "email",
								label: "�����ַ"
							}, {
								align: "left",
								name: "education",
								label: "ѧ��"
							}, {
								align: "center",
								name: "photoUrl",
								label: "��Ƭ",
								format: function(val, record, col) {
									return "<a  onclick=\"gridOperation.view('" + record.id + "');\"><i class='glyphicon glyphicon-eye-open'></i></a>";
								}
							}, {
								align: "left",
								name: "memo",
								label: "��ע"
							}],
							ds: {
								url: "user/list"
							},
							pageSizes: [1, 10, 20, 30, 40]
						});
					});
			});
		</script>
</head>
<body>
</body>
</html>