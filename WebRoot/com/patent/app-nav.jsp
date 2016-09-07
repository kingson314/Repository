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
        <li class="active"><a href="#" onclick="javascript:navClick(this);" title="Common" recType=0>授权专利</a></li>
        <li><a href="#" onclick="javascript:navClick(this);" title="Common" recType=1>授权未下证专利</a></li>
        <li><a href="#" onclick="javascript:navClick(this);" title ="Project">重点项目销售</a></li>
      </ul>
      <form class="navbar-form navbar-right" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search"/>
        </div>
      </form>
    </div>
  </div>
</nav>