<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>formLayout</title>
		<%@ include file="../../Session.jsp"%>
		<script src="<%=basePath%>sea/core/dragsort/jquery.dragsort-0.4.min.js"></script>
		<script src="../../../sea/core/artTemplate/template.js"></script>
		<style>
			table{
			   text-align:center;
				margin:20px auto;
				width:70%;
			}
			input[type=radio],input[type=checkbox],input[type=text],input[type=password],input[type=button],select{
				border:0;
			}
			select:hover,input[type=button]:hover,input[type=text]:hover,input[type=password]:hover,input[type=radio]:hover,input[type=checkbox]:hover{
				outline: none;
				border:0;
				box-shadow: none;
			}
			select:focus,input[type=button]:focus,input[type=text]:focus,input[type=password]:focus,input[type=radio]:focus,input[type=checkbox]:focus{
				outline: none;
				border: 0;
			}	
			select{
				width:100%;
				height:100%;
				z-index:99999;
			}
		</style>
		<script>
			function del(obj){
				$(obj).parent().parent().remove();
			}
			$(document).ready(function(){
				var templateTextarea=$("#template");
				var resultTextarea=$("#result");
				seajs.use(["BorderLayout","FormLayout","Json","Ajax","String","ButtonGroup","String"], function(BorderLayout,FormLayout,Json,Ajax,String,ButtonGroup,String) {
					//alert(String.upperTo_("userId"));
					var formTables ,formFields;
					var cfgFormTables = {
							title: "<i class='glyphicon glyphicon-th-list'></i>&nbsp;数据表配置",
							width:"100%",
							cssInner:{"padding":"0 30% 0 0"},
							items: [[{
									id:"title",
									label: "标题",
									type:"textfield"
								}],[{
									id:"objType",
									label: "对象类型",
									type:"textfield"
								}],[{
								id:"tablename",
								label: "数据表",
								type: "select" ,
								url:"user/tables",
								isNull: false,
								events:{
									change:function(){
										$("#objType").val(String.upperFirst(String.upper_($("#tablename").val())));
										Border.getCenter().empty();
										Ajax.post("user/fields",formTables.val(),
											function(rs) {
												var tableFields=$("<table border=1></table");
												tableFields.append("	<thead><tr><td>编号</td><td>字段名称</td><td>字段标签</td><td>字段类型</td><td>字段长度</td><td>是否为空</td><td>编辑</td><td>查看</td><td>查询</td><td>列表</td><td>操作</td></tr></thead>");
												var tbody=$("<tbody id='tableFieldsBody'></tbody>").appendTo(tableFields);
												$.each(rs.data,function(index,item){
													var checked="";
													if(item["ISNULL"]=="NO")checked="checked";
													 tbody.append("<tr><td>"+index
															 						 +"</td><td><input type='text' value='"+(item["COLUMN_NAME"])
			                     													 +"'/></td><td><input type='text' value=''/></td><td><select id='type'><option vlaue='textfield'>textfield</option><option vlaue='textarea'>textarea</option><option vlaue='select'>select</option><option vlaue='date'>date</option><option vlaue='hidden'>hidden</option><option vlaue='checkbox'>checkbox</option><option vlaue='checkgroup'>checkgroup</option></select></td><td><input type='text' value='"+item["DATA_LEN"]
																				     +"'/></td><td><input type='checkbox' "+checked+"  id='isNull'/></td><td><input type='checkbox' checked id='isEdit'/></td><td><input type='checkbox' checked id='isView'/></td><td><input type='checkbox' id='isQuery'/></td><td><input type='checkbox' checked id='isList'/></td><td><input type='button' value='删除' onclick='del(this)'/></td></tr>");
												});
												var cfgBtnGroup={
														items:[{
															id : "summit",
															value : "提交",
															events : {
																click : function(){
																	var out={
																			title:$("#title").val(),
																			objType:$("#objType").val(),
																			cfgFormQuery:"",
																			cfgFormEdit:"",
																			cfgFormEditHidden:"",
																			cfgFormView:"",
																			cfgGridColumn:""
																	};
																	var indexQuery=0;
																	var indexEdit=0;
																	var indexView=0;
																	$.each($("#tableFieldsBody>tr"),function(index,item){
																			var tds=$(item).find("td");
																			var fieldName=$(tds[1]).find("input").val();
																			var fieldLabel=$(tds[2]).find("input").val();
																			var fieldType=$(tds[3]).find("select").val()
																			var fieldLen=$(tds[4]).find("input").val();
																			var isNull=$(tds[5]).find("input").attr("checked")=="checked"?true:false;
																			var isEdit=$(tds[6]).find("input").attr("checked")=="checked"?true:false;
																			var isView=$(tds[7]).find("input").attr("checked")=="checked"?true:false;
																			var isQuery=$(tds[8]).find("input").attr("checked")=="checked"?true:false;
																			var isList=$(tds[9]).find("input").attr("checked")=="checked"?true:false;
																			
																			/**cfgFormQuery**/
																			if(isQuery){
																					if(indexQuery%2==0){
																						out.cfgFormQuery+="[{id:\""+fieldName+"\",label:\""+fieldLabel+"\",type:\""+fieldType+"\",len:\""+fieldLen+"\",isNull:"+isNull+"},\n";
																					}else{
																						out.cfgFormQuery+="{id:\""+fieldName+"\",label:\""+fieldLabel+"\",type:\""+fieldType+"\",len:\""+fieldLen+"\",isNull:"+isNull+"}],\n";
																					}
																					indexQuery++;
																			}
																			/**cfgFormEdit**/
																			if(isEdit){
																					if(indexEdit%2==0){
																						out.cfgFormEdit+="[{id:\""+fieldName+"\",label:\""+fieldLabel+"\",type:\""+fieldType+"\",len:\""+fieldLen+"\",isNull:"+isNull+"},\n";
																					}else{
																						out.cfgFormEdit+="{id:\""+fieldName+"\",label:\""+fieldLabel+"\",type:\""+fieldType+"\",len:\""+fieldLen+"\",isNull:"+isNull+"}],\n";
																					}
																					indexEdit++;
																			}
																			/**cfgFormView**/
																			if(isView){
																					if(indexView%2==0){
																						out.cfgFormView+="[{id:\""+fieldName+"\",label:\""+fieldLabel+"\"},\n";
																					}else{
																						out.cfgFormView+="{id:\""+fieldName+"\",label:\""+fieldLabel+"\"}],\n";
																					}
																					indexView++;
																			}

																			/**cfgGridColumn**/
																			if(isList){
																				out.cfgGridColumn+="{name:\""+fieldName+"\",label:\""+fieldLabel+"\",align:\"left\"},\n";
																			}
																	});//循环tr  end

																	/**cfgFormQuery**/
																	//if(String.endWith(out.cfgFormQuery,"}")){
																	//	out.cfgFormQuery+="]"
																	//}else if(String.endWith(out.cfgFormQuery,",")){
																	//	out.cfgFormQuery=out.cfgFormQuery.substring(0,out.cfgFormQuery.length-2);
																	//}
																	/** cfgFormEdit**/
																	//if(String.endWith(out.cfgFormEdit,"}")){
																	//	out.cfgFormEdit+="]"
																	//}else if(String.endWith(out.cfgFormEdit,",")){
																	//	out.cfgFormEdit=out.cfgFormEdit.substring(0,out.cfgFormEdit.length-2);
																	//}
																	/** cfgFormView**/
																	//if(String.endWith(out.cfgFormView,"}")){
																	//	out.cfgFormView+="]"
																	//}else if(String.endWith(out.cfgFormView,",")){
																	//	out.cfgFormView=out.cfgFormView.substring(0,out.cfgFormView.length-2);
																	//}
																	/** cfgGridColumn**/
																	//if(String.endWith(out.cfgGridColumn,",")){
																	//	out.cfgGridColumn=out.cfgGridColumn.substring(0,out.cfgGridColumn.length-2);
																	//}
																	/**Template-Result**/
																	var template=templateTextarea.val();
																	$.each(out,function(key,value){
																		template=template.replace("["+key+"]",value);
																	});
																	resultTextarea.val(template);
																}//提交end
															}
														}]
														}
												var buttonGroup=ButtonGroup.create(cfgBtnGroup).buttonGroup;	 		
												Border.getCenter().append(tableFields).append(buttonGroup);
												setTimeout(function(){
													$("#tableFieldsBody").dragsort({ itemSelector: "tr", dragSelector: "tr", dragBetween: true,dragEnd: function(){}, placeHolderTemplate: "<tr></tr>" });
													$("#tableFieldsBody input").css({"border":"0"}).mousemove(function(){$(this).css({"border":"0","box-shadow":"none"});});
													$("#tableFieldsBody select").css({"width":"100%","height":"100%"});
												},100);
												
												Border.getCenter().append("<br>").append(resultTextarea);
												tableFields.find("input[type=checkbox]").click(function(){
													if(!$(this).attr("checked")){
														$(this).attr("checked","checked");		
													}else{
														$(this).removeAttr("checked");
													}
												});
												
											},false);
											//change end
									}
								}
							}]]
						};
						formTables=FormLayout.create(cfgFormTables);
	
						var Border = BorderLayout.create({
							north: {
								height: 180,
								item: formTables.formLayout
							},
							center: {
								item:$("#template"),
								css:{"overflow":"auto","text-align":"center","margin":"0 auto"}
							}
						});
				});
			});
		</script>		
	</head>
	<body>
	<%-- template--%>
	<%@ include file="Template.jsp" %>
	</body>
</html>