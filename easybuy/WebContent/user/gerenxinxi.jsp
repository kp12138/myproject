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
             String sql="delete from news where id=" + request.getParameter("del"); 
             PreparedStatement  ps=conn.prepareStatement(sql);
             int rs=ps.executeUpdate();
            } 
           String sql="SELECT*FROM user where id="+username+"";  
           ResultSet rs=stmt.executeQuery(sql); 
                 if(rs.next()){
         %>         
    <div class="nav">
        <ul>
            <li><a href="user/xinxiedit.jsp?id=<%=username%>">修改个人信息</a></li>
            <li><a href="user/goodsdefault.jsp?name=<%=rs.getString("name")%>">浏览商品</a></li>
            <li><a href="user/usergoodsadd.jsp?name=<%=rs.getString("name")%>">我有东西要卖了</a></li>
            <li><a href="user/dingdanselect.jsp?name=<%=rs.getString("name")%>">查看我的订单</a></li>
            <li><a href="user/fahuoselect.jsp?name=<%=rs.getString("name")%>">查看我的发货单</a></li>

        </ul>
    </div>
         <br><br><br><br><br><br>
    <table summary="book list">     
          <caption>User Information List</caption>
         <% 
               ID =username;
         %>
    <thead>
      <col /><col /><col /><col /><col /><col  class="price"/>
      <tr>
           <th>姓名</th>
           <th>性别</th>
           <th>年龄</th>
           <th>专业</th>
           <th>邮箱</th>
           <th>地址</th>
           <th></th>
      </tr> 
   </thead>   
     <tbody>
        <tr class="even">
		    <td><a href="javascript:NewsWindow(<%=ID%>)"><u><%=rs.getString("name")%></u></a></td>
		    <td><%=rs.getString("sex")%></td>
		    <td><%=rs.getInt("age")  %></td>
		    <td><%=rs.getString("zhuanye")  %></td>
		    <td><%=rs.getString("youxiang")%></td>
		    <td><%=rs.getString("address")  %></td>
		    <td align=right>
		      <img src=img/TWO2_06.GIF><a href=user/xinxiedit.jsp?id=<%=ID%>>修改</a>　
		    </td>
        </tr>
      </tbody>         
</table><br>
	    <div id="footer">
			Welcome to<a href="" target="_blank" title="二手之家">&nbsp;&nbsp;校园二手</a>
		</div>	
<br><br><br><br><br><br><br>	 
	  <div class="nav2">
      </div>	
	<%          
             }
                rs.close();
                stmt.close();
                conn.close();            
              %>                                    
     </center>  
  </body>
</html>
