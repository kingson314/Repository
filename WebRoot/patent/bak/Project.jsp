<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="../../../sea/Session.jsp"%>
	<link href="<%=basePath%>sea/component/base/table/css/table.css" rel="stylesheet" type="text/css" />
	<script src="<%=basePath%>sea/core/jquery/jquery-form.js"></script>
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
			var form, dialog;
			function del(obj){
				$(obj).parent().parent().remove();
			}
			function upload(obj){
				//$("#projectForm").ajaxSubmit(function(message) { 
					// ���ڱ��ύ�ɹ�����messageΪ�ύҳ��saveReport.htm�ķ������� 
				//	alert(message);
				//	$("#formEdit #id").val(message);
				//}); 
				$("#projectForm").ajaxSubmit({
		            type: 'post', // �ύ��ʽ get/post
		            url: '<%=basePath %>project/upload', // ��Ҫ�ύ�� url
		            data: {
		                'id': $("#formEdit #id").val()
		            },
		            dataType:"json",
		            success: function(rs) {
		            	$("#formEdit #id").val(rs.data.id);
		            	$("#formEdit #files").val(rs.data.files.join(","));
		            	$("#formEdit #detailurl").val(rs.data.id+".jsp");
						//�ϴ��걣��һ�Σ���ֱֹ�ӹر�
		                if(!form.check()) {
							return false;
						}
						var vals = form.val();
						Ajax.post("project/svaeProject", vals,
							function(rs) {
							$("#formEdit #id").val(rs.msg);
							$(".grid").Grid("reload", {});
						});
		            }
		        }); 

				
				return false; // ���뷵��false����������Լ�����һ���ύ����������ҳ����ת 
			}
			function add(obj){
				var name="fileUp"+$(obj).parent().parent().index();
				var html=[];
				html.push('					<tr class="sea_table_tr">                                                                                            ');
				html.push('						<td class="sea_table_td" align="left" style="width: 300px; min-width: 300px;">                                     ');
				html.push('							<input type="file" name="'+name+'" />                                                                             ');
				html.push('						</td>                                                                                                              ');
				html.push('						<td class="sea_table_td" align="left" style="width: 100px; min-width: 100px;">                                     ');
				html.push('						<input type="button" value="ɾ��" onclick="del(this);"/>                                     ');
				html.push('						</td>                                                                                                              ');
				html.push('					</tr>                 								');
				$(html.join("")).insertBefore($(obj).parent().parent());                                                                                               
			}
			
			function getForm(){
				var form=$('<form id="projectForm" action="#" method="post" enctype="multipart/form-data" style="float:left;width:50%;height:400px;"></form>');
				var html=[];																										
				 	html.push('  	<div class="sea_table" style="margin: 0px auto; text-align: center; width: 100%; height: 400px;overflow-y:auto">                          ');
					html.push('    	<div class="sea_table_header">                                                                                           ');
					html.push('			<table class="sea_table_tableHeader">                                                                                    ');
					html.push('				<tbody>                                                                                                                ');
					html.push('					<tr>                                                                                                                 ');
					html.push('						<td class="sea_table_td" align="left" style="width: 300px; min-width: 300px;">                                     ');
					html.push('							�ļ��б�                                                                                                         ');
					html.push('						</td>                                                                                                              ');
					html.push('						<td class="sea_table_td" align="left" style="width: 100px; min-width: 105px;">                                     ');
					html.push('							����                                                                                                             ');
					html.push('						</td>                                                                                                              ');
					html.push('					</tr>                                                                                                                ');
					html.push('				</tbody>                                                                                                               ');
					html.push('			</table>                                                                                                                 ');
					html.push('		</div>                                                                                                                     ');
					html.push('		<div class="sea_table_mainBody">                                                                                           ');
					html.push('			<table class="sea_table_tableBody">                                                                                      ');
					html.push('				<tbody>                                                                                                                ');
					html.push('					<tr class="sea_table_tr">                                                                                            ');
					html.push('						<td class="sea_table_td" align="left" style="width: 300px; min-width: 300px;">                                     ');
					html.push('							<input type="file" name="fileUp0"/>                                                                               ');
					html.push('						</td>                                                                                                              ');
					html.push('						<td class="sea_table_td" align="left" style="width: 100px; min-width: 100px;">                                     ');
					html.push('						<input type="button" value="ɾ��" onclick="del(this);"/>                                     ');
					html.push('						</td>                                                                                                              ');
					html.push('					</tr>                                                                                                                ');
					html.push('					<tr class="sea_table_tr">                                                                                            ');
					html.push('						<td class="sea_table_td" align="left" style="width: 300px; min-width: 300px;">                                     ');
					html.push('							<input type="file" name="fileUp1" />                                                                             ');
					html.push('						</td>                                                                                                              ');
					html.push('						<td class="sea_table_td" align="left" style="width: 100px; min-width: 100px;">                                     ');
					html.push('						<input type="button" value="ɾ��" onclick="del(this);"/>                                     ');
					html.push('						</td>                                                                                                              ');
					html.push('					</tr>                                                                                                                ');
					html.push('					<tr class="sea_table_tr">                                                                                            ');
					html.push('						<td class="sea_table_td" align="left" style="width: 300px; min-width: 300px;">                                     ');
					html.push('							<input type="file" name="fileUp2"/>                                                                               ');
					html.push('						</td>                                                                                                              ');
					html.push('						<td class="sea_table_td" align="left" style="width: 100px; min-width: 100px;">                                     ');
					html.push('						<input type="button" value="ɾ��" onclick="del(this);"/>                                     ');
					html.push('						</td>                                                                                                              ');
					html.push('					</tr>                                                                                                                ');
					html.push('					<tr class="sea_table_tr">                                                                                            ');
					html.push('						<td class="sea_table_td" align="left" style="width: 300px; min-width: 300px;">                                     ');
					html.push('							<input type="file" name="fileUp3" />                                                                             ');
					html.push('						</td>                                                                                                              ');
					html.push('						<td class="sea_table_td" align="left" style="width: 100px; min-width: 100px;">                                     ');
					html.push('						<input type="button" value="ɾ��" onclick="del(this);"/>                                     ');
					html.push('						</td>                                                                                                              ');
					html.push('					</tr>                                                                                                                ');
					html.push('					<tr class="sea_table_tr">                                                                                            ');
					html.push('						<td class="sea_table_td" align="left" style="width: 300px; min-width: 300px;">                                     ');
					html.push('							<input type="file" name="fileUp4"/>                                                                               ');
					html.push('						</td>                                                                                                              ');
					html.push('						<td class="sea_table_td" align="left" style="width: 100px; min-width: 100px;">                                     ');
					html.push('						<input type="button" value="ɾ��" onclick="del(this);"/>                                     ');
					html.push('						</td>                                                                                                              ');
					html.push('					</tr>                                                                                                                ');
					html.push('					<tr class="sea_table_tr">                                                                                            ');
					html.push('						<td class="sea_table_td" align="left" style="width: 300px; min-width: 300px;">                                     ');
					html.push('							<input type="file" name="fileUp5" />                                                                             ');
					html.push('						</td>                                                                                                              ');
					html.push('						<td class="sea_table_td" align="left" style="width: 100px; min-width: 100px;">                                     ');
					html.push('						<input type="button" value="ɾ��" onclick="del(this);"/>                                     ');
					html.push('						</td>                                                                                                              ');
					html.push('					</tr>                                                                                                                ');
					html.push('					<tr class="sea_table_tr">                                                                                            ');
					html.push('						<td class="sea_table_td" align="left">                                                                  ');
					html.push('							<input type="button" id="btnUpload" onclick="upload(this);" value="�ϴ�" />                                                              ');
					html.push('						</td>                                                                                                              ');
					html.push('						<td class="sea_table_td" align="left">                                                                  ');
					html.push('							<input type="button" id="btnAdd"  onclick="add(this);" value="����һ��" />                                                              ');
					html.push('						</td>                                                                                                              ');
					html.push('					</tr>                                                                                                                ');
					html.push('				</tbody>                                                                                                               ');
					html.push('			</table>                                                                                                                 ');
					html.push('		</div>                                                                                                                     ');
					html.push('	</div>                                                                                                                       ');
				form.append(html.join(""));
				return form;
			}
		
		</script>
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
								//cssInner:{"height":"400px"},
								items: [
									[{id:"name",label:"��Ŀ����",type:"textfield",len:"",isNull:true}],//,{id:"file",type:"label",label:"ͼƬ�б�",tdCss:{"text-align":"center"}}
									[{id:"level",label:"��Ŀ�׶�",type:"textfield",len:"",isNull:true}],
									[{id:"relative",label:"����ר��",type:"textarea",css:{"width":"100%"},len:"",isNull:true}],
									[{id:"memo",label:"���",type:"textarea",css:{"width":"100%"},len:"",isNull:true}],
									[{id:"ord",label:"�����",type:"textfield",value:"0",len:"",isNull:true}],
									[{id:"files",label:"�ļ��б�",type:"textfield",len:"",disabled:true,isNull:true}],
									[{id:"detailurl",label:"����url",type:"textfield",disabled:true,len:"",isNull:true}],
									[{id:"id",type:"hidden"},{id:"type",type:"hidden"}]	
								]
							};
							form = FormLayout.create(cfgForm);
							if(formVal){
								form.val(formVal);	
							}
							var layout=$("<div></div>").css({"width":"100%","height":"400px"});
							var left=$("<div></div>").append(form.formLayout).appendTo(layout).css({"float":"left","width":"50%","height":"400px"});
							var right=getForm().appendTo(layout);
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
								content: layout
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
							{name:"level",label:"��Ŀ�׶�",width:120,align:"center"},
							{name:"relative",label:"����ר��",width:150,align:"center"},
							{name:"memo",label:"���",width:100,align:"center"},
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
						
						//$("body").delegate("#btnUpload","click",{},function(){
						//	$("#projectForm").ajaxSubmit(function(message) { 
						//		// ���ڱ��ύ�ɹ�����messageΪ�ύҳ��saveReport.htm�ķ������� 
						//		alert(message);
						//	}); 
						//	return false; // ���뷵��false����������Լ�����һ���ύ����������ҳ����ת 
						//})
						
					});
			});
			
		</script>
</head>
<body>
</body>
</html>
