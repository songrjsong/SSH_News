<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta name="keywords" content="小情调 有情调 有趣 好玩 休闲 娱乐 小游戏 图画 视频 文字 音乐" />
	<meta name="description" content="小情调 热爱生活，张扬个性   传播美好，在兼顾趣味性的同时，以张扬创意、激情、梦想的生活态度为主旨，让大家在娱乐中感受生活的乐趣！" />
	<title>修改密码</title>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/common.css" type="text/css" media="screen" />
	<link href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-common.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-user.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/ui/css/bootstrap.min.css" >  
	<script src="${pageContext.request.contextPath}/jsp/ui/js/jquery-1.7.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/jsp/ui/js/bootstrap.min.js"></script>
	<link href="${pageContext.request.contextPath }/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
</head>
<body >
	

	
	<div id="divTop">
		
		
		<div id="divtu">
			<h1 id="BlogTitle"><a href="#"><img src="${pageContext.request.contextPath}/jsp/ui/images/head.png" style="width: 1365px;height: 150px" /></a></h1>
			<div style="position: relative;top:-130px;left:1150px;font-size: 16px">
				<c:if test="${ empty userInfo  }">
					<ul>
						<li style="display: inline;"><a class="sign-up" href="${pageContext.request.contextPath }/jsp/ui/regist.jsp" >注册</a></li>
						<li style="display: inline;">&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li style="display: inline;"><a class="log-in" href="${pageContext.request.contextPath }/jsp/ui/login.jsp"  >登录</a></li>
					</ul>
				</c:if>
				<c:if test="${ not  empty userInfo  }">
					<ul>
						<li style="display: inline;"><a class="personal-center" href="${pageContext.request.contextPath }/news/showPersonNewsList.form?userId=${userInfo.user_Id}" style="text-decoration:none;"><i class="Hui-iconfont" style="font-size:18px">&#xe60d;</i>&nbsp;&nbsp;${userInfo.nickname }</a></li>
						<li style="display: inline;">&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li style="display: inline;"><a class="exit" href="${pageContext.request.contextPath }/user/exit.form?userId=${userInfo.user_Id}"  >退出</a></li>
					</ul>
				</c:if>
			</div>	
		</div>
		
		<div id="divNavBar">
			<ul>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/news/findAllNewsByStatus.form?status=1" style="color: #262626" >首页</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/news/queryNewsByType.form?typeName=国内新闻" style="color: #262626">国内新闻</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/news/queryNewsByType.form?typeName=财经新闻" style="color: #262626">财经新闻</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/news/queryNewsByType.form?typeName=体育新闻" style="color: #262626">体育新闻</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/news/queryNewsByType.form?typeName=科技新闻" style="color: #262626">科技新闻</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/news/queryNewsByType.form?typeName=军事新闻" style="color: #262626">军事新闻</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/news/queryNewsByType.form?typeName=娱乐新闻" style="color: #262626">娱乐新闻</a></li>
				<li style="display: inline;"><a href="${pageContext.request.contextPath }/news/queryNewsByType.form?typeName=汽车新闻" style="color: #262626">汽车新闻</a></li>
			</ul>
		</div>
	</div>
		
		
		
	<div id="divMiddle">
		
		<div class="menu-nav">					
			<ul>
					<li style="display: inline;"><a href="${pageContext.request.contextPath }/news/showPersonNewsList.form?userId=${userInfo.user_Id}" class="user-nav">我的动态</a></li>
					<li style="display: inline;"><a href="${pageContext.request.contextPath }/collect/PersonCollectList.form?userId=${userInfo.user_Id}" class="user-nav">收藏列表</a></li>
					<li style="display: inline;"><a href="${pageContext.request.contextPath }/favor/PersonFavorList.form?userId=${userInfo.user_Id}" class="user-nav">点赞列表</a></li>
					<li style="display: inline;"><a href="${pageContext.request.contextPath }/comment/PersonCommentList.form?userId=${userInfo.user_Id}" class="user-nav">评论列表</a></li>
					<li style="display: inline;"><a href="${pageContext.request.contextPath }/attention/PersonAttentionList.form?userId=${userInfo.user_Id}" class="user-nav">关注人</a></li>
					<c:if test="${userInfo.is_editor == 1 }">
					<li style="display: inline;"><a href="${pageContext.request.contextPath }/type/showTypesForUI.form" class="user-nav">发布文章</a></li>
					</c:if>
					<li style="display: inline;"><a href="${pageContext.request.contextPath }/user/showUserForUI.form?userId=${userInfo.user_Id}" class="user-nav">设置</a></li>
				</ul>
		</div>
			
		<div id="div_status" class="login-user" style="display:none;"></div>
		<div class="user_big_holder">
			<div class="home_tab">
				<a href="${pageContext.request.contextPath}/user/showUserForUI.form?userId=${userInfo.user_Id}">个人资料</a>
				<a href="${pageContext.request.contextPath}/jsp/ui/personal/update-image.jsp">修改头像</a>
				<a class="selected" href="${pageContext.request.contextPath}/jsp/ui/personal/update-pwd.jsp">修改密码</a>
		
		
			</div>
			<form action="${pageContext.request.contextPath}/user/modifyPass.form?userId=${userInfo.user_Id}" method="post">
				<table  class="user_table_1">
					<tr class="hui">
						<th>原始密码</th>
						<td><input type="password" id="password" name="password" class="gray_inputbox input_title" /> <span>请输入你的旧密码</span></td>
					</tr>
					<tr class="hui">
						<th>新设密码</th>
						<td><input type="password" id="newpwd" name="newpwd" class="gray_inputbox input_title" /> <span>4-16个字符，建议英文与符号混合</span></td>
					</tr>
					<tr class="hui">
						<th>重复密码</th>
						<td><input type="password" id="newpwd2" name="newpwd2" class="gray_inputbox input_title" /> <span>重复新设密码</span></td>
					</tr>
				</table>
				<div id="ctrl_area" style="margin-left: 350px">
					<input id="btn_save" type="submit" value=" 提 交 " class="green_button input_publish" style="width: 100px" onClick=" checkpwd() " />
				</div>
			</form>
		</div>
			
	</div>
	
	
	<div class="footer" style="width:1350px;margin-top:100px;">
		<div>
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-about.jsp" target="_blank">关于我们</a>　
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-policy.jsp" target="_blank">隐私政策</a> &nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-relation.jsp" target="_blank">联系我们</a>
		      　<a href="${pageContext.request.contextPath }/jsp/ui/bottom-links.jsp">友情链接</a>　
		    <a href="${pageContext.request.contextPath }/jsp/ui/bottom-help.jsp" target="_blank">帮助中心</a></div>
		<div>&copy; 2017小情调版权所有  <a href="http://www.miibeian.gov.cn" target="_blank">苏ICP备20170713号</a> <a href="http://www.qdnet110.gov.cn" target="_blank">违法不良信息举报</a></div>
	</div>

<script type = "text/javascript">
	function checkpwd() {
		
		var pwd1 = $("#newpwd").val();
	    var pwd2 = $("#newpwd2").val();
	    //比较两次输入的 密码是否相同
	    if(pwd1 == pwd2) {
	       alert("修改成功");
	     }
		else {
	       	alert("修改密码失败，请重新输入");
	     }
	
	}
</script>

</body>
</html>