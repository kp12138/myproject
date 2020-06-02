<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
int did = Integer.parseInt(request.getParameter("did"));
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
            <li><a href="guanliyuan/dingdancheck.jsp">订单管理</a></li>
        </ul>
    </div>
    <br><br><br><br><br><br><br><br><br>
        <%
        
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/easybuycart";
       String user="root";
       String pass2="123";
       Connection conn=DriverManager.getConnection(url,user,pass2);
       Statement stmt=conn.createStatement();
       

       
       String sql="update dingdan set dhandle='1' where did='"+did+"'" ;
       stmt.executeUpdate(sql);
    
                stmt.close();
                conn.close();
     %>
     <h4><p>该订单以处理————卖家可以发货了</p></h4>
    <br>
    <a href="guanliyuan/dingdancheck.jsp">返回订单管理</a>
    
    <br><br><br><br><br><br><br><br><br><br>
      <div class="nav2">
      </div>
  </center>
  </body>
</html>
