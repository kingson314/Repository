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
    	var droper=$($(this)[i]);
    	if( droper.children().length ==0) {
            $("<div></div>").appendTo(droper).attr("class", "drop_block").css({"height":100});
        }
    }
    var startJq;
    $(container).children().off("mousedown");
    //$(container).children().off("mousedown").mousedown(function(e) {
	$(container).delegate(".dropitem","mousedown",{},function(e) {
        if(e.which != 1 || $(e.target).is("input, textarea") || window.sea_drop_only) return; // 排除非左击和表单元素
        e.preventDefault(); // 阻止选中文本
 		startJq=$(this);
 		if(options.onStart){
    		options.onStart($(this));
    	}
        window.sea_drop_only = true;
        var self=$(this);
        var me = self.clone().insertBefore(self); // 点击选中块
        var meParent=me.parent();
        var x = e.pageX;
        var y = e.pageY;
        var w = me.width();
        var h = me.height();
        var w2 = w/2;
        var h2 = h/2;
        var p = me.offset();
        var left = p.left;
        var top = p.top;
        // 添加虚线框
        var sea_drop_holder = $("<div id='sea_drop_holder'></div>").insertBefore(me);
        sea_drop_holder.css({"border":"1px dashed #222", "height":me.outerHeight(true)-4,"width":me.outerWidth(true)});
        // 保持原来的宽高
        me.css({"width":w, "height":h, "position":"absolute", opacity: 0.8, "z-index": 999, "left":left-options.offset.left, "top":top-options.offset.top});
        // 绑定mousemove事件
        $(document).mousemove(function(e) {
            e.preventDefault();
            // 移动选中块
            var l = left + e.pageX - x;
            var t = top + e.pageY - y;
            me.css({"left":l-options.offset.left, "top":t-options.offset.top});
            // 选中块的中心坐标
            var ml = l+w2;
            var mt = t+h2;
            // 遍历所有块的坐标
            $(container).children().not(me).not(sea_drop_holder).each(function(i) {
                var obj = $(this);
                var p = obj.offset();
                var left1 = p.left;
                var left2 = p.left + obj.width();
                var top1 = p.top;
                var top2 = p.top + obj.height();
                // 移动虚线框
                if(left1 < ml && ml < left2 && top1 < mt && mt < top2) {
                    if(!obj.next("#sea_drop_holder").length) {
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
            // 检查容器为空的情况
            $(container).each(function() {
                var obj = $(this).children();
                var len = obj.length;
                if(len == 1 && obj.is(me)) {
                    $("<div></div>").appendTo(this).attr("class", "drop_block").css({"height":me.height()});
                }else if(len == 2 && obj.is(".drop_block")){
                    $(this).children(".drop_block").remove();
                }
            });
            
            if(options.onEnd){
        		options.onEnd(startJq,sea_drop_holder);
        	}
            // 拖拽回位，并删除虚线框
            var p = sea_drop_holder.offset();
            me.animate({"left":p.left, "top":p.top}, 100, function(){
            	me.removeAttr("style");
//            	me.css({"opacity": 1, "z-index": 0,"border":"1px solid red",
//                "line-height": me.height(),
//                "margin-bottom": "10px",
//                "padding": "0 30px",
//                "border-radius": "4px",
//                "background-color": "#39F",
//                "color": "#fff",
//                "vertical-align": "middle",
//                "font-weight": "700",
//                "font-size": "14px",
//                "cursor": "pointer",
//                "text-decoration": "none",
//                "display": "block"
//            	});
                sea_drop_holder.replaceWith(me);
                sea_drop_holder.height(me.height());
                if(meParent.is(me.parent())==true){
           		  sea_drop_holder.remove();
           		  me.remove();
                }
                window.sea_drop_only = null;
            });
        });
    });
}