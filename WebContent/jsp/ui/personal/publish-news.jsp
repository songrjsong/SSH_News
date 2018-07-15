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
	<title>发布新闻</title>
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/common.css" type="text/css" media="screen" />
	<link href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-common.css" rel="stylesheet" type="text/css" />
	<link rel="stylesheet"  href="${pageContext.request.contextPath}/jsp/ui/css/sentiments-user.css" type="text/css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/jsp/ui/css/bootstrap.min.css" >  
	<script src="${pageContext.request.contextPath}/jsp/ui/js/jquery-1.7.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/jsp/ui/js/bootstrap.min.js"></script>
	<link href="${pageContext.request.contextPath }/lib/Hui-iconfont/1.0.8/iconfont.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/jsp/ui/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.config.js"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/jsp/ui/ueditor1_4_3_3-utf8-jsp/utf8-jsp/ueditor.all.min.js"> </script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/jsp/ui/ueditor1_4_3_3-utf8-jsp/utf8-jsp/lang/zh-cn/zh-cn.js"></script>
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
				<a href="#">发表文章</a>
			</div>
			
			<form action="${pageContext.request.contextPath }/news/addNews.form?userId=${userInfo.user_Id}" method="post" enctype="multipart/form-data">
			
				<table class="user_table_1">
					<tr class="hui">
						<th>新闻标题</th>
						<td><input type="text" id="title" name="title" class="gray_inputbox input_title" /> </td>
					</tr>
					<tr class="hui">
						<th>新闻封面</th>
						<td><input type="file" id="newImg" name="newImg" class="gray_inputbox input_title" /> </td>
					</tr>
					<tr class="hui">
						<th>新闻内容</th>
						<td><div><script id="editor"  name="content" type="text/plain" style="width:780px;height:350px;"></script></div></td>	
					</tr>
					
					<tr class="hui">
						<th>新闻标签</th>
						<td>
							<input type="text"  name="label" class="gray_inputbox input_title"  />&nbsp;&nbsp;	
						</td>
					</tr>
					<tr class="hui">
						<th>文章类型</th>
						<td>
							<c:if test="${not empty types }">
								<c:forEach var='t' items='${types }'>
									<input type="radio" id="typeName" name="typeName" value="${t.typeName }" />${t.typeName }&nbsp;&nbsp;
								</c:forEach>
							</c:if>
						</td>
						
					</tr>
					
					<tr class="hui">
						<th class="descript">描&nbsp;&nbsp;&nbsp;&nbsp;述</th>
						<td>
							<textarea id="descript" name="descript" class="gray_textarea edit_summary"></textarea>
						</td>
					</tr>
					
				</table>
				
				<div id="ctrl_area" style="text-align: center;">
					<input id="btn_save" type="submit" value="发表文章 " class="green_button input_publish" />&nbsp;&nbsp;&nbsp;&nbsp;
					<input id="btn_save" type="reset" value="取消 " class="green_button input_publish" />
				</div>
		</form>	
		
			
	
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

    //实例化编辑器
    //建议使用工厂方法getEditor创建和引用编辑器实例，如果在某个闭包下引用该编辑器，直接调用UE.getEditor('editor')就能拿到相关的实例
    var ue = UE.getEditor('editor');


    function isFocus(e){
        alert(UE.getEditor('editor').isFocus());
        UE.dom.domUtils.preventDefault(e);
    }
    function setblur(e){
        UE.getEditor('editor').blur();
        UE.dom.domUtils.preventDefault(e);
    }
    function insertHtml() {
        var value = prompt('插入html代码', '');
        UE.getEditor('editor').execCommand('insertHtml', value);
    }
    function createEditor() {
        enableBtn();
        UE.getEditor('editor');
    }
    function getAllHtml() {
        alert(UE.getEditor('editor').getAllHtml());
    }
    function getContent() {
        var arr = [];
        arr.push("使用editor.getContent()方法可以获得编辑器的内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getContent());
        alert(arr.join("\n"));
    }
    function getPlainTxt() {
        var arr = [];
        arr.push("使用editor.getPlainTxt()方法可以获得编辑器的带格式的纯文本内容");
        arr.push("内容为：");
        arr.push(UE.getEditor('editor').getPlainTxt());
        alert(arr.join('\n'));
    }
    function setContent(isAppendTo) {
        var arr = [];
        arr.push("使用editor.setContent('欢迎使用ueditor')方法可以设置编辑器的内容");
        UE.getEditor('editor').setContent('欢迎使用ueditor', isAppendTo);
        alert(arr.join("\n"));
    }
    function setDisabled() {
        UE.getEditor('editor').setDisabled('fullscreen');
        disableBtn("enable");
    }

    function setEnabled() {
        UE.getEditor('editor').setEnabled();
        enableBtn();
    }

    function getText() {
        //当你点击按钮时编辑区域已经失去了焦点，如果直接用getText将不会得到内容，所以要在选回来，然后取得内容
        var range = UE.getEditor('editor').selection.getRange();
        range.select();
        var txt = UE.getEditor('editor').selection.getText();
        alert(txt);
    }

    function getContentTxt() {
        var arr = [];
        arr.push("使用editor.getContentTxt()方法可以获得编辑器的纯文本内容");
        arr.push("编辑器的纯文本内容为：");
        arr.push(UE.getEditor('editor').getContentTxt());
        alert(arr.join("\n"));
    }
    function hasContent() {
        var arr = [];
        arr.push("使用editor.hasContents()方法判断编辑器里是否有内容");
        arr.push("判断结果为：");
        arr.push(UE.getEditor('editor').hasContents());
        alert(arr.join("\n"));
    }
    function setFocus() {
        UE.getEditor('editor').focus();
    }
    function deleteEditor() {
        disableBtn();
        UE.getEditor('editor').destroy();
    }
    function disableBtn(str) {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            if (btn.id == str) {
                UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
            } else {
                btn.setAttribute("disabled", "true");
            }
        }
    }
    function enableBtn() {
        var div = document.getElementById('btns');
        var btns = UE.dom.domUtils.getElementsByTagName(div, "button");
        for (var i = 0, btn; btn = btns[i++];) {
            UE.dom.domUtils.removeAttributes(btn, ["disabled"]);
        }
    }

    function getLocalData () {
        alert(UE.getEditor('editor').execCommand( "getlocaldata" ));
    }

    function clearLocalData () {
        UE.getEditor('editor').execCommand( "clearlocaldata" );
        alert("已清空草稿箱");
    }
</script>

</body>
</html>
