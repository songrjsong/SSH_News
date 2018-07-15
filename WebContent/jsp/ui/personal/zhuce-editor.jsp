<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta name="keywords" content="小情调 有情调 有趣 好玩 休闲 娱乐 小游戏 图画 视频 文字 音乐" />
	<meta name="description" content="小情调 热爱生活，张扬个性   传播美好，在兼顾趣味性的同时，以张扬创意、激情、梦想的生活态度为主旨，让大家在娱乐中感受生活的乐趣！" />
	<title>设置</title>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/common.css" type="text/css" media="screen" />
	<link href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-common.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-user.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/ui/css/bootstrap.min.css" >  
	<script src="${pageContext.request.contextPath}/jsp/ui/js/jquery-1.7.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/jsp/ui/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/jsp/ui/js/dateJs.fei.js"></script>
	<link href="${pageContext.request.contextPath }/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
	<style>
		body{margin: 0;padding: 0;}
		.everyWeekDay .weekday,.everyDay .days {/*解决span不支持width属性*/display: -moz-inline-box;display: inline-block;margin: 5px 0 0 20px;text-align: center;width: 20px;border: 1px solid #F7F7F7;cursor: pointer;}		
		.marginTop{margin-top: 5px;}
		.selectStyle{padding-left: 10px;border: none;border-radius: 3px;outline: none;appearance: none;-moz-appearance: none;-webkit-appearance: none;margin: 0 10px 0 10px;width: 60px;border-color: #0FB9EF;color: #0FB9EF;}       
	</style>
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
					<li style="display: inline;"><a href="${pageContext.request.contextPath }/user/showUserForUI.form?userId=${userInfo.user_Id}" class="user-nav">设置</a></li>
				</ul>
		</div>
			
	<div id="div_status" class="login-user" style="display:none;"></div>	
	<div class="user_big_holder">
	<div class="home_tab">
		<a class="selected" href="${pageContext.request.contextPath}/user/showUserForUI.form?userId=${userInfo.user_Id}">填写详细个人信息</a>
		
		
	</div>
		<form action="${pageContext.request.contextPath}/user/addUser2.form?userId=${userInfo.user_Id}" method="post">
			<table  class="user_table_1">
				<%-- <tr class="hui">
					
					<input type="hidden" id="userId" name="userId" class="gray_inputbox input_title" value="${u.userId }" />
				</tr> --%>
				<tr >
					<th>姓名</th>
					<td><input type="text"  name="name" class="gray_inputbox input_title"  /></td>
				</tr>
				<tr class="hui">
					<th>性别</th>
					<td>
						<input type="radio" name="sex" value="保密" />保密&nbsp;&nbsp;
						<input type="radio" name="sex" value="男" /> 男&nbsp;&nbsp;
						<input type="radio" name="sex" value="女" /> 女
					</td>
				
				</tr>
				<tr >
					<th>地址</th>
					<td>
						<input type="text"  name="address" class="gray_inputbox input_title"  />
					</td>
				</tr>
				<tr class="hui">
					<th>出生日期</th>
					<td><input type="date" id="txt_calendar"  name="birthday" class="gray_inputbox input_title"  readonly="readonly" onfocus="showDate()"/></td>
				</tr>
				
				<tr>
					<th>身份证号码</th>
					<td><input type="text"  name="ID_Number" class="gray_inputbox input_title"  /> </td>
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


<script>
lay('#version').html('-v'+ laydate.v);

//执行一个laydate实例
laydate.render({
  elem: '#test1' //指定元素
});
</script>

</body>
</html>