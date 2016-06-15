var optionsTable = {
	tableId: "menu-tableId",
	url: getUrl("systemvar/list"),
	cardview: false,
	columns: [{
		field: 'module',
		title: '模块名称',
		align: 'center',
		valign: 'middle',
		sortable: true
	},
	{
		field: 'function',
		title: '功能名称',
		align: 'center',
		valign: 'middle',
		sortable: true
	},
	{
		field: 'useTimes',
		title: '使用次数',
		align: 'right',
		valign: 'middle'
	},
	{
		field: 'value',
		title: '参数值',
		align: 'left',
		valign: 'middle'
	}],
	showAdd:false,
	showEdit:false,
	showView:false,
	showDelete:false,
	showExport:false
}
$(".main-center").jtable(optionsTable);