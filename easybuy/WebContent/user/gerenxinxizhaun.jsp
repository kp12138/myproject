<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String id="";
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
  
  <body >
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
        <%
        String name= new String( request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");  
        
    
        
           Class.forName("com.mysql.jdbc.Driver");
           String url="jdbc:mysql://localhost:3306/easybuycart";
           String user="root";
           String pass="123";
           Connection conn=DriverManager.getConnection(url,user,pass);
           Statement stmt=conn.createStatement();
           ResultSet rs=stmt.executeQuery("select id from user where name='"+name+"'");
           if(rs.next()){
            id=rs.getString("id");}
         %>
<div class="nav">
     <ul><li><a href="user/gerenxinxi.jsp?id=<%=id %>">回到个人信息主页</a></li></ul>
</div>	
<br><br><br><br><br><br><br><br><br><br>
<a href="user/gerenxinxi.jsp?id=<%=id %>">回到个人信息主页</a>　  

      <br><br><br><br><br><br><br><br><br><br><br><br>
	  <div class="nav2">
      </div>                    
     </center>  

  </body>
</html>
