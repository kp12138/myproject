<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
String id = "";
String name = "";
String name1 = "";
String sex = "";
String age = "";
String zhuanye = "";
String youxiang = "";
String address = "";
boolean flag1=false;
boolean flag2=false;
boolean flag3=false;
boolean flag4=false;
boolean flag5=false;
boolean flag6=false;
boolean flag7=false;
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
    
    <title>My JSP 'savexinxi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<%
request.setCharacterEncoding("utf-8");
if(request.getParameter("id")!=null)     {
	flag1=true; id = request.getParameter("id");
}
if(request.getParameter("name")!=null)  {
	flag2=true; name = request.getParameter("name");
}
if(request.getParameter("sex")!=null)   {
	flag3=true; sex = request.getParameter("sex");  
}
if(request.getParameter("age")!=null)    {
	flag4=true; age = request.getParameter("age");
}
if(request.getParameter("zhuanye")!=null)  {
	flag5=true; zhuanye = request.getParameter("zhuanye");
}
if(request.getParameter("youxiang")!=null)    {
	flag6=true; youxiang = request.getParameter("youxiang");
}
if(request.getParameter("address")!=null)  {
	flag7=true; address = request.getParameter("address");
}
// 如果title不为空，则添加或修改记录
if(flag1 & flag2 & flag3 & flag4 & flag5 & flag6 & flag7 ) {
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
            
            String sql =  "update user set name='" + name ;
	               sql += "',youxiang='" + youxiang + "',address='" + address + "',sex='" + sex + "',age='" + age + "',zhuanye='";
	               sql += zhuanye + "' where id=" + id;
            ps=con.prepareStatement(sql);
            int n=ps.executeUpdate();
        
        
		out.println("<hr>");
		out.println("<h2>修改信息成功！</h2>");
		out.println("<hr>");
}else {
		out.println("<hr>");
        out.println("<h2>请输入正确的信息后再进行录入！</h2>");
		out.println("<hr>");
}
%>
<jsp:forward page="gerenxinxi.jsp"/>
	

  </head>
</html>
