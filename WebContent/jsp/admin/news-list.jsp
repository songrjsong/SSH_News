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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/static/h-ui.admin/css/style.css" />

<title>新闻列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 新闻管理 <span class="c-gray en">&gt;</span> 新闻列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c">
	<form action="${pageContext.request.contextPath }/news/showNewsListToAdmin.form" method="post">
		作者：
		 <input type="text" name="nickname" id="" style="width:100px" class="input-text">
		类别：
		 <input type="text" name="typeName" id="" style="width:100px" class="input-text">
		 日期范围：
			<input type="text" name="startTime" value="${startTime }" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'logmax\')||\'%y-%M-%d\'}' })" id="logmin" class="input-text Wdate" style="width:120px;">
			-
			<input type="text" name="endTime" value="${endTime }" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'logmin\')}',maxDate:'%y-%M-%d' })" id="logmax" class="input-text Wdate" style="width:120px;">
			<input type="text"  name="title" id="" placeholder=" 新闻名称" style="width:250px" class="input-text">
			<button name="" id="" class="btn btn-success" type="submit"><i class="Hui-iconfont">&#xe665;</i> 搜新闻</button>
	</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20">  <span class="r">共有数据：<strong>${page.rowCount }</strong> 条</span> </div>
	<div class="mt-20">
		<table class="table table-border table-bordered table-bg table-hover table-sort table-responsive">
			<thead>
				<tr class="text-c">
					<th width="25"><input type="checkbox" name="" value=""></th>
					<th>ID</th>
					<th>标题</th>
					<th>分类</th>
					<th>标签</th>
					<th>来源</th>
					<th>发布时间</th>
					<th>浏览次数</th>
					<th>评论次数</th>
					<th>点赞次数</th>
					<th>发布状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<c:if test="${not empty page.news }">
				<c:forEach var='n' items='${page.news }'>
			<tbody>
				<tr class="text-c">
					<td><input type="checkbox"  name=""  ></td>
					<td>${n.news_Id }</td>
					<td><u style="cursor:pointer" class="text-primary" onClick="news_show(' ','${pageContext.request.contextPath}/news/showNews2.form?newsId=${n.news_Id }','${n.news_Id }','700','500' )" title="查看新闻">${n.title }</u></td>
					<td>${n.type.typeName }</td>
					<td>${n.label }</td>
					<td>${n.user.nickname }</td>
					<td>${n.createTime }</td>
					<td>${n.lookCount }</td>
					<td>${n.commentCount }</td>
					<td>${n.favorCount }</td>
					<td class="td-status">
						<c:if test="${n.status eq 1 }"><span class="label label-success radius">已发布</span></c:if>
						<c:if test="${n.status eq 0 }"><span class="label label-success radius">未发布</span></c:if>
					</td>
					<td class="f-14 td-manage"><a style="text-decoration:none" onClick="news_shenhe('${n.news_Id}')" href="javascript:;" title="审核"><i class="Hui-iconfont">&#xe6e1;</i></a><a style="text-decoration:none" class="ml-5" onClick="news_del('${n.news_Id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a> </td>
				</tr>
			</tbody>
			</c:forEach>
		</c:if>
		<c:if test="${empty page.news }" >
					<tbody>
						<tr>
							<td colspan="11" style='color:red;font-size:9pt;text-align: center'>没有数据</td>
						</tr>
					</tbody>
		</c:if>
		</table>
	</div>
	<c:set var='url' value="${pageContext.request.contextPath }/news/showNewsListToAdmin.form?nickname =${n.nickname }&typeName=${n.type.typeName }&title=${n.title }"></c:set> 
		<div class="page" style="text-align:center;margin-top:10px;font-size:14px">
		<c:if test="${page.pageNow != 1}">
    			<a href="${url }&pageNow=1&pageSize=${page.pageSize}">首页</a>&nbsp;
    			<a href="${url }&pageNow=${page.pageNow-1 }&pageSize=${page.pageSize}">上一页</a>&nbsp;
    	</c:if>
    			
    	<c:forEach var='beg' begin="1" end="${page.pageCount }">
    			<a href="${url }&pageNow=${beg }&pageSize=${page.pageSize}">${beg }</a>
    	</c:forEach>
    			
    	<c:if test="${page.pageNow != page.pageCount}">
    			<a href="${url }&pageNow=${page.pageNow+1 }&pageSize=${page.pageSize}">下一页</a>&nbsp;
    			<a href="${url }&pageNow=${page.pageCount }&pageSize=${page.pageSize}">尾页</a>&nbsp;
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

<script type="text/javascript" src="${pageContext.request.contextPath }/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/static/h-ui.admin/js/H-ui.admin.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="${pageContext.request.contextPath }/lib/laypage/1.2/laypage.js"></script>
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
				
				var url = "${pageContext.request.contextPath }/news/showNewsListToAdmin.form?nickname=${nickname}&typeName=${typeName}&title=${title}&pageSize=${page.pageSize }&pageNow="+now;
				location = url;
			}
		}
	}

	function toSize(obj){
		var size = obj.value;
		location = "${pageContext.request.contextPath }/news/showNewsListToAdmin.form?nickname=${nickname}&typeName=${typeName}&title=${title}&pageSize="+size+"&pageNow=1";
		
	}

	/*新闻-查看*/
	function news_show(title,url,id,w,h){
		layer_show(title,url,w,h);
	}
	
	
	/*新闻-审核*/
	function news_shenhe(id){
		if(confirm("通过审核？")){
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath }/news/newsShenHe.form?newsId='+id,
				success: function(data){
					window.location.reload(); 
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		}
	}
	
	/*新闻-删除*/
	function news_del(id){
		if(confirm("确定删除该新闻？")){
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath }/news/newsDel.form?newsId='+id,
				success: function(data){
					window.location.reload(); 
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		}
	}
</script> 
</body>
</html>