define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	var Component = require("Component");
	require("./css/tablayout.css");
	var BorderLayout=require("BorderLayout");
	var Navbar=require("Navbar");
	var Iframe=require("Iframe");
	/** * 模块私有数据 ** */
	var defaults = {
		id : "",
		cls : "",
		css : {},
		attr : {	},
		position:"top",//title的位置，top,right,bottom,left
		items:[{
		       label:"",
		       active:false,
		       img:null,//Img.js:Img.img
		       click:null,
		       url:"",//内容url,不为空时，内嵌一个iframe
		       item:""//内容jquery对象
		} ]
	};
	/** * 模块私有方法 ** */
	var self = {
		init : function(me) {
			// 导航封装
			var cfgNavbar={};
			cfgNavbar.items=me.configs.items;
		    me.navbar=Navbar.create(cfgNavbar).navbar;
		    var cftBorderLayout = {
					id: me.configs.id,
					width: "100%",
					height: "100%",
					center: {
					}
				};
		    switch (me.configs.position.toLowerCase()) {
					case "top":
					//case:"north":
						cftBorderLayout.north={
								height:30,
								item:me.navbar
							};
					break;
					case "right":
					//case:"east":
						cftBorderLayout.east={
								width:30,
								item:me.navbar
							};
					break;
					case "bottom":
					//case:"south":
						cftBorderLayout.south={
								height:30,
								item:me.navbar
							};
					break;
					case "left":
					//case:"west":
						cftBorderLayout.west={
								width:30,
								item:me.navbar
							};
					break;
					default:
					break;
		    };
		    this.tabLayout=BorderLayout.create(cftBorderLayout).borderLayout;
		}
	};
	/** * 类定义 ** */
	var TabLayout = function(configs) {
		// 类的属性定义
		this.configs = $.extend(true, {}, defaults, configs);
		// 初始化
		self.init(this);
	};
	// 类公共方法
	TabLayout.prototype = {
		//检查函数
		check:function(configs){
		
		},
		//白盒测试函数
		test:function(data){
			
		}
	};
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new TabLayout(configs);
	};
});
