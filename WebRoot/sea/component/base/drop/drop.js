$.fn.drop = function(configs) {
	var defaults={
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
    var container = this;
    //初始化投放区域
    for(var i=0;i<$(this).length;i++){
    	$($(this)[i]).append($("<div></div>").css({"height":3}));
    }
    var startJq;
	$(container).delegate(".dropitem","mousedown",{},function(e) {
        if(e.which != 1 || window.SEA_DROP_ONLY) return; // 排除非左击和表单元素
        e.preventDefault(); // 阻止选中文本
        window.SEA_DROP_ONLY = true;
 		startJq=$(this);
 		if(options.onStart){
    		options.onStart($(this));
    	}
        var me= $(this);
        var sea_drop_holder = $("<div id='sea_drop_holder'></div>")
        if(me.parent().hasClass("drager")){
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
        // 添加虚线框
        // 保持原来的宽高
        me.css({"width":width, "height":height, opacity: 0.8, "z-index": 999});
        sea_drop_holder.css({"border":"1px dashed #222", "height":me.outerHeight(true),"width":me.outerWidth(true)});
        // 绑定mousemove事件
        $(document).mousemove(function(e){
            e.preventDefault();
            // 移动选中块
            var l = left + e.pageX - pageX;
            var t = top + e.pageY - pageY;
            me.css({ "position":"absolute","left":l-options.offset.left, "top":t-options.offset.top});
            // 选中块的中心坐标
            var ml = l+width/2;
            var mt = t+height/2;
            // 遍历所有块的坐标
            $(container).children().not(me).not(sea_drop_holder).each(function(i){
                var obj = $(this);
                if(obj.parent().hasClass("drager"))return;
                var offset = obj.offset();
                var left1 = offset.left;
                var left2 = offset.left + obj.width();
                var top1 = offset.top;
                var top2 = offset.top + obj.height();
                // 移动虚线框
                if(left1 < ml && ml < left2 && top1 < mt && mt < top2){
                    if(!obj.next("#sea_drop_holder")) {
                        sea_drop_holder.insertAfter(this);
                    }else{
                        sea_drop_holder.insertBefore(this);
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
            if(offset.top==0){
            	me.remove();
            	sea_drop_holder.remove();
                window.SEA_DROP_ONLY = null;
            	return;
            }
            me.animate({"left":offset.left, "top":offset.top}, 100, function(){
            	me.removeAttr("style");
                sea_drop_holder.replaceWith(me);
                sea_drop_holder.height(me.height());
                window.SEA_DROP_ONLY = null;
            });
        });
    });
}