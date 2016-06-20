define(function(require,exports,module){
 ;(function($,window,document){
 	var pluginName = 'dialogBox',
 		defaults = {
 			width: null, //弹出层宽度
 			height: null,  //弹出层高度
 			zIndex: 99999,  //弹出层定位层级
 			confirm: function(){}, //点击确定后回调函数
 			cancel: function(){},  //点击取消后回调函数，默认关闭弹出框
 			title: '',  //标题内容，如果不设置，则连同关闭按钮（不论设置显示与否）都不显示标题
 			content: ''  //正文内容，可以为纯字符串，html标签字符串，以及URL地址，当content为URL地址时，将内嵌目标页面的iframe。
 		};
 	function DialogBox(element,options){
 		this.element = element;
 		this.settings = $.extend({}, defaults, options);
 		this.init();		
 	}
 	DialogBox.prototype = {	
 		//初始化弹出框
 		init: function(){
 			var self = this,
 			element = this.element;
 			self.render(element);
 			self.setStyle();
 			self.show();
 			self.trigger(element);
 		},
 		//创建弹出框
 		create: function(element){
 			var self = this,
 				$this = $(element),
 				dialogHTML = [];
 					dialogHTML[0] = '<section class="dialog-box"><div class="dialog-box-container"><div class="dialog-box-title">'+ self.settings.title + '<span class="dialog-box-close">×</span></div><div class="dialog-box-content"></div>';
 					dialogHTML[1] = '<div class="dialog-btn"><span class="dialog-btn-cancel">取消</span><span class="dialog-btn-confirm">确定</span></div></div></section>';
 				dialogHTML[2] = '<div id="dialog-box-mask"></div>';
 			return dialogHTML;	
 		},
 		//渲染弹出框
 		render: function(element){
 			var self = this,
			$this = $(element),
			dialogHTML = self.create($this),
			$content = self.settings.content;
 			$this.replaceWith(dialogHTML[0] + dialogHTML[1]);
 			if(typeof($content) === 'object'){
 				$content.appendTo('.dialog-box-content');
 			}else{
 				$('.dialog-box-content').append($content);
 			}
 			$('body').append(dialogHTML[2]);
 		},
 		//显示弹出框
 		show: function(){
 			$('.dialog-box').css({display:'block'});
 			setTimeout(function(){
 				$('.dialog-box').addClass('show');
 			},50)
 			$('#dialog-box-mask').show();
 		},
 		//隐藏弹出框
 		hide: function(element){
 			var $this = $(element),
 				$dialogBox = $('.dialog-box');
 			$dialogBox.removeClass('show');
 			setTimeout(function(){
 				$dialogBox.replaceWith('<div id="' + $this.attr('id') + '"></div/>');
 				$('#dialog-box-mask').remove();
 			},150)
 		},
 		//设置弹出框样式
 		setStyle: function(){
 			var self = this,
 				$dialog = $('.dialog-box'),
 				$container = $('.dialog-box-container'),
 				$content = $('.dialog-box-content'),
 				$mask  = $('#dialog-box-mask'),
 				$dialogBtn=$(".dialog-btn");
 			//弹出框外框样式
 			$dialog.css({
 				width: function(){
 					if(self.settings.width){
 						return self.settings.width + 'px';
 					}else{
 						return;
 					}
 				},
 				height: function(){
 				},
 				'margin-top': function(){
 					var height;
 						height = self.settings.height;
 					return -Math.round(height/2) + 'px';
 				},
 				'margin-left': function(){
 					var width = $(this).width();
 					return -Math.round(width/2) + 'px';
 				},
 				'z-index': self.settings.zIndex
 			});
 			//弹出框内层容器样式
 			$container.css({
 				width: function(){
 					if(self.settings.width){
						return self.settings.width + 'px';
 					}else{
 						return;
 					}
 				},
 				height: function(){
 					if(self.settings.height){
 						return self.settings.height+ 'px';
 					}else{
 						return;
 					}
 				},
 			});
 			//弹出框内容样式
 			$content.css({
 				width: function(){
 					if(self.settings.width){
 						return self.settings.width + 'px';
 					}else{
 						return;
 					}
 				},
 				height: function(){
 				}
 			});
 			//遮罩层样式
 			$mask.css({
 				height: $(document).height() + 'px'
 			});
 		},
 		//弹出框触屏器(系列事件)
 		trigger: function(element,event){
 			var self = this,
			$this = $(element);
 			$('.dialog-box-close,#dialog-box-mask,.dialog-btn-cancel,.dialog-btn-confirm').on('click',function(){
 				self.hide($this);
 			});
 			$(document).keyup(function(event){
 				if(event.keyCode === 27){
 					self.hide($this);
 				}
 			});
 			if($.isFunction(self.settings.confirm)){
 				$('.dialog-btn-confirm').on('click',function(){
 					self.settings.confirm();
 				})
 			}
 			if($.isFunction(self.settings.cancel)){
 				$('.dialog-btn-cancel').on('click',function(){
 					self.settings.cancel();
 				})
 			}
 		}
 	};
 	$.fn[pluginName] = function(options) {
        this.each(function() {
            if (!$.data(this, "plugin_" + pluginName)) {
                $.data(this, "plugin_" + pluginName, new DialogBox(this, options));			
			}
        });
		return this;
    };
 })(jQuery,window,document)
});