<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> 
<jsp:useBean id="now" class="java.util.Date"></jsp:useBean>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="utf-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
	<title>新闻页面</title>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/common.css" type="text/css" media="screen" />
	<link href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-common.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-user.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/ui/css/bootstrap.min.css" >  
	<script src="${pageContext.request.contextPath}/jsp/ui/js/jquery-1.7.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/jsp/ui/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/lib/layer/2.4/layer.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/ui/js/jquery-1.8.3.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/jsp/ui/css/owl.carousel.css" />
	<script type="text/javascript" src="${pageContext.request.contextPath }/jsp/ui/js/owl.carousel.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/h-ui/js/H-ui.min.js"></script> 
	<script type="text/javascript" src="${pageContext.request.contextPath }/static/h-ui.admin/js/H-ui.admin.js"></script>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/h-ui/css/H-ui.min.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/h-ui.admin/css/H-ui.admin.css" /> 
	<link href="${pageContext.request.contextPath }/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />	
	<style type="text/css">
		.holder {width:1100px;padding:20px 40px;border-radius:3px;margin:10px auto;overflow:hidden}
		.holder1 {float:left;width:702px;height:80px;padding:0px 0px 0px 0px;background:#fff;border-radius:3px;margin:-20px 0px 0px -40px;border:1px #eee solid;}
		.holder11 {float:left;width:702px;padding:0px 0px 50px 0px;background:#fff;border-radius:3px;margin:-20px 0px 0px -40px;border:1px #eee solid;}
		.holder1 h1 {width: 613px;height: 20px;padding: 0 15px 0 10px;border-left: 5px #f90 solid;line-height: 20px;
						font-size: 18px;letter-spacing: 1px;margin-bottom: 30px;margin-top: 30px;}
		.holder2 {width:295px;padding:0px 0px;background:#fff;border-radius:3px;margin:-20px 0px 40px 700px;border:1px #eee solid;}
		.holder2 h2 {width: 295px;height: 20px;padding: 0 10px 0 10px;border-left: 5px #f90 solid;line-height: 20px;
						font-weight: normal;font-size: 14px;letter-spacing: 1px;margin:20px 0 20px 0;}
		.holder2 h2 span {float: right;font-size: 12px;font-weight: normal;color: #ccc;margin-right: 30px;}
		.holder2 a{text-decoration:none;}			
		 ul li{  
		list-style-type:none;  
		}
			#pagelist{
			margin-top:35px;
			margin-left:0px;
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
		/* #commentContent{
	position:relative;
	
	width:550px;
	height: 30px;
	/* border:1px solid pink; */
	border:1px solid pink;
	}
	#content{
	border: 1px solid #eee; 
	width: 580px;
	height: auto;
	z-index: 10px;
	margin-left:-10px;
	-moz-border-radius: 5px; 
    -webkit-border-radius: 5px; 
    border-radius:5px;   
	} */	
	</style>
</head>
<body>
	<div id="divTop" style="margin-top:-22px;">
		<div id="divtu">
			<h1 id="BlogTitle"><a href="#"><img src="${pageContext.request.contextPath}/jsp/ui/images/head.png" style="width: 1365px;height: 150px" /></a></h1>		
			<div style="float: right;position: relative;top:-150px;left: -40px;font-size: 16px">
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
		<div id="div_status" class="login-user" style="display:none;"></div>
			<div class="holder">
			<!-- 左侧 -->
				
				<div class="holder11" style="font-size: 15px">
					<div>
				 		<c:if test="${not empty news }">
					
						<div id="content">
						    <br></br>
						    
							<p style="text-align:center;font-family:楷体; font-size: 25px;font-weight: bold;color: #444">${news.title }</p>
							<p style="text-align:center;">标签：${news.label }丨类型： ${news.type.typeName }丨 来自：<a href="${pageContext.request.contextPath }/jsp/ui/personal/personal.jsp">${news.user.nickname }</a>
							<p style="text-align:center;">本文为原创内容，未经许可，禁止转载；合作请联系邮箱：${news.user.email }</p>
	
      						 <br></br>
	 					   <hr style="border: 1px dashed #ccc;width:640px;margin-left: 20px"></hr>
	   					   <table >
					   		 <tbody>
								<tr>
									<td>  
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${news.content }	
									<br/><br/><br/><br/>
									<br></br>
									<br/><br/>
									<img alt="" src="${pageContext.request.contextPath }/jsp/ui/img/houyuan.png " style="margin-left:80px"/>
									<br><br>
									<i style="font-size:18px;margin-left:220px;">欢迎关注新闻发布系统平台</i>
									
									<br/><br/>
									
									<c:if test="${ collect.collectStatus eq 1 }">
									<div style="position:relative ;top:135px;left:120px">	
											已收藏&nbsp;&nbsp;<a style="text-decoration:none;" href="javascript:;" title="取消收藏"><i id="qcoll" class="Hui-iconfont" style="color: yellow;font-size: 20px">&#xe630;</i></a>
									</div>
									</c:if>  
									<c:if test="${collect.collectStatus eq 0 }">
										<div style="position:relative ;top:135px;left:120px">
											收藏&nbsp;&nbsp;<a  style="text-decoration:none" href="javascript:;"   title="收藏"><i id="coll" class="Hui-iconfont" style="color: black;font-size: 20px">&#xe630;</i></a>
										</div>
									</c:if>
									<c:if test="${empty collect.collect_Id}">
										<div style="position:relative ;top:135px;left:120px">
											收藏&nbsp;&nbsp;<a  style="text-decoration:none" href="javascript:;"   title="收藏"><i id="coll2" class="Hui-iconfont" style="color: black;font-size: 20px">&#xe630;</i></a>
										</div>
									</c:if>
									<c:if test="${favor.favor_Status eq 1   }">
									<div style="position:relative ;top:103px;left:200px">	
											已赞&nbsp;&nbsp;<a style="text-decoration:none" href="javascript:;"   title="取消点赞"><i id="like" class="Hui-iconfont" style="color: red;font-size: 20px">&#xe648;</i></a>
									</div>
									</c:if>  
									<c:if test="${favor.favor_Status eq 0 }">
										<div style="position:relative ;top:103px;left:200px">
											点赞&nbsp;&nbsp;<a  style="text-decoration:none" href="javascript:;"   title="点赞"><i id="cs" class="Hui-iconfont" style="color: black;font-size: 20px">&#xe648;</i></a>
										</div>
									</c:if>
									<c:if test="${ empty favor.favor_Id }">
										<div style="position:relative ;top:103px;left:200px">
											点赞&nbsp;&nbsp;<a  style="text-decoration:none" href="javascript:;"   title="点赞"><i id="cs2" class="Hui-iconfont" style="color: black;font-size: 20px">&#xe648;</i></a>
										</div>
									</c:if>	
									<div style="position:relative ;top:70px;left:280px">
											举报&nbsp;&nbsp;<a href="javascript:;" onclick="inform_news('','${pageContext.request.contextPath }/jsp/ui/inform-news.jsp',' ','400','300')"><i id="jubao" class="Hui-iconfont" style="color: black;font-size: 20px">&#xe692;</i></a>
									</div>	
									<p id="lastpart" style="margin-left: 350px;margin-top: 50px">发布时间： <fmt:formatDate value="${news.createTime }" pattern="yyyy-MM-dd "/>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;浏览：${news.lookCount }/评论:${news.commentCount }
									</p>		<!-- HH:mm:ss -->
									
																		
									</td>   
									 </tr>
								</tbody>
								</table>
								<br></br>
								<hr style="border: 1px solid #eee; width:680px;margin-left: 10px"></hr>
								<br>
									<p style="margin-left: 50px;">我要评论：</p>
				     				<div id="comment" style="margin-left: 40px;" >
		             
										<form id="id_form">
									    	<textarea id="commentContent" name="commentContent" style="width: 610px;height:80px;border:1px solid pink;"></textarea><br />
									    	<input id="articleid" type="hidden"  name="newsId" value="${news.news_Id }"> 
											<input id="btn_save" type="button" value="发表" class="green_button input_publish" style="width:100px;margin-top:20px;" />&nbsp;&nbsp;&nbsp;&nbsp;
											<input id="btn_save1" type="reset" value="取消 " class="green_button input_publish" style="width:100px;margin-top:20px;" />
										  
										</form> 
									</div>	
									<br></br>
									<p style="margin-left: 50px;">评论内容：</p>
									
									<c:forEach var='comment' items='${commentpage.comments }'>
									</br>
									<hr style="border: 1px dashed #eee; width:680px;margin-left: 10px"></hr>
									<c:if test="${empty comment.from_user.image }">
										<img  style="position: relative;top:20px;left:50px" width="50px" height="50px"  src="${pageContext.request.contextPath }/jsp/ui/img/0.png"></img> 
									</c:if>
									<c:if test="${not empty comment.from_user.image }">
										<img  style="position: relative;top:20px;left:50px" width="50px" height="50px"  src="${pageContext.request.contextPath }/jsp/ui/img/${comment.from_user.image }"></img> 
									</c:if>
										
										<span style="position: relative;top:8px;left:70px">${comment.from_user.nickname }:&nbsp;&nbsp;
										${comment.commentContent }</span>
										<br></br>
										<div style="position: relative;left:540px;top:20px">
										<fmt:formatDate value="${comment.commentTime }" pattern="yyyy-MM-dd HH:mm:ss "  /> 
										</div>
										
										
										
									</c:forEach>
										
									<div id="com_content" ></div>	
								</div>
				
							</c:if> 
				
					 	</div>
					
					</div>
			
				
				<div class="holder2" >
		 			<c:if test="${not empty news }">
						
							<p>&nbsp;</p>
							<c:if test="${empty news.user.image}">
							 	<img src="${pageContext.request.contextPath }/jsp/ui/img/0.png" width="120px" height="120px" style="position:relative; margin-left: 10px; margin-top: -10px;" alt="用户头像" />
							</c:if>
							<c:if test="${not empty news.user.image}">
								 <img src="${pageContext.request.contextPath }/jsp/ui/img/0.png" width="120px" height="120px" style="position:relative; margin-left: 10px; margin-top: -10px;" alt="用户头像" />
							</c:if>
						   
							<p style="position:relative; margin-left: 150px;margin-top:-110px;color: orange;font-size: 18px ">${news.user.nickname }</p>
							<p style="position:relative; margin-left: 145px;margin-top: 0px;color: #ccc;width:130px;height: 70px;overflow:hidden;">${news.user.signature }</p>
							
							<c:if test="${!(news .user.user_Id).equals(sessionScope.userInfo.user_Id) }">
								<div style="background-color: #65b916;width: 270px;height: 40px; margin-top:35px;margin-left: 13px;"></div>
								
								<c:if test="${attention.status  eq 1 }">
									<p id="ygz" style="margin-left: 120px;margin-top: -38px;font-size: 20px;"><a href="" style="color: white">已关注</a></p>
								</c:if>
								<c:if test="${attention.status  eq 0 }">
									<p id="jgz2" style="margin-left: 120px;margin-top: -38px;font-size: 20px;"><a href="" style="color: white">+关注</a></p>
								</c:if>
								<c:if test="${empty attention.attention_Id }">
									<p id="jgz" style="margin-left: 120px;margin-top: -38px;font-size: 20px;"><a href="" style="color: white">+关注</a></p>
								</c:if>
							</c:if>
			
				
					</c:if>	
				</div>
				<div class="holder2">
					<a href="${pageContext.request.contextPath }/news/queryNews.form?newsId=18"><img src="${pageContext.request.contextPath }/jsp/ui/img/weijinsi.jpg" width="250px" height="120px" style="margin-top: 20px;margin-left: 15px"/></a>
					<p style="margin-top: 5px;"><a href="${pageContext.request.contextPath }/news/queryNews.form?newsId=18" style="margin-left: 15px;font-size: 17px;">曝1.48亿状元郎恐被交易！</a></p>
					<a href="${pageContext.request.contextPath }/news/queryNews.form?newsId=20"><img src="${pageContext.request.contextPath }/jsp/ui/img/nvpai.jpg" width="250px" height="120px" style="margin-top: 10px;margin-left: 15px"/></a>
					<p style="margin-top: 5px;"><a href="${pageContext.request.contextPath }/news/queryNews.form?newsId=20" style="margin-left: 15px;font-size: 17px; ">中国女排3-0横扫多米尼加取开门红 </a></p>
					<a href="${pageContext.request.contextPath }/news/queryNews.form?newsId=6"><img src="${pageContext.request.contextPath }/jsp/ui/img/bolan.jpg" width="250px" height="120px" style="margin-top: 10px;margin-left: 15px"/></a>
					<p style="margin-top: 5px;"><a href="${pageContext.request.contextPath }/news/querynews.form?newsId=6" style="margin-left: 15px; font-size: 17px;">波兰为防备俄军狂买美国爱国者导弹</a></p>
					<p>&nbsp;</p>
				</div>
				
				
			
	</div>
	
	<div id="divBottom" style="margin-left:-150px;">
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

	
	<script >
	
	 $(function() {
	    	if($("#cs")[0]){
	        $("#cs").click(function () {
	        	var myName="<%=session.getAttribute("userInfo")%>"; 
	        	if( myName != "null"){
	        		 $.ajax({ 
	        			 url: "${pageContext.request.contextPath }/favor/addFavor.form", 
	        			 context: "document.body",
	        			 success: function(){
	        			 $(this).toggleClass('cs2'); 
	        			 window.location.reload(); 
	        			 }}); 
	        	}else{
	        		alert("请先登录");
	        	}  
	        });
	    	}else if($("#cs2")[0]){
	    		$("#cs2").click(function () {
	            	var myName="<%=session.getAttribute("userInfo")%>"; 
	            	if( myName != "null"){
	            		 $.ajax({ 
	            			 url: "${pageContext.request.contextPath }/favor/addFavor.form", 
	            			 context: "document.body",
	            			 success: function(){
	            			 $(this).toggleClass('cs'); 
	            			 window.location.reload(); 
	            			 }}); 
	            	}else{
	            		alert("请先登录");
	            	}  
	            });
	    		}else if($("#like")[0]){
	    			$("#like").click(function () {
	            	var myName="<%=session.getAttribute("userInfo")%>"; 
	            	if( myName != "null"){
	            		 $.ajax({ 
	            			 url: "${pageContext.request.contextPath }/favor/addFavor.form", 
	            			 context: "document.body",
	            			 success: function(){
	            			 $(this).toggleClass('cs'); 
	            			 window.location.reload(); 
	            			 }}); 
	            	}else{
	            		alert("请先登录");
	            	}  
	            });
	    	}
	    }); 
	
	</script>
	<script >
	
	 $(function() {
	    	if($("#ygz")[0]){
	        $("#ygz").click(function () {
	        	var myName="<%=session.getAttribute("userInfo")%>"; 
	        	if( myName != "null"){
	        		 $.ajax({ 
	        			 url: "${pageContext.request.contextPath }/attention/addAttention.form", 
	        			 context: "document.body",
	        			 success: function(){
	        			 $(this).toggleClass('jgz'); 
	        			 window.location.reload(); 
	        			 }}); 
	        	}else{
	        		alert("请先登录");
	        	}  
	        });
	    	}else if($("#jgz")[0]){
	    		$("#jgz").click(function () {
	            	var myName="<%=session.getAttribute("userInfo")%>"; 
	            	if( myName != "null"){
	            		 $.ajax({ 
	            			 url: "${pageContext.request.contextPath }/attention/addAttention.form", 
	            			 context: "document.body",
	            			 success: function(){
	            			 $(this).toggleClass('ygz'); 
	            			 window.location.reload(); 
	            			 }}); 
	            	}else{
	            		alert("请先登录");
	            	}  
	            });
	    	}else if($("#jgz2")[0]){
	    		$("#jgz2").click(function () {
	            	var myName="<%=session.getAttribute("userInfo")%>"; 
	            	if( myName != "null"){
	            		 $.ajax({ 
	            			 url: "${pageContext.request.contextPath }/attention/addAttention.form", 
	            			 context: "document.body",
	            			 success: function(){
	            			 $(this).toggleClass('ygz'); 
	            			 window.location.reload(); 
	            			 }}); 
	            	}else{
	            		alert("请先登录");
	            	}  
	            });
	    	}
	    	
	    }); 
	
	</script>
<script >
     
	 $(function() {
	    	if($("#qcoll")[0]){
	        $("#qcoll").click(function () {
	        	var myName="<%=session.getAttribute("userInfo")%>"; 
	        	if( myName != "null"){
	        		 $.ajax({ 
	        			 url: "${pageContext.request.contextPath }/collect/addcollect.form", 
	        			 context: "document.body",
	        			 success: function(){
	        			 $(this).toggleClass('coll'); 
	        			 window.location.reload(); 
	        			 }}); 
	        	}else{
	        		alert("请先登录");
	        	}  
	        });
	    	}else if($("#coll")[0]){
	    		$("#coll").click(function () {
	            	var myName="<%=session.getAttribute("userInfo")%>"; 
	            	if( myName != "null"){
	            		 $.ajax({ 
	            			 url: "${pageContext.request.contextPath }/collect/addcollect.form", 
	            			 context: "document.body",
	            			 success: function(){
	            			 $(this).toggleClass('coll2'); 
	            			 window.location.reload(); 
	            			 }}); 
	            	}else{
	            		alert("请先登录");
	            	}  
	            });
	    	}else if($("#coll2")[0]){
	    		$("#coll2").click(function () {
	            	var myName="<%=session.getAttribute("userInfo")%>"; 
	            	if( myName != "null"){
	            		 $.ajax({ 
	            			 url: "${pageContext.request.contextPath }/collect/addcollect.form", 
	            			 context: "document.body",
	            			 success: function(){
	            			 $(this).toggleClass('coll'); 
	            			 window.location.reload(); 
	            			 }}); 
	            	}else{
	            		alert("请先登录");
	            	}  
	            });
	    	}
	    }); 
		
	 /*举报新闻*/
	 function inform_news(title,url,id,w,h){
		 var myName = "<%=session.getAttribute("userInfo")%>"; 
		 if(myName != "null"){
			 layer_show(title,url,w,h);
		 }else{
			 alert("请先登录");
		 }
		
	 }
	 
	 
	 
	</script>
	<script type="text/javascript">  
    
		$(function() {
		        $("#btn_save").click(function () {
		        	var myName="<%=session.getAttribute("userInfo")%>"; 
		        	if( myName != "null"){
		        		 $.ajax({ 
		        			 url: "${pageContext.request.contextPath }/comment/addComment.form", 
		        			 type:"POST",
		     	             data:$("#id_form").serialize(), 
		     	           	 success:function(data){
		    	            	alert('Thanks for your comment!');
		    	            	$("#com_content").append("<img alt='图片' id='img' style='position: relative;top:20px;left:50px' width='50px' height='50px' src='${pageContext.request.contextPath }/jsp/ui/images/${user.image }'></img><span style='position: relative;top:8px;left:70px'>"+"${user.nickname }:"+$('#commentContent').val()+"<br></br></span> "+"<div style='position: relative;left:50px;top:8px'><fmt:formatDate value='${now}' pattern='yyyy-MM-dd HH:mm '/><div>"+"<br></br>" ); 
		    	            	$("#commentContent").val("");
		    	            	window.location.reload();
		    	           	 },
		    	             error:function(error){
		    	            	alert('发送错误');
		    	             }
		        		  }); 
		        	}else{
		        		alert("请先登录");
		        	}  
		        });
			
		});

</script>   
</body>
</html>