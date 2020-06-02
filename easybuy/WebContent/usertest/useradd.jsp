<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'goodsadd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/css.css">
	
	 </head>
<body> 
<center>
		添加用户信息<br>
       <form action="usertest/useraddcheck.jsp" method="post">
       <table border="0" width="200">
         <tr>
           <td>学号</td>
           <td><input type="text" name="id"></td>
         </tr>
         <tr>
           <td>密码</td>
           <td><input type="text" name="pass"></td>
         </tr>
         <tr>
           <td>电话</td>
           <td><input type="text" name="youxiang"></td>
         </tr>  
         <tr>
           <td>地址</td>
           <td><input type="text" name="address"></td>
         </tr>   
         <br>     
         <tr align="center">
           <td colspan="2">
            <br>  
               <input name="sure" type="submit" value="提交">
               &nbsp;&nbsp;&nbsp;&nbsp; 
               <input name="clear" type="reset" value="取消">
           </td>
         </tr>
      </table>
      </form>     
      </center>  
  </body>
</html>
