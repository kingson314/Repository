<%@ page pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse">
  <div class="container container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-header">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
    </div>
    <div class="collapse navbar-collapse" id="navbar-header">
      <ul class="nav navbar-nav">
        <%--<li class="active"><a href="#" onclick="javascript:navClick(this);">Link <span class="sr-only">(current)</span></a></li>--%>
        <li class="active"><a href="#" onclick="javascript:navClick(this);">Monitor</a></li>
        <li><a href="#" onclick="javascript:navClick(this);">中国(CN)</a></li>
        <li><a href="#" onclick="javascript:navClick(this);">WIPO</a></li>
        <li><a href="#" onclick="javascript:navClick(this);">美国(US)</a></li>
        <li><a href="#" onclick="javascript:navClick(this);">欧盟(EP)</a></li>
        <li><a href="#" onclick="javascript:navClick(this);">英国(GP)</a></li>
        <li><a href="#" onclick="javascript:navClick(this);">日本(JP)</a></li>
        <li><a href="#" onclick="javascript:navClick(this);">韩国(KR)</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">二级数据  <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="#" onclick="javascript:navSubClick(this);">加拿大(CA)</a></li>
	        <li><a href="#" onclick="javascript:navSubClick(this);">墨西哥(MX)</a></li>
	        <li><a href="#" onclick="javascript:navSubClick(this);">联邦(RU)</a></li>
	        <li><a href="#" onclick="javascript:navSubClick(this);">新加坡(SG)</a></li>
	        <li><a href="#" onclick="javascript:navSubClick(this);">以色列(IL)</a></li>
	        <li><a href="#" onclick="javascript:navSubClick(this);">日本(JP)</a></li>
	        <li><a href="#" onclick="javascript:navSubClick(this);">韩国(KR)</a></li>
	        <li><a href="#" onclick="javascript:navSubClick(this);">加拿大(CA)</a></li>
	        <li><a href="#" onclick="javascript:navSubClick(this);">印度(IN)</a></li>
	        <li><a href="#" onclick="javascript:navSubClick(this);">南非(ZA)</a></li>     
			<li><a href="#" onclick="javascript:navSubClick(this);">新西兰(NZ) </a></li>     
			<li><a href="#" onclick="javascript:navSubClick(this);">德国(DE)</a></li>     
			<li><a href="#" onclick="javascript:navSubClick(this);">法国(FR)</a></li>     
			<li><a href="#" onclick="javascript:navSubClick(this);">英国(GB)</a></li>     
			<li><a href="#" onclick="javascript:navSubClick(this);">中国台湾(TW)</a></li>     
			<li><a href="#" onclick="javascript:navSubClick(this);">瑞士(SE)</a></li>     
			<li><a href="#" onclick="javascript:navSubClick(this);">西班牙(ES)</a></li>     
			<li><a href="#" onclick="javascript:navSubClick(this);">意大利(IT)</a></li>     
			<li><a href="#" onclick="javascript:navSubClick(this);">挪威(NO)</a></li>     
			<li><a href="#" onclick="javascript:navSubClick(this);">瑞典(SE)</a></li>     
			<li><a href="#" onclick="javascript:navSubClick(this);">荷兰(NL)</a></li>     
			<li><a href="#" onclick="javascript:navSubClick(this);">芬兰(FI)</a></li>     
          </ul>
        </li>
      
      </ul>
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search"/>
        </div>
      </form>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>