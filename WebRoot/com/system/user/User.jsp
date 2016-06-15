<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>Repository</title>
		<%@ include file="../../../sea/Session.jsp"%>
		<script>
		$(document).ready(function(){
			seajs.use(["BorderLayout","FormLayout","Grid","Ajax","Toolbar","Dialog"],
				function(BorderLayout,FormLayout,Grid,Ajax,Toolbar,Dialog){
				//��ѯ��
				var cfgFormQuery = {
						width:"100%",
						title:"<i class='glyphicon glyphicon-th'></i>��ѯ����",
						items: [[{
							id:"name",
							label: "�û���",
							type: "textfield",
							isNull: true
						},{
							id:"mobilePhone",
							label: "�绰����",
							type: "textfield",
							isNull: true
						}], [{id: "sex",
							type: "checkgroup",
							css:{"text-align":"right"},
							  items: [{
							    label: "��",
							    id:"man"
							  },
							  {
							    label: "Ů",
							    id:"women"
							  }]},{
							id:"email",
							label: "�����ַ",
							type: "textfield",
							isNull: true
						}],[{
							type:"buttongroup",
							colspan:2,
							  items: [{
							    icon: "icon-ok",
							    value: "��ѯ",
							    click: function() {
									  if(!formQuery.check()){
										    return false;
									    }
									  var params=formQuery.val();
									  $(".grid").Grid("reload",{name:"fgq"});
									  return false;
							    }
							  },
							  {
							    icon: "icon-remove",
							    value: "����",
							    click: function() {
								  formQuery.clear();
								  return false;
							    }
							  }]
							  }]]
					};
				var formQuery=FormLayout.create(cfgFormQuery);

				//������
				var cfgToolbar = {
						  items: [{
							    icon: "icon-refresh",
							    value: "ˢ��",
							    click: function() {
							  			$(".grid").Grid("reload",{});
							  			return false;
							    }
							  },{
						    icon: "icon-plus-sign",
						    value: "����",
						    click: function() {
								userForm("add");
							 	return false;
						    }
						  },
						  {
						    icon: "icon-edit",
						    value: "�޸�",
						    click: function() {
							  var selected=$('.grid').Grid('getSelected','id');
								if(selected.length!=1){
									Dialog.create({
								        content: '��ѡ��һ����¼'
								      });
								      return false;
								}else{
									var params={
											id:selected[0]	
									};
									 Ajax.post("user/get",params,function(rs){
											if(rs.success==true){
												var val=rs.data;
												userForm("update",val);
											}
									});
								}
							 	return false;
						    }
						  },
						  {
						    icon: " icon-remove",
						    value: "ɾ��",
						    click: function() {
							    var selected=$('.grid').Grid('getSelected','id');
								if(selected.length==0){
									Dialog.create({
								        content: '��ѡ��һ����¼'
								      });
								      return false;
								}else{
									Dialog.create({
								        content: '�Ƿ�ɾ��?',
								        confirmValue:"ȷ��",
									     confirm:function(){
								        	var params={
													"id":selected
											};
											  Ajax.post("user/delete",params,function(rs){
														if(rs.success==true){
															Dialog.create({
														        content: 'ɾ���ɹ�'
														      });
														}else{
															Dialog.create({
														        content: 'ɾ��ʧ��'
														      });
														}
														$(".grid").Grid("reload",{});
												});
										  }
								      });
								}
								return false;
						    }
						  }]
						};
				var toolbar=Toolbar.create(cfgToolbar).toolbar;
				var panel='<div class="panel panel-default">'+
									  '<div class="panel-heading">'+
									  '<h3 class="panel-title"><i class="glyphicon glyphicon-th"></i>Panel title</h3>'+
									  '</div>'+
								  '<div class="panel-body">'+
								  formQuery.formLayout.html()+
								  '</div>'+
								  //'<div class="panel-footer">Panel footer</div>'+
								'</div>';
				//ҳ�����岼��
				var Border=BorderLayout.create({
						north:{
							height:160,
							item:formQuery.formLayout
						},
						center:{
							north:{
								height:35,
								item:toolbar
							},
							center:{
								cls:"grid"
							}
						}
					});
				//�����༭��
				function userForm(opType,val){
					var form ,dialog;
					var cfgForm = {
						id:"loginform",
						width:"100%",
						labelWidthPercent: 0.25,
						items: [[{
							id: "name",
							type: "textfield",
							label:"�û���",
							isNull: true
						},{
							id: "userAlias",
							type: "textfield",
							label:"�û�����",
							isNull: true
						}],  [{
							id: "password",
							type: "textfield",
							label: "�û�����",
							isNull: true
						},{
							id: "sex",
							type: "textfield",
							label: "�Ա�",
							isNull: true
						}],[{
							id: "birthday",
							type: "textfield",
							label: "��������",
							isNull: true
						},{
							id: "education",
							type: "textfield",
							label: "ѧ��",
							isNull: true
						}],[{
							id: "mobilePhone",
							type: "textfield",
							label: "�ֻ�����",
							isNull: true
						},{
							id: "officePhone",
							type: "textfield",
							label: "�칫�绰",
							isNull: true
						}],[{
							id: "email",
							type: "textfield",
							label: "�����ַ",
							isNull: true
						},{
							id: "photoUrl",
							type: "textfield",
							label: "������Ƭ",
							isNull: true
						}],
						//�����Լ���Ϊnull�ֶ�����������������ʾ���ֶ�ҲӦ�������򣬴��Ż�
						[{id: "id",type: "hidden"},{id: "state",type: "hidden"},{id: "createDate",type: "hidden"},{id: "modifyDate",type: "hidden"},{id: "version",type: "hidden"},{id: "ord",type: "hidden"}]]
					};
					form = FormLayout.create(cfgForm);
					form.val(val&&val);
					dialog=Dialog.create({
				        width: 800,
				        height: 380,
				        title: '�û�����',
				        confirmValue: '����',
				        confirm: function() {
							 if(!form.check()){
								    return false;
							   }
							   var url;
							  var params=form.val();
							  Ajax.post("user/"+opType,params,function(rs){
									if(rs.success==true){
										Dialog.create({
									        content: '�����ɹ�'
									      });
									}else{
										Dialog.create({
									        content: '����ʧ��'
									      });
									}
									$(".grid").Grid("reload",{});
							 });
				        },
				        cancelValue: 'ȡ��',
					    content:	form.formLayout
				      }).dialog;
				 };
				$(".grid").Grid({
					columns:[
					     	{align:"center",name:"id",label:"ID",width:"20",format:{type:"checkbox"}},
					      	{align:"left",name:"name",label:"�û���" },
				           	{align:"left",name:"userAlias",label:"�û�����" },
				           	{align:"left",name:"sex",label:"�Ա�" ,format:{type:"json",content:{"0":"��","1":"Ů"}} },
				           	{align:"left",name:"postId",label:"ְλ" },
				           	{align:"left",name:"birthday",label:"����" },
				           	{align:"left",name:"mobilePhone",label:"�ֻ�����" },
				           	{align:"left",name:"officePhone",label:"�칫�绰" },
				           	{align:"left",name:"email",label:"�����ַ" },
				           	{align:"left",name:"education",label:"ѧ��" },
				           	{align:"left",name:"photoUrl",label:"��Ƭ" },
				           	{align:"left",name:"memo",label:"��ע" }
					         ],
					 ds:{
					 		type:"url",
					 		url:"user/list"
					 },
					 limit:20,
					 pageSizes:[10,20,30,40],
					 height:"350px",
					 indexColumn:true,
					 loadMsg:"���ݼ����У����Ժ�......"
				}) ;
			});
		});
		</script>
	</head>
	<body style="background-color: #EEEEEE;">
	</body>
</html>