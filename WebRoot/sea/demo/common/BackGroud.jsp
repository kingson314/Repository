<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>button</title>
		<style>
		.bg {
			width: 100px;
			height: 100px;
			display:inline-block;
		}
		.title {
			background-color:  #E6F0F3;
			border: 1px solid #B3CBD6;
			border-radius: 5px 5px 0px 0px;
		}
		.Information {
			border: 1px solid #cadcea;
			background: #e1f2fc;
			background: -webkit-gradient(linear, left top, left bottom, from(#e1f2fc), to(#cae9fd) );
			background: -moz-linear-gradient(top, #e1f2fc, #cae9fd);
			filter: progid : DXImageTransform.Microsoft.gradient ( startColorstr = '#e1f2fc', endColorstr = '#cae9fd' );
			color: #225b86;
			text-shadow: 0 1px 0 #fff;
		}
		.Success {
			border: 1px solid #b8c97b;
			background: #e5edc4;
			background: -webkit-gradient(linear, left top, left bottom, from(#e5edc4), to(#d9e4ac) );
			background: -moz-linear-gradient(top, #e5edc4, #d9e4ac);
			filter: progid : DXImageTransform.Microsoft.gradient ( startColorstr = '#e5edc4', endColorstr = '#d9e4ac' );
			color: #3f7227;
			text-shadow: 0 1px 0 #fff;
		}
		.Warning {
			border: 1px solid #e5dbaa;
			background: #ffffc0;
			background: -webkit-gradient(linear, left top, left bottom, from(#ffffc0), to(#f9ee9c) );
			background: -moz-linear-gradient(top, #ffffc0, #f9ee9c);
			filter: progid : DXImageTransform.Microsoft.gradient ( startColorstr = '#ffffc0', endColorstr = '#f9ee9c' );
			color: #6d7829;
			text-shadow: 0 1px 0 #fff;
		}
		.Error {
			border: 1px solid #eeb7ba;
			background: #fae2e2;
			background: -webkit-gradient(linear, left top, left bottom, from(#fae2e2), to(#f2cacb) );
			background: -moz-linear-gradient(top, #fae2e2, #f2cacb);
			filter: progid : DXImageTransform.Microsoft.gradient ( startColorstr = '#fae2e2', endColorstr = '#f2cacb' );
			color: #be4741;
			text-shadow: 0 1px 0 #fff;
		}
	</style>
	</head>
	<body>
		<div class="bg title"></div>
		<div class="bg Information"></div>
		<div class="bg Success"></div>
		<div class="bg Warning"></div>
		<div class="bg Error"></div>
	</body>
</html>