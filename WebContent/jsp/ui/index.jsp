<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<!DOCTYPE HTML>
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta http-equiv="Content-Language" content="zh-CN" />
	<meta name="keywords" content="小情调 有情调 有趣 好玩 休闲 娱乐 小游戏 图画 视频 文字 音乐" />
	<meta name="description" content="小情调 热爱生活，张扬个性   传播美好，在兼顾趣味性的同时，以张扬创意、激情、梦想的生活态度为主旨，让大家在娱乐中感受生活的乐趣！" />
	<title>首页</title>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/common.css" type="text/css" media="screen" />
	<link href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-common.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-user.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/ui/css/bootstrap.min.css" >  
	<script src="${pageContext.request.contextPath}/jsp/ui/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/jsp/ui/css/owl.carousel.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/ui/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/ui/js/owl.carousel.js"></script>
	<link href="${pageContext.request.contextPath }/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
	<style type="text/css">
		.holder {width:1100px;padding:20px 40px;border-radius:3px;margin:10px auto;overflow:hidden}
		.holder1 {float:left;width:702px;padding:0px 0px 0px 0px;border-radius:3px;margin:-20px 0px 0px -40px;border:1px #eee solid;}
		.holder11 {float:left;width:702px;padding:0px 0px 50px 0px;background:#fff;border-radius:3px;margin:10px 0px 0px -40px;border:1px #eee solid;}
		.holder1 h1 {width: 613px;height: 20px;padding: 0 15px 0 10px;border-left: 5px #f90 solid;line-height: 20px;
						font-size: 18px;letter-spacing: 1px;margin-bottom: 30px;margin-top: 30px;}
		.holder2 {width:295px;padding:0px 0px;background:#fff;border-radius:3px;margin:-20px 0px 40px 700px;border:1px #eee solid;}
		.holder2 h2 {width: 295px;height: 20px;padding: 0 10px 0 10px;border-left: 5px #f90 solid;line-height: 20px;
						font-weight: normal;font-size: 14px;letter-spacing: 1px;margin:20px 0 20px 0;}
		.holder2 h2 span {float: right;font-size: 12px;font-weight: normal;color: #ccc;margin-right: 30px;}
		.holder2 a{text-decoration:none;}		
			
	#owl-demo{position:relative;width:700px;height:300px;margin:0 0 0 0;}
	#owl-demo .item{ position:relative;display:block;margin:0 0 0 0;}
	#owl-demo img{display:block;width:700px;height:300px;position:relative;margin:0 0 0 0;}
	#owl-demo b{position:absolute;left:0;bottom:0px;width:100%;height:78px;background-color:#000;opacity:.5;filter:alpha(opacity=50);}
	#owl-demo span{position:absolute;left:0;bottom:10px;width:100%;font:18px/32px "微软雅黑","黑体";color:#fff;text-align:center;}
	.owl-pagination{position:absolute;left:0;bottom:35px;width:100%;height:22px;text-align:center;}
	.owl-page{display:inline-block;width:10px;height:10px;margin:0 5px;background-image:url(${pageContext.request.contextPath }/jsp/ui/images/bg15.png);*display:inline;*zoom:1;}
	.owl-pagination .active{width:25px;background-image:url(${pageContext.request.contextPath }/jsp/ui/images/bg16.png);}
	.owl-buttons{display:none;}
	.owl-buttons div{position:absolute;top:50%;width:40px;height:80px;margin-top:-40px;text-indent:-9999px;}
	.owl-prev{left:0;background-image:url(${pageContext.request.contextPath }/jsp/ui/images/bg17.png);}
	.owl-next{right:0;background-image:url(${pageContext.request.contextPath }/jsp/ui/images/bg18.png);}
	.owl-prev:hover{background-image:url(${pageContext.request.contextPath }/jsp/ui/images/bg19.png);}
	.owl-next:hover{background-image:url(${pageContext.request.contextPath }/jsp/ui/images/bg20.png);}		
	 ul li{  
	list-style-type:none;  
	}
		#page{
		margin-top:35px;
		margin-left:0px;
		text-align: center;
		}
	    table{
	    width:702px;
		margin-left: 0px;
		margin-top:0px;
		border: 2px dashed #EAEAEA;
		} 
		table tr{
		border: 2px dashed #EAEAEA;
		}
		table th, td
	  	{
	  	border: 1px dashed #EAEAEA;
	  	}
		span.page{
		color:#666;
		font-weight:bolder;
		padding:2px 5px 2px 5px;
		margin:4px;
		border:1px solid #cccccc;
	}
	
	span.now-page{
		color:#666;
		font-weight:bolder;
		padding:2px 5px 2px 5px;
		margin:5px;
		border:1px solid #666;
	}
	
	a:hover span.page{
		color:#ff1461;
		border:1px solid #ff1461;
	}
		
	</style>
</head>
<body>
	<div id="divTop">
		<div id="divtu">
			<h1 id="BlogTitle"><a href="#"><img src="${pageContext.request.contextPath}/jsp/ui/images/head.png" style="width: 1365px;height: 150px" /></a></h1>
			<div style="float: right;position: relative;top:-130px;left: -40px;font-size: 16px">
				<c:if test="${ empty userInfo }">
					<ul>
						<li style="display: inline;"><a class="sign-up" href="${pageContext.request.contextPath }/jsp/ui/regist.jsp" style="text-decoration:none;" >注册</a></li>
						<li style="display: inline;">&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li style="display: inline;"><a class="log-in" href="${pageContext.request.contextPath }/jsp/ui/login.jsp" style="text-decoration:none;" >登录</a></li>
					</ul>
				</c:if>
				<c:if test="${not empty userInfo  }">
					<ul>
						<li style="display: inline;"><a class="personal-center" href="${pageContext.request.contextPath }/news/showPersonNewsList.form?userId=${userInfo.user_Id}" style="text-decoration:none;"><i class="Hui-iconfont" style="font-size:18px">&#xe60d;</i>&nbsp;&nbsp;${userInfo.nickname }</a></li>
						<li style="display: inline;">&nbsp;&nbsp;&nbsp;&nbsp;</li>
						<li style="display: inline;"><a class="exit" href="${pageContext.request.contextPath }/user/exit.form" style="text-decoration:none;" >退出</a></li>
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
		<div id="div_status" class="login-user" style="display:none;"></div>
			<div class="holder">
			<!-- 左侧 -->
				<div class="holder1">
					<div id="owl-demo" class="owl-carousel">
						<a class="item" href="${pageContext.request.contextPath }/news/queryNews.form?newsId=23" target="_blank"><img src="${pageContext.request.contextPath }/jsp/ui/img/G5qk.jpg" alt="" /><b></b><span>[东部决赛G5]骑士83-96凯尔特人</span></a>
						<a class="item" href="${pageContext.request.contextPath }/news/queryNews.form?newsId=24" target="_blank"><img src="${pageContext.request.contextPath }/jsp/ui/img/kjwxr.png" alt="" /><b></b><span>有外星人？科学家暗示外星生命或隐藏在平行宇宙中</span></a>
						<a class="item" href="${pageContext.request.contextPath }/news/queryNews.form?newsId=25" target="_blank"><img src="${pageContext.request.contextPath }/jsp/ui/img/xiaomi.jpg" alt="" /><b></b><span>小米线下经销商遭盈利难题</span></a>
						<a class="item" href="${pageContext.request.contextPath }/news/queryNews.form?newsId=27" target="_blank"><img src="${pageContext.request.contextPath }/jsp/ui/img/linkeng.jpg" alt="" /><b></b><span>林肯今年遭遇两次销量下跌 质量隐患服务欠佳引不满</span></a>
						
					</div>
				</div>
				<div class="holder11" style="font-size: 15px">
				<div style="background-color: #5B9BD5;height: 30px;"><p style="font-size: 16px;margin-left: 20px;padding-top: 7px;">新闻栏目</p></div>
					<c:if test="${not empty page.news }">
					<c:forEach var='n' items='${page.news }'>
				    <div class="mainlist">
						<div class="big-img">
							<a href="${pageContext.request.contextPath }/news/queryNews.form?newsId=${n.news_Id }" ><img src="${pageContext.request.contextPath }/jsp/ui/img/${n.newsImg }"  /></a>
							<div class="belongs"><a href="#" class="link1">${n.type.typeName }</a></div>
						</div>
						<div class="list-content">
							<h1><a style="text-decoration:none;" href="${pageContext.request.contextPath }/news/queryNews.form?newsId=${n.news_Id }" >${n.title }</a></h1>
							<div class="article-info">
								<div class="index-time">作者：<span class="link4" target="_blank">${n.user.nickname }</span></div>
								<div class="article-star level4"></div>
							</div>
							<div class="summary">描述：${n.descript}</div>
							<div class="data">
								<div class="data-left">
									<div class="data-text">推荐于：${n.createTime }</div>
									<div class="data-star level4"></div>
								</div>
								<div class="data-right">浏览：${n.lookCount } / 评论：${n.commentCount }</div>
							</div>
						</div>
					</div>
					</c:forEach>
				</c:if>
				
				
		<c:set var='url' value="${pageContext.request.contextPath }/news/findAllNewsByStatus.form"></c:set> 
		<div id="page">
          <c:if test="${page.pageNow != 1}">
  			  <a href="${pageContext.request.contextPath }/news/findAllNewsByStatus.form?pageNow=1&pageSize=${page.pageSize}">首页</a>&nbsp;
  			  <a href="${pageContext.request.contextPath }/news/findAllNewsByStatus.form?pageNow=${page.pageNow-1 }&pageSize=${page.pageSize}">上一页</a>&nbsp;
  		  </c:if>
   			
   			<c:if test="${page.pageNow != page.pageCount}">
   			   <a href="${pageContext.request.contextPath }/news/findAllNewsByStatus.form?pageNow=${page.pageNow+1 }&pageSize=${page.pageSize}">下一页</a>&nbsp;
   			   <a href="${pageContext.request.contextPath }/news/findAllNewsByStatus.form?pageNow=${page.pageCount }&pageSize=${page.pageSize}">尾页</a>&nbsp;
   			</c:if>

			当前 <span style='color:red'>${page.pageNow }</span>/${page.pageCount }页  &nbsp;
			
			跳转&nbsp;<input type="text" style='width:30px;text-align: center;margin-top: 5px' value='${page.pageNow }' id="toPage" name="toPage" />&nbsp;&nbsp;<input type="button" value="Go" onclick="go()" style="width: 50px;margin-top: -5px">&nbsp;
			
			每页显示:<select name="toSize" onchange="toSize(this)" style="width: 100px">
					<option value="5"  <c:if test='${page.pageSize == "5" }'>selected</c:if>   >5</option>
					<option value="10"  <c:if test='${page.pageSize == "10" }'>selected</c:if>    >10</option>
					<option value="20"  <c:if test='${page.pageSize == "20" }'>selected</c:if>    >20</option>
			       </select>&nbsp;条
		</div>
				</div>
			
				<!-- 右侧 -->
				<div class="holder2" >
					<dl class="function" id="divSearchPanel" style="background-color: #5B9BD5;height: 30px;margin: 0 0 50px 0">
						<dt class="function_t" style="font-size: 17px;margin-left: 20px;padding-top: 7px">搜 索</dt>
						<dd class="function_c">
						<div>
							<div style="padding:1.2em 0 0.5em 1em;">
								<form method="post" action="${pageContext.request.contextPath }/news/findNewsByTag.form">
									<input type="text" name="inputtag" id="edtSearch" size="12"  style="width: 180px"/> 
									<input type="submit" value="搜索" name="" style="height:30px;width: 50px;margin-top: -8px"/>
								</form>
							</div>
						</div>
						</dd>
					</dl>
				</div>
				<div class="holder2" style="height:190px">
					<div style="background-color: #5B9BD5;height: 30px;"><p style="font-size: 16px;margin-left: 20px;padding-top: 7px;">最新公告</p></div>
					<div style="font-size: 16px;margin-top: 10px">
						<ul>	
							<li style="text-overflow:ellipsis;overflow:hidden;width:250px;" >
							     ${notice.notice_Content }
							</li>
						</ul>
					</div>			
				</div>
				
				<div class="holder2">
					<div style="background-color: #5B9BD5;height: 30px;"><p style="font-size: 16px;margin-left: 20px;padding-top: 7px;">新闻推荐</p></div>
					<div style="font-size: 16px;margin-top: 10px">
						<ul>
							<c:if test="${not empty newss }">
								<c:forEach var='n' items='${newss  }'>
									<li style="text-overflow:ellipsis;height: 30px;overflow:hidden;white-space:nowrap;width:250px;border-bottom:1px gray dashed;"  >
							     		<a style="color:blue;" href="${pageContext.request.contextPath }/news/queryNews.form?newsId=${n.news_Id }">${n.title}</a>	
									</li>
									<p></p>
						     	</c:forEach>
					       	</c:if> 
					       	
						</ul>
					</div>			
				</div>
				
				
		</div>
	
	<div id="divBottom" style="margin-left:-150px;">
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
				
				var url = "${pageContext.request.contextPath }/news/findAllNewsByStatus.form?pageSize=${page.pageSize }&pageNow="+now;
				location = url;
			}
		}
	}
	
	function toSize(obj){
		var size = obj.value;
		location = "${pageContext.request.contextPath }/news/findAllNewsByStatus.form?pageSize="+size+"&pageNow=1";
		
	}
	
	
	window.onload=function(){
		$.ajax({
			type: 'POST',
			url: '${pageContext.request.contextPath }/notice/queryNoticeForUI.form',
			success: function(data){
				console.log(data.msg); 
			},
			error:function(data) {
				console.log(data.msg);
			},
		});	
		
	};
	
	
</script>
	 <script>
	  $(function(){
			$('#owl-demo').owlCarousel({
				items: 1,
				navigation: true,
				navigationText: ["上一个","下一个"],
				autoPlay: true,
				stopOnHover: true
			}).hover(function(){
				$('.owl-buttons').show();
			}, function(){
				$('.owl-buttons').hide();
			});
		});

	

</script>
</body>
</html>