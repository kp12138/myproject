<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%
int currid = 1;
String id="";
ResultSet rs = null;
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'xinxiedit.jsp' starting page</title>
    
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
  
 
<body>	  
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


  
        <% 
        
    //    String ID; 
    //    String username=(String)request.getParameter("id"); 
    //    id = request.getParameter("id");
        String name= new String( request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8"); 
        Class.forName("com.mysql.jdbc.Driver");
       String url="jdbc:mysql://localhost:3306/easybuycart";
       String user="root";
       String pass2="123";
       Connection conn=DriverManager.getConnection(url,user,pass2);
       Statement stmt=conn.createStatement();
       

        
       
       
       String sql= "SELECT*FROM dingdan,user,goods where dhandle='0' and user.name=dingdan.dname and dingdan.dgid=goods.id" ;
       ResultSet rs1=stmt.executeQuery(sql); 
       rs1.last();
         %>        
<div class="nav">
      <ul><li><a href="javascript:history.back(-1)">返回上一页</a></li></ul>
</div>	
<br><br><br>                            

         <br><br><br> 
    <table summary="book list">     
          <caption> 
                               订单查看      
         <font size="4" color="red">
                       共<%=rs1.getRow() %>张订单
         </font></caption>
    <thead>
      <col /><col /><col /><col /><col /><col  class="price"/>
        <tr>
           <td>记录条数</td>
           <td>订单号</td>
           <td>商品名称</td>
           <td>价格</td>  
        </tr>
   </thead>
             <%
               rs1.beforeFirst();
               while(rs1.next()){
             %>   
     <tbody>
        <tr class="even">
		    <td><%=rs1.getRow() %></td> 
		    <td><u><%=rs1.getInt("did") %></u></td>
			<td><%=rs1.getString("title")%></td>
		    <td><%=rs1.getString("keyw")  %></td>
        </tr>
      </tbody>        	
	<%          
             }
                rs1.close();
                stmt.close();
                conn.close();
             
              %>        
   </table>  
    <br>   
    
    	 <p align=center><a href="javascript:history.back(-1)">返回上一页</a></p>	
    	 
    	 
     <br><br><br>
	  <div class="nav2">
      </div>  
      <br>                        
     </center>  



  </body>
</html>
