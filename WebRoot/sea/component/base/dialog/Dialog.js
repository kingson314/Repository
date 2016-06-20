define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	require.async("./css/dialog.css");
	var ButtonGroup = require("ButtonGroup"); 
	var Component = require("Component");
	/** * 模块私有数据 ** */
	var  defaults = {
			id:"",
 			width: "400", //弹出层宽度
 			height: "200",  //弹出层高度
 			confirm: function(){}, //点击确定后回调函数
 			cancel: function(){},  //点击取消后回调函数，默认关闭弹出框
 			title: '提示',  //标题内容，如果不设置，则连同关闭按钮（不论设置显示与否）都不显示标题
 			content: ''  //正文内容，可以为纯字符串，html标签字符串，以及URL地址，当content为URL地址时，将内嵌目标页面的iframe（未实现）。
	    };
	/** * 模块私有方法 ** */
	 var self={
	 	init:function(me){
	 		me.dialog=$("<div></div>").addClass(me._className).css({
								  "width":Component.getSize(me.configs.width),
								  "height":Component.getSize(me.configs.height)
								});
	 		me.title=$("<div><span class='"+me._className+"_title_icon "+"glyphicon glyphicon-leaf'></span>"+me.configs.title+"</div>").addClass(me._className+"_title")
	 						.append("<span class='"+me._className+"_title_btn "+"glyphicon glyphicon-remove'></span>")
	 						.appendTo(me.dialog);
	 		me.title.find("."+me._className+"_title_btn").click(function(){
	 			me.hide();
	 		});
	 		me.content=$("<div></div>").addClass(me._className+"_content")
	 								.append(me.configs.content)
	 								.appendTo(me.dialog);
			var cfgBtnGroup = {
					 cls:me._className+"_buttonGroup",
					  separatorWidth:0,
					  items: [{
					  	cls:me._className+"_buttonGroup_confirm",
					    value: "确定",
					    click: function() {
					    	me.configs.confirm();
					    	me.hide();
					    }
					  }, {
					  	cls:me._className+"_buttonGroup_cancel",
					    value: "取消",
					    click: function() {
					    	me.configs.cancel();
					    	me.hide();
					    }
					  }]
					};
			me.buttonGroup=ButtonGroup.create(cfgBtnGroup).buttonGroup.appendTo(me.dialog);	 		
	 		me.mask=$("<div></div>").addClass(me._className+"_mask");
	 		$("body").append(me.dialog).append(me.mask);
	 		$(document).keyup(function(event){
 				if(event.keyCode === 27){
 					me.hide();
 				}
 			});
 			
	 		//重排
	 		me.dialog.css({
				  "margin-top":Component.getSize(-Math.round(me.dialog.height()/2)),
				  "margin-left":Component.getSize(-Math.round(me.dialog.width()/2))
	 		});
	 		me.content.height(me.dialog.height()-me.title.height()-me.buttonGroup.height());
			me.content.css("line-height",Component.getSize(me.content.height()));
	 	}
	 }
	/** * 类定义 ** */
	var Dialog = function(configs) {
		// 类的属性定义
		this.configs = $.extend(true, {}, defaults, configs);
		this._className="sea_dialog";
		// 初始化
		self.init(this);
	};
	// 类公共方法
	Dialog.prototype = {
		alert:function(){
			this.dialog.show();
			this.dialog.find("."+this._className+"_buttonGroup_cancel").hide()
			this.mask.show();
			return this.dialog;
		},
		confirm:function(){
			this.dialog.show();
			this.mask.show();
			return this.dialog;
		},		
		hide:function(){
			this.dialog.remove();
	 		this.mask.remove();
		},
		//白盒测试函数
		test:function(data){
		}
	};
	/** * 输出类对象 ** */
	exports.alert = function(configs) {
		return new Dialog(configs).alert();
	};
	exports.confirm = function(configs) {
		return new Dialog(configs).confirm();
	};
});
