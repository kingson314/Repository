define(function(require) {
	/** *只需要维护该对象** */
	var lang = {
		zh_CN : {
			"please.select":"请选择",
			"select.all":"全部"
		},
		en_US : {
			"please.select":"Please Select",
			"select.all":"Select All"
		}
	};
	/** *** */
	return $.extend(true, {}, require('ComponentLang')[Session.langue], lang[Session.langue]);
});
