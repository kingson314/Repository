define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	require("./css/bootstrap-theme.css");
	require("./css/bootstrap.css");
	require("./css/bootstrap-table.css");
	require("./bootstrap-table.js");
	require("./bootstrap-table-zh-CN.js");
	var Component = require("Component");
    var Ajax=require("Ajax");
	/** * 模块私有数据 ** */
	var defaults = {
			id : '',
			method : 'get',
			url : '',
			cache : false,
			height : 400,
			striped : true,
			pagination : true,
			pageSize : 50,
			pageList : [ 10, 25, 50, 100, 200 ],
			search : true,
			showColumns : true,
			showRefresh : true,
			minimumCountColumns : 2,// 表格显示/隐藏列表时可设置最小隐藏的列数
			clickToSelect : true,
			columns : [],
			cardview : false
	};
	/** * 模块私有方法 ** */
	 
	/** * 类定义 ** */
	var Table = function(configs) {
		// 类的属性定义
		this.configs = $.extend(true, {}, defaults, configs);
		this.configs.url=Ajax.getUrl(this.configs.url);
		// 初始化
		this.table=$("<div sytle='width:100%;height:100%;'></div>").bootstrapTable(this.configs);
	};
	// 类公共方法
	Table.prototype = {
		 
	};
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new Table(configs);
	};
});
