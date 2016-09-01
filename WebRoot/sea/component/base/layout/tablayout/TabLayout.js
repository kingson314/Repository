define(function(require, exports, module) {
	/** * 模块外部依赖 ** */
	require.async("./css/tabLayout"+Cookie.theme+".css");
	var Component = require("Component"); 
	/** * 模块私有数据 ** */
	var defaults = {
			id:"",
			align:"0",//横排：horizontal  或 0; 竖排：vertical 或 1
			cls : "",
			width:"100%",
			height:"100%",
			css : {},
			attr : {},
			separatorWidth:null,
			items:[{
				id : "",
				value : "",
				cls : "",
				css : {},
				attr : {},
				icon:null,
				events : {
					//click : null
				},
				content:null
			}]
	};
	/** * 模块私有方法 ** */
	var self = {
		init : function(me) {
			me.tabLayout=$("<div></div>").addClass(me._className).mouseleave(function(){
				me.tabLayout.hide();
			});
			me.tab=$("<ul></ul>").appendTo(me.tabLayout);
			me.title=[];
			me.content=[];
			$.each(me.configs.items,function(index,item){
				var li;
				if(item.icon){
					li=$("<li></li>").append("<a href='#'><i  class='"+item.icon+"'></i>&nbsp;"+item.value+"</a>").appendTo(me.tab);
				}else{
					li=$("<li></li>").append("<a href='#'>"+item.value+"</a>").appendTo(me.tab);
				}
				me.title.push(li);
				if(me.configs.align=="0"||me.configs.align=="horizontal"){
					li.css("display","inline");
					if(me.configs.separatorWidth)li.css("margin-ight",me.configs.separatorWidth);
				}else{
					if(me.configs.separatorWidth)lli.css("margin-bottom",me.configs.separatorWidth);
				}
				// 控件类名设置
				Component.addClass(li.find("a"), item);
				// 控件样式设置
				Component.css(li.find("a"), item);
				// 控件的属性设置
				Component.attr(li.find("a"), item);
				// 控件的事件绑定
				Component.bind(li.find("a"), item);
				var content
				if(item.content){
					content=$("<div></div>").addClass(me._className+"_content").append(item.content).appendTo(me.tabLayout);
					if(index>0){
						content.hide();
					}
					setTimeout(function(){
						content.css({width:"100%",height:me.tabLayout.height()-me.tab.height()})
					},100);
				}
				me.content.push(content);
				
				li.find("a").hover(function(){
					$("."+me._className+"_content").hide();
					$("."+me._className+"_content:eq("+index+")").show();
				},function(){
				 
				});
			});
			
			me.tab.append("<li style='display:inline;'><span class='" + me._className+ "_title_btn glyphicon glyphicon-remove'></span></li>")
			me.tab.find("." + me._className + "_title_btn").click(function() {
				me.tabLayout.hide()
			});
			// 控件类名设置
			Component.addClass(me.tabLayout, me.configs);
			// 控件样式设置
			Component.css(me.tabLayout, me.configs);
			// 控件的属性设置
			Component.attr(me.tabLayout, me.configs);
		}
	};
	/** * 类定义 ** */
	var TabLayout = function(configs) {
		// 类的属性定义
		this.configs = $.extend(true, {}, defaults, configs);
		// 初始化
		// 类的属性定义
		this.configs=$.extend(true,{},defaults,configs);
		this._className="sea_tabLayout";
		//初始化
		self.init(this);
	};
	// 类公共方法
	TabLayout.prototype = {
		 reload:function(i,content){
			 this.content[i].empty().append(content);
		 }
	};
	/** * 输出类对象 ** */
	exports.create = function(configs) {
		return new TabLayout(configs);
	};
});
