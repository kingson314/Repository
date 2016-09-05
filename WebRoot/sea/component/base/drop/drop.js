/**
 * sea_drop_layout 拖放布局器类，可支持布局器本身的拖放以及布局器内部sea_drop_holder承载投放对象
 * sea_drager 只支持拖拽，不支持投放，方式为：克隆
 * sea_droper 既支持拖拽也支持拖放，方式为：移动
 * 
 */
$.fn.drop = function(configs) {
	var defaults={
		height:"100%",
		width:"100%",
		offset:{
			left:0,
			top:0
		},
		onStart:function(startJq){
		},
		onEnd:function(startJq,endJq){
		}
	}
	
	var options=$.extend(true,{},defaults,configs); 
	console.debug(options)
    var container = $(this);
	container.css({
		width:options.width,
		height:options.height
	});
	var droper=container.find(".sea_droper,.sea_drager");
    //初始化投放区域
    for(var i=0;i<droper.length;i++){
    	$(droper[i]).append($("<div></div>").css({width:"100%",height:10,float:"left","border":"1px solid blue"}));
    }
    var startJq;
    droper.delegate(".sea_dropitem","mousedown",{},function(e) {
        if(e.which != 1 || window.SEA_DROP_ONLY) return; // 排除非左击和表单元素
        e.preventDefault(); // 阻止选中文本
        window.SEA_DROP_ONLY = true;
 		startJq=$(this);
 		if(options.onStart){
    		options.onStart($(this));
    	}
        var me= $(this);
        // 添加虚线框
        // 保持原来的宽高
        me.css({opacity: 0.8, "z-index": 999});
        var sea_drop_holder = $("<div id='sea_drop_holder'></div>")
        if(me.parent().hasClass("sea_drager")){
        	me= me.clone().appendTo($("body")).css({"position":"absolute","left":startJq.offset().left,"top":startJq.offset().top});
        }else{
        	sea_drop_holder.insertBefore(me).append(me);
        }
        var pageX = e.pageX;
        var pageY = e.pageY;
        var width = me.width();
        var height = me.height();
        var left = me.offset().left;
        var top = me.offset().top;
        sea_drop_holder.css({"border":"1px dashed #222", "height":me.height(),"width":me.width()});
        // 绑定mousemove事件
        $(document).mousemove(function(e){
            e.preventDefault();
            // 移动选中块
            var l = left + e.pageX - pageX;
            var t = top + e.pageY - pageY;
            me.css({ "position":"absolute","left":l-options.offset.left, "top":t-options.offset.top});
            // 选中块的中心坐标
            var pointer=getMousePos(e);
            var ml =pointer.x;// l+width/2;
            var mt =pointer.y;// t+height/2;
            // 遍历所有块的坐标
            droper.children().not(me).not(sea_drop_holder).each(function(i){
                var obj = $(this);
                if(obj.parent().hasClass("sea_drager"))return;
                var offset = obj.offset();
                var left1 = offset.left;
                var left2 = offset.left + obj.width();
                var top1 = offset.top;
                var top2 = offset.top + obj.height();
                // 移动虚线框
                if(left1 < ml && ml < left2 && top1 < mt && mt < top2){
                	if(obj.hasClass("sea_drop_holder")&& obj.find(".sea_dropitem").length==0){//支持首层子元素为sea_drop_holder
                		 sea_drop_holder.appendTo(obj);
                	}else if(obj.find(".sea_drop_holder").length>0){//支持多层子元素为sea_drop_holder
                		var allHasDropItem=true;
                		obj.find(".sea_drop_holder").each(function(i){
                			var objItem= $(this);
                			if(objItem.find(".sea_dropitem").length==0){
                				allHasDropItem=false;
	                			var offset = objItem.offset();
	                            var left1 = offset.left;
	                            var left2 = offset.left + objItem.width();
	                            var top1 = offset.top;
	                            var top2 = offset.top + objItem.height();
	                            if(left1 < ml && ml < left2 && top1 < mt && mt < top2){
	                            	sea_drop_holder.appendTo(objItem);
	                            }
                			}
                			if(allHasDropItem==true){
                				if(obj.next(".sea_drop_layout")) {
                                    sea_drop_holder.insertBefore(obj);
                				}
                			}
                		});
                	}else if(obj.next("#sea_drop_holder")) {
                        sea_drop_holder.insertBefore(this);
                    }else{
                        sea_drop_holder.insertAfter(this);
                    }
                    return;
                }
            });
        });
        // 绑定mouseup事件
        $(document).mouseup(function() {
            $(document).off('mouseup').off('mousemove');
            if(options.onEnd){
        		options.onEnd(startJq,sea_drop_holder);
        	}
            // 拖拽回位，并删除虚线框
            var offset = sea_drop_holder.offset();
            if(offset.top==0){//只点击没拖动时
            	me.remove();
            	sea_drop_holder.remove();
                window.SEA_DROP_ONLY = null;
            	return;
            }
            me.animate({"left":offset.left, "top":offset.top}, 100, function(){
            	me.removeAttr("style");
            	sea_drop_holder.replaceWith(me);
                if(me.parent().hasClass("sea_drop_holder")){
                	me.css({width:me.parent().width(),"max-width":me.parent().width(),height:me.parent().height()});
                }
                window.SEA_DROP_ONLY = null;
            });
        });
    });
	
	//Firefox支持属性pageX,与pageY属性，这两个属性已经把页面滚动计算在内了, 
	//在Chrome可以通过document.body.scrollLeft，document.body.scrollTop计算出页面滚动位移， 
	//而在IE下可以通过document.documentElement.scrollLeft ，document.documentElement.scrollTop 
	function getMousePos(event) { 
      var e = event || window.event; 
      var scrollX = document.documentElement.scrollLeft || document.body.scrollLeft; 
      var scrollY = document.documentElement.scrollTop || document.body.scrollTop; 
      var x = e.pageX || e.clientX + scrollX; 
      var y = e.pageY || e.clientY + scrollY; 
      return { 'x': x, 'y': y }; 
    } 
}