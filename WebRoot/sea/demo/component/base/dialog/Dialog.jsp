<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>button</title>
		<%@ include file="../../../../Session.jsp"%>
	<style>
	</style>
	<script>
		$(document).ready(function(){
			var form ;
				seajs.use(["ButtonGroup","Dialog"],
					function(ButtonGroup,Dialog){
					var cfgButtonGroup = {
							  id: "buttongroup",
							  align: "1",
							  items: [{
							    icon: "icon-flag",
							    value: "simple dialogBox",
							    click: function() {
							     	Dialog.alert({
							        content: 'dialog content text,image,html file'
							      });
							    }
							  },
							  {
							    icon: "icon-flag",
							    value: "stantard dialogBox",
							    click: function() {
							      Dialog.confirm({
							        title: 'title text',
							        hasClose: true,
							        content: 'dialog content text,image,html file'
							      });
							    }
							  },
							  {
							    icon: "icon-flag",
							    value: "custom size dialogBox",
							    click: function() {
							      Dialog.confirm({
							        width: 500,
							        height: 300,
							        //title: 'title text',
							        hasClose: true,
							        hasMask: true,
							       // content: $('<ul><li>Support custom dialog box style.</li><li>on the high version of brwosers support a series of animation effect</li><li>Support adaptive popup content size</li><li>Support the standard and the modal dialog box</li><li>Support IE7+,Firefox3+,Chrome and Oprea</li></ul>')
								       content:	form.formLayout
							      });
							    }
							  },
							  {
							    icon: "icon-flag",
							    value: "auto close dialogBox",
							    click: function() {
							      Dialog.confirm({
							        autoHide: true,
							        time: 3000,
							        title: 'title text',
							        content: 'dialog content text,image,html file'
							      });
							    }
							  },
							  {
							    icon: "icon-flag",
							    value: "mask dialogBox",
							    click: function() {
							      Dialog.confirm({
							        hasClose: true,
							        hasMask: true,
							        title: 'title text',
							        content: 'dialog content text,image,html file'
							      });
							    }
							  },
							  {
							    icon: "icon-flag",
							    value: "btn dialogBox",
							    click: function() {
							      Dialog.confirm({
							        hasClose: true,
							        hasBtn: true,
							        confirmValue: 'I am sure',
							        confirm: function() {
							          alert('this is callback function');
							        },
							        cancelValue: 'I will cancel',
							        title: 'title text',
							        content: 'dialog content text,image,html file'
							      });
							    }
							  },
							  {
							    icon: "icon-flag",
							    value: "effect dialogBox",
							    click: function() {
							      Dialog.confirm({
							        width: 500,
							        height: 260,
							        autoHide: true,
							        time: 3000,
							        effect: 'flip-horizontal',
							        title: 'title text',
							        content: 'dialog content text,image,html file'
							      });
							    }
							  },
							  {
							    icon: "icon-flag",
							    value: " type dialogBox",
							    click: function() {
							      Dialog.confirm({
							        type: 'correct' ,//three type:'normal'(default),'correct','error'
							        width: 300,
							        height: 200,
							        hasMask: true,
							        autoHide: true,
							        time: 3000,
							        effect: 'fall',
							        title: 'title text',
							        content: 'dialog content text,image,html file'
							      });
							    }
							  }]
							};
						var buttongroup=ButtonGroup.create(cfgButtonGroup);
						$("body").append(buttongroup.buttonGroup.css({"vertical-align":"middle"}))
						.css({"margin-top":"100px"});
				});
				seajs.use(["BorderLayout", "FormLayout","Ajax","Json"],
				function(Border, Form,Ajax,Json) {
					var cfgForm = {
						id:"loginform",
						width:"80%",
						labelWidthPercent: 0.25,
						items: [[{
							id:"logo",
							type: "img",
							tdCss: {
								"text-align":"center", "float": "left"
							},
							css:{"height":"80px"},
							src: "<%=request.getContextPath()%>/com/system/user/images/login_logo.png" 
						}],[], [{
							type: "label",
							tdCss:{ "width": "100%",
							 "height": "30px",
							 "float": "left",
							 "text-align": "center",
							 "line-height": "30px",
							 "font-size": "22px",
							 "color":"#433E3D",
							 "margin-top": "10px"},
							label: "Lumin Home 度假居",
							css: {}
						}], [{
							type: "label",
							label: "为您的家人订制5星度假空间",
							tdCss: {"width":"100%",
							"height":"30px",
							"float":"left",
							"text-align":"center",
							"line-height":"30px",
							"font-size":"18px",
							"color":"#888",
							"margin-top":"10px"}
						}], [],[{
							id: "phone",
							type: "textfield",
							placeholder: "请输入您的手机号码",
							isNull: true
						}],  [{
							id: "password",
							type: "textfield",
							placeholder: "请输入您的密码",
							isNull: false
						}],[{
							value: "登录",
							type: "button",
							css:{
								"width":"100%",
								"font-size":"18px",
								 "background-color": "#4FBA9C",
								  "color": "#fff"
								  },
								click:function(){
									  var data={"id":"1","password":"111"};
									  Ajax.post("user/login",data,function(result){
										  if(result.success==true){
											    if(!form.check()){
												    return;
											    }
											  	form.val({phone:"15914475509",memo:"fenggq"});
												alert(Json.toString(form.val()));
												  form.clear();
												  alert(("登录成功"));
										  		window.location.href =Ajax.getUrl("app/app-main.jsp",data);
										  }
									  	},false
									  );
								}
						}],[{
							id:"forget",
							colspan:0.5,
							type: "button",
							value: "忘记密码？",
							css:{
								"width":"49%",
								"font-size":"18px",
								 "background-color": "#aaa",
								  "color": "#fff"
								  },
							click:function(){
								window.location.href =Ajax.getUrl("user/forget");
							}},{
							value: "注册",
							type: "button",
							colspan:0.5,
							css:{
								"width":"49%",
								 "margin-left":"2%",
								"font-size":"18px",
								 "background-color": "#63b7ff",
								  "color": "#fff"
								  },
								click:function(){
										window.location.href =Ajax.getUrl("user/register");
								}
						}]]
					};
					form = Form.create(cfgForm);
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>