define(function(require, exports, module) {
	//history
	//cache
	//cookie
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
