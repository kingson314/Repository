<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>button</title>
		<%@ include file="../../../../../Session.jsp"%>
		<style>
			.footer {
				width: 100%;
				position: fixed;
				bottom: 0;
				left: 0;
				z-index: 9999;
				background-color: #fff;
				padding-top: 5px;
				border-top: solid 1px #CCCDCC;
			}
			
			.footer li {
				float: left;
				width: 20%;
				color: #6D6E6D;
				position: relative;
			}
			
			.footer li img {
				width: 40%;
				float: left;
				margin: 0 30%;
			}
			
			.footer li span {
				width: 100%;
				float: left;
				text-align: center;
				font-size: 0.9em;
			}
			
			.footer li .xiaoxi {
				width: auto;
				height: auto;
				padding: 0 5px;
				position: absolute;
				background-color: #48BC9D;
				color: #fff;
				border-radius: 5px;
				right: 18%;
				top: 0;
			}
			
			.margin_footer {
				width: 100%;
				height: 70px;
				float: left;
			}
			
			@media screen and (min-width:500px) {
				.footer {
					width: 500px;
					left: 50%;
					margin-left: -250px;
				}
			}
			
			@media screen and (min-width:351px) and (max-width:499px) {
				.footer {
					height: 57px;
				}
			}
			
			.bs-glyphicons {
				margin: 0 -10px 20px;
				overflow: hidden
			}
			
			.bs-glyphicons-list {
				padding-left: 0;
				list-style: none
			}
			
			.bs-glyphicons li {
				float: left;
				width: 25%;
				height: 115px;
				padding: 10px;
				font-size: 10px;
				line-height: 1.4;
				text-align: center;
				background-color: #f9f9f9;
				border: 1px solid #fff
			}
			
			.glyphicon {
				width: 100px;
				height: 100px;
				border: 1px solid red;
				font-size: 24px;
				margin-top: 10px;
				background-image: url(../../sea/core/css/images/all.png)
			}
			
			.bs-glyphicons .glyphicon-class {
				display: block;
				text-align: center;
				word-wrap: break-word
			}
			
			.bs-glyphicons li:hover {
				color: #fff;
				background-color: #563d7c
			}
	</style>
	</head>
	<body style="background-color: #EEEEEE;">
		<ul class="bs-glyphicons-list">
			<li>
				<img class="glyphicon" />
				<span class="glyphicon-class">glyphicon glyphicon-asterisk</span>
			</li>
		</ul>
		<input type="button" class="glyphicon" value="我的按钮" />

		<div class="footer">
			<ul>
				<li>
					<a href="/Goods/exclusive"><img src="<%=basePath%>/sea/core/css/images/demo/all.png"> </a><span>所有商品</span>
				</li>
				<li>
					<a href="/Collection/index"><img src="<%=basePath%>/sea/core/css/images/demo/store.png"> </a><span>我的收藏</span>
					<div class="xiaoxi" style="display: none;"></div>
				</li>
				<li>
					<a href="/Reservation/index"><img src="<%=basePath%>/sea/core/css/images/demo/intouch.png"> </a><span>预约我们</span>
				</li>
				<li>
					<a href="/center/index"><img src="<%=basePath%>/sea/core/css/images/demo/person.png"> </a><span>个人中心</span>
				</li>
			</ul>
		</div>
	</body>
</html>