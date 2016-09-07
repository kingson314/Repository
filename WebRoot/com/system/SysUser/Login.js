seajs.use(["BorderLayout", "FormLayout","Ajax"],
function(BorderLayout, FormLayout,  Ajax) {
	/** * 查询表单 ** */
	var cfgForm = {
		"width": "380px",
		"height": "430px",
		css:{
			"box-shadow":"0 20px 50px #333",
			"border-radius": "4px"
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
			placeholder: "邮箱/电话/账号",
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
			label: "记住账户",
			type: "checkbox",
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
		}]]
	};
	var form = FormLayout.create(cfgForm);
	/** * 页面布局 ** */
	var Border = BorderLayout.create({
		north:{
			height:"15%"
		},
		east: {
			width: "60%",
			item: form.formLayout
		},
		center: {
			 
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
			item:"<div>Copyright@kingson.All Rights Reserved</div>"
		}
	});
});
