<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户注册</title>
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
  
 #TABLE .nnn{
    display:none;
	}
	

</style>

</head>
<body class="login_bj">
	<div class="zhuce_body">
		<div class="logo"><a href="${pageContext.request.contextPath }/user/addUser.form"></a></div> 
    		<div class="zhuce_kong">
    			<div class="zc">
        			<div class="bj_bai">
           			<h3>欢迎注册</h3>
       	  	  		<form action="${pageContext.request.contextPath }/user/addUser.form" method="post"  onsubmit="return go()" >
       	  	  		<table id="TABLE">
    					<tbody>
        					<tr>
        						<td>
       	  	  						<input name="userName" type="text" id="USERNAME" class="kuang_txt phone" placeholder="请输入昵称" onfocus="showDesc(this)" onblur="checkText(this)" />
       	  	  					</td>
       	  	  					<td>			
				       				<span id="userName" class="nnn" style="color:black;" >请输入昵称</span>
       	  	  					</td>
       	  	  				</tr>
       	  	  				<tr>
       	  	  					<td>
       	  	  						<input name="password" type="password" id="PASSWORD" class="kuang_txt possword" placeholder="密码" onfocus="showDesc(this)" onblur="checkText(this)" />
               					</td>
               					<td>
               						<span id="password" class="nnn" style="color:black" >请输入密码</span>
               					</td>
               				</tr>
               				<tr>
               					<td>
                					<input name="password2" type="password" id="PASSWORD2" class="kuang_txt possword" placeholder="确认密码" onfocus="showDesc(this)" onblur="checkText(this)" />
                				</td>
                				<td>
               						<span id="password2" class="nnn" style="color:black" >请再次输入密码</span>
               					</td>
                			</tr>
                			<tr>
                				<td>
                					<input name="tel" type="text"  id="TEL"class="kuang_txt phone" placeholder="手机号" onfocus="showDesc(this)" onblur="checkText(this)" />
                				</td>
                				<td>
               						<span id="tel" class="nnn" style="color:black" >请输入手机号码</span>
               					</td>
                			</tr>
                			<tr>
                				<td>
                					<input name="email" type="text" id="EMAIL" class="kuang_txt email" placeholder="邮箱" onfocus="showDesc(this)" onblur="checkText(this)" />
               					</td>
               					<td>
               						<span id="email" class="nnn" style="color:black" >请输入邮箱地址</span>
               					</td>
               				</tr>
          
			                
			                <tr>
			                	<td>
                					<input name="注册" type="submit" class="btn_zhuce" value="注册">
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
	function checkText(obj){
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
	    if(userName.length > 20 || userName.length < 2 )
	    {
	      document.getElementById(id.name).innerHTML = "输入的昵称过长或过短";
	      document.getElementById(id.name).style.color="red";
	      
	      return false;
	    }
	    else{
	    	return true;
	    }
	    
	}
	
	function checkPassword()
	{	
		var id = document.getElementById("PASSWORD");
	    var password = id.value;   
	    if(password.length < 4 || password.length > 18 )
	    {
	    	 document.getElementById(id.name).innerHTML = "输入的密码过长或过短";
	         document.getElementById(id.name).style.color="red";
	         
	    	 return false;
	    }
	    else{
	    	return true;
	    }

	}
	
	function checkPassword2()
	{
	     var id=document.getElementById("PASSWORD");
	     var id2=document.getElementById("PASSWORD2");
	     var password = id.value;   
	     var password2 = id2.value;
	     if(password!=password2)
	     {
	        document.getElementById(id2.name).innerHTML="密码不一致";
	        document.getElementById(id2.name).style.color="red";
	        return false;
	     }else{
	    	 if(password2.length < 4 || password2.length > 18 ){
	    		 return false;
	    	 }
	    	 return true;  
	     }
	      
	}
	
	function checkTel()
	{
	// 利用正则表达式对输入数据匹配
	   var id=document.getElementById("TEL");
	   var tel = id.value;    
	//匹配到一个非数字字符，则返回false
	   var expr =  /\D/i;
	   var idd = document.getElementById("TEL");
	   var tel1=idd.value;   
	   if(expr.test(tel))
	   {
	      document.getElementById(id.name).innerHTML="不能输入非数字字符";
	      document.getElementById(id.name).style.color="red";
	      return false;
	   }else{
		   if(tel1.length != 11){
			   document.getElementById(idd.name).innerHTML="请输入正确的手机号";
			      document.getElementById(id.name).style.color="red";
			      return false; 
		   }
		   return true;
	   }
	}
	function checkEmail()
	{
	// 利用正则表达式对输入数据匹配
	   var id =  document.getElementById("EMAIL");
	   var email = id.value;   
	//以字母或数字开头，跟上@,字母数字以.com结尾
	   var expr =  /^([0-9]|[a-z])+@([0-9]|[a-z])+(\.[c][o][m])$/i;
	   if(!expr.test(email))
	   {
	      document.getElementById(id.name).innerHTML="输入的邮箱格式有误";
	      document.getElementById(id.name).style.color="red";
	      return false;
	   }
	   return true;
	}
	
	
	function go(){
		  var id = document.getElementById("USERNAME");
		    var userName=id.value;   
		    if(userName.length >2 || userName.length < 20 ){
		    	var id1=document.getElementById("PASSWORD");
		        var id2=document.getElementById("PASSWORD2");
		        var password = id1.value;   
		        var password2 = id2.value;
		        if(password == password2 && (password.length < 18 || password >3 )){
		        	 var id3=document.getElementById("TEL");
		        	 var tel = id3.value;    
		        	 var expr =  /\D/i;
		        	 var idd = document.getElementById("TEL");
		        	 var tel1=idd.value;   
		        	 if(expr.test(tel)){
		        	      return false;
		        	   }else{
		        		   if(tel1.length != 11){
		        			      return false; 
		        		   }else{
		        			   var id4 =  document.getElementById("EMAIL");
		        			   var email = id4.value;   
		        			   var expr =  /^([0-9]|[a-z])+@([0-9]|[a-z])+(\.[c][o][m])$/i;
		        			   if(!expr.test(email))
		        			   {
		        			      return false;
		        			   }else{
		        				    return true;
		        			   }
		        			  
		        		   }
		        	   }
		        }else{
		        	return false;
		        }
		        
		    }else{
		    	return false;
		    }   	 
	}

</script>
   
</body>
</html>