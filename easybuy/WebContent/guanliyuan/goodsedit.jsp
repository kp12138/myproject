<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
String sql = "";
int id = 1;
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
<script language="JavaScript">
function NewsWindow(id)
{
window.open('guanliyuan/goodswind.jsp?id='+id,'infoWin', 'height=400,width=600,scrollbars=yes,resizable=yes');
}
</script>
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
    <div class="nav">
        <ul>
            <li><a >编辑商品</a></li>
            <li><a href="guanliyuan/default.jsp">查看商品</a></li>

        </ul>
    </div>
<%
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/easybuycart";
            String user="root";
            String pass="123";
            Connection conn=DriverManager.getConnection(url,user,pass);
            Statement stmt=conn.createStatement();
            
            
         if(request.getParameter("del")!=null) {
          String sql="delete from goods where id=" + request.getParameter("del"); 
         PreparedStatement  ps=conn.prepareStatement(sql);
        int rs=ps.executeUpdate();
 }
             sql="SELECT * from goods order by ID desc";
            ResultSet rs=stmt.executeQuery(sql);
         if(!rs.next())

	   

%>
<br><br><br><br>
    <p><strong>全部商品</strong><table width=70%>
	<%
	do {
		id = rs.getInt("ID");
	%>
	<tr>
		<td><a href="javascript:NewsWindow(<%=id%>)"><u>
		<%=rs.getString("title")%></u></a>
		<%=rs.getString("author")%>
		【<%=rs.getDate("times").toString()%>】
		</td>
		<td align=right>  
		<!--  管理员  不用编辑功能   <img src=img/TWO2_06.GIF><a href=guanliyuan/goodsedit2.jsp?id=<%=id%>>编辑</a>　-->
		<img src=img/TWO2_09.GIF><a href=guanliyuan/goodsedit.jsp?del=<%=id%>>删除</a>
		</td>
	</tr>
		<%
	}while(rs.next());

rs.close();
%>
</table>
<p >
<!--  管理员不用添加功能    <a href=guanliyuan/goodsadd.jsp>添加商品</a>　  -->
<a href="guanliyuan/default.jsp">查看商品</a></p>
<br><br><br><br><br>
	 
	  <div class="nav2">
      </div>
</center>
</body>
</html>