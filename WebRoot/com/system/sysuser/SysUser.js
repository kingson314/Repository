seajs.use(["BorderLayout", "FormLayout", "ViewLayout", "Dialog", "Grid", "Toolbar", "Ajax"],
function(BorderLayout, FormLayout, ViewLayout, Dialog, Grid, Toolbar, Ajax) {
	/** * 查询表单 ** */
	var cfgFormQuery = {
		items: [[{
			id: "name",
			label: "用户名",
			type: "textfield",
			isNull: true
		},
		{
			id: "mobilePhone",
			label: "电话号码",
			type: "textfield",
			isNull: true
		}], [ 
		{
			id: "email",
			label: "邮箱地址",
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
				value: "查询",
				click: function() {
					if (!formQuery.check()) {
						return false;
					}
					var params = formQuery.val();
					$(".grid").Grid("reload", params);
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
	var formQuery = FormLayout.create(cfgFormQuery);
	/** * 工具栏 ** */
	var cfgToolbar = {
		items: [{
			icon: "glyphicon glyphicon-refresh",
			value: "刷新",
			click: function() {
				$(".grid").Grid("reload", {});
				return false;
			}
		},
		{
			icon: "glyphicon glyphicon-plus",
			value: "新增",
			click: function() {
				formEdit("save");
				return false;
			}
		},
		{
			icon: "glyphicon glyphicon-pencil",
			value: "修改",
			click: function() {
				var selected = $('.grid').Grid('getSelected', 'id');
				if (selected.length != 1) {
					Dialog.alert({
						content: '请选择一条记录!'
					});
					return false;
				} else {
					Ajax.post("SysUser/get", {
						"id": selected
					},
					function(rs) {
						alert(JSON.stringify(rs))
						if (rs.success == true) {
							var val = rs.data;
							alert(JSON.stringify(rs))
							formEdit("update", val);
						}
					});
				}
				return false;
			}
		},
		{
			icon: "glyphicon glyphicon-eye-open",
			value: "查看",
			click: function() {
				var selected = $('.grid').Grid('getSelected', 'id');
				if (selected.length != 1) {
					Dialog.alert({
						content: '请选择一条记录!'
					});
					return false;
				} else {
					Ajax.post("SysUser/get", {
						"id": selected
					},
					function(rs) {
						if (rs.success == true) {
							var val = rs.data;
							formView(val);
						}
					});
				}
				return false;
			}
		},
		{
			icon: "glyphicon glyphicon-minus",
			value: "删除",
			click: function() {
				var selected = $('.grid').Grid('getSelected', 'id');
				if (selected.length == 0) {
					Dialog.alert({
						content: '请选择一条记录!'
					});
					return false;
				} else {
					Dialog.confirm({
						content: '是否删除?',
						confirmValue: "确定",
						confirm: function() {
							Ajax.post("SysUser/delete", {
								"id": selected
							},
							function(rs) {
								if (rs.success == true) {
									Dialog.alert({
										content: '删除成功!'
									});
								} else {
									Dialog.alert({
										content: '删除失败!'
									});
								}
								$(".grid").Grid("reload", {});
							});
						}
					});
				}
				return false;
			}
		},
		{
			icon: "glyphicon glyphicon-floppy-disk",
			value: "导出",
			css: {
				"display": "none"
			},
			click: function() {
				var params = {
					id: selected[0]
				};
				Ajax.post("SysUser/export", params,
				function(rs) {
					if (rs.success == true) {}
				});
				return false;
			}
		},
		{
			icon: "glyphicon glyphicon-wrench",
			value: "测试",
			css: {},
			click: function() {
				var params = {};
				Ajax.post("SysUser/test", params,
				function(rs) {
					if (rs.success == true) {}
				});
				return false;
			}
		}]
	};
	var toolbar = Toolbar.create(cfgToolbar);
	/** * 新增编辑表单 ** */
	function formEdit(opType, val) {
		var form, dialog;
		var cfgForm = {
			css: {
				border: 0
			},
			items: [[{
				id: "name",
				type: "textfield",
				label: "用户名",
				isNull: true
			},
			{
				id: "userAlias",
				type: "textfield",
				label: "用户别名",
				isNull: true
			}], [{
				id: "password",
				type: "textfield",
				label: "用户密码",
				isNull: true
			},
			{
				id: "sex",
				type: "textfield",
				label: "性别",
				isNull: true
			}], [{
				id: "birthday",
				type: "textfield",
				label: "出生日期",
				isNull: true
			},
			{
				id: "education",
				type: "textfield",
				label: "学历",
				isNull: true
			}], [{
				id: "mobilePhone",
				type: "textfield",
				label: "手机号码",
				isNull: true
			},
			{
				id: "officePhone",
				type: "textfield",
				label: "办公电话",
				isNull: true
			}], [{
				id: "email",
				type: "textfield",
				label: "邮箱地址",
				isNull: true
			},
			{
				id: "photoUrl",
				type: "textfield",
				label: "个人照片",
				isNull: true
			}],
			// 主键以及不为null字段须隐藏域，其他不显示的字段也应该隐藏域，待优化
			[{
				id: "id",
				type: "hidden"
			},
			{
				id: "state",
				type: "hidden"
			},
			{
				id: "createDate",
				type: "hidden"
			},
			{
				id: "modifyDate",
				type: "hidden"
			},
			{
				id: "version",
				type: "hidden"
			},
			{
				id: "ord",
				type: "hidden"
			}]]
		};
		form = FormLayout.create(cfgForm);
		form.val(val || {});
		Dialog.confirm({
			width: "80%",
			height: "80%",
			title: '用户管理',
			confirm: function() {
				if (!form.check()) {
					return false;
				}
				var url;
				var params = form.val();
				Ajax.post("SysUser/" + opType, params,
				function(rs) {
					if (rs.success == true) {
						Dialog.alert({
							content: '操作成功!'
						});
					} else {
						Dialog.alert({
							content: '操作失败！'
						});
					}
					$(".grid").Grid("reload", {});
				});
			},
			content: form.formLayout
		});
	};
	/** * 查看详情表单 ** */
	function formView(record) {
		var form, dialog;
		var cfgForm = {
			record: record,
			css: {
				"border": 0
			},
			items: [[{
				id: "name",
				label: "用户名"
			},
			{
				id: "userAlias",
				label: "用户别名"
			}], [{
				id: "password",
				label: "用户密码"
			},
			{
				id: "sex",
				label: "性别"
			}], [{
				id: "birthday",
				label: "出生日期"
			},
			{
				id: "education",
				label: "学历"
			}], [{
				id: "mobilePhone",
				label: "手机号码"
			},
			{
				id: "officePhone",
				label: "办公电话"
			}], [{
				id: "email",
				label: "邮箱地址"
			},
			{
				id: "photoUrl",
				label: "个人照片"
			}]]
		};
		form = ViewLayout.create(cfgForm);
		Dialog.alert({
			width: "80%",
			height: "80%",
			title: '用户管理',
			content: form.viewLayout
		});
	};
	/** * 页面布局 ** */
	var Border = BorderLayout.create({
		north: {
			height: 160,
			item: formQuery.formLayout
		},
		center: {
			north: {
				height: 35,
				item: toolbar.toolbar
			},
			center: {
				cls: "grid"
			}
		}
	});

	/** * 查询列表-行内操作 ** */
	gridOperation = {
		view: function(val) {
			var params = {
				id: val
			};
			Ajax.post("SysUser/get", params,
			function(rs) {
				if (rs.success == true) {
					var val = rs.data;
					formView(val);
				}
			});
		}
	}
	/** * 查询列表 ** */
	$(".grid").Grid({
		columns: [{
			align: "center",
			name: "id",
			label: "ID",
			width: "30",
			format: {
				type: "checkbox"
			}
		},
		{
			align: "center",
			name: "name",
			label: "用户名"
		},
		{
			align: "left",
			name: "userAlias",
			label: "用户别名"
		},
		{
			align: "left",
			name: "sex",
			label: "性别",
			format: {
				type: "json",
				content: {
					"0": "男",
					"1": "女"
				}
			}
		},
		{
			align: "left",
			name: "departmentId",
			label: "职位"
		},
		{
			align: "left",
			name: "birthday",
			label: "生日"
		},
		{
			align: "left",
			name: "mobilePhone",
			label: "手机号码"
		},
		{
			align: "left",
			name: "officePhone",
			label: "办公电话"
		},
		{
			align: "left",
			name: "email",
			label: "邮箱地址"
		},
		{
			align: "left",
			name: "education",
			label: "学历"
		},
		{
			align: "center",
			name: "photoUrl",
			label: "照片",
			format: function(val, record, col) {
				return "<a  onclick=\"gridOperation.view('" + record.id + "');\"><i class='glyphicon glyphicon-eye-open'></i></a>";
			}
		},
		{
			align: "left",
			name: "memo",
			label: "备注"
		}],
		ds: {
			url: "SysUser/list"
		},
		pageSizes: [1, 10, 20, 30, 40]
	});
});
