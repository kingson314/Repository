seajs.use(["BorderLayout", "FormLayout","Ajax"],
function(BorderLayout, FormLayout,  Ajax) {
	/** * 查询表单 ** */
	var cfgForm = {
		items: [[{
			id: "name",
			label: "账号",
			type: "textfield",
			isNull: true
		}],
		[{
			id: "passord",
			label: "密码",
			type: "textfield",
			isNull: true
		}], [{
			type: "buttongroup",
			css: {
				"margin-top": "10px"
			},
			colspan: 2,
			items: [{
				icon: "icon-ok",
				value: "登陆",
				click: function() {
					if (!form.check()) {
						return false;
					}
					var params = form.val();
					 
					return false;
				}
			}]
		}]]
	};
	var form = FormLayout.create(cfgForm);
	/** * 页面布局 ** */
	var Border = BorderLayout.create({
		east: {
			width: 360,
			item: form.formLayout
		},
		center: {
			 
		}
	});
});
