<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">  
    <title>登陆页面</title>   
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href=css/style.css />
  </head> 
  <body>
		<div id="container">
			<form method="get" action="user/userlogincheck.jsp">
				<div class="login">LOGIN</div>
				<div class="username-text">Username:</div>
				<div class="password-text">Password:</div>
				<div class="username-field">
					<input type="text" name="username" value="azmind" />
				</div>
				<div class="password-field">
					<input type="password" name="userpass" value="azmind" />
				</div>
				<input type="checkbox" name="remember-me" id="remember-me" /><label for="remember-me">Remember me</label>
				<div class="forgot-usr-pwd">Forgot <a href="#">username</a> or <a href="#">password</a>?</div>
				<input type="submit" name="submit" value="GO" />
			</form>
		</div>
		<div id="footer">
			Welcome to 校园二手 &nbsp;&nbsp;   <a href="user/useradd.jsp" target="_blank">新用户注册</a>
		</div>
  </body>
</html>


