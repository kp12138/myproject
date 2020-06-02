<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
String id = "";
String title = "";
String title1 = "";
String content = "";
String keyw = "";
String author = "";
boolean flag1=false;
boolean flag2=false;
boolean flag3=false;
boolean flag4=false;
boolean flag5=false;
String sql = "";
ResultSet rs = null;
%>
<%
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
//request.setCharacterEncoding("UTF-8");
if(request.getParameter("id")!=null)     {
	flag1=true; id = request.getParameter("id");
}
if(request.getParameter("title")!=null)  {
	flag2=true; title = new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8") ;
}
if(request.getParameter("body")!=null)   {
	flag3=true; content = new String(request.getParameter("body").getBytes("ISO-8859-1"),"UTF-8");  
}
if(request.getParameter("keyw")!=null)    {
	flag4=true; keyw =new String( request.getParameter("keyw").getBytes("ISO-8859-1"),"UTF-8");
}
if(request.getParameter("author")!=null)  {
	flag5=true; author =new String(  request.getParameter("author").getBytes("ISO-8859-1"),"UTF-8");
  }
// 如果title不为空，则添加或修改记录
if(flag1 & flag2 & flag3 & flag4 & flag5 ) {
        // 执行插入操作
        
  
            Connection con=null;
            PreparedStatement ps=null;
            Statement stmt=null;

            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/easybuycart";
            String user="root";
            String pass="123";
            con=DriverManager.getConnection(url,user,pass);
            stmt=con.createStatement();
            
            String sql =  "update goods set title='" + title ;
	               sql += "',content='" + content + "',keyw='" + keyw + "',author='";
	               sql += name + "' where id=" + id;
            ps=con.prepareStatement(sql);
            int n=ps.executeUpdate();
 %>       
  <div class="nav">
     <ul><li><a href="user/gerenxinxizhaun.jsp?name=<%=name %>">返回</a></li></ul>
</div>	
<br><br><br><br><br><br><br><br>      
<% 	
		out.println("<h2>商品添加成功！</h2>");
		
}else {
		
        out.println("<h2>请输入正确的信息后再进行录入！</h2>");
		
}
%>

<br><br>
<a href="user/gerenxinxizhaun.jsp?name=<%=name %>">返回</a>　

<br><br><br><br><br><br><br><br><br><br>
	  <div class="nav2">
      </div>
</center>  
</body>  
</html>
