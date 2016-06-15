define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	var Component = require("Component");
	var Dialog = require("Dialog");
	/** * 模块私有数据 ** */
	/** * 类定义 ** */
	var Input = function(configs) {
		// 类的属性定义
		//this.configs = $.extend(true, {}, defaults, configs);
		//this._className="";
		// 初始化
		//this.init();
	};
	// 类公共方法
	Input.prototype = {
		//初始化函数
		init:function(){
			this.label = Component.createLabel(this.configs);
			// 控件封装
			this._input.addClass(this._className);
			// 控件类名设置
			Component.addClass(this._input, this.configs);
			// 控件样式设置
			Component.css(this._input, this.configs);
			// 控件默认值
			Component.val(this._input, this.configs);
			// 控件的属性设置
			Component.attr(this._input, this.configs);
			// 控件的事件绑定
			Component.bind(this._input, this.configs);
		},
		//检查函数
		check:function(configs){
			if(this.configs.isNull==false){
				if($.trim(this._input.val())==""){
					Dialog.create({
				        content: (this.configs.label||"")+this._lang.nullwarning
				     });
					return false;
				}
			}
			return true;
		},
		//白盒测试函数
		test:function(data){
			
		},
		//值获取或赋值函数
		val:function(data){
			if(data){
				this._input.val(data);
			}else{ 
				return this._input.val();
			}
		},
		//清空函数
		clear:function(){
			this._input.val("");
		},
		//设置焦点
		focus:function(){
			return Component.focus(this._input);
		},
		//显示 
		show:function(){
			return Component.show(this._input);
		},
		//隐藏
		hide:function(){
			return Component.hide(this._input);
		},
		//禁用
		disabled:function(){
			return Component.disable(this._input);
		},
		//启用
		enabled:function(){
			return Component.enabled(this._input);
		}
	};
	/** * 输出类对象 ** */
	exports.create = function() {
		return new Input();
	};
});
