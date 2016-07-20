<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Laytpl</title>
		<script src="../../../sea/core/artTemplate/template.js"></script>
	</head>
<body>
<textarea style="width:800px;height:300px;">
@page
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
	<title>Repository</title>
	@Session.jsp
		<script>
			$(document).ready(function() {
				seajs.use(["BorderLayout", "FormLayout", "ViewLayout", "Dialog", "Grid", "Toolbar", "Ajax"],
					function(BorderLayout, FormLayout, ViewLayout, Dialog, Grid, Toolbar, Ajax) {
						/*** 查询表单 ***/
						var cfgFormQuery = {
							items: [
</textarea>

<script id="test" type="text/html">
<h1>{{title}}</h1>
{{include 'list'}}
</script>
<script id="list" type="text/html">
<ul>
    {{each list as map i}}
        <li>索引 {{i + 1}} ：{{map.name+map.text}}</li>
    {{/each}}
</ul>
</script>
<textarea id="result"style="width:500px;height:300px;"></textarea>
<script>
var data = {
	title: '嵌入子模板',
	list: [{name:'文艺',text:"webyi"}]
};
var html = template('test', data);
document.getElementById('result').value = html;
</script>

</body>
</html>