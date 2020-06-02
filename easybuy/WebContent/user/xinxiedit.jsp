<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
String id = "";
String name = "";
String name1 = "";
String sex = "";
String age = "";
String zhuanye  = "";
String youxiang = "";
String address  = "";
int currid = 0;
String sql = "";
ResultSet rs = null;
%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xinxiedit.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/css.css">
	
	
	  </head>
<body>	  
	<center>
	<br>
<div class="header">   
	<div class="logo"><a href="#"><img src="img/sch_02.png" /></a></div>
    <div class="about">
	        <div class="search_box">
				<form name="search" method="get" action="guanliyuan/searchResult.jsp">
				   <input type="text" name="key" value="Search" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = 'Search';}"><input type="submit" value="">
			    </form>
			</div>
    </div>    
</div>

<div class="nav">
     
</div>	
<br><br><br>	
	<%
// 下面主要是为了进行显示
if(request.getParameter("id") != null) {
	id = request.getParameter("id");
	
	   
         Class.forName("com.mysql.jdbc.Driver");
         String url="jdbc:mysql://localhost:3306/easybuycart";
         String user="root";
         String pass="123";
         Connection conn=DriverManager.getConnection(url,user,pass);
         Statement stmt=conn.createStatement();
	
	     sql="select * from user where id=" + request.getParameter("id");
         ResultSet rs=stmt.executeQuery( sql );
	if(rs.next()) {
		name1  = rs.getString("name");
		sex = rs.getString("sex");
		age = rs.getString("age");
		zhuanye  = rs.getString("zhuanye");
		youxiang = rs.getString("youxiang");
		address  = rs.getString("address");
		rs.close();
%>


  
		<form name=form1 method="post" action="user/savexinxi.jsp">
		  <input value="<%=id%>" type=hidden name=id>
		  <P align="center">姓名：<INPUT size=25 name=name value=<%=name1%>></P>
		  <br>
		  <P align="center">性别：<INPUT size=25 name=sex value=<%=sex%>></P>
		  <br>
		  <P align="center">年龄：<INPUT size=25 name=age value=<%=age%>></P>
		　  <P align="center">专业：<INPUT size=25 name=zhuanye value=<%=zhuanye %>></P>	
		<br>
		  <P align="center">邮箱：<INPUT size=25 name=youxiang value=<%=youxiang%>></P>
		　  <P align="center">地址：<INPUT size=25 name=address value=<%=address %>></P>		　
		  <p align="center">
		  <INPUT class=buttonface type=submit value=" 确 定 ">
		  <INPUT class=buttonface type=reset value=" 清 除 "></p>
		</form>
<%
   } else {
		  out.println("<hr>");	
		  out.println("<center>非法的id号！</center>");
		  out.println("<hr>");	
   }
}
%>
<br><br><br><br><br>
	  <div class="nav2">
      </div>
</center>
</body>
</html>