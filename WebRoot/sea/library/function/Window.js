define(function(require, exports, module) {
	//history
	//cache
	
	//cookie
	expprts.setCookie = function(map, expiredays) {
		var exdate = new Date()
		exdate.setDate(exdate.getDate() + expiredays)
		$.each(map, function(key, value) {
			document.cookie = key + "=" + escape(value) + ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString())
		});
	};
	expprts.setCookie = function(c_name, value, expiredays) {
		var exdate = new Date()
		exdate.setDate(exdate.getDate() + expiredays)
		document.cookie = c_name + "=" + escape(value) + ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString())
	}
	exports.getCookie = function(c_name) {
		if (document.cookie.length > 0) {
			c_start = document.cookie.indexOf(c_name + "=")
			if (c_start != -1) {
				c_start = c_start + c_name.length + 1
				c_end = document.cookie.indexOf(";", c_start)
				if (c_end == -1) c_end = document.cookie.length
				return unescape(document.cookie.substring(c_start, c_end))
			}
		}
		return ""
	};

	exports.delCookie = function(name) //删除cookie
	{
		var exp = new Date();
		exp.setTime(exp.getTime() - 1);
		var cval = getCookie(name);
		if (cval != null) document.cookie = name + "=" + cval + ";expires=" + exp.toGMTString();
	};

	//loader
	exports.loadJs = function(path) {
		if (!path || path.length === 0) {
			return;
		}
		var head = document.getElementsByTagName('head')[0];
		var script = document.createElement('script');
		script.src = path;
		script.type = 'text/javascript';
		head.appendChild(script);
	};
	exports.loadCss = function(path) {
		if (!path || path.length === 0) {
			return;
		}
		var head = document.getElementsByTagName('head')[0];
		var link = document.createElement('link');
		link.href = path;
		link.rel = 'stylesheet';
		link.type = 'text/css';
		head.appendChild(link);
	};
	
	//Firefox支持属性pageX,与pageY属性，这两个属性已经把页面滚动计算在内了, 
	//在Chrome可以通过document.body.scrollLeft，document.body.scrollTop计算出页面滚动位移， 
	//而在IE下可以通过document.documentElement.scrollLeft ，document.documentElement.scrollTop 
	exports.getMousePos=function(event) { 
	      var e = event || window.event; 
	      var scrollX = document.documentElement.scrollLeft || document.body.scrollLeft; 
	      var scrollY = document.documentElement.scrollTop || document.body.scrollTop; 
	      var x = e.pageX || e.clientX + scrollX; 
	      var y = e.pageY || e.clientY + scrollY; 
	      //alert('x: ' + x + '\ny: ' + y); 
	      return { 'x': x, 'y': y }; 
	    } 
});