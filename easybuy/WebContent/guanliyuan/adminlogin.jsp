<%@ page pageEncoding="GB18030"%>
<%@ page import="java.sql.*,com.*"%>

<%
	request.setCharacterEncoding("GBK");
	String action = request.getParameter("action");
	String username = "";
	if (action != null && action.trim().equals("login")) {
		username = request.getParameter("username");
		//check username whether valid or not!
		String password = request.getParameter("password");
		if(username == null || !username.trim().equals("admin")) {
			out.println("username not correct!");
		} else if(password == null || !password.trim().equals("admin")) {
			out.println("password not correct!");
		} else {
			session.setAttribute("adminLogined" , "true");
			response.sendRedirect("default.jsp");
		}
	}
%>

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
			<form action="guanliyuan/adminlogin.jsp" method="post">
				<div class="login">ADMINLOGIN</div>
				<div class="username-text">Username:</div>
				<div class="password-text">Password:</div>
				<div class="username-field">
					<input type="hidden" name="action"  value="login"/>
					<input type="text" name="username" value="<%=username %>"/>
				</div>
				<div class="password-field">
					<input type="password" name="password" />
				</div>
				<input type="checkbox" name="remember-me" id="remember-me" /><label for="remember-me">Remember me</label>
				<div class="forgot-usr-pwd">Forgot <a href="#">username</a> or <a href="#">password</a>?</div>
				<input type="submit" name="submit" value="GO" />
			</form>
		</div>
		<div id="footer">
			Welcome to<a href="#" target="_blank" title="二手之家">二手之家</a>
		</div>
  </body>

</html>
