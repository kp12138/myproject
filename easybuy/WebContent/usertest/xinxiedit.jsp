<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
String id = "";
String name = "";
String name1 = "";
String sex = "";
String age = "";
String zhuanye  = "";
String youxiang = "";
String address  = "";
int currid = 0;
String sql = "";
ResultSet rs = null;
%>	
	<%
// 下面主要是为了进行显示
       if(request.getParameter("id") != null) {
		     id = request.getParameter("id");
	         Class.forName("com.mysql.jdbc.Driver");
	         String url="jdbc:mysql://localhost:3306/easybuycart";
	         String user="root";
	         String pass="123";
	         Connection conn=DriverManager.getConnection(url,user,pass);
	         Statement stmt=conn.createStatement();
		
		     sql="select * from user where id=" + request.getParameter("id");
	         ResultSet rs=stmt.executeQuery( sql );
	   if(rs.next()) {
			 name1  = rs.getString("name");
			 sex = rs.getString("sex");
			 age = rs.getString("age");
			 zhuanye  = rs.getString("zhuanye");
			 youxiang = rs.getString("youxiang");
			 address  = rs.getString("address");
			 rs.close();
    %>  
		<form name=form1 method="post" action="savexinxi.jsp">
		  <input value="<%=id%>" type=hidden name=id>
		  <P align="center">姓名：<INPUT size=25 name=name value=<%=name1%>></P>
		  <br>
		  <P align="center">性别：<INPUT size=25 name=sex value=<%=sex%>></P>
		  <br>
		  <P align="center">年龄：<INPUT size=25 name=age value=<%=age%>></P>
		　  <P align="center">专业：<INPUT size=25 name=zhuanye value=<%=zhuanye %>></P>	
		<br>
		  <P align="center">邮箱：<INPUT size=25 name=youxiang value=<%=youxiang%>></P>
		　  <P align="center">地址：<INPUT size=25 name=address value=<%=address %>></P>		　
		  <p align="center">
		  <INPUT type=submit value=" 确 定 ">
		  <INPUT type=reset value=" 清 除 "></p>
		</form>
   	<%
	   } 
	   else {
			  out.println("<hr>");	
			  out.println("<center>非法的id号！</center>");
			  out.println("<hr>");	
	   }
}
	%>
</center>
</body>
</html>