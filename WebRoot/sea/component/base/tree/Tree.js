define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	var Component = require("Component");
	require("./css/tree.css");
	require("./jquery.ztree.all-3.5.min");
	/** * 模块私有数据 ** */
	var defaults = {
			id: "",
			cls : "",
			css : "",
			treeId: "",
			treeObj: null,
			async: {
				autoParam: [],
				//contentType: "application...",
				dataFilter: null,
				dataType : "json",
				enable : true,
				otherParam: [],
				type: "post",
				url: ""
			},
			callback: {
				beforeAsync: null,
				beforeCheck: null,
				beforeClick: null,
				beforeCollapse: null,
				beforeDblClick: null,
				beforeDrag: null,
				beforeDragOpen: null,
				beforeDrop: null,
				beforeEditName: null,
				beforeExpand: null,
				beforeMouseDown: null,
				beforeMouseUp: null,
				beforeRemove: null,
				beforeRename: null,
				beforeRightClick: null,
				onAsyncError: null,
				onAsyncSuccess: null,
				onCheck: null,
				onClick: null,
				onCollapse: null,
				onDblClick: null,
				onDrag: null,
				onDragMove: null,
				onDrop: null,
				onExpand: null,
				onMouseDown: null,
				onMouseUp: null,
				onNodeCreated: null,
				onRemove: null,
				onRename: null,
				onRightClick: null
			},
			check: {
				autoCheckTrigger: false,
				chkboxType: {
					"Y": "ps",
					"N": "ps"
				},
				chkStyle: "checkbox",
				enable: false,
				nocheckInherit: false,
				chkDisabledInherit: false,
				radioType: "level"
			},
			data: {
				keep: {
					leaf: false,
					parent: false
				},
				key: {
					checked: "checked",
					children: "children",
					name: "name",
					title: "",
					url: "url"
				},
				simpleData: {
					enable: true,
					idKey : "id",
					pIdKey : "parentId",
					rootPId : ""
				}
			},
			edit: {
				drag: {
					autoExpandTrigger: true,
					isCopy: true,
					isMove: true,
					prev: true,
					next: true,
					inner: true,
					borderMax: 10,
					borderMin: -5,
					minMoveSize: 5,
					maxShowNodeNum: 5,
					autoOpenTime: 500
				},
				editNameSelectAll: false,
				enable: false,
				removeTitle: "remove",
				renameTitle: "rename",
				showRemoveBtn: true,
				showRenameBtn: true
			},
			view: {
				addDiyDom: null,
				addHoverDom: null,
				autoCancelSelected: true,
				dblClickExpand: true,
				expandSpeed: "fast",
				fontCss: {},
				nameIsHTML: false,
				removeHoverDom: null,
				selectedMulti: true,
				showIcon: true,
				showLine: true,
				showTitle: true,
				txtSelectedEnable: false
			}
		}

	/** * 模块私有方法 ** */
	var self = {
		init : function(me) {
			me.tree=$("<ul id='"+me.configs.id+"' class='ztree'></ul>");
			$.fn.zTree.init(me.tree, me.configs);
		}
	};
	/** * 类定义 ** */
	var Tree = function(configs) {
		// 类的属性定义
		this.configs = $.extend(true, {}, defaults, configs);
		// 初始化
		self.init(this);
	};
	// 类公共方法
	Tree.prototype = {
			getTree:function(){
		 		return $.fn.zTree.getZTreeObj(this.configs.id);
			}
	};
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new Tree(configs);
	};

});
