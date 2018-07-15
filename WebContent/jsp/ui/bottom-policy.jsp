<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
	<title>隐私政策</title>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/common.css" type="text/css" media="screen" />
	<link href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-common.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-user.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/ui/css/bootstrap.min.css" >  
		<link href="${pageContext.request.contextPath }/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
	<script src="${pageContext.request.contextPath}/jsp/ui/js/jquery-1.7.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/jsp/ui/js/bootstrap.min.js"></script>
	<style type="text/css">
		.holder {width:883px;padding:20px 40px;border-radius:3px;margin:10px auto;overflow:hidden}
		.holder1 {float:left;width:645px;padding:0px 0px 50px 0px;background:#fff;border-radius:3px;margin:-20px 0px 0px -40px;border:1px #eee solid;}
		.holder1 h1 {width: 613px;height: 20px;padding: 0 15px 0 10px;border-left: 5px #2E75B6 solid;line-height: 20px;
						font-size: 18px;letter-spacing: 1px;margin-bottom: 30px;margin-top: 30px;}
		.holder2 {width:295px;padding:0px 0px;background:#fff;border-radius:3px;margin:-20px 0px 40px 625px;border:1px #eee solid;}
		.holder2 h2 {width: 295px;height: 20px;padding: 0 10px 0 10px;border-left: 5px #2E75B6 solid;line-height: 20px;
						font-weight: normal;font-size: 14px;letter-spacing: 1px;margin:20px 0 20px 0;}
		.holder2 h2 span {float: right;font-size: 12px;font-weight: normal;color: #ccc;margin-right: 30px;}
		li{display: inline;}				
	</style>
</head>
<body>
	<div id="divTop">
		<div id="divtu">
			<h1 id="BlogTitle"><a href="#"><img src="${pageContext.request.contextPath}/jsp/ui/images/head.png" style="width: 1365px;height: 150px" /></a></h1>		
			<div style="float: right;position: relative;top:-130px;left: -40px;font-size: 16px">
				<c:if test="${ empty userInfo  }">
							<ul>
								<li style="display: inline;"><a class="sign-up" href="${pageContext.request.contextPath }/jsp/ui/regist.jsp" style="text-decoration:none;" >注册</a></li>
								<li style="display: inline;">&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<li style="display: inline;"><a class="log-in" href="${pageContext.request.contextPath }/jsp/ui/login.jsp" style="text-decoration:none;" >登录</a></li>
							</ul>
						</c:if>
						<c:if test="${ not  empty userInfo  }">
							<ul>
								<li style="display: inline;"><a class="personal-center" href="${pageContext.request.contextPath }/user/recommendArticleList.form" style="text-decoration:none;"><i class="Hui-iconfont" style="font-size:18px">&#xe60d;</i>&nbsp;&nbsp;${userInfo.nickname }</a></li>
								<li style="display: inline;">&nbsp;&nbsp;&nbsp;&nbsp;</li>
								<li style="display: inline;"><a class="exit" href="${pageContext.request.contextPath }/user/exit.form?userId=${userInfo.user_Id}" style="text-decoration:none;" >退出</a></li>
							</ul>
						</c:if>
			</div>
		</div>
		<div id="divNavBar">
			<ul>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/news/findAllNewsByStatus.form?status=1" style="color: #262626" >首页</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/articleUiType.form?typeName=国内新闻" style="color: #262626">国内新闻</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/articleUiType.form?typeName=财经新闻" style="color: #262626">财经新闻</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/articleUiType.form?typeName=体育新闻" style="color: #262626">体育新闻</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/articleUiType.form?typeName=科技新闻" style="color: #262626">科技新闻</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/articleUiType.form?typeName=军事新闻" style="color: #262626">军事新闻</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/articleUiType.form?typeName=娱乐新闻" style="color: #262626">娱乐新闻</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/articleUiType.form?typeName=汽车新闻" style="color: #262626">汽车新闻</a></li>
			</ul>
		</div>
	</div>
	<div id="divMiddle">
		
		<div id="div_status" class="login-user" style="display:none;"></div>
		<div class="holder">
			<!-- 左侧 -->
			<div class="holder1">
				
				<h1>隐私原则</h1>
				<div style="margin: 0 60px;">
					<div class="about-content">
						<strong>Email地址</strong><br />
						不经过你明确的允许，我们确保不在网站的任何页面公开，也不向任何外部实体和个人透露你的email地址。你的email地址的用途限于辨别你的身份和保证在你忘记密码的时候能恢复你在有意思吧的身份和数据。<br/><br/>
						只有下列情况例外：<br/>
						政府执法部门或监管机构依法有权要求有意思吧提供你的注册信息。
						<div>&nbsp;</div>					
						<strong>访问记录</strong><br />
						根据中国法律，你发布的信息、发布时间、以及你发布时的IP地址会被保留 60 天，政府执法部门或监管机构有权要求油坛提供以上信息。
					</div>	
				</div>
				
			</div>
			
			<!-- 右侧 -->
			<div class="holder2">
				<h2><span>About Us</span><a href="${pageContext.request.contextPath }/jsp/ui/bottom-about.jsp">关于我们</a></h2>
			</div>
			<div class="holder2">
				<h2><span>Policy</span><a href="${pageContext.request.contextPath }/jsp/ui/bottom-policy.jsp">隐私政策</a></h2>
			</div>
			<div class="holder2">
				<h2><span>Help</span><a href="${pageContext.request.contextPath }/jsp/ui/bottom-help.jsp">帮助中心</a></h2>
			</div>
			<div class="holder2">
				<h2><span>Links</span><a href="${pageContext.request.contextPath }/jsp/ui/bottom-links.jsp">友情链接</a></h2>
			</div>
			<div class="holder2">
				<h2><span>Feedback</span><a href="${pageContext.request.contextPath }/jsp/ui/bottom-relation.jsp">联系我们</a></h2>
			</div>
		</div>
	</div>
	
	<div id="divBottom">
		<div class="introduce1">
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-about.jsp" target="_blank">关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-policy.jsp" target="_blank">隐私政策</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-relation.jsp" target="_blank">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-links.jsp" target="_blank">友情链接</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-help.jsp" target="_blank">帮助中心</a>
		</div>

		<div class="introduce3">&copy;  小情调版权所有  
			<a href="http://www.miibeian.gov.cn" target="_blank">苏ICP备20171007号</a>	
			<a href="http://www.qdnet110.gov.cn" target="_blank">违法不良信息举报</a>
		</div>
	</div>	
		

</body>
</html>

