<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%!
String id = "";
String title = "";
String title1 = "";
String content = "";
String keyw = "";
String author = "";
int currid = 1;
String sql = "";
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
    
    <title>My JSP 'goodsadd.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/css.css">
	
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
         String name= new String( request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8"); 

         PreparedStatement ps=null;
   
         Class.forName("com.mysql.jdbc.Driver");
         String url="jdbc:mysql://localhost:3306/easybuycart";
         String user="root";
         String pass="123";
         Connection conn=DriverManager.getConnection(url,user,pass);
         Statement stmt=conn.createStatement();

         ResultSet rsTmp = stmt.executeQuery( "select max(id) as maxid from goods" );
         if(rsTmp.next()) currid = rsTmp.getInt("maxid") + 1;

         
         
//request.setCharacterEncoding("UTF-8");
if(request.getParameter("title")!=null)     title   =new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8") ;
if(request.getParameter("body")!=null)      content =new String( request.getParameter("body").getBytes("ISO-8859-1"),"UTF-8") ;
if(request.getParameter("keyw")!=null)      keyw    =new String( request.getParameter("keyw").getBytes("ISO-8859-1"),"UTF-8") ;
if(request.getParameter("author")!=null)    author  =new String( request.getParameter("author").getBytes("ISO-8859-1"),"UTF-8") ;    
// 如果title不为空，则添加记录
if(request.getParameter("title")!=null) {
        // 执行插入操作
         Date t=new Date();
         String st=t.toLocaleString();
	    String sql =  "insert into goods values (" + currid ;
	    sql += ",'" + title + "','" + content + "',";
	    sql += "'"+st+"','" + keyw + "','" + name + "')";
	    
        ps=conn.prepareStatement(sql);
        int rs=ps.executeUpdate();
	    
		out.println("<hr>");
		out.println("<h2>商品添加成功！</h2>");
		out.println("<hr>");
}else {

}
%>
<div class="nav">  
        <ul>
            <li><a href="user/usergoodsedit.jsp?name=<%=name%>">编辑商品</a></li>
            <li><a href="user/usergoodsgeren.jsp?name=<%=name%>">查看商品</a></li>
        </ul>   
</div>	
<br><br>

<form name=form1 method="post" action="user/usergoodsadd.jsp?name=<%=name %>">
  <P align="center">商品标  题：<INPUT size=95 name=title value=""></P><br>
  <P align="center">商品内  容：<TEXTAREA cols=73 name=body rows=15></TEXTAREA></P><br>
  <P align="center">商品价  格：<INPUT size=25 name=keyw value="">
 卖家：
　<INPUT size=25 name=author value="<%=name%>">　
  <p align="center">
  <INPUT class=buttonface type=submit value=" 确 定 ">
  <INPUT class=buttonface type=reset value=" 清 除 "></p>
</form><br>
<P align="center"><a href="user/usergoodsedit.jsp?name=<%=name%>">编辑商品</a>　<a href="user/usergoodsgeren.jsp?name=<%=name%>">查看商品</a>

<br><br><br>
	  <div class="nav2">
      </div>
</center> 
</body> 
</html>
