<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta name="keywords" content="小情调 有情调 有趣 好玩 休闲 娱乐 小游戏 图画 视频 文字 音乐" />
	<meta name="description" content="小情调 热爱生活，张扬个性   传播美好，在兼顾趣味性的同时，以张扬创意、激情、梦想的生活态度为主旨，让大家在娱乐中感受生活的乐趣！" />
	<title>收藏</title>
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
			<table class="user_table_1">
				<thead>
					<tr class="bai">
						<th></th>
						<th>评论标题</th>
						<th>创建时间</th>
						<th class="tright">操作</th>
					</tr>
				</thead>
				<c:if test="${not empty page.comments }">
					<c:forEach var='comm' items='${page.comments }'>
						<tbody>
							<tr class="text-c">		
								<td><input type="hidden" name="commentId" value="${comm.comment_Id }" ></td>
								<td>${comm.news.title }</td>
								<td>${comm.commentTime }</td>
								<td class="tright">	<a title="查看" class="set_del" href="${pageContext.request.contextPath }/news/queryNews.form?userId=${comm.from_user.user_Id}&newsId=${comm.news.news_Id}" ><i class="Hui-iconfont">&#xe695;</i></a></td>				
   							</tr>
						</tbody>
					</c:forEach>
				</c:if>
				
			</table>
			<c:set var='url' value="${pageContext.request.contextPath }/comment/PersonCommentList.form?userId=${userInfo.user_Id}"></c:set> 
				<div class="pageli">
				
					<c:if test="${page.pageNow != 1}">
		    			<a href="${url }&pageNow=1&pageSize=${page.pageSize}"><span class="disabled">首页</span></a>&nbsp;
		    			<a href="${url }&pageNow=${page.pageNow-1 }&pageSize=${page.pageSize}"><span class="disabled"> &lt;上一页</span></a>&nbsp;
		    		</c:if>
		    			
	    			<c:forEach var='beg' begin="1" end="${page.pageCount }">
	    				<a href="${url }&pageNow=${beg }&pageSize=${page.pageSize}"><span class="current">${beg }</span></a>
	    			</c:forEach>
	    			
	    			<c:if test="${page.pageNow != page.pageCount}">
	    			   <a href="${url }&pageNow=${page.pageNow+1 }&pageSize=${page.pageSize}">	<span class="disabled">下一页 &gt;</span></a>&nbsp;
	    			   <a href="${url }&pageNow=${page.pageCount }&pageSize=${page.pageSize}">	<span class="disabled">尾页</span></a>&nbsp;
	    			</c:if>
				
					
					当前 <span style='color:red'>${page.pageNow }</span>/${page.pageCount }页  &nbsp;
					
					跳转<input type="text" style='width:30px;text-align: center' value='${page.pageNow }' id="toPage" name="toPage" /><input type="button" value="Go" onclick="go()">&nbsp;
					
					每页显示:<select name="toSize" onchange="toSize(this)">
							<option value="5"  <c:if test='${page.pageSize == "5" }'>selected</c:if>   >5</option>
							<option value="10"  <c:if test='${page.pageSize == "10" }'>selected</c:if>    >10</option>
							<option value="20"  <c:if test='${page.pageSize == "20" }'>selected</c:if>    >20</option>
					       </select>条
				</div>
				
		</div>

	</div>

	<div class="footer" style="width:1350px;margin-top:100px;">
		<div>
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-about.jsp" target="_blank">关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-policy.jsp" target="_blank">隐私政策</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-relation.jsp" target="_blank">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-links.jsp" target="_blank">友情链接</a>&nbsp;&nbsp;|&nbsp;&nbsp;
			<a href="${pageContext.request.contextPath }/jsp/ui/bottom-help.jsp" target="_blank">帮助中心</a>
		</div>
		<div>&copy; 2017小情调版权所有  <a href="http://www.miibeian.gov.cn" target="_blank">苏ICP备20170713号</a> <a href="http://www.qdnet110.gov.cn" target="_blank">违法不良信息举报</a></div>
	</div>


<script type="text/javascript">

	function go(){
		var now = document.getElementById("toPage").value;
		//对now 做验证
		var reg =  /^[1-9]\d*$/;
		if(!reg.test(now)){
			alert("请输入正整数");
		}else {
			var count = '${page.pageCount}';
			if(now > parseInt(count)){
				
				alert("超过总页数！");
			}else {
				
				var url = "${pageContext.request.contextPath }/comment/PersonCommentList.form?userId=${userInfo.user_Id}&pageSize=${page.pageSize }&pageNow="+now;
				location = url;
			}
		}
	}
	
	function toSize(obj){
		var size = obj.value;
		
		location = "${pageContext.request.contextPath }/comment/PersonCommentList.form?userId=${userInfo.user_Id}&pageSize="+size+"&pageNow=1";
		
	}



</script> 

</body>
</html>
