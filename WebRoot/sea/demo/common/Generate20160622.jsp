<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>formLayout</title>
		<%@ include file="../../Session.jsp"%>
		<script src="<%=basePath%>sea/core/dragsort/jquery.dragsort-0.4.min.js"></script>
		<script>
			$(document).ready(function(){
				seajs.use(["BorderLayout","FormLayout","Json","Ajax","String"], function(BorderLayout,FormLayout,Json,Ajax,String) {
					var formTables ,formFields;
					var cfgFormTables = {
							title: "<i class='glyphicon glyphicon-th-list'></i>&nbsp;数据表配置",
							width:"100%",
							items: [[{
								id:"tablename",
								label: "数据表",
								type: "select" ,
								url:"user/tables",
								isNull: false,
								events:{
									change:function(){
										Border.getCenter().empty();
										var cfgFormFields = {
												id:"formFields",
												title: "<i class='glyphicon glyphicon-th-list'></i>&nbsp;字段配置",
												width:"100%",
												css:{border:0},
												items:[]
										};
										Ajax.post("user/fields",formTables.val(),
											function(rs) {
												$.each(rs.data,function(index,item){
													cfgFormFields.items.push([{
														id:"label",
														type: "label" ,
														cls:"sea_index",
														label:index
													},{
														id:"name",
														label: "字段名称",
														type: "textfield" ,
													//label:item["COLUMN_NAME"],
														value:item["COLUMN_NAME"]
													},{
														id:"type",
														label: "字段类型",
														type: "textfield" ,
														value:item["DATA_TYPE"]
													},{
														id:"len",
														label: "字段长度",
														type: "textfield",
														value:item["DATA_LEN"]
													}]);
												});
												cfgFormFields.items.push([{
													type: "buttonGroup",
													colspan:3,
													items:[{
														id : "summit",
														value : "提交",
														events : {
															click : function(){
																var data={};
																$.each(formFields.formLayout.find(".sea_formLayout_tr"),function(index,item){
																		var inputs=$(item).find("input[type=text]");
																		if(inputs.length<=0) return true;
																		if(String.isBlank($(inputs[0]).val())==true)return true;
																		data[$(inputs[0]).val()]=$(inputs[1]).val()+"|"+$(inputs[2]).val();
																});
																alert(Json.toString(data));
																Ajax.post("user/generate",data,
																		function(rs) {
																			alert(rs.success);
																	},false);
																
															}
														}
													}]
												}]);
												cfgFormFields.items.push([]);
												formFields=FormLayout.create(cfgFormFields);
												Border.getCenter().append(formFields.formLayout);
												$(".sea_index").parent().css("width","10px");
											},false);
									}
								}
							},{}]]
						};
						formTables=FormLayout.create(cfgFormTables);
						var Border = BorderLayout.create({
							north: {
								height: 100,
								item: formTables.formLayout
							},
							center: {
								item: "",
								css:{"overflow":"auto"}
							}
						});

						$("#formFields").find(".sea_formLayout_table").dragsort({ dragSelectorExclude: "" ,itemSelector: ".sea_formLayout_tr", dragSelector: ".sea_formLayout_tr", dragBetween: true,dragEnd: function(){}, placeHolderTemplate: "<div><div></div></div>" });
					});
			});
		</script>		
	</head><%--
	<body style="background-color:#F9F9F9;">
	--%><body>
	</body>
</html>