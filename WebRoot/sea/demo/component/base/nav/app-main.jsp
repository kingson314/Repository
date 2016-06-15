<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>Repository</title>
		<%@ include  file="../../../../Session.jsp"%>
		
		
<style type="text/css">
*{box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;}
body{background:#f0f0f0;}
.content{width:260px;margin:100px auto;}
.filterinput{
	background-color:rgba(249, 244, 244, 0);
	border-radius:15px;
	width:90%;
	height:30px;
	border:thin solid #FFF;
	text-indent:0.5em;
	font-weight:bold;
	color:#FFF;
}
#menu_list a{
	overflow:hidden;
	text-overflow:ellipsis;
	-o-text-overflow:ellipsis;
	white-space:nowrap;
	width:100%;
}
</style>
		<script>
		$(document).ready(function() {
			seajs.use(["Date"],function(Date) {
				$("#time").html("当前时间："+Date.getNow());
			});
			seajs.use(["BorderLayout","FormLayout","Bread","Json","Grid", "Nav","Menu"	],
			function(Border, FormLayout,Bread,Json) {
				var nav=$('#sea_nav-nav').Nav().show().css({"position":"relative","margin":"0","padding":"0"});
				var cfgBread = {
						  id: "bread", 
						  items: [{ 
						    label: "主页",
						    click: function() {
						      alert("button1  click");
						    }
						  },
						  { 
						    label: "系统管理",
						    click: function() {
						      alert("button1  click");
						    }
						  },
						  { 
						    label: "用户管理",
						    click: function() {
						      alert("button1  click");
						    }
						  }]
						};
					var bread=Bread.create(cfgBread);

					var cfgFormQuery = {
							width:"60%",
							labelWidthPercent: 0.25,
							items: [[{
								id:"username",
								label: "用户名",
								type: "textfield",
								isNull: false
							},{
								id:"tel",
								label: "电话号码",
								type: "textfield",
								isNull: false
							}], [{id: "checkgroup1",
								type: "checkgroup",
								css:{"text-align":"right"},
								  items: [{
								    label: "男",
								    click: function() {
								      alert("check1  click");
								    }
								  },
								  {
								    label: "女",
								    click: function() {
								      alert("check1  click");
								    }
								  }]},{
								id:"identityCard",
								label: "身份证",
								type: "textfield",
								isNull: false
							}],[{id: "buttongroup1",
								type:"buttongroup",
								colspan:2,
								  items: [{
								    icon: "icon-ok",
								    value: "查询",
								    click: function() {
										  if(!formQuery.check()){
											    return;
										    }
										alert(Json.toString(formQuery.val()));
								    }
								  },
								  {
								    icon: "icon-remove",
								    value: "重置",
								    click: function() {
									  login();
									  formQuery.clear();
								    }
								  }]
								  }]]
						};
						var formQuery=FormLayout.create(cfgFormQuery);

				var cfgBorder = {
					parent: "#viewport",
					id: "",
					name: "",
					width: "100%",
					 //north : {
					//	 height :50,
					//	 css:{"border":"1px solid red","position":"relative"},
					//	 item:nav
					//},
					west:{
						width:260,
						item:$("#sea_menu").Menu().show()
						},
					center: {
							 north : {
								 height :35,
								 css:{"line-height":"35px","vertical-align":"middle","height":"35px"},
								 item:bread.bread
							},center: {
								 north : {
									 height :150,
									css:{"border-bottom":"1px solid #eee","padding-bottom":"5px"},
									 item:formQuery.formLayout
								},center: {
									item:$("	<div class='grid-content' style='width:100%;height:100%;'></div>")
								}
							}
					}
				};
				var border = Border.create(cfgBorder);
				createGrid();
			});
		});

	    function login(){
	    	seajs.use(["BorderLayout", "FormLayout","Ajax","Json","Dialog"],
					function(Border, Form,Ajax,Json,Dialog) {
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
								label: "Web应用 私人定制",
								css: {}
							}], [{
								type: "label",
								label: "为您量身定做高品质Web应用",
								tdCss: {"width":"100%",
								"height":"30px",
								"float":"left",
								"text-align":"center",
								"line-height":"30px",
								"font-size":"18px",
								"color":"#888",
								"margin-top":"10px"}
							}], [{
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
									"width":"100%",
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
									"width":"100%",
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
						var form = Form.create(cfgForm);
				    	var dialog=Dialog.create({
					        width: 500,
					        height: 600,
					        //title: 'title text',
					        hasClose: true,
					        hasMask: true,
						       content:	form.formLayout
					      })dialog;
					});
		     }
		function createGrid(){
			$(".grid-content").Grid({
				columns:[
				           	{align:"center",name:"username",label:"用户名" },
				           	{align:"center",name:"sex",label:"性别" },
				           	{align:"center",name:"birthday",label:"出生日期" ,format:function(val , record , col){
					           	val =val.replace(/,/g, ".")
					           	var arr=val.split(".");
					           	if(arr[1].length==1)arr[1]= 0+arr[1];
					           	if($.trim(arr[2]).length==1)arr[2]= 0+arr[2];
								return arr[0]+"-"+arr[1]+"-"+arr[2];	
					         }},
				           	{align:"center",name:"a",label:"身份证" },
				           	{align:"center",name:"b",label:"文化程度" },
				           	{align:"center",name:"c",label:"入党（团）时间" },
				           	{align:"center",name:"d",label:"政治面貌" },
				           	{align:"center",name:"e",label:"住址" },
				           	{align:"center",name:"f",label:"户籍地址" },
				           	{align:"center",name:"g",label:"外出居住地址" },
				           	{align:"center",name:"h",label:"联系电话" }
				           	
				         ],
				         ds:{type:"data",records:[
							{"username":"	陈文光	","sex":"	男	","birthday":"	1968,10,18	","a":"	440726196810186312		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨路20号	","f":"		","g":"		","h":"	13725614371	"},
							{"username":"	梁德英	","sex":"	女	","birthday":"	1939.1.20	","a":"	440726193901206327		","b":"	小学	","c":"		","d":"	群众	","e":"	海滨路20号	","f":"		","g":"		","h":"	13725614371	"},
							{"username":"	陈增明	","sex":"	男	","birthday":"	1963.10.9	","a":"	440726196310096337		","b":"	高中	","c":"		","d":"	个体户	","e":"	海滨二2号	","f":"		","g":"		","h":"	5590595	"},
							{"username":"	林米	","sex":"	女	","birthday":"	1968.3.15	","a":"	440726196803156326		","b":"	高中	","c":"		","d":"	个体户	","e":"	海滨二2号	","f":"		","g":"		","h":"	5590595	"},
							{"username":"	陈韦铮	","sex":"	男	","birthday":"	2003.4.13	","a":"	441721200304134518		","b":"	小学	","c":"		","d":"	群众	","e":"	海滨二2号	","f":"		","g":"		","h":"	5590595	"},
							{"username":"	陈韵竹	","sex":"	女	","birthday":"	2003.5.13	","a":"	441721200305134528		","b":"	初中	","c":"		","d":"	群众	","e":"	海滨二2号	","f":"		","g":"		","h":"	5590595	"},
							{"username":"	巫献平	","sex":"	男	","birthday":"	1961.8.8	","a":"	440726196108086311		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨二4号	","f":"		","g":"		","h":"	13680668515	"},
							{"username":"	陈桃	","sex":"	女	","birthday":"	1964.3.24	","a":"	440726196403246322		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨二4号	","f":"		","g":"		","h":"	13680668515	"},
							{"username":"	巫昌朗	","sex":"	男	","birthday":"	1990.4.9	","a":"	441721199004094539		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨二4号	","f":"		","g":"		","h":"	13680668515	"},
							{"username":"	陈福	","sex":"	男	","birthday":"	1958.6.9	","a":"	44072619580609631X		","b":"	小学	","c":"		","d":"	群众	","e":"	海滨二32号	","f":"		","g":"		","h":"	5589298	"},
							{"username":"	李秀珍	","sex":"	女	","birthday":"	1960.2.14	","a":"	440726196002146320		","b":"	小学	","c":"		","d":"	群众	","e":"	海滨二32号	","f":"		","g":"		","h":"	5589298	"},
							{"username":"	陈建娣	","sex":"	女	","birthday":"	1981.9.2	","a":"	441721198109024524		","b":"	初中	","c":"		","d":"	群众	","e":"	海滨二32号	","f":"		","g":"		","h":"	5589298	"},
							{"username":"	陈建辉	","sex":"	男	","birthday":"	1985.10.11	","a":"	441721198510114518		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨二32号	","f":"		","g":"		","h":"	5589298	"},
							{"username":"	陈建国	","sex":"	男	","birthday":"	1987.8.27	","a":"	441721198708274517		","b":"	大专	","c":"		","d":"	群众	","e":"	海滨二32号	","f":"		","g":"		","h":"	5589298	"},
							{"username":"	陈泓希	","sex":"	男	","birthday":"	2012.6.24	","a":"	441721201206244518		","b":"		","c":"		","d":"	群众	","e":"	海滨二32号	","f":"		","g":"		","h":"	5589298	"},
							{"username":"	陈锦兆	","sex":"	男	","birthday":"	1950.6.2	","a":"	440726195006026313		","b":"	高中	","c":"		","d":"	退休职工	","e":"	海滨二46号	","f":"		","g":"		","h":"	5589603	"},
							{"username":"	陈泽瑜	","sex":"	男	","birthday":"	1979.11.1	","a":"	441721197911014513		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨二46号	","f":"		","g":"		","h":"	5589603	"},
							{"username":"	陈荣滔	","sex":"	男	","birthday":"	1985.9.9	","a":"	441721198509094513		","b":"	大专	","c":"		","d":"	群众	","e":"	海滨二46号	","f":"		","g":"		","h":"	5589603	"},
							{"username":"	张杰贞	","sex":"	男	","birthday":"	1947.7.2	","a":"	440726194707026311		","b":"	初中	","c":"		","d":"	群众	","e":"	海滨三10号	","f":"		","g":"		","h":"	5588221	"},
							{"username":"	赖执	","sex":"	女	","birthday":"	1943.9.20	","a":"	440726194309206325		","b":"	初中	","c":"		","d":"	群众	","e":"	海滨三10号	","f":"		","g":"		","h":"	5588221	"},
							{"username":"	张胜	","sex":"	男	","birthday":"	1967.7.6	","a":"	440726196707066339		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨三10号	","f":"		","g":"		","h":"	5588221	"},
							{"username":"	张智富	","sex":"	男	","birthday":"	2005.2.7	","a":"	441721200502074536		","b":"	小学	","c":"		","d":"	群众	","e":"	海滨三10号	","f":"		","g":"		","h":"	5588221	"},
							{"username":"	王马娇	","sex":"	男	","birthday":"	1968.12.3	","a":"	440726196812036326		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨三10号	","f":"		","g":"		","h":"	5588221	"},
							{"username":"	张智颖	","sex":"	男	","birthday":"	1995.5.19	","a":"	441721199505194511		","b":"	大专	","c":"		","d":"	群众	","e":"	海滨三10号	","f":"		","g":"		","h":"	5588221	"},
							{"username":"	魏小红	","sex":"	女	","birthday":"	1966.5.11	","a":"	440726196605116323		","b":"	初中	","c":"		","d":"	群众	","e":"	海滨三18号	","f":"		","g":"		","h":"	13542621062	"},
							{"username":"	许琬玲	","sex":"	女	","birthday":"	1987.3.12	","a":"	441721198703124528		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨三18号	","f":"		","g":"		","h":"	13542621062	"},
							{"username":"	许日初	","sex":"	男	","birthday":"	1988.9.18	","a":"	441721198809184510		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨三18号	","f":"		","g":"		","h":"	13542621062	"},
							{"username":"	罗初三	","sex":"	男	","birthday":"	196410.8	","a":"	440726196410086312		","b":"	初中	","c":"		","d":"	群众	","e":"	海滨三21号	","f":"		","g":"		","h":"	5590489	"},
							{"username":"	周结桃	","sex":"	女	","birthday":"	1968.9.17	","a":"	440726196809176344		","b":"	初中	","c":"		","d":"	群众	","e":"	海滨三21号	","f":"		","g":"		","h":"	5590489	"},
							{"username":"	罗晓军	","sex":"	男	","birthday":"	1993.3.9	","a":"	441721199303094512		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨三21号	","f":"		","g":"		","h":"	5590489	"},
							{"username":"	罗晓诗	","sex":"	女	","birthday":"	1996.11.28	","a":"	441721199611284529		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨三21号	","f":"		","g":"		","h":"	5590489	"},
							{"username":"	周苏伟	","sex":"	男	","birthday":"	1963.4.28	","a":"	440726196304286310		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨三37号	","f":"		","g":"		","h":"	5591958	"},
							{"username":"	黄爱珍	","sex":"	女	","birthday":"	19634.24	","a":"	44072619630424636X		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨三37号	","f":"		","g":"		","h":"	5591958	"},
							{"username":"	周婉婷	","sex":"	女	","birthday":"	1992.6.23	","a":"	441721199206234528		","b":"	大专	","c":"		","d":"	群众	","e":"	海滨三37号	","f":"		","g":"		","h":"	5591958	"},
							{"username":"	黄记	","sex":"	男	","birthday":"	1967.10.5	","a":"	440726196710056350		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨三38号	","f":"		","g":"		","h":"	5590726	"},
							{"username":"	杨小梅	","sex":"	女	","birthday":"	1971.9.11	","a":"	441721197109114525		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨三38号	","f":"		","g":"		","h":"	5590726	"},
							{"username":"	黄安	","sex":"	男	","birthday":"	1970.4.10	","a":"	441721197004104531		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨三38号	","f":"		","g":"		","h":"	5590726	"},
							{"username":"	黄婉莹	","sex":"	女	","birthday":"	2004.8.4	","a":"	441721200408044525		","b":"	小学	","c":"		","d":"	群众	","e":"	海滨三38号	","f":"		","g":"		","h":"	5590726	"},
							{"username":"	黄宏智	","sex":"	男	","birthday":"	2000.2.7	","a":"	441721200002074513		","b":"	初中	","c":"		","d":"	群众	","e":"	海滨三38号	","f":"		","g":"		","h":"	5590726	"},
							{"username":"	林善贤	","sex":"	男	","birthday":"	1940.10.3	","a":"	440726194010316319		","b":"	小学	","c":"		","d":"	群众	","e":"	海滨三26号	","f":"		","g":"		","h":"	5589232	"},
							{"username":"	许年	","sex":"	女	","birthday":"	1944.7.2	","a":"	440726194407026328		","b":"	小学	","c":"		","d":"	群众	","e":"	海滨三26号	","f":"		","g":"		","h":"	5589232	"},
							{"username":"	杨光	","sex":"	男	","birthday":"	1968.10.4	","a":"	44072619681004631X		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨四37号	","f":"		","g":"		","h":"	18344210309	"},
							{"username":"	黄碗秋	","sex":"	女	","birthday":"	1968.2.17	","a":"	440726196802176325		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨四37号	","f":"		","g":"		","h":"	18344210309	"},
							{"username":"	杨子享	","sex":"	男	","birthday":"	1994.3.27	","a":"	441721199403274510		","b":"	大专	","c":"		","d":"	群众	","e":"	海滨四37号	","f":"		","g":"		","h":"	18344210309	"},
							{"username":"	骆里明	","sex":"	男	","birthday":"	1962.7.1	","a":"	440726196207016335		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨四38号	","f":"		","g":"		","h":"	5592858	"},
							{"username":"	邵燕芬	","sex":"	女	","birthday":"	1962.10.3	","a":"	441721196210304521		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨四38号	","f":"		","g":"		","h":"	5592858	"},
							{"username":"	骆永锐	","sex":"	男	","birthday":"	1992.6.18	","a":"	441721199206184559		","b":"	大专	","c":"		","d":"	群众	","e":"	海滨四38号	","f":"		","g":"		","h":"	5592858	"},
							{"username":"	骆子君	","sex":"	女	","birthday":"	1987.10.19	","a":"	441721198710194524		","b":"	大专	","c":"		","d":"	群众	","e":"	海滨四38号	","f":"		","g":"		","h":"	5592858	"},
							{"username":"	骆子健	","sex":"	男	","birthday":"	1990.8.22	","a":"	441721199008224513		","b":"	大专	","c":"		","d":"	群众	","e":"	海滨四38号	","f":"		","g":"		","h":"	5592858	"},
							{"username":"	李伟波	","sex":"	男	","birthday":"	1966.10.25	","a":"	440726196610256312		","b":"	高中	","c":"		","d":"	群众	","e":"	海滨五20号	","f":"		","g":"		","h":"	5589056	"}
		 				 ]},
						 limit:20,
						 pageSizes:[10,20,30,40],
						 height:"410px",
						 title:"用户列表",
						 indexColumn:true,
						 params:{name:"hello",name2:"world"},
						 loadMsg:"数据加载中，请稍候......"
					}) ; 
			}
		</script>		
		
		<script type="text/javascript">

		$(function(){	
			//顶部导航切换
			$("#menu_list li").click(function(){
				$("#menu_list li.active").removeClass("active")
				$(this).addClass("active");
			})	
		});	(function($) {
			$.expr[":"].Contains = function(a, i, m) {
				return (a.textContent || a.innerText || "").toUpperCase().indexOf(m[3].toUpperCase()) >= 0;
			};
			function filterList(header, list) {
				//@header 头部元素
				//@list 无需列表
				//创建一个搜素表单
				var form = $("<form>").attr({
					"class":"filterform",
					action:"#"
				}).css({"text-align":"center"});
				var input = $("<input>").attr({
					"class":"filterinput",
					type:"text"
				}).css({"border":"1px solid #bbb","color":"black","height":"30px","line-height":"30px","vertical0-align":"middle","width":"95%","text-align":"center","margin-right":"40px","padding":"0"});
				$(form).append(input).appendTo(header);
				$(input).change(function() {
					var filter = $(this).val();
					if (filter) {
						$matches = $(list).find("a:Contains(" + filter + ")").parent();
						$("li", list).not($matches).slideUp();
						$matches.slideDown();
					} else {
						$(list).find("li").slideDown();
					}
					return false;
				}).keyup(function() {
					$(this).change();
				});
			}
			$(function() {
				filterList($("#form"), $("#menu_list"));
			});
			})(jQuery);	
</script>
	</head>
	<body style="background-color:#EEEEEE;overflow:hidden;">
	<!-- nav -->
	<div id="sea_nav-nav" style="display:none;margin:0;">
					<ul id="sea_nav-main-nav">
						<li>
						<div id="time" style="background-color:transparent;color:white;width:280px;padding-left:20px;font-size:16px;color:#fff"></div>
						</li>
						<li class="sea_nav-active"><a href="#">Home</a></li>
						<li class="sea_nav-dropdown">
							<a href="#">Pages <i class="icon-angle-down"></i></a>
							<ul class="sea_nav-submenu">
								<li><a href="#">Link 1</a></li>
								<li><a href="#">Link 2</a></li>
								<li><a href="#">Link 3</a></li>
								<li class="sea_nav-dropdown">
									<a href="#">Dropdown <i class="icon-angle-right"></i></a>
									<ul class="sea_nav-submenu">
										<li><a href="#">Link 1</a></li>
										<li><a href="#">Link 2</a></li>
										<li><a href="#">Link 3</a></li>
										<li class="sea_nav-dropdown">
											<a href="#">Dropdown <i class="icon-angle-right"></i></a>
											<ul class="sea_nav-submenu">
												<li><a href="#">Link 1</a></li>
												<li><a href="#">Link 2</a></li>
												<li><a href="#">Link 3</a></li>
												<li><a href="#">Link 4</a></li>
											</ul>
										</li>
									</ul>
								</li>
								<li><a href="#">Link 5</a></li>
							</ul>
						</li>
						<li><a href="#">Contact</a></li>
						<li><a href="#">About</a></li>
					</ul>
				</div> <!-- nav close -->
				
	<div id="sea_menu" class="sea_menu white" style="display:none;">
		<div class="sea_menu-header" id="form"></div>
		<ul id="menu_list">
		   <li class="active"><a href="#"><i ><span class=" icon-user"></span></i>系统管理 </a>
				<ul class="submenu">
					<li><a href="#"><i ><span class=" icon-asterisk"></span></i>用户管理</a></li>
					<li><a href="#"><i ><span class=" icon-asterisk"></span></i>机构管理 </a></li>
					<li><a href="#"><i ><span class=" icon-asterisk"></span></i>部门管理 </a></li>
					<li><a href="#"><i ><span class=" icon-asterisk"></span></i>角色管理 </a></li>
					<li><a href="#"><i ><span class=" icon-asterisk"></span></i>权限管理 </a></li>
				</ul>
			</li>
			<li><a href="#"><i ><span class="  icon-leaf"></span></i>信息录入 </a>
				<ul class="submenu">
					<li><a href="#"><i ><span class=" icon-asterisk"></span></i>单项录入</a></li>
					<li><a href="#"><i ><span class=" icon-asterisk"></span></i>批量录入 </a></li>
				</ul>
			</li>
		   	<li><a href="#"><i ><span class="  icon-search"></span></i>信息查询 </a>
				<ul class="submenu">
					<li><a href="#"><i ><span class=" icon-asterisk"></span></i>特征查询</a></li>
					<li><a href="#"><i ><span class=" icon-asterisk"></span></i>分类查询 </a></li>
				</ul>
			</li>
		   	<li><a href="#"><i ><span class=" icon-file"></span></i>信息输出</a>
				<ul class="submenu">
					<li><a href="#"><i ><span class=" icon-asterisk"></span></i>信息打印</a></li>
					<li><a href="#"><i ><span class=" icon-asterisk"></span></i>批量导出 </a></li>
				</ul>
			</li>	
				<li><a href="#"><i ><span class="  icon-eye-open"></span></i>信息公告</a></li>
			</li>			
		</ul>
		<div class="sea_menu-footer" style="height:100%">
			&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>&nbsp;<br>
		</div>
	</div>
	<div id="viewport"></div>
	</body>
</html>