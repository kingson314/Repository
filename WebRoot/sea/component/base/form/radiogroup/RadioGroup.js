define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	var Component = require("Component");
	
	/** * 模块私有数据 ** */
	var defaults = {
			id:"",
			name:"",//必须有name
			align:"0",//横排：horizontal  或 0; 竖排：vertical 或 1
			cls : "",
			css : {},
			attr : {	},
			items:[{
				//id : "",
				value : "",
				checked:false,
				cls : "",
				css : {},
				attr : {	},
				events : {
					//click : null
				}
			}]
	};
	/** * 模块私有方法 ** */
	var self = {
		init : function(me) {
		me.radioGroup=$("<div></div>").addClass(me._className);
		me.radios=[];
		var ul=$("<ul></ul>").appendTo(me.radioGroup);
		$.each(me.configs.items,function(index,item){
			var li=$("<li></li>").appendTo(ul);
			if(me.configs.align=="0"||me.configs.align=="horizontal"){
				li.css("display","inline");
			}
			item.labelCls="sea_radioLabel";
			item.id=me.configs.id+Session.getSeq();
			var radio=$("<input id='"+item.id+"' type='radio' name='"+(me.configs.name||me.configs.id)+"' value='"+item.value+"'/>").appendTo(li);
			if(item.checked){
				radio.attr("checked",item.checked);
			}
			me.radios.push(radio);
			li.append("&nbsp;");
			var label=Component.createLabel(item).appendTo(li);
			// 控件类名设置
			Component.addClass(radio, item);
			// 控件样式设置
			Component.css(radio, item);
			// 控件的属性设置
			Component.attr(radio, item);
			// 控件默认值
			Component.val(radio, item);
			// 控件的事件绑定
			Component.bind(radio, item);
		});
		// 控件类名设置
		Component.addClass(me.radioGroup, me.configs);
		// 控件样式设置
		Component.css(me.radioGroup, me.configs);
		// 控件的属性设置
		Component.attr(me.radioGroup, me.configs);
		}
	};
	/** * 类定义 ** */
	var RadioGroup = function(configs) {
		// 类的属性定义
		this.configs = $.extend(true, {}, defaults, configs);
		// 初始化
		// 类的属性定义
		this.configs=$.extend(true,{},defaults,configs);
		this._className="sea_radiogroup";
		//初始化
		self.init(this);
	};
	// 类公共方法
	RadioGroup.prototype = {
		val:function(data){
			if(data){
				$.each(this.radios,function(index,item){
					item.removeAttr("checked");
					if(item.val()==data){
						item.click();
						item.attr("checked",true);
					}
				});
			}else{
				for(var i=0;i<this.radios.length;i++){
					if(this.radios[i].is(':checked')){
						return this.radios[i].val();
					}
				}
				return "";
			}
		},
		clear:function(){
			this.radioGroup.find("input[type=radio]").removeAttr("checked");
		}
	};
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new RadioGroup(configs);
	};
});
