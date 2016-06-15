define(function(require, exports, module) {
	/*** 模块外部依赖 ***/
	var Lang=require("./Textfield.lang.js");
	var Component = require("Component");
	
	/** * 模块私有数据 ** */
	var ClassName="sea_textfield";
	//默认配置
	var defaults = {
		id:"",
		validator:'char',
		label:"",
		labelCss:{},
		labelAttr:{},
		value:"",
		isNull:true,
		cls:"",
		css:{},
		attr:{disabled:false,maxLen:0},
		events:{
			click:null,
			change:null
		}
	};
	/** * 模块私有方法 ** */
	var self = {
		init : function(me) {
				me.label=Component.createLabel(me.configs);
				//控件封装
				me.textfield=$("<input type='text'/>").addClass(ClassName);
				//控件类名设置
				Component.addClass(me.textfield,me.configs);
				//控件样式设置
				Component.css(me.textfield,me.configs);
				//控件默认值
				Component.val(me.textfield,me.configs);
				//控件的属性设置
				Component.attr(me.textfield,me.configs);
				//控件的事件绑定
				Component.bind(me.textfield,me.configs);
		}
	};
	/** * 类定义 ** */
	var Textfield = function(configs) {
		 //类的属性定义
		this.configs=$.extend(true,{},defaults,configs);
		//初始化
		self.init(this);
	};
	//类公共方法
	Textfield.prototype={
		//检查函数
		check:function(){
			if(this.configs.isNull==false){
				if($.trim(this.textfield.val())==""){
					alert(this.configs.label||""+Lang.nullwarning);
					return false;
				}
			}
			return true;
		},
		//值获取或赋值函数
		val:function(data){
			if(data){
				this.textfield.val(data);
			}else{ 
				return this.textfield.val()
			}
		},
		//清空函数
		clrear:function(){
			return Component.clrear(this.textfield);
		},
		//设置焦点
		focus:function(){
			return Component.focus(this.textfield);
		},
		//隐藏
		hide:function(){
			return Component.hide(this.textfield);
		},
		//隐藏
		show:function(){
			return Component.show(this.textfield);
		},
		//disabled
		disable:function(){
			return Component.disable(this.textfield);
		},
		//隐藏
		enable:function(){
			return Component.enable(this.textfield);
		}
	};
	/*** 输出类对象 ***/
	exports.create = function(configs) {
		return new Textfield(configs);
	};
});
