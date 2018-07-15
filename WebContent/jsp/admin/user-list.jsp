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


<title>用户管理</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span> 用户列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<form action="${pageContext.request.contextPath }/user/userList.form" method="post">
		<div class="text-c"> 注册时间：
			 <input type="text" name="startTime" value="${startTime }" onfocus="WdatePicker({maxDate:'#F{$dp.$D(\'datemax\')||\'%y-%M-%d\'}'})" id="datemin" class="input-text Wdate" style="width:120px;">
			-
			<input type="text" name="endTime" value="${endTime }" onfocus="WdatePicker({minDate:'#F{$dp.$D(\'datemin\')}',maxDate:'%y-%M-%d'})" id="datemax" class="input-text Wdate" style="width:120px;">
			<input type="text" class="input-text" style="width:250px" placeholder="输入用户姓名、电话、邮箱" id="" name="queryCondition" value="${queryCondition }">
			<button type="submit" class="btn btn-success radius" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 搜用户</button>
	</div>
	</form>
	<div class="cl pd-5 bg-1 bk-gray mt-20">  <span class="r">共有数据：<strong>${page.rowCount }</strong> 条</span> </div>
	<div class="mt-20">
	<table class="table table-border table-bordered table-hover table-bg table-sort">
		<thead>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="">ID</th>
				<th width="">昵称</th>
				<th width="">姓名</th>
				<th width="">性别</th>
				<th width="">身份证</th>
				<th width="">手机</th>
				<th width="">邮箱</th>
				<th width="">地址</th>
				<th width="">身份</th>
				<th width="">注册时间</th>			
				<th width="">状态</th>
				<th width="">操作</th>
			</tr>
		</thead>
		<c:if test="${not empty page.users }">
			<c:forEach var='u' items='${page.users }'>
		<tbody>
			<tr class="text-c">
				<td><input type="checkbox"  name="" id="" "></td>
				<td>${u.user_Id}</td>
				<td>${u.nickname }</td>
				<td><u style="cursor:pointer" class="text-primary" onclick="user_show('${u.name }','${pageContext.request.contextPath }/user/showUser.form?user_Id=${u.user_Id }','${u.user_Id}','400','500')">${u.name}</u></td>
				<td>${u.sex }</td>
				<td>${u.ID_Number}</td>
				<td>${u.tel }</td>
				<td>${u.email }</td>
				<td>${u.address }</td>
				<td>
					<c:if test="${u.is_editor eq 1}">作者</c:if>
					<c:if test="${u.is_editor eq 0}">普通用户 </c:if>
				</td>
				<td>${u.regTime }</td>
				<td class="td-status">
				<c:if test="${u.status eq 1}"><span class="label label-success radius">已启用</span></c:if>
				<c:if test="${u.status eq 0}"><span class="label label-success radius">已停用</span></c:if>
				</td>
				<td class="td-manage"><a style="text-decoration:none"  onClick="user_stop('${u.user_Id}',)" href="javascript:;" title="停用"><i class="Hui-iconfont">&#xe631;</i></a><a style="text-decoration:none" onClick="user_start('${u.user_Id}')" href="javascript:;" title="启用"><i class="Hui-iconfont">&#xe6e1;</i></a><a style="text-decoration:none" onClick="user_shenhe('${u.user_Id}')" href="javascript:;" title="作者审核"><i class="Hui-iconfont">&#xe601;</i></a></td>
			</tr>
		</tbody>
			</c:forEach>
		</c:if>
		<c:if test="${empty page.users }" >
			<tbody>
				<tr>
					<td colspan="11" style='color:red;font-size:9pt;text-align: center'>没有数据</td>
				</tr>
			</tbody>
		</c:if>
		
	</table>
	</div>
	
		<c:set var='url' value="${pageContext.request.contextPath }/user/userList.form?name =${name }&email=${email }&tel=${tel }"></c:set> 
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
				
				var url = "${pageContext.request.contextPath }/user/userList.form?name=${name}&email=${email}&tel=${tel}&pageSize=${page.pageSize }&pageNow="+now;
				location = url;
			}
		}
	}

	function toSize(obj){
		var size = obj.value;
		
		location = "${pageContext.request.contextPath }/user/userList.form?name=${name}&email=${email}&tel=${tel}&pageSize="+size+"&pageNow=1";
		
	}


	/*用户-查看*/
	function user_show(title,url,id,w,h){
		layer_show(title,url,w,h);
	}
	
	
	/*用户-停用*/
	function user_stop(id){
		if(confirm("确定停用吗？")){
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath }/user/userStop.form?userId='+id,
				success: function(data){
					window.location.reload(); 
				},
				error:function(data) {
					console.log(data.msg);
				}
			});		
		}
	}

	/*用户-启用*/
	function user_start(id){
		if(confirm("确定启用吗？")){
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath }/user/userStart.form?userId='+id,
				success: function(data){
					window.location.reload(); 
				},
				error:function(data) {
					console.log(data.msg);
				}
			});			
		}
	}
	
	/*作者-审核*/
	function user_shenhe(id){
		if(confirm("同意该用户申请为作者？")){
			$.ajax({
				type: 'POST',
				url: '${pageContext.request.contextPath }/user/zhuceEditor.form?userId='+id,
				success: function(data){
					window.location.reload(); 
				},
				error:function(data) {
					console.log(data.msg);
				}
			});
		}
	}
</script> 
</body>
</html>