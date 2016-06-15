define(function(require) {
	/** *只需要维护该对象** */
	var lang = {
		zh_CN : {

		},
		en_US : {

		}
	};
	/** *** */
	return $.extend(true, {}, require('ComponentLang')[Session.langue], lang[Session.langue]);
});