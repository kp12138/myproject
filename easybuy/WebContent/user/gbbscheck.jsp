<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%

String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'stuaddcheck.jsp' starting page</title>
    
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
	   String name= new String( request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8"); 
       String Name=request.getParameter("Name");
       byte b[]=Name.getBytes("ISO-8859-1");
       Name=new String(b,"UTF-8");
       String Email=request.getParameter("Email");
       byte b1[]=Email.getBytes("ISO-8859-1");
       Email=new String(b1,"UTF-8");
       String Subject=request.getParameter("Subject");
       byte b2[]=Subject.getBytes("ISO-8859-1");
       Subject=new String(b2,"UTF-8");
       String Memo=request.getParameter("Memo");      
       byte b3[]=Memo.getBytes("ISO-8859-1");
       Memo=new String(b3,"UTF-8");
       
       int id = Integer.parseInt(request.getParameter("id"));
          Date t=new Date();
         String st=t.toLocaleString();
        
       
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/easybuycart";
       String user="root";
       String pass="123";
       Connection conn=DriverManager.getConnection(url,user,pass);
       Statement stmt=conn.createStatement();
       String condition="insert into bbs values('"+Name+"','"+Email+"','"+Subject+"','"+Memo+"','"+st+"','"+id+"')" ;
       stmt.executeUpdate(condition);
       stmt.close();
       conn.close();
                                  
     %>
     <center>
        <h2>添加留言内容</h2>
        <p>
          <br>
          新的留言已经添加到到数据库
        </p>
        <form name="form1" method="post" action="user/usergoodswind.jsp?name=<%=name%>&id=<%=id%>">
            <input type="submit" id="back" name="back" value="返回">
        </form>  
        <%
       stmt.close();
       conn.close();  
        %>  
     </center>  
  </body>
</html>