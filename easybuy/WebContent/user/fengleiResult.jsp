<%@ page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
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
  <center>
  <br>
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
        </ul>
    </div>
    <%String key=request.getParameter("key");
   // byte a[]=key.getBytes("ISO-8859-1");
   // key=new String(a,"UTF-8");
   key=new String(key.getBytes("iso8859-1"),"utf-8");
    Class.forName("com.mysql.jdbc.Driver");
    String url="jdbc:mysql://localhost:3306/easybuycart";
    String user="root";
    String pass="123";
    Connection conn=DriverManager.getConnection(url,user,pass);
    Statement st=conn.createStatement();%>
      
    <%String sql="SELECT * FROM goods where content like '%"+key+"%'";
    ResultSet rs=st.executeQuery(sql);
    rs.last();%>
         
         <br><br><br><br>
      
                                
    <table summary="book list">     
          <caption>                               
                                   共检索到
         <font size="5" color="red">
             <%=rs.getRow() %>
         </font>
                                条完全匹配的记录     </caption>
    <thead>
      <col /><col /><col /><col /><col /><col  class="price"/>
      <tr>
               <td width="80">记录条数</td>
               <td width="720" align="center">记录</td>
      </tr> 
   </thead>  
             <%
               rs.beforeFirst();
               while(rs.next()){
             %> 
     <tbody>
             <tr align="center">
                <td><%=rs.getRow() %></td> 
                <td><h3><%=rs.getString("title") %>（卖家：<%=rs.getString("author") %>）</h3> </td>       
             </tr>
              <tr>
              <td></td>
              <td align="center"> <p><%=rs.getString("content") %></p></td>
              </tr>   
              <tr>
              <td></td>
              <td align="right"><h3>单价：<%=rs.getString("keyw") %>元</h3> <p><%=rs.getDate("times").toString()%></p></td>
              </tr>
             <%          
                  }
             %>
      </tbody>         
</table>                                    

                
                
                <%rs.close();

                st.close();
                conn.close();%>
         <br><br><br>
             	 <p align=center><a href="javascript:history.back(-1)">返回上一页</a></p>	
         <br><br><br>    
 	  <div class="nav2">
      </div>	             
          
          </center>                     
  </body>
</html>
