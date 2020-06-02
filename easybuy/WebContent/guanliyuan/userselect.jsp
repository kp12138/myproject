<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<%
boolean logined = false;
String adminLogined = (String)session.getAttribute("adminLogined");
if(adminLogined != null && adminLogined.trim().equals("true")) {
	logined = true;
} 
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
	
	<style type="text/css">
	<!--
	
table{
 background-color:#fff;
 border:none;
 color:#565;
 font:18px arial;
 text-align:left;
}

table caption{
 font-size:24px;
 border-bottom:2px solid #b3de94;
}

table,td,th{
 margin:0;
 padding:0;
 vertical-align:middle;
}
tbody td,tbody th{
 background-color:#dfc;
 border-bottom:2px solid #b3de94;
 border-top:3px solid #fff;
 padding:9px;
}

thead th{
 font-size:14px;
 font-weight:bold;
 line-height:19px;
 padding:0 8px 2px;
 text-align:center;
}
tbody tr.even th,tbody tr.even td{
 background-color:#cea;
 border-bottom:2px solid #67bd2a;
}
col.price{
 text-align:right;
}
    
	-->
	</style>
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
           ResultSet rs=stmt.executeQuery("SELECT*FROM user");
           rs.last();
         %>
         <br><br>       
    <table summary="book list">     
          <caption>User Information List</caption>
    <thead>
      <col /><col /><col /><col /><col /><col  class="price"/>
      <tr>
               <td>记录条数</td>
               <td>学号</td> 
               <td>姓名</td> 
               <td>性别</td> 
               <td>年龄</td> 
               <td>专业</td>
               <td>邮箱</td> 
               <td>地址</td>
      </tr> 
   </thead>
             <%
               rs.beforeFirst();
               while(rs.next()){
             %>
     <tbody>
        <tr class="even">
                <td><%=rs.getRow() %></td> 
                <td><%=rs.getString("id") %></td>
                <td><%=rs.getString("name")  %></td>
                <td><%=rs.getString("sex")  %></td>
                <td><%=rs.getString("age")  %></td>
                <td><%=rs.getString("zhuanye")  %></td> 
                <td><%=rs.getString("youxiang")  %></td>
                <td><%=rs.getString("address")  %></td>
        </tr>
      </tbody>  
       

             <%
             }
                rs.close();
                stmt.close();
                conn.close();
             
              %> 
   </table>   
   	 <br><br>
	  <div class="nav2">
      </div>                                
     </center>  
    <br>
  </body>
</html>

