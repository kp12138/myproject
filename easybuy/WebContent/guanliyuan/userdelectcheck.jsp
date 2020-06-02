<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'stuselect.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="css/css.css">

  </head>
  
  <body >
    </br>
     <center>
     
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
        <ul>
            <li><a href="guanliyuan/userdelect.jsp">删除用户</a></li>
        </ul>
    </div>
      <% 
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/easybuycart";
       String user="root";
       String pass="123";
       Connection conn=DriverManager.getConnection(url,user,pass);
       Statement stmt=conn.createStatement();
       String id=request.getParameter("id");
       byte b[]=id.getBytes("ISO-8859-1");
       id=new String(b,"UTF-8");
       String sql="delete from user where id="+id;
       stmt.executeUpdate(sql);
      %>
       <br><br><br>  
       <br><br><br>
       <br><br> 
         <h2>删除用户信息</h2>
         <p>
            <br>
            该用户信息已经被删除！
         </p>
        <form name="form1" method="post" action="guanliyuan/userselect.jsp">
            <input type="submit" id="back" name="back" value="返回">
        </form>    
       <br><br><br>  
       <br><br><br>
       <br><br><br> 
       	 
	  <div class="nav2">
      </div>
       </center>
  </body>
</html>
