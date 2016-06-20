<%@page language="java" contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv='cache-control' content='no-cache' />
		<meta http-equiv='expires' content='0' />
		<meta name="viewport" content=" initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<title>Repository</title>
		<%@ include  file="../sea/Session.jsp"%>
		<script src="<%=basePath%>sea/core/bootstrap/bootstrap.min.js"></script> 
		<link rel="stylesheet" href="<%=basePath %>sea/core/bootstrap/css/bootstrap.css"/>
		
        <!--[if lt IE 9]>
	        <script src="<%=basePath%>sea/core/bootstrap/html5shiv.js"></script>
        <![endif]-->
        <style type="text/css">
        	.header-tool,
        	.header-tool .nav a
        	{
        		height:30px;
        		line-height:30px;
        		min-height:30px;
        		padding:0 5px;
        		margin:0 3px;
        	}
        	.header-tool .nav .navbar-text{
        		height:30px;
        		line-height:30px;
        		min-height:30px;
        		padding:0;
        		margin:0;
        	}
        	.header-tool .navbar-brand{
        		width:15%;
        	}
        	.header{
        		margin-top:30px;
        	}
        	.header .logo{
        		height:50px;
        		widht:50px;
        		line-height:50px;
        		margin-right:5px;
        	}
        	.header .telphone{
        		color:red;
        		font-weight:bold;
        		height:30px;
        		line-height:90px;
        	}	 	 	
        	 #sea_search input{
        		height:25px;
        		vertical-align:middle;
        		line-height:25px;
        		min-height:25px;
        		margin:5px 20px;
        		padding:5px;
        	} 
        	#carousel-example-generic img{
        		height:250px;
        		width:100%;
        		text-align:center;
        		margin:0 auto;
        	}
        	.row{
        		padding:5px 0;
        	}
        	.sea-footer{
        			border-top:3px solid #00c2e3;
        			text-align:center;
        			margin:0 auto;	
        	}
        	/**
        	.nvabar-main .navbar-default,
        	.nvabar-main .navbar-default .navbar-collapse, 
        	.nvabar-main .navbar-default .navbar-form{
        			background-color:#0B74BF;
        	}
        	.nvabar-main{
        		color:#fff;
        	}
        	**/
        	body{
        		/*background:url(../sea/core/bootstrap/css/images/bg.jpg) no-repeat;*/
        	}
		</style>
		
		
		<script>
		$(document).ready(function() {
			seajs.use(["Nav"],
					function(BorderLayout,Bread,Iframe,Ajax,Date) {
						//var northNav=$('.sea_nav').Nav().show();//.css({"position":"relative","margin":"0","padding":"0"});
				});

			$('.carousel').carousel({
				  interval: 3000
			});
		});
	</script>
	</head>
	<body>
		<%@ include  file="app-header.jsp"%>
		<%@ include  file="app-nav.jsp"%>		
		<%@ include  file="app-carousel.jsp"%>					 
	 <div class="container">  
     		<!-- main -->
		 <div class="row">
             <div class="col-md-3">
                 <div class="panel panel-success">
                     <div class="panel-heading">
                         <div class="pull-right">
                             <a href="" class="new-msg"><i class="glyphicon glyphicon-leaf"></i></a>
                         </div><!-- pull-right -->
                         <h3 class="panel-title">公司简介</h3>
                     </div>
                     <ul class="list-group">
                         <li class="list-group-item">
                             <small class="pull-right">Dec 10</small>
                             <h4 class="sender">Jennier Lawrence</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                         <li class="list-group-item">
                             <small class="pull-right">Dec 9</small>
                             <h4 class="sender">Marsha Mellow</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                         <li class="list-group-item">
                             <small class="pull-right">Dec 9</small>
                             <h4 class="sender">Holly Golightly</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                         <li class="list-group-item">
                             <small class="pull-right">Dec 10</small>
                             <h4 class="sender">Jennier Lawrence</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                     </ul>
                 </div><!-- panel -->
     		</div>
     		
     		<div class="col-md-6">
                 <div class="panel panel-success">
                     <div class="panel-heading">
                         <div class="pull-right">
                             <a href="" class="new-msg"><i class="glyphicon glyphicon-leaf"></i></a>
                         </div><!-- pull-right -->
                         <h3 class="panel-title">产品展示</h3>
                     </div>
                                <ul class="nav nav-pills nav-stacked">
                                    <li>
                                    <a href="#">
                                        <span class="badge pull-right">2</span>
                                        <i class="glyphicon glyphicon-inbox"></i> Inbox
                                    </a>
                                    </li>
                                    <li><a href="#"><i class="glyphicon glyphicon-star"></i> Starred</a></li>
                                    <li><a href="#"><i class="glyphicon glyphicon-send"></i> Sent Mail</a></li>
                                    <li>
                                    <a href="#">
                                        <span class="badge pull-right">3</span>
                                        <i class="glyphicon glyphicon-pencil"></i> Draft
                                    </a>
                                    </li>
                                    <li><a href="#"><i class="glyphicon glyphicon-trash"></i> Trash</a></li>
                                </ul>
                 </div><!-- panel -->
     		</div>
     		
     		
     		<div class="col-md-3">
                 <div class="panel panel-success">
                     <div class="panel-heading">
                         <div class="pull-right">
                             <a href="" class="new-msg"><i class="glyphicon glyphicon-leaf"></i></a>
                         </div><!-- pull-right -->
                         <h3 class="panel-title">新闻动态</h3>
                     </div>
                     <ul class="list-group">
                         <li class="list-group-item">
                             <small class="pull-right">Dec 10</small>
                             <h4 class="sender">Jennier Lawrence</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                         <li class="list-group-item">
                             <small class="pull-right">Dec 9</small>
                             <h4 class="sender">Marsha Mellow</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                         <li class="list-group-item">
                             <small class="pull-right">Dec 9</small>
                             <h4 class="sender">Holly Golightly</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                         <li class="list-group-item">
                             <small class="pull-right">Dec 10</small>
                             <h4 class="sender">Jennier Lawrence</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                     </ul>
                 </div><!-- panel -->
     		</div>
     	</div> <!-- row -->
     	
     	<!-- main1 -->
     	<div class="row">
             <div class="col-md-3">
                 <div class="panel panel-success">
                     <div class="panel-heading">
                         <div class="pull-right">
                             <a href="" class="new-msg"><i class="glyphicon glyphicon-leaf"></i></a>
                         </div><!-- pull-right -->
                         <h3 class="panel-title">公司简介</h3>
                     </div>
                     <ul class="list-group">
                         <li class="list-group-item">
                             <small class="pull-right">Dec 10</small>
                             <h4 class="sender">Jennier Lawrence</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                         <li class="list-group-item">
                             <small class="pull-right">Dec 9</small>
                             <h4 class="sender">Marsha Mellow</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                         <li class="list-group-item">
                             <small class="pull-right">Dec 9</small>
                             <h4 class="sender">Holly Golightly</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                         <li class="list-group-item">
                             <small class="pull-right">Dec 10</small>
                             <h4 class="sender">Jennier Lawrence</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                     </ul>
                 </div><!-- panel -->
     		</div>
     		<div class="col-md-6">
                 <div class="panel panel-success">
                     <div class="panel-heading">
                         <div class="pull-right">
                             <a href="" class="new-msg"><i class="glyphicon glyphicon-leaf"></i></a>
                         </div><!-- pull-right -->
                         <h3 class="panel-title">产品展示</h3>
                     </div>
                                <ul class="nav nav-pills nav-stacked">
                                    <li>
                                    <a href="#">
                                        <span class="badge pull-right">2</span>
                                        <i class="glyphicon glyphicon-inbox"></i> Inbox
                                    </a>
                                    </li>
                                    <li><a href="#"><i class="glyphicon glyphicon-star"></i> Starred</a></li>
                                    <li><a href="#"><i class="glyphicon glyphicon-send"></i> Sent Mail</a></li>
                                    <li>
                                    <a href="#">
                                        <span class="badge pull-right">3</span>
                                        <i class="glyphicon glyphicon-pencil"></i> Draft
                                    </a>
                                    </li>
                                    <li><a href="#"><i class="glyphicon glyphicon-trash"></i> Trash</a></li>
                                </ul>
                                <br />
                                <h5 class="sm-title">Tags</h5>
                                <ul class="nav nav-pills nav-stacked nav-msg">
                                    <li>
                                      <a href="http://themepixels.com/demo/webpage/chain/email.html">
                                        <span class="badge pull-right">2</span>
                                        <i class="fa fa-tag"></i> Promotions
                                      </a>
                                    </li>
                                    <li><a href="#"><i class="fa fa-tag"></i> Updates</a></li>
                                    <li><a href="#"><i class="fa fa-tag"></i> Social</a></li>
                                </ul>
                 </div><!-- panel -->
     		</div>
     		<div class="col-md-3">
                 <div class="panel panel-success">
                     <div class="panel-heading">
                         <div class="pull-right">
                             <a href="" class="new-msg"><i class="glyphicon glyphicon-leaf"></i></a>
                         </div><!-- pull-right -->
                         <h3 class="panel-title">新闻动态</h3>
                     </div>
                     <ul class="list-group">
                         <li class="list-group-item">
                             <small class="pull-right">Dec 10</small>
                             <h4 class="sender">Jennier Lawrence</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                         <li class="list-group-item">
                             <small class="pull-right">Dec 9</small>
                             <h4 class="sender">Marsha Mellow</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                         <li class="list-group-item">
                             <small class="pull-right">Dec 9</small>
                             <h4 class="sender">Holly Golightly</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                         <li class="list-group-item">
                             <small class="pull-right">Dec 10</small>
                             <h4 class="sender">Jennier Lawrence</h4>
                             <p>Lorem ipsum dolor sit amet...</p>
                         </li>
                     </ul>
                 </div><!-- panel -->
     		</div>
     	</div> <!-- row -->
	 </div>			
     	<%@ include  file="app-footer.jsp"%>
	</body>
</html>