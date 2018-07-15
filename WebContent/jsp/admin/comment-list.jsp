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


<title>评论列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 评论管理 <span class="c-gray en">&gt;</span> 评论列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<form action="${pageContext.request.contextPath }/comment/commentList.form" method="post">
		<div class="text-c"> 日期范围
			<input type="text" name="startTime" value="${startTime }" onfocus="WdatePicker({ maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}' })" id="datemin" class="input-text Wdate" style="width:120px;">
			-
			<input type="text" name="endTime" value="${endTime }" onfocus="WdatePicker({ minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d' })" id="datemax" class="input-text Wdate" style="width:120px;">
			<input type="text" class="input-text" style="width:250px" placeholder="用户昵称或新闻标题" id="" name="inputCondition">
			<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜索</button>
		</div>
	</form>	
	<div class="cl pd-5 bg-1 bk-gray mt-20"><span class="l"><input type="button"  id="delbatch" class="btn btn-danger radius" value="批量删除"></span> <span class="r">共有数据：<strong>${page.rowCount }</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="">ID</th>
				<th width="">新闻标题</th>
				<th width="">评论用户</th>
				<th width="">评论内容</th>
				<th width="">评论时间</th>
				<th width="">操作</th>
			</tr>
		</thead>
		<c:if test="${not empty page.comments }">
			<c:forEach var='c' items='${page.comments }'>
		<tbody>
			<tr class="text-c">
				<td><input type="checkbox" value="${c.comment_Id }" name="commentIds" ></td>
				<td>${c.comment_Id }</td>
				<td>${c.news.title}</td>
				<td>${c.from_user.nickname }</td>
				<td>${c.commentContent }</td>
				<td>${c.commentTime }</td>			
				<td class="td-manage"> <a style="text-decoration:none" class="ml-5" onClick="comment_del('${c.comment_Id}')" href="javascript:;" title="删除"><i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
		</tbody>
			</c:forEach>
		</c:if>
		<c:if test="${empty page.comments }" >
			<tbody>
				<tr>
					<td colspan="7" style='color:red;font-size:9pt;text-align: center'>没有数据</td>
				</tr>
			</tbody>
		</c:if>
	</table>
	</div>
	
	<c:set var='url' value="${pageContext.request.contextPath }/comment/commentList.form?nickname =${nickname }&title=${title}"></c:set> 
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
				
				var url = "${pageContext.request.contextPath }/comment/commentList.form?nickname=${nickname}&title=${title}&pageSize=${page.pageSize }&pageNow="+now;
				location = url;
			}
		}
	}
	
	function toSize(obj){
		var size = obj.value;	
		location = "${pageContext.request.contextPath }/comment/commentList.form?nickname=${nickname}&title=${title}&pageSize="+size+"&pageNow=1";
		
	}

	/*评论-删除*/
	function comment_del(id){
		if(confirm("确定删除吗？")){
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath }/comment/delComment.form?commentId='+id,
				success: function(data){
					window.location.reload(); 
				},
				error:function(data) {
					console.log(data.msg);
				},
			});		
		}
	}
	
	/**
	 * 评论批量删除
	 */
	 $(document).ready(function(){
			$("#delbatch").click(function(){
				var commentids = new Array();
				$("input[name='commentIds']:checked").each(function() { 
					commentids.push($(this).val());
				//	commentids +=$(this).val()+",";
				});
				if(commentids.length>0){					
					if(confirm("确定删除？")){		
						$.ajax({ 
							type:"post", 
							url:"${pageContext.request.contextPath }/comment/delBatchComment.form", 
							data: {
									"commentids":commentids.toString()
							}, 
						//	dataType:"json",
							success: function(result) { 
								$("[name = 'commentIds']:checkbox").attr("checked", false); 
								window.location.reload(); 
							} 
						}); 
					}
				}else{
					 alert("请先选择！");
				}
			});		
		});


</script> 
</body>
</html>