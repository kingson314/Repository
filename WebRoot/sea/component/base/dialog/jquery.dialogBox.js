define(function(require,exports,module){
 ;(function($,window,document){
 	var pluginName = 'dialogBox',
 		defaults = {
 			width: null, //弹出层宽度
 			height: null,  //弹出层高度
 			autoSize: true,  //是否自适应尺寸,默认自适应
 			autoHide: false,  //是否自自动消失，配合time参数共用
 			time: 3000,  //自动消失时间，单位毫秒
 			zIndex: 99999,  //弹出层定位层级
 			hasMask: false,  //是否显示遮罩层
 			hasClose: false,  //是否显示关闭按钮
 			hasBtn: false,  //是否显示操作按钮，如取消，确定
 			confirmValue: null,  //确定按钮文字内容
 			confirm: function(){}, //点击确定后回调函数
 			cancelValue: null,  //取消按钮文字内容
 			cancel: function(){},  //点击取消后回调函数，默认关闭弹出框
 			effect: '', //动画效果：fade(默认),newspaper,fall,scaled,flip-horizontal,flip-vertical,sign,
 			type: 'normal', //对话框类型：normal(普通对话框),correct(正确/操作成功对话框),error(错误/警告对话框)
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
 				title =  self.settings.title,
 				hasBtn = self.settings.hasBtn,
 				hasMask = self.settings.hasMask,
 				hasClose = self.settings.hasClose,
 				confirmValue = self.settings.confirmValue,
 				cancelValue = self.settings.cancelValue,
 				dialogHTML = [];
 			if(!title){
 				dialogHTML[0] = '<section class="dialog-box"><div class="dialog-box-container"><div class="dialog-box-content"></div>';			
 			}else{
 				if(!hasClose){
					dialogHTML[0] = '<section class="dialog-box"><div class="dialog-box-container"><div class="dialog-box-title">'+ title + '</div><div class="dialog-box-content"></div>';
 				}else{					
 					dialogHTML[0] = '<section class="dialog-box"><div class="dialog-box-container"><div class="dialog-box-title">'+ title + '<span class="dialog-box-close">×</span></div><div class="dialog-box-content"></div>';
 				}
 			}
 			if(!hasBtn){
 				dialogHTML[1] = '</div></section>';
 			}else{
 				if(confirmValue && cancelValue){
 					dialogHTML[1] = '<div class="dialog-btn"><span class="dialog-btn-cancel">' + cancelValue + '</span><span class="dialog-btn-confirm">' + confirmValue + '</span></div></div></section>';
 				}else if(cancelValue){
 					dialogHTML[1] = '<div class="dialog-btn"><span class="dialog-btn-cancel">' + cancelValue + '</span></div></div></section>';
 				}else if(confirmValue){
 					dialogHTML[1] = '<div class="dialog-btn"><span class="dialog-btn-confirm">' + confirmValue + '</span></div></div></section>';
 				}else{
 					dialogHTML[1] = '<div class="dialog-btn"><span class="dialog-btn-cancel">取消</span><span class="dialog-btn-confirm">确定</span></div></div></section>';
 				}
 			}
 			if(!hasMask){
 				dialogHTML[2] = '';
 			}else{
 				dialogHTML[2] = '<div id="dialog-box-mask"></div>';
 			}
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
 				type = self.settings.type,
 				EFFECT = 'effect';
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
 					if(self.settings.height){
 						if(type === '' || type === 'normal'){
 							return self.settings.height + 'px';
 						}else if(type === 'error' || type === 'correct'){
 							return self.settings.height + 'px';
 						}
 					}else{
 						return;
 					}
 				},
 				'margin-top': function(){
 					var height;
 					if(type === '' || type === 'normal'){
 						height = self.settings.height;
 					}else if(type === 'error' || type === 'correct'){
 						height = self.settings.height;
 					}
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
 					if(self.settings.height){
 						return self.settings.height + 'px';
 					}else{
 						return;
 					}
 				}
 			});
 			//遮罩层样式
 			$mask.css({
 				height: $(document).height() + 'px'
 			});
 			//判断弹出框类型
 			switch(self.settings.type){
 				case 'correct':
 					$container.addClass('correct');
 					break;
 				case 'error':
 					$container.addClass('error');
 					break;
 				default:
 					$container.addClass('normal');;
 					break;
 			}
 			//弹出框多种动画效果
 			switch(self.settings.effect){
 				case 'newspaper':
 					$dialog.addClass(EFFECT + '-newspaper');
 					break;
 				case 'fall':
 					$dialog.addClass(EFFECT + '-fall');
 					break;
 				case 'scaled':
 					$dialog.addClass(EFFECT + '-scaled');
 					break;
 				case 'flip-horizontal':
 					$dialog.addClass(EFFECT + '-flip-horizontal');
 					break;
 				case 'flip-vertical':
 					$dialog.addClass(EFFECT + '-flip-vertical');
 					break;
 				case 'sign':
 					$dialog.addClass(EFFECT + '-sign');
 					break;
 				default:
 					$dialog.addClass(EFFECT + '-fade');
 					break;
 			}
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
 			if(self.settings.autoHide){
 				setTimeout(function(){
 					self.hide($this);
 				},self.settings.time)
 			}
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