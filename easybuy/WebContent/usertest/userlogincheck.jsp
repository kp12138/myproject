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
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
   <%
           
           Class.forName("com.mysql.jdbc.Driver");
           String url="jdbc:mysql://localhost:3306/easybuycart";
           String user="root";
           String pass="123";
           Connection conn=DriverManager.getConnection(url,user,pass);
           Statement stmt=conn.createStatement();
           
           String username=request.getParameter("username");
           String password=request.getParameter("userpass");

           ResultSet rs1=stmt.executeQuery("SELECT * FROM user where id='"+username+"'");        
           if(rs1.next()){            
               ResultSet rs2=stmt.executeQuery("SELECT * FROM user where pass='"+password+"'"); 
               if(rs2.next()){                   
                   response.sendRedirect("gerenxinxi.jsp?id="+username+"");
               }
               else{
                   response.sendRedirect("userlogin.jsp");
               }
           } 
    %>
  </body>
</html>
