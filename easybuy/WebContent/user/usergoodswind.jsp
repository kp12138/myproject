<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
int id = 0;
String sql = "";
ResultSet rs = null;
ResultSet rsTmp = null;
%>
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
    <div class="nav">
        <ul>
            <li ><strong>浏览商品</strong></li>

        </ul>
    </div>  
<%        id = Integer.parseInt(request.getParameter("id"));     
      	 String name= new String( request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");          
         Class.forName("com.mysql.jdbc.Driver");
         String url="jdbc:mysql://localhost:3306/easybuycart";
         String user="root";
         String pass="123";
         Connection conn=DriverManager.getConnection(url,user,pass);
         Statement stmt=conn.createStatement();
         ResultSet rs=stmt.executeQuery("SELECT * from goods where ID=" + id);
         if(!rs.next()) {
	     out.println("错误的ID号");
	     rs.close();
}else {
	%>
    <table summary="book list">     
          <caption>Goods Information List</caption>
    <thead>
      <col /><col /><col /><col /><col /><col  class="price"/>
      <tr>
           <th>商品名称</th>
           <th>介绍</th>
           <th>卖家</th>
           <th>价格</th>
           <th>上传时间</th>
           <th></th>
      </tr> 
   </thead>
     <tbody>
        <tr class="even">
		    <td><u><%=rs.getString("title")%></u></td>
		    <td><%=rs.getString("content")%></td>
		    <td><%=rs.getString("author")  %></td>
		    <td>﹩<%=rs.getString("keyw")  %></td>
		    <td><%=rs.getString("times")%></td>
		    <td align="center"><p>﹩<%=rs.getString("keyw")%><a href="user/goodsjiesuan.jsp?name=<%=name%>&id=<%=id%>">点击购买</a></p></td>　
        </tr>
      </tbody>         
</table>	
	<br><b>相关商品：</b><ul>
	<%	 
	sql="SELECT * from goods where ID<>"+id+" and title='" + rs.getString("title")+"' order by ID desc";
	rs.close();
	rs = stmt.executeQuery(sql);
	while(rs.next()) {
	%>
		<li><a href=user/usergoodswind.jsp?name=<%=name%>&id=<%=rs.getInt("ID")%>><u>
		<%=rs.getString("title")%></u></a>
		<%=rs.getString("author")%>
		【<%=rs.getDate("times").toString()%>】
	<%
	}
	rs.close();
%>
</ul>
<br><br>
<p align=center><a href="user/goodsbbs.jsp">看看大家的评价</a></p>
	<%	 
	sql="SELECT*FROM bbs WHERE GID="+id+" ";
	rs.close();
	rs = stmt.executeQuery(sql);
	while(rs.next()) {
	%>
         <div align="center" >
         <%
          String Name=rs.getString(1);
          String Email=rs.getString(2);
          String Subject=rs.getString(3);
          String Memo=rs.getString(4);
          String gtime=rs.getString(5);         
          String Line1;
          Line1 = "留言人：" + Name;
          Line1 = Line1 + "     ";    // 插入5个汉字空格
          Email = "<A HREF=mailto:" + Email + ">" + Email + "</A>";
          Line1 = Line1 + "Email" + Email + "";          
          out.println(Line1+"");     
          String Line2;
          Line2 = "主 题：" + Subject + "";
           out.println(Line2+"");
          String Line3;
          Line3 = "<TABLE BORDER=0 BGCOLOR=#00FFFF ><TR><TD>";
          Line3 = Line3 + Memo + "</TD></TR></TABLE>";
           out.println(Line3+"");      
          String Line4;
           Line4 = "时间："  + gtime + "";
            out.println(Line4+"<br>");
         %>
    <%    
	}
	rs.close();
}
%>
<div align="center"  >  
  <form Action="user/gbbscheck.jsp?name=<%=name%>&id=<%=id%>" Method="POST">
  <table width="406" border="1" cellspacing="1" cellpadding="2" align="center" >
    <tr > 
      <td colspan="2"> 
        <div align="center"><b>留言表单</b></div>
      </td>
    </tr>
    <tr> 
      <td>姓 名：</td>
      <td>
        <input type="text" name="Name" class="form" size="50" value="<%=name%>">
      </td>
    </tr>
    <tr> 
      <td height="16">Email：</td>
      <td height="16"> 
        <input type="text" name="Email" class="form" size="50">
      </td>
    </tr>
    <tr> 
      <td>主 题：</td>
      <td> 
        <input type="text" name="Subject" class="form" size="50">
      </td>
    </tr>
    <tr> 
      <td>留 言：</td>
      <td> 
        <textarea name="Memo" class="form" rows="8" cols="45"></textarea>
      </td>
    </tr>
  </table>
  <p align="center"> 
    <input name="sure" type="submit" value="提交留言" class="form"> 　　　　　　　 
    <input name="clear" type="reset" value="清除留言" class="form">
  </p>
  </form>
</div>
	<br> 
	  <div class="nav2">
      </div>
      <br>
</center>
</body>
</html>
