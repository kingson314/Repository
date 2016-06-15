define(function(require, exports, module) {
 	/***模块外部依赖***/
 	var String =require("String");
	/* @Description: focus
 	* @ param jq
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	exports.focus=function(jq){
		if(jq.attr("type").indexOf("select")>=0){
			jq.focus();
		}else{
			var obj=jq.get(0);
			var txt=obj.createTextRange();
			txt.moveStart('character',obj.value.length);
			txt.collapse(true);
			txt.select();
		}
		return jq;
	};
	/* @Description: 增加jQuery对象的类名
 	* @ param jq
 	* @ param configs 包含属性数组configs.cls
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	var addClass=function(jq,configs){
		if(!jq || !configs){
			return jq;
		}
		if($.type(configs.cls)=="array"){
			for(var i=0;i<configs.cls.length;i++){
				jq.addClass(configs.cls);
			}
		}else{
			 if(!String.isBlank(configs.cls)){
				 jq.addClass(configs.cls);
			 }
		}
		 return jq;
	};
	exports.addClass=addClass;
	/* @Description: 增加jQuery对象的Css样式
 	* @ param jq
 	* @ param configs 包含属性数组configs.css
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	var css=function(jq,configs){
		if(!jq || !configs){
			return jq;
		}
		if(configs.css){
			jq.css(configs.css);
		}
		 if(!String.isBlank(configs.width)){
		 	 jq.css("width",configs.width);
		 }
		 if(!String.isBlank(configs.height)){
		 	 jq.css("height",configs.height);
		 }
		 return jq;
	};
	exports.css=css;	

	/* @Description: 增加jQuery对象的属性
 	* @ param configs 包含属性数组configs.attr
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	var attr=function(jq,configs){
		if(!jq || !configs){
			return jq;
		}
		if(configs.attr){
			for(var key in configs.attr){
				var val=configs.attr[key];
				if(!String.isBlank(key.val)){
					 jq.attr(key,val);
				}
			}
		}
		 if(!String.isBlank(configs.id)){
		 	 jq.attr("id",configs.id);
		 }
		 if(!String.isBlank(configs.name)){
		 	 jq.attr("name",configs.name);
		 }
		 //textarea,input
		 if(!String.isBlank(configs.disabled)){
		 	 jq.attr("disabled",configs.disabled);
		 }
		 //textarea
		 if(!String.isBlank(configs.rows)){
		 	 jq.attr("rows",configs.rows);
		 }
		 //textarea
		 if(!String.isBlank(configs.cols)){
		 	 jq.attr("cols",configs.cols);
		 }
		//input
		 if(!String.isBlank(configs.placeholder)){
		 	 jq.attr("placeholder",configs.placeholder);
		 }
		 //radio,check
		 if(!String.isBlank(configs.checked) ){
			 if(configs.checked==true || configs.checked=="checked"){
				 jq.attr("checked","checked");
			 }else{
				 jq.removeAttr("checked");
			 }
		 }
		//iframe,img..
		 if(!String.isBlank(configs.src)){
		 	 jq.attr("src",configs.src);
		 }
		 return jq;
	};
	exports.attr=attr;
	/*@Description: jQuery对象设置默认值
 	* @ param jq=[],value=[]时，jq[i]=value[i];jq={},value=[]时，jq=value[0];jq={},value=“”时，jq=value
 	* @ param configs 包含属性数组configs.value[]
 	* @return jq 
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	exports.val=function(jq,configs){
		if($.type(jq)=="array"){
			for(var i=0;i<jq.length;i++){
				if(!String.isBlank(configs.value[i])){
					jq[i].val(configs.value[i]);
				}
			}
		}else{
			if($.type(configs.value)=="array"){
					if(!String.isBlank(configs.value[0])){
						jq.val(configs.value[0]);
					}
			}else{
				if(!String.isBlank(configs.value)){
					jq.val(configs.value);
				}
			}
		}
		return jq;
	};
	/*@Description: jQuery对象绑定事件
 	* @ param jq
 	* @ param configs 包含属性数组configs.cls
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	exports.bind=function(jq,configs){
		 if (configs.events) {
		 	for (var key in configs.events) {
		 		var val=configs.events[key];
		 		if(val){
		 			jq.bind(key,val);
		 		}
		 	}
		 }
		 if(configs.click){
			 jq.bind("click",configs.click);
		 }
		 if(configs.change){
			 jq.bind("change",configs.change);
		 }
		 if(configs.click){
			 jq.bind("blur",configs.blur);
		 }
		 return jq;
	};
	/* @Description: 创建标签 
 	* @ param configs 
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	exports.createLabel=function(configs){
		if(!configs.label){
			return null;
		}
		var label=$("<label for='"+configs.id+"'>"+configs.label+"</label>").css("background-color","transparent");
		if(configs.isNull==false || configs.isNull=="false"){
			label.append("<span style='color:red'>*</span>");
		}
		var labelConfigs={};
		labelConfigs.cls=configs.labelCls||{}; 
		labelConfigs.css=configs.labelCss||{}; 
		labelConfigs.attr=configs.labelArr||{};
		//控件样式设置
		css(label,labelConfigs);
		//控件类设置
		addClass(label,labelConfigs);
		//控件属性设置
		attr(label,labelConfigs);
		return label;
	};
	
	/* @Description: 隐藏
 	* @ param jq 
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	exports.hide=function(jq){
		return jq.hide();
	},
	/* @Description: 显示
 	* @ param jq 
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	exports.show=function(jq){
		return jq.show();
	},
	/* @Description: 禁用
 	* @ param jq 
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	exports.disabled=function(jq){
		return jq.attr("disabled","disabled");
	},
	/* @Description: 启用
 	* @ param jq 
	* @date 2015-12-31
	* @author:kfzx-fenggq
	*/
	exports.enabled=function(jq){
		return jq.attr("disabled","");
	}
});