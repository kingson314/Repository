<%@ page pageEncoding="UTF-8"%>
<textarea  id="result" style="width:100%;height:300px;">
</textarea>
<textarea  id="template" style="width:100%;height:300px;">
<\%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>Repository</title>
	<\%@ include file="../../../sea/Session.jsp"%>
		<script>
			var objType="[objType]";
			var Title="[title]";
			$(document).ready(function() {
				seajs.use(["BorderLayout", "FormLayout", "ViewLayout", "Dialog", "Grid", "Toolbar", "Ajax"],
					function(BorderLayout, FormLayout, ViewLayout, Dialog, Grid, Toolbar, Ajax) {
						/*** 查询表单 ***/
						var cfgFormQuery = {
							items: [
								/*** generate ***/
								[cfgFormQuery],
								[{
									type: "buttongroup",
									css:{"margin-top":"10px"},
									items: [{
										icon: "icon-ok",
										value: "查询",
										click: function() {
											if(!formQuery.check()) {
												return false;
											}
											var params = formQuery.val();
											params["objType"]=objType;
											params["token"]=Cookie.token;
											$(".grid").Grid("reload", params);
											return false;
										}
									}, {
										icon: "icon-remove",
										value: "重置",
										click: function() {
											formQuery.clear();
											return false;
										}
									}]
								}]
							]
						};
						var formQuery = FormLayout.create(cfgFormQuery);
						/*** 工具栏 ***/
						var cfgToolbar = {
							items: [{
								icon: "glyphicon glyphicon-refresh",
								value: "刷新",
								click: function() {
									$(".grid").Grid("reload", {});
									return false;
								}
							}, {
								icon: "glyphicon glyphicon-plus",
								value: "新增",
								click: function() {
									formEdit();
									return false;
								}
							}, {
								icon: "glyphicon glyphicon-pencil",
								value: "修改",
								click: function() {
									var selected = $('.grid').Grid('getSelected', 'uuid');
									if(selected.length != 1) {
										Dialog.alert({
											content: '请选择一条记录!'
										});
										return false;
									} else {
										var params = {
											uuid: selected[0],
											"objType":objType,
											"token":Cookie.token
										};
										Ajax.post("inf/getObject", params,
											function(rs) {
												if(rs.retMsg == "OK") {
													var val = rs.retVal;
													formEdit(val);
												}
											});
									}
									return false;
								}
							}, {
								icon: "glyphicon glyphicon-minus",
								value: "删除",
								click: function() {
									var selected = $('.grid').Grid('getSelected', 'uuid');
									if(selected.length == 0) {
										Dialog.alert({
											content: '请选择一条记录!'
										});
										return false;
									} else {
										Dialog.confirm({
											content: '是否删除?',
											confirmValue: "确定",
											confirm: function() {
												var params = {
													"uuid": selected.join(","),
													"objType":objType,
													"token":Cookie.token
												};
												Ajax.post("inf/delObject", params,
													function(rs) {
														if(rs.retMsg == "OK") {
															Dialog.alert({
																content: '删除成功!'
															});
														} else {
															Dialog.alert({
																content: '删除失败!'
															});
														}
														$(".grid").Grid("reload", {});
													});
											}
										});
									}
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
								cssInner:{"width":"600px"},
								items: [
									/*** generate ***/
									[cfgFormEdit],
									//主键以及不为null字段须隐藏域，其他不显示的字段也应该隐藏域，待优化
									[{
										id: "uuid",
										type: "hidden"
									}]
								]
							};
							form = FormLayout.create(cfgForm);
							form.val(formVal || {});
							Dialog.confirm({
								width: "800px",
								height: "400px",
								title: Title,
								confirm: function() {
									if(!form.check()) {
										return false;
									}
									var params = form.val();
									params["objType"]=objType;
									if(!formVal){
										delete params.uuid;
									}
									var data={
											"token":Cookie.token,
											"params":JSON.stringify(params)
									};
									Ajax.post("inf/saveObject", data,
										function(rs) {
											if(rs.retMsg == "OK") {
												Dialog.alert({
													content: '操作成功!'
												});
											} else {
												Dialog.alert({
													content: '操作失败！'
												});
											}
											$(".grid").Grid("reload", {});
										});
								},
								content: form.formLayout
							});
						};
						/*** 查看详情表单 ***/
						function formView(record) {
							var form, dialog;
							var cfgForm = {
									record: getRecord(val),
									cssInner:{"width":"600px"},
								css: {
									"border": 0
								},
								items: [
									/*** generate ***/
									[cfgFormView]
								]
							};
							form = ViewLayout.create(cfgForm);
							Dialog.alert({
								width: "800px",
								height: "400px",
								title: Title,
								content: form.viewLayout
							});
						};
						/*** 页面布局 ***/
						var Border = BorderLayout.create({
							north: {
								height: 120,
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
						/*** 查询列表 ***/
						$(".grid").Grid({
							columns: [{
								align: "center",
								name: "uuid",
								label: "ID",
								width: "30",
								format: {
									type: "checkbox"
								}
							},
							{name:"name",label:"用户名称",align:"left",format:function(val , record , col){
								var uuid=record["uuid"];
								return "<a href='#' onclick='formView(\""+uuid+"\");'>"+val+"</a>";	
					         }},
							/*** generate ***/
							[cfgGridColumn]],
							ds: {
								url: "inf/listObject"
							},
							params:{
								"objType":objType,
								"token":Cookie.token
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
</textarea>