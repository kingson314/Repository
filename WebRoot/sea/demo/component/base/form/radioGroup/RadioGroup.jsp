<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>radio</title>
		<%@ include file="../../../../../Session.jsp"%>
	<style>
	</style>
	<script>
		$(document).ready(function(){
				seajs.use(["RadioGroup"],
					function(RadioGroup){
					var cfgRadioGroup1 = {
							  id: "radiogroup1",
							  name:"radiogroup1",
							  //align:"0",
							  items: [{
							    label: "radio1",
							    value:"1",
							    click: function() {
							      alert("radio1  click");
							    }
							  },
							  {
							    label: "radio1",
							    value:"2",
							    click: function() {
							      alert("radio2  click");
							    }
							  }]
							};
						var radiogroup1=RadioGroup.create(cfgRadioGroup1);
						var cfgRadioGroup2= {
								  id: "radiogroup2",
								  align:"1",
								  items: [
								  {
								    label: "radio1",
								    click: function() {
									  radiogroup1.val(1);
								    }
								  },
								  {
								    label: "radio2",
								    click: function() {
									  alert(radiogroup1.val());
								    }
								  }]
								};
						var radiogroup2=RadioGroup.create(cfgRadioGroup2);
						$("body").append(radiogroup1.radioGroup).append("<br><br><br>")
						.append(radiogroup2.radioGroup)
						.css({"text-align":"center","margin-top":"10px"});
				});
		});
	</script>
	</head>
	<body>
	</body>
</html>