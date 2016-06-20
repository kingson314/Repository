define(function(require, exports, module) {
  /** * 模块外部依赖 ** */
  require("./css/bootstrap-theme.css");
  require("./css/bootstrap.css");
  require("./css/bootstrap-table.css");
  require("./bootstrap-table.js");
  require("./bootstrap-table-zh-CN.js");
  var Component = require("Component");
  var Ajax = require("Ajax");
  /** * 模块私有数据 ** */
  var defaults = {
    classes: 'table table-hover',   //String
    height: undefined,   //Number
    undefinedText: '-',   //String
    striped: false,   //Boolean
    sortName: undefined,   //String
    sortOrder: 'asc',   //String
    iconsPrefix: 'glyphicon',   //String
    iconSize: undefined,   //String
    icons: {},   //Object
    columns: [],   //Array
    data: [],   //Array
    dataField: 'rows',   //String
    ajax: undefined,   //Function
    method: 'get',   //String
    cache: true,   //Boolean
    contentType: 'application/json',   //String
    dataType: 'json',   //String
    ajaxOptions: {},   //Object
    queryParams: function(params) {  //Function
      return params;
    }, 
    queryParamsType: 'limit',   //String
    responseHandler: function(res) {//Function
      return res;
    },   
    pagination: true,   //Boolean
    onlyInfoPagination: true,   //Boolean
    sidePagination: 'client',   //String
    pageNumber: 1,   //Number
    pageSize: 10,   //Number
    pageList: [10, 25, 50, 100],   //Array
    selectItemName: 'btSelectItem',   //String
    smartDisplay: true,   //Boolean
    'escape': false,   //Boolean
    search: false,   //Boolean
    searchOnEnterKey: false,   //Boolean
    strictSearch: false,   //Boolean
    searchText: '',   //String
    searchTimeOut: 500,   //Number
    trimOnSearch: true,   //Boolean
    showHeader: true,   //Boolean
    showFooter: false,   //Boolean
    showColumns: false,   //Boolean
    showRefresh: false,   //Boolean
    showToggle: false,   //Boolean
    showPaginationSwitch: true,   //Boolean
    minimumCountColumns: 1,   //Number
    idField: undefined,   //String
    uniqueId: undefined,   //String
    cardView: false,   //Boolean
    detailView: false,   //Boolean
    detailFormatter: function(index, row, element) {  //Function
      return '';
    }, 
    searchAlign: 'right',   //String
    buttonsAlign: 'right',   //String
    toolbarAlign: 'left',   //String
    paginationVAlign: 'bottom',   //String
    paginationHAlign: 'right',   //String
    paginationDetailHAlign: 'left',   //String
    paginationPreText: '<',   //String
    paginationNextText: '>',   //String
    clickToSelect: false,   //Boolean
    singleSelect: false,   //Boolean
    'toolbar': undefined,   //String | Node
    checkboxHeader: true,   //Boolean
    maintainSelected: false,   //Boolean
    sortable: true,   //Boolean
    silentSort: true,   //Boolean
    rowStyle: {},   //Function
    rowAttributes: {},   //Function
    locale: undefined,   //string
  };
  /** * 模块私有方法 ** */

  /** * 类定义 ** */
  var Table = function(configs) {// 类的属性定义
    this.configs = $.extend(true, {},defaults, configs);
    this.configs.url = Ajax.getUrl(this.configs.url);// 初始化
	alert(JSON.stringify(this.configs));
    this.table = $("<div sytle='width:100%;height:100%;'></div>").bootstrapTable(this.configs);
  };
  // 类公共方法
  Table.prototype = {

};
  /** * 输出类对象 ** */
  exports.create = function(configs) {
    return new Table(configs);
  };
});