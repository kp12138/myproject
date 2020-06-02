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
  
  <body>
  </br>
     <center>       
        <% 
        String ID; 
        String username=(String)request.getParameter("id"); 
           Class.forName("com.mysql.jdbc.Driver");
           String url="jdbc:mysql://localhost:3306/easybuycart";
           String user="root";
           String pass="123";
           Connection conn=DriverManager.getConnection(url,user,pass);
           Statement stmt=conn.createStatement();            
           if(request.getParameter("del")!=null) {
             String sql="delete from user where id=" + request.getParameter("del"); 
             PreparedStatement  ps=conn.prepareStatement(sql);
             int rs=ps.executeUpdate();
            } 
           String sql="SELECT*FROM user where id="+username+"";  
           ResultSet rs=stmt.executeQuery(sql); 
             if(rs.next()){
         %>         

    <table border=2px;>     
      	<tr>
           <th>姓名</th>
           <th>性别</th>
           <th>年龄</th>
           <th>专业</th>
           <th>邮箱</th>
           <th>地址</th>
           <th></th>
           <th></th>
      	</tr> 
        <tr>
		    <td><%=rs.getString("name")%></td>
		    <td><%=rs.getString("sex")%></td>
		    <td><%=rs.getInt("age")  %></td>
		    <td><%=rs.getString("zhuanye")  %></td>
		    <td><%=rs.getString("youxiang")%></td>
		    <td><%=rs.getString("address")  %></td>
		    <td>
		      <img src=img/TWO2_06.GIF><a href=usertest/xinxiedit.jsp?id=<%=username%>>修改</a>　
		    </td>
		    <td>
		      <img src=img/TWO2_09.GIF><a href=usertest/gerenxinxi.jsp?del=<%=username%>>删除</a>
		    </td>
        </tr>       
	</table>
	<%          
             }
                rs.close();
                stmt.close();
                conn.close();            
              %>                                    
     </center>  
  </body>
</html>
