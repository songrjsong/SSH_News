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
	<title>忘记密码1</title>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/common.css" type="text/css" media="screen" />
	<link href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-common.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-user.css" type="text/css" />
		<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/css.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/ui/css/bootstrap.min.css" >  
	<script src="${pageContext.request.contextPath}/jsp/ui/js/jquery-1.7.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/jsp/ui/js/bootstrap.min.js"></script>
	<link href="${pageContext.request.contextPath }/jsp/admin/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
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
		
				<div class="content">
				  <div class="web-width">
				    <div class="for-liucheng">
				     <div class="liulist for-cur"></div>
				     <div class="liulist"></div>
				     <div class="liulist"></div>
				     
				     <div class="liutextbox">
				      <div class="liutext for-cur"><em>1</em><br /><strong>验证身份</strong></div>
				      <div class="liutext"><em>2</em><br /><strong>设置新密码</strong></div>
				      <div class="liutext"><em>3</em><br /><strong>完成</strong></div>
				     </div>
				    </div>
				    <form action="${pageContext.request.contextPath }/user/findpwd1.form" method="get" class="forget-pwd">
				      <dl>
				       <dt>账号：</dt>
				       <dd><input type="text" name="inputType" placeholder="请输入手机号或邮箱"/></dd>
				       <div class="clears"></div>
				      </dl> 
				      <dl>
				       <dt>验证码：</dt>
				       <dd>
				        <input type="text" name="yzm" id="yzm" value=""/> 
				        <div class="yanzma">
				         <img src="${pageContext.request.contextPath }/jsp/ui/img/yzm.gif" /> <a href="javascript:;">换一换</a>
				        </div>
				       </dd>
				       <div class="clears"></div>
				      </dl>
				      <div class="subtijiao" ><input type="submit" value="提交" onClick=" return checkYzm() "/></div> 
				     </form>
				  </div>
				 </div>
  
			
			
	</div>
	
	
	<div id="divBottom" style="">
		<div class="introduce1">
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-about.jsp" target="_blank">关于我们</a>&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-policy.jsp" target="_blank">隐私政策</a>&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-relation.jsp" target="_blank">反馈建议</a>&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-links.jsp" target="_blank">友情链接</a>&nbsp;&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-help.jsp" target="_blank">帮助中心</a>
		</div>
		
		<div class="introduce3">&copy;  小情调版权所有  
			<a href="http://www.miibeian.gov.cn" target="_blank">苏ICP备20171007号</a>	
			<a href="http://www.qdnet110.gov.cn" target="_blank">违法不良信息举报</a>
		</div>
	</div>	

<script type = "text/javascript">
	function checkYzm() {
		
		var yzm = $("#yzm").val();
	    
	    if(yzm == "3hay" || yzm =="3HAY" ) {
	       return ture;
	     }else {
	       	alert("验证码错误，请重新输入！");
	     }
	
	}
</script>

</body>
</html>