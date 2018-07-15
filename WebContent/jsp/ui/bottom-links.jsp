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
	<title>友情链接</title>
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
				
				<h1>友情链接</h1>
				<div style="margin: 0 60px;">
					<div>&nbsp;</div>
					<div style="line-height:26px;font-size:12px;">
						<a href="http://www.wangxiaofeng.me" target="_blank" title="不许联想">不许联想</a>
						<a href="http://erji.hao123.com/xiaoqingxin" target="_blank" title="HAO123小清新">HAO123小清新</a>　
						<a href="http://www.slxun.com" target="_blank" title="一带一路城市网">一带一路城市网</a>　
						<a href="http://jandan.net" target="_blank" title="煎蛋">煎蛋</a>　
						<a href="http://photo.poco.cn" target="_blank" title="POCO摄影">POCO摄影</a>　
						<a href="http://www.17k.com" target="_blank" title="17K小说">17K小说</a>　
						<a href="http://xiangce.baidu.com" target="_blank" title="百度相册">百度相册</a>　
						<a href="http://www.xinli001.com" target="_blank" title="壹心理">壹心理</a>　
						<a href="http://www.jinhusns.com" target="_blank" title="近乎">近乎</a>　
						<a href="http://www.coocg.com" target="_blank" title="漫天糖">漫天糖</a>　
						<a href="http://www.manmankan.com" target="_blank" title="火影忍者">火影忍者</a>　
						<a href="http://www.mahua.com" target="_blank" title="快乐麻花">快乐麻花</a>　
						<a href="http://www.zongheng.com" target="_blank" title="纵横小说网">纵横小说网</a>　
						<a href="http://www.laifudao.com" target="_blank" title="来福岛">来福岛</a>　
						<a href="http://www.52souluo.com" target="_blank" title="我爱搜罗网">我爱搜罗网</a>　
						<a href="http://qd.ifeng.com" target="_blank" title="凤凰网青岛">凤凰网青岛</a>　
						<a href="http://www.xilu.com" target="_blank" title="西陆军事">西陆军事</a>　
						<a href="http://www.duomi.com" target="_blank" title="多米音乐">多米音乐</a>　
						<a href="http://www.2345.com" target="_blank" title="2345网址">2345网址</a>　
						<a href="http://www.itouxian.com" target="_blank" title="爱偷闲">爱偷闲</a>　
						<a href="http://www.qclyd.com" target="_blank" title="神州汽车露营地">神州汽车露营地</a>　
						<a href="http://www.ishhuo.com" target="_blank" title="爱生活">爱生活</a>　
						<a href="http://www.xihaiannews.com" target="_blank" title="青岛西海岸新闻网">青岛西海岸新闻网</a>　
						<a href="http://www.sxbbm.com" target="_blank" title="师兄帮帮忙">师兄帮帮忙</a>　
						<a href="http://tuan.xihaiannews.com/" target="_blank" title="海岸团">海岸团</a>　
						<a href="http://www.arita.cc" target="_blank" title="ARITA阿里塔">ARITA阿里塔</a>　
						<a href="http://www.fengniao.com" target="_blank" title="蜂鸟网">蜂鸟网</a>　
						<a href="http://www.wozheka.com" target="_blank" title="我淘卡">我淘卡</a>　
						<a href="http://www.ruishitv.com/" target="_blank" title="睿视网">睿视网</a>　
						<a href="http://www.9mtu.cn/" target="_blank" title="九美图">九美图</a>　
						<a href="http://www.yiyuandesign.com/" target="_blank" title="怡元设计">怡元设计</a>　
						<a href="http://www.ruhonglife.com/" target="_blank" title="如弘家具">如弘家具</a>　
						<a href="http://www.coolxoo.com" target="_blank" title="酷迅网">酷迅网</a>　
						<a href="http://qng.im/" target="_blank" title="青果QNGOO">青果QNGOO</a>　
						<a href="http://www.shashatu.com/" target="_blank" title="傻傻图">傻傻图</a>　
						<a href="http://dorazzz.com" target="_blank" title="哆啦网">哆啦网</a>　
						<a href="http://www.huangjiwei.com/blog/" target="_blank" title="孤岛客">孤岛客</a>　
						<a href="http://www.k2gou.cn" target="_blank" title="孔二狗">孔二狗</a>　
						<a href="http://www.my7475.com" target="_blank" title="奇事奇物网">奇事奇物网</a>　
						<a href="http://cartoon.zwbk.org" target="_blank" title="动漫百科">动漫百科</a>　
						<a href="http://maitang.com" target="_blank" title="麦糖">麦糖</a>　
						<a href="http://www.mimoprint.com" target="_blank" title="创意个性礼品">创意个性礼品</a>　
						<a href="http://www.liudaiquan.com" target="_blank" title="幻觉摄影">幻觉摄影</a>　
						<a href="http://www.printyourmind.com" target="_blank" title="创意礼物">创意礼物</a>　
						<a href="http://www.yixieshi.com" target="_blank" title="互联网的一些事">互联网的一些事</a>　
						<a href="http://www.lequ001.com" target="_blank" title="乐趣小游戏">乐趣小游戏</a>　
						<a href="http://www.xxlifexx.com" target="_blank" title="制品">制品</a>　
						<a href="http://www.shzaizhi.com/" target="_blank" title="上海在职教育网">上海在职教育网</a>　
						<a href="http://www.cuixiaoke.com/" target="_blank" title="片段">片段</a>　
						<a href="http://shijueyishu.cc" target="_blank" title="视觉艺术">视觉艺术</a>　
						<a href="http://www.17art.com" target="_blank" title="当代艺术">当代艺术</a>　
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

