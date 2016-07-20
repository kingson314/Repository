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
});