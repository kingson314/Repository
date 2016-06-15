define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	require("./css/navbar.css");
	var Component = require("Component");	

	/** * 模块私有数据 ** */
	var ClassName="sea_navbar";
	var defaults = {
		id : "",
		cls:"",
		items:[
			{
				label:"",
				url:"#",
				css:{},
				img:null,//Img.js:Img.img
				active:false,
				click:null
			}
		]
	};
	 
	/** * 类定义 ** */
	var Navbar  = function(configs) {
		// 类的属性定义
		this.configs = $.extend(true, {}, defaults, configs);
		// 初始化
		this.navbar=$("<div></div>");
		if(this.configs.cls!=""){
			this.navbar.addClass(ClassName+"_"+this.configs.cls);
		}else{
			this.navbar.addClass(ClassName);
		}
		//控件类名设置
		Component.addClass(this.navbar,this.configs);
		//控件样式设置
		Component.css(this.navbar,this.configs);
		//控件默认值
		Component.val(this.navbar,this.configs);
		//控件的属性设置
		Component.attr(this.navbar,this.configs);
		var ul=$("<ul></ul>").appendTo(this.navbar);
		var liLen=this.configs.items.length;
		var liWidth=100/liLen+"%";
		for (var i = 0; i < liLen; i++) {
			var item=this.configs.items[i];
			var li=$("<li></li>").appendTo(ul).css("width",liWidth);
			if(!item.css){
				item.css={};
			}
			if(!item.css.width)item.css["width"]=liWidth;
			li.css(item.css);
			if(item.active==true){
				li.addClass("active");
			}
			var a=$("<a></a>").append("<span>"+item.label+"</span>").click(function(){
				$(this).parent().siblings().removeClass("active");
				$(this).parent().addClass("active");
			}).appendTo(li);
			if(item.img){
				a.append(item.img)
			}
			if(item.click){
				a.bind("click",item.click);
				a.attr("href","#");
			}
			if(item.url){
				a.attr("href",item.url);
			}
		}
	};
	// 类公共方法
	Navbar.prototype = {
			css:function(obj,css){
				
			}
	};
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new Navbar(configs);
	};
});
