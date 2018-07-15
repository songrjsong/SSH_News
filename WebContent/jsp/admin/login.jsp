<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />

<link href="${pageContext.request.contextPath }/static/h-ui/css/H-ui.min.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/static/h-ui.admin/css/H-ui.login.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/static/h-ui.admin/css/style.css" rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath }/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />

<title>后台登录 - 新闻发布系统</title>

</head>
<body>

<div class="header">新闻发布 — 后台管理系统</div>
<div class="loginWraper">
  <div id="loginform" class="loginBox">
    <form class="form form-horizontal" action="${pageContext.request.contextPath}/admin/login.form" method="post" id="loginForm">
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60d;</i></label>
        <div class="formControls col-xs-8">
          <input id="uid" name="username" type="text" placeholder="用户名" class="input-text size-L">
        </div>
      </div>
      <div class="row cl">
        <label class="form-label col-xs-3"><i class="Hui-iconfont">&#xe60e;</i></label>
        <div class="formControls col-xs-8">
          <input id="pwd" name="password" type="password" placeholder="密码" class="input-text size-L">
        </div>
      </div>
      
      <div class="row cl">
        <div class="formControls col-xs-8 col-xs-offset-3">
          <input name="" type="submit" onclick="tz_login();" class="btn btn-success radius size-L" value="&nbsp;登&nbsp;&nbsp;&nbsp;&nbsp;录&nbsp;">
          <input name="" type="reset" class="btn btn-default radius size-L" value="&nbsp;取&nbsp;&nbsp;&nbsp;&nbsp;消&nbsp;">
        </div>
      </div>
    </form>
  </div>
</div>
<div class="footer">Copyright 巢湖学院信息工程学院 by songrj</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/static/h-ui/js/H-ui.min.js"></script>

<script type="text/javascript">
	
	//登录验证
	var username = $('#uid');
	var password = $('#pwd');
	function tz_login() {
		
		if (username.val().length < 1) {
			$('.tip').html("请输入用户名...");
			$("#uid").focus();
			return;
		}
		if (password.val().length < 1) {
			$('.tip').html("请输入密码...");
			$("#pwd").focus();
			return;
		}
		

	}
	
	
	//回车登录
   document.onkeydown=function(event){
       var e = event || window.event || arguments.callee.caller.arguments[0];
       if(e && e.keyCode==13){ // enter 键
           tz_login();
    }
    
  
   //js获取Cookie
	$(function(){
		var ck = document.cookie;
		if(ck){
			var exp1 = new RegExp("username" + "=.*?(?=;|$)");
			var userCookie = ck.match(exp1);
			var exp2 = new RegExp("password" + "=.*?(?=;|$)");
			var passwordCookie = ck.match(exp2);
			var ckusername = chineseFromUtf8Url((userCookie[0].substring(9)));
			var ckpassword = chineseFromUtf8Url((passwordCookie[0].substring(9)));
			username.val(ckusername);
			password.val(ckpassword);
			return "设置Cookie成功";
		}
		return;
	});
};
</script>

</body>
</html>