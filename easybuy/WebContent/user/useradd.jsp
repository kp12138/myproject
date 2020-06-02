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
<center>	<br>
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
       <br><br><br><br>
       <p>&nbsp;&nbsp;添加用户信息</p>
       <form action="user/useraddcheck.jsp" method="post">
       <table border="0" width="200">
         <tr>
           <td>学号</td>
           <td><input type="text" name="id"></td>
         </tr>
         <tr>
           <td>姓名</td>
           <td><input type="text" name="name"></td>
         </tr>
         <tr>
           <td>性别</td>
           <td><input type="text" name="sex"></td>
         </tr>
         <tr>
           <td>年龄</td>
           <td><input type="text" name="age"></td>
         </tr>
         <tr>
           <td>专业</td>
           <td><input type="text" name="zhuanye"></td>
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
      <br><br><br><br><br><br>
      <div class="nav2">
      </div>
      </center>  
  </body>
</html>


