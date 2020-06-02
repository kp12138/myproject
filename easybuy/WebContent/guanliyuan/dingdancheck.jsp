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
            <li><a href="guanliyuan/dingdancheck.jsp">订单管理</a></li>
        </ul>
    </div>
     
        <br><br> <br><br> <br><br>
  
        <% 
       Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/easybuycart";
       String user="root";
       String pass2="123";
       Connection conn=DriverManager.getConnection(url,user,pass2);
       Statement stmt=conn.createStatement();
       
                       
       
       String sql= "SELECT*FROM dingdan,user,goods where dhandle='0' and user.name=dingdan.dname and dingdan.dgid=goods.id" ;
       ResultSet rs=stmt.executeQuery(sql); 
       rs.last();
           
        %>
   <table summary="book list">     
          <caption>Order Information List</caption>
    <thead>
      <col /><col /><col /><col /><col /><col  class="price"/>
      <tr>
           <td>记录条数</td>
           <td>订单号</td>
           <td>商品名称</td>
           <td>价格</td>        
           <td>姓名</td>         
           <td>邮箱</td>
           <td>地址</td>
           <td>处理</td>
      </tr> 
   </thead>
          <%
               rs.beforeFirst();
               while(rs.next()){
             %>
     <tbody>
        <tr class="even">
		    <td><%=rs.getRow() %></td> 
		    <td><u><%=rs.getString("DID")%></u></td>
		    <td><%=rs.getString("title")%></td>
		    <td><%=rs.getString("keyw")  %></td>		
		    <td><%=rs.getString("name")%></td>
		    <td><%=rs.getString("youxiang")%></td>
		    <td><%=rs.getString("address")  %></td>
		    <td><a href="guanliyuan/success.jsp?did=<%=rs.getString("DID")%>">处理</a></td>
        </tr>
      </tbody>          

	<%          

             }

                 rs.close();
                stmt.close();
                conn.close();
             
              %>  

   </table>     
     <br><br> <br><br> <br><br> <br><br> <br>
      <div class="nav2">
      </div>   
     <br>                              
     </center>  



  </body>
</html>
