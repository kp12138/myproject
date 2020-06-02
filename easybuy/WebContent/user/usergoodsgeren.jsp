<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
String sql = "";
int totalRecords = 1;
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
	
	<Script language="JavaScript">
//打开新窗口函数NewsWindow
function NewsWindow(id)
{
  window.open('goodswind.jsp?id='+id,'infoWin', 'height=400,width=600,scrollbars=yes,resizable=yes');
}
    </Script>

  </head>
  
<body>
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
        String name= new String( request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
         Class.forName("com.mysql.jdbc.Driver");
         String url="jdbc:mysql://localhost:3306/easybuycart";
         String user="root";
         String pass="123";
         Connection conn=DriverManager.getConnection(url,user,pass);
         Statement stmt=conn.createStatement();   
         ResultSet rsTmp = stmt.executeQuery("select count(id) as countid from goods");

         rsTmp.next();
         totalRecords = rsTmp.getInt("countid");
         rsTmp.close();
         ResultSet rs = stmt.executeQuery("SELECT * from goods where author='"+name+"' order by ID desc");                 

	if(!rs.next()) {
		out.println("<p>还 没 有 任 何 商品</p>");
	} else {
%>
<div class="nav">
         <ul>
            <li><a href="user/usergoodsedit.jsp?name=<%=name %>">编辑商品</a></li>
        </ul>
</div>	
<br><br><br><br><br><br>
	<p><strong>全部商品</strong><table border=1 borderColorDark=#ffffec borderColorLight=#5e5e00 cellPadding=1 cellSpacing=0 width=70%>
	<tr bgcolor=cccccc align=center><td>商品信息</td><td>作者</td><td>日期</td></tr>
<%
	int cc = 1;
	do {
	    // 不同行之间以不同颜色显示
    	if(cc % 2 == 1)
			  out.println("<tr bgcolor=#E7E7E7>");
		else
			  out.println("<tr BGCOLOR=#F4F4F4>");
%>
 	    <td><a href="javascript:NewsWindow(<%=rs.getInt("ID")%>)"><u>
	    <%=rs.getString("title")%></u></a></td>
	    <td><%=rs.getString("author")%></td>
	    <td><%=rs.getDate("times").toString()%>
<%
		out.println("</td></tr>");
		cc++;
	} while(rs.next());
	out.println("</table><p>共" + totalRecords + "条商品");
}
rs.close();
%>
<br><br>
<p align=center><a href="user/usergoodsedit.jsp?name=<%=name %>">编辑商品</a></p>

<br><br><br><br><br><br><br><br>
	  <div class="nav2">
      </div>
</center>
</body>
</html>
