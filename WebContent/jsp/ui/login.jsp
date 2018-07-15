<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/jsp/ui/style/ui.regist.css" />
<style type="text/css">
	.login_bj {
    background: url(${pageContext.request.contextPath }/jsp/ui/images/bj_zhuce.jpg) no-repeat top center;
        background-color: rgba(0, 0, 0, 0);
        background-image: url("${pageContext.request.contextPath }/jsp/ui/images/bj_zhuce.jpg");
       }
   .zhuce_body .zhuce_kong .zc .bj_bai .phone {
    background: url(${pageContext.request.contextPath }/jsp/ui/images/zc_06.jpg) no-repeat 10px 10px;
        background-color: rgba(0, 0, 0, 0);
        background-image: url("${pageContext.request.contextPath }/jsp/ui/images/zc_06.jpg");
    }
    .zhuce_body .zhuce_kong .zc .bj_bai .email {
    background: url(${pageContext.request.contextPath }/jsp/ui/images/zc_12.jpg) no-repeat 10px 10px;
        background-color: rgba(0, 0, 0, 0);
        background-image: url("${pageContext.request.contextPath }/jsp/ui/images/zc_12.jpg");
 }
 .zhuce_body .zhuce_kong .zc .bj_bai .possword {
    background: url(${pageContext.request.contextPath }/jsp/ui/images/zc_16.jpg) no-repeat 10px 10px;
        background-color: rgba(0, 0, 0, 0);
        background-image: url("${pageContext.request.contextPath }/jsp/ui/images/zc_16.jpg");
    }
    .zhuce_body .zhuce_kong .zc .bj_bai .yanzm {
    background: url(${pageContext.request.contextPath }/jsp/ui/images/zc_19.jpg) no-repeat 10px 10px;
        background-color: rgba(0, 0, 0, 0);
        background-image: url("${pageContext.request.contextPath }/jsp/ui/images/zc_19.jpg");
    }
  
	 #pic_1{
	 	position: absolute;
	 	top:100px;
	 	z-index: -300px;
	 }

</style>

</head>
<body class="login_bj">

	<div class="zhuce_body">
		<div class="logo"><a href="${pageContext.request.contextPath }/ui/login.form"></a></div> 
    		<div class="zhuce_kong">
    			<div class="zc">		
				<div id="pic_1">
				 </div>
        			<div class="bj_bai" >
           			<h3 style="font-size: 25px;margin-top: 40px;margin-left: -10px;color: #3498db;font-family: 楷体 "><b>登录</b></h3>
       	  	  		<!-- 处理cookie记住密码 -->
					<c:set var="cookieValue" value="${cookie.myUserInfo.value }"></c:set>
					<c:set var="uname" value='${fn:split(cookieValue,":")[0] }'></c:set>
					<c:set var="upass" value='${fn:split(cookieValue,":")[1] }'></c:set>
       	  	  		<form action="${pageContext.request.contextPath }/user/login.form" method="post" onsubmit="yanzheng()">
       	  	  		<table id="TABLE">
    					<tbody>
        					<tr>
        						<td>
       	  	  						<input style="margin-top: -20px;" name="inputType"  type="text" id="USERNAME" value="${uname }"  class="kuang_txt phone" placeholder="请输入手机号码或邮箱" onfocus="showDesc(this)" onblur="checkText(this)" />
       	  	  					</td>
       	  	  				</tr>
       	  	  				<tr>
       	  	  					<td>
       	  	  						<input style="margin-top: 20px;" name="password" type="password" id="PASSWORD" value="${upass }"  class="kuang_txt possword" placeholder="请输入密码" onfocus="showDesc(this)" onblur="checkText(this)" />
               					</td>        					
               				</tr>
			                <tr>
			                	<td>
			                	<c:if test="${empty cookie.myUserInfo }">
									<input type="checkbox" value="1" name="flag"><span style="color: #666;font-family: 楷体">记住密码</span>
								</c:if>
								<c:if test="${not empty cookie.myUserInfo }">
									<input type="checkbox" value="1" name="flag" checked="checked" ><span style="color: #666;font-family: 楷体">记住密码</span>
								</c:if>
			               		
			               			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			               			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			               			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                		<a href="${pageContext.request.contextPath }/jsp/ui/forgetPwd/forgetpwd1.jsp" class="forget_pass" id="forget_pass" style="color: #666;font-family: 楷体">忘记密码</a>
			                	</td>
			                	
			                </tr>
			                <br/>
			                <tr>
			                	<td>
                					<input style="margin-top: 15px;" name="login" type="submit" class="btn_zhuce" value="登录" onclick="go()">
               					</td>
               					
               				</tr>
               				<br/>
               				<tr>
                				<td>
                					<p style="margin-top:10px;color:red">${message }</p>
                					<p style="margin-top: 30px;margin-left: -140px;color: #066">还没有账号？<a href="${pageContext.request.contextPath }/jsp/ui/regist.jsp" class="" >立即注册！</a></p>
                					
               					</td>
               					
               				</tr>
          
               			</tbody>
               		</table>
               		
               </form>
             </div>

          </div>
      </div>
   </div>

<script  type="text/javascript" >


function showDesc(obj)
{ 
   var id= obj.name;
   document.getElementById(id).style.display="inline";
}

//输入框失去焦点时检验输入内容是否有效
function checkText(obj)
{
   //获取输入框的id值
   var id= obj.name;
   var text=document.getElementById(id.toString().toUpperCase()).value;

   //判断是否为空
   if(text.replace(/\s/g, "")=="")
   {
      document.getElementById(id).innerHTML="输入不能为空";
      document.getElementById(id).style.color="red";
   }
   else
   {
     //组装方法
     //取首字母转换为大写,其余不变
     var firstChar=id.charAt(0).toString().toUpperCase();
     //
     var strsub=id.substring(1,id.length);
     var strMethod="check"+firstChar+strsub+"()";
     var isTrue = eval(strMethod);
     if(isTrue)
     {
         document.getElementById(id).innerHTML="输入有效";
         document.getElementById(id).style.color="green";
     }
   }

  
}

function checkUserName()
{
    //只简单的判断用户名的长度
    var id = document.getElementById("USERNAME");
    var userName=id.value;   
    if(userName.length > 10)
    {
      document.getElementById(id.name).innerHTML = "输入的用户名过长";
      document.getElementById(id.name).style.color="red";
      
      return false;
    }
    else
    return true;
}
function checkPassword()
{
    var password = document.getElementById("PASSWORD").value;   
    return true;
}


</script>
   
</body>
</html>