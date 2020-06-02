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
  <br>
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
    </div> 
        <br><br>
        <h1>
        <% 
        
    //    String ID; 
    //    String username=(String)request.getParameter("id"); 
        id = request.getParameter("id");
        String name= new String( request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8"); 
        
        out.println(name); 
           Class.forName("com.mysql.jdbc.Driver");
           String url="jdbc:mysql://localhost:3306/easybuycart";
           String user="root";
           String pass="123";
           Connection conn=DriverManager.getConnection(url,user,pass);
           Statement stmt=conn.createStatement(); 
            
         if(request.getParameter("del")!=null) {
             String sql="delete from news where name=" + request.getParameter("del"); 
             PreparedStatement  ps=conn.prepareStatement(sql);
             int rs=ps.executeUpdate();
            } 
           String sql="SELECT*FROM user where name='"+name+"'"; 
 
           ResultSet rs=stmt.executeQuery(sql); 
         %></h1>
         <br><br><br>        
 <table summary="book list">     
          <caption>我的联系方式与发货地址：</caption>
    <thead>
      <col /><col /><col /><col /><col /><col  class="price"/>
      <tr>
           <th>姓名</th>
           <th>电话</th>
           <th>地址</th>
      </tr> 
   </thead> 
               <%
               if(rs.next()){
		       //  ID =username;
	%>
		
     <tbody>
        <tr class="even">
		    <td><u><%=rs.getString("name")%></u></td>
		    <td><%=rs.getString("youxiang")%></td>
		    <td><%=rs.getString("address")  %></td>
        </tr>
      </tbody>       
</table>   
    

		<br><b>所购商品信息：</b><ul>
	<%
	
	 
	sql="SELECT*FROM goods where id='"+id+"'";
	//rs.close();
	rs = stmt.executeQuery(sql);
	while(rs.next()) {
	%>
		<li><u>
		商品：<%=rs.getString("title")%></u>
		卖家：<%=rs.getString("author")%>
		价格：﹩<%=rs.getString("keyw")%>
		上传时间：【<%=rs.getDate("times").toString()%>】
	<%
	}
	rs.close();

%>
	 <br><br>
	 <p align=center><a href="user/jiesuancheck.jsp?name=<%=name%>&id=<%=id%>">确认下单</a></p>
	 <br><br>
	
	<%          

             }
                rs.close();
                stmt.close();
                conn.close();
             
              %>  
       <br><br>
	 
	  <div class="nav2">
      </div>                                  
     </center>  

  </body>
</html>
