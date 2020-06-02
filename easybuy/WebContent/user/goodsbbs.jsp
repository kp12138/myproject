<%@ page language="java" import="java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
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
	

</head>
  
  <body >
  
          <%
           Class.forName("com.mysql.jdbc.Driver");
           String url="jdbc:mysql://localhost:3306/easybuycart";
           String user="root";
           String pass="123";
           Connection conn=DriverManager.getConnection(url,user,pass);
           Statement stmt=conn.createStatement();
           ResultSet rs=stmt.executeQuery("SELECT*FROM bbs  ");
          while(rs.next()){
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
          Line1 = Line1 + "Email" + Email + "<BR>";          
          out.println(Line1+"<br/>");
          
     
          String Line2;
          Line2 = "主 题：" + Subject + "<BR>";
           out.println(Line2+"<br/>");

          String Line3;
          Line3 = "<TABLE BORDER=0 BGCOLOR=#00FFFF ><TR><TD>";
          Line3 = Line3 + Memo + "</TD></TR></TABLE>";
           out.println(Line3+"<br/>");
           
          String Line4;
           Line4 = "时间："  + gtime + "<BR>";
            out.println(Line4+"<br/>");
          

         %>

   
         <br/>       
              <% 
               }
                rs.close();
                stmt.close();
                conn.close();
             
              %>
<div align="center"  >
  
  
  <form Action="user/gbbscheck.jsp" Method="POST">
  <table width="406" border="1" cellspacing="1" cellpadding="2" align="center" >
    <tr > 
      <td colspan="2"> 
        <div align="center"><b>留言表单</b></div>
      </td>
    </tr>
    <tr> 
      <td>姓 名：</td>
      <td>
        <input type="text" name="Name" class="form" size="50">
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
     

        
	 <div align="center">
	 <p>电话：0735-6778888 &nbsp;&nbsp;&nbsp;&nbsp;  传真：0735-6773196<br />
      客服监督电话：13907353280<br />
      E-mail：1023276826@qq.com
     </p>
	 
	 </div> 
</div>
  </body>
</html>
