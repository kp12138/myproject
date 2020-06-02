<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'useraddcheck.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body bgcolor="cccfff">
    <% 

       String id=request.getParameter("id");
       byte b[]=id.getBytes("ISO-8859-1");
       id=new String(b,"UTF-8");
       String name=request.getParameter("name");
       byte b1[]=name.getBytes("ISO-8859-1");
       name=new String(b1,"UTF-8");
       String sex=request.getParameter("sex");
       byte b2[]=sex.getBytes("ISO-8859-1");
       sex=new String(b2,"UTF-8");
       
       String pass1=request.getParameter("pass");      
       byte b5[]=pass1.getBytes("ISO-8859-1");
       pass1=new String(b5,"UTF-8"); 
       int pass=Integer.parseInt(pass1);               
       
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/easybuycart";
       String user="root";
       String pass2="123";
       Connection conn=DriverManager.getConnection(url,user,pass2);
       Statement stmt=conn.createStatement();
       String sql="insert into user values('"+id+"','"+name+"','"+sex+"')" ;
       stmt.executeUpdate(sql);
       
       stmt.close();
       conn.close();
       response.sendRedirect("userlogin.jsp");                          
     %>
 
  </body>
</html>

