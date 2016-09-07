seajs.use(["BorderLayout", "FormLayout","Ajax"],
function(BorderLayout, FormLayout,  Ajax) {
	/** * 查询表单 ** */
	var cfgForm = {
		"width": "380px",
		"height": "430px",
		css:{
			"box-shadow":"0 20px 50px #333",
			"border-radius": "4px",
			"margin":"0"
		},
		items: [[{
			id: "logo",
			type: "img",
			src:Global.basePath+"com/system/SysUser/css/images/logo.png",
			cls : "",
			css : {
				"height":"80px",
				"padding-left":"35%"
			},
			attr : {}
		}],[{
			id: "name",
			placeholder: "账号/邮箱/电话",
			type: "textfield",
			isNull: true
		}],
		[{
			id: "passord",
			placeholder: "请输入密码",
			type: "textfield",
			subtype:"password",
			isNull: true
		}], [{
			id: "remember",
			label: "自动登陆",
			type: "checkbox",
			checked:true,
			tdCss:{
				"text-align":"left"
			}
		}],[{
			type: "button",
			css: {
				"margin-top": "10px",
				"width":"100%"
			},
			value: "登陆",
			click: function() {
				if (!form.check()) {
					return false;
				}
				var params = form.val();
				 
				return false;
			}
		}], [{
			type: "link",
			css:{
				"margin-top":"10px",
				"text-align":"right"
			},items:[
		         {
						label : "忘记密码",
						imgCls:"glyphicon glyphicon-question-sign",
						imgAlign:"left",
						cls : "",
						css : {},
						attr : {},
						click : function(){
							alert();
						}
		         },{
						label : "注册新用户",
						imgCls:"glyphicon glyphicon-user",
						imgAlign:"left",
						cls : "",
						css : {},
						attr : {},
						click : function(){
							alert();
						}
		         }
			]
		}]]
	};
	var form = FormLayout.create(cfgForm);
	/** * 页面布局 ** */
	var Border = BorderLayout.create({
		north:{
			height:"15%"
		},
		east: { 
			css:{
			},
			width: "40%",
			item: form.formLayout
		},
		center: {
			css:{
			},
			 item:"<div class='sea_title'><h1>欢迎使用集成开发平台</h1></div>"
		},
		south:{
			height:35,
			css:{
				"position":"fixed",
				"left":"0",
				"bottom":"0",
				"line-height":"35px",
				"text-align":"center",
				"font-size":"12px",
				"background-color":"#003366",
				"filter":"alpha(opacity : 70)",
				"opacity":"0.7",
				"color":"#f8f8f8"
			},
			item:"<div>Copyright@FengGuoqu.All Rights Reserved</div>"
		}
	});
});
