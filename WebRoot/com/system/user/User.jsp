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
				//查询表单
				var cfgFormQuery = {
						width:"100%",
						title:"<i class='glyphicon glyphicon-th'></i>查询条件",
						items: [[{
							id:"name",
							label: "用户名",
							type: "textfield",
							isNull: true
						},{
							id:"mobilePhone",
							label: "电话号码",
							type: "textfield",
							isNull: true
						}], [{id: "sex",
							type: "checkgroup",
							css:{"text-align":"right"},
							  items: [{
							    label: "男",
							    id:"man"
							  },
							  {
							    label: "女",
							    id:"women"
							  }]},{
							id:"email",
							label: "邮箱地址",
							type: "textfield",
							isNull: true
						}],[{
							type:"buttongroup",
							colspan:2,
							  items: [{
							    icon: "icon-ok",
							    value: "查询",
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
							    value: "重置",
							    click: function() {
								  formQuery.clear();
								  return false;
							    }
							  }]
							  }]]
					};
				var formQuery=FormLayout.create(cfgFormQuery);

				//工具条
				var cfgToolbar = {
						  items: [{
							    icon: "icon-refresh",
							    value: "刷新",
							    click: function() {
							  			$(".grid").Grid("reload",{});
							  			return false;
							    }
							  },{
						    icon: "icon-plus-sign",
						    value: "新增",
						    click: function() {
								userForm("add");
							 	return false;
						    }
						  },
						  {
						    icon: "icon-edit",
						    value: "修改",
						    click: function() {
							  var selected=$('.grid').Grid('getSelected','id');
								if(selected.length!=1){
									Dialog.create({
								        content: '请选择一条记录'
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
						    value: "删除",
						    click: function() {
							    var selected=$('.grid').Grid('getSelected','id');
								if(selected.length==0){
									Dialog.create({
								        content: '请选择一条记录'
								      });
								      return false;
								}else{
									Dialog.create({
								        content: '是否删除?',
								        confirmValue:"确定",
									     confirm:function(){
								        	var params={
													"id":selected
											};
											  Ajax.post("user/delete",params,function(rs){
														if(rs.success==true){
															Dialog.create({
														        content: '删除成功'
														      });
														}else{
															Dialog.create({
														        content: '删除失败'
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
				//页面整体布局
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
				//新增编辑表单
				function userForm(opType,val){
					var form ,dialog;
					var cfgForm = {
						id:"loginform",
						width:"100%",
						labelWidthPercent: 0.25,
						items: [[{
							id: "name",
							type: "textfield",
							label:"用户名",
							isNull: true
						},{
							id: "userAlias",
							type: "textfield",
							label:"用户别名",
							isNull: true
						}],  [{
							id: "password",
							type: "textfield",
							label: "用户密码",
							isNull: true
						},{
							id: "sex",
							type: "textfield",
							label: "性别",
							isNull: true
						}],[{
							id: "birthday",
							type: "textfield",
							label: "出生日期",
							isNull: true
						},{
							id: "education",
							type: "textfield",
							label: "学历",
							isNull: true
						}],[{
							id: "mobilePhone",
							type: "textfield",
							label: "手机号码",
							isNull: true
						},{
							id: "officePhone",
							type: "textfield",
							label: "办公电话",
							isNull: true
						}],[{
							id: "email",
							type: "textfield",
							label: "邮箱地址",
							isNull: true
						},{
							id: "photoUrl",
							type: "textfield",
							label: "个人照片",
							isNull: true
						}],
						//主键以及不为null字段须隐藏域，其他不显示的字段也应该隐藏域，待优化
						[{id: "id",type: "hidden"},{id: "state",type: "hidden"},{id: "createDate",type: "hidden"},{id: "modifyDate",type: "hidden"},{id: "version",type: "hidden"},{id: "ord",type: "hidden"}]]
					};
					form = FormLayout.create(cfgForm);
					form.val(val&&val);
					dialog=Dialog.create({
				        width: 800,
				        height: 380,
				        title: '用户管理',
				        confirmValue: '保存',
				        confirm: function() {
							 if(!form.check()){
								    return false;
							   }
							   var url;
							  var params=form.val();
							  Ajax.post("user/"+opType,params,function(rs){
									if(rs.success==true){
										Dialog.create({
									        content: '操作成功'
									      });
									}else{
										Dialog.create({
									        content: '操作失败'
									      });
									}
									$(".grid").Grid("reload",{});
							 });
				        },
				        cancelValue: '取消',
					    content:	form.formLayout
				      }).dialog;
				 };
				$(".grid").Grid({
					columns:[
					     	{align:"center",name:"id",label:"ID",width:"20",format:{type:"checkbox"}},
					      	{align:"left",name:"name",label:"用户名" },
				           	{align:"left",name:"userAlias",label:"用户别名" },
				           	{align:"left",name:"sex",label:"性别" ,format:{type:"json",content:{"0":"男","1":"女"}} },
				           	{align:"left",name:"postId",label:"职位" },
				           	{align:"left",name:"birthday",label:"生日" },
				           	{align:"left",name:"mobilePhone",label:"手机号码" },
				           	{align:"left",name:"officePhone",label:"办公电话" },
				           	{align:"left",name:"email",label:"邮箱地址" },
				           	{align:"left",name:"education",label:"学历" },
				           	{align:"left",name:"photoUrl",label:"照片" },
				           	{align:"left",name:"memo",label:"备注" }
					         ],
					 ds:{
					 		type:"url",
					 		url:"user/list"
					 },
					 limit:20,
					 pageSizes:[10,20,30,40],
					 height:"350px",
					 indexColumn:true,
					 loadMsg:"数据加载中，请稍候......"
				}) ;
			});
		});
		</script>
	</head>
	<body style="background-color: #EEEEEE;">
	</body>
</html>