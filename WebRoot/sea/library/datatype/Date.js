define(function(require, exports, module) {
	exports.getNow=function () {
	    var date = new Date();
	    var seperator1 = "-";
	    var seperator2 = ":";
	    var year=date.getFullYear() ;
	    var month = date.getMonth() + 1;
	    var day = date.getDate();
	    var hour= date.getHours() ;
	    var minute=date.getMinutes();
	    var second=date.getSeconds();
	    if (month <= 9) {
	        month = "0" + month;
	    }
	    if (day <= 9) {
	        day = "0" + day;
	    }
	    if (hour <= 9) {
	        hour = "0" + hour;
	    }
	    if (minute <= 9) {
	        minute = "0" + minute;
	    }
	    if (second <= 9) {
	        second = "0" + second;
	    }
	    var curdate = year+ seperator1 + month + seperator1 + day
	            + " " +hour+ seperator2 + minute
	            + seperator2 +second ;
	    return curdate;
	}
});
