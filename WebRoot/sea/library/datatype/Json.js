define(function(require, exports, module) {
	exports.toJson = function(str) {
		//return eval('(' + str + ')');
		return $.parseJSON(str);
	};

	exports.toString = function(obj) {
		return JSON.stringify(obj);
	};
});