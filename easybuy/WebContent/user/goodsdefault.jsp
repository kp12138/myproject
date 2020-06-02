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
    

  
	<script type="text/javascript" src="js/js.js"></script>
	<Script language="JavaScript">
//打开新窗口函数NewsWindow
function NewsWindow(id,name)
{
  window.open('user/usergoodswind.jsp?id='+id+'&name='+name,'infoWin', 'height=400,width=600,scrollbars=yes,resizable=yes');
}
    </Script>

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
            <li><strong>大类搜索</strong></li>
            <li><a href="user/fengleiResult.jsp?key=电脑" >电脑</a></li>
            <li><a href="user/fengleiResult.jsp?key=相机" >相机</a></li>
            <li><a href="user/fengleiResult.jsp?key=手机" >手机</a></li>
            <li><a href="user/fengleiResult.jsp?key=箱包" >箱包</a></li>
            <li><a href="user/fengleiResult.jsp?key=服饰" >服饰</a></li>
            <li><a href="user/fengleiResult.jsp?key=图书" >图书</a></li>
            <li><a href="user/fengleiResult.jsp?key=寝室家电" >寝室家电</a></li>
            <li><a href="user/fengleiResult.jsp?key=寝室家居" >寝室家居</a></li>
            <li><a href="user/fengleiResult.jsp?key=耳机" >耳机</a></li>
            <li><a href="user/fengleiResult.jsp?key=自行车" >自行车</a></li>
            <li><a href="user/fengleiResult.jsp?key=其它数码" >其它数码</a></li>
        </ul>
</div>
  <br><br>
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
         ResultSet rs = stmt.executeQuery("SELECT * from goods order by ID desc");                 
	if(!rs.next()) {
		out.println("<p>还 没 有 任 何 商品</p>");
	} else {
%>
<div class="content">
	<div class="index_content">
    	<div class="index_content_left">        	
	&nbsp;<strong>Goods List:</strong>
	</br>	
<table  background-color:#fff border:none color:#565 font:20px arial text-align:left width="590" >
	   <tr bgcolor=cccccc align=center>
	      <td>商品信息</td>
	      <td width="">作者</td>
	      <td>商品简介</td>
	      <td>价格</td>
	      <td>日期</td>
	   </tr>
<%
	int cc = 1;
	do {
	    // 不同行之间以不同颜色显示
    	if(cc % 2 == 1)
			  out.println("<tr bgcolor=#E7E7E7>");
		else
			  out.println("<tr BGCOLOR=#F4F4F4>");
%>
 	    <td><a href="javascript:NewsWindow(<%=rs.getInt("ID")%>,'<%=name%>')"><u>
	    <%=rs.getString("title")%></u></a></td>
	    <td><%=rs.getString("author")%></td>
	    <td><%=rs.getString("content")%></td>
	    <td>﹩<%=rs.getString("keyw")%></td>
	    <td><%=rs.getDate("times").toString()%></td>
<%
		out.println("</td></tr>");
		cc++;
	} while(rs.next());	
	out.println("</table><p>共" + totalRecords + "条商品");
}
rs.close();
%>	
    </div>
<br>
    	   <div class="index_content_right">   	   
        	<div class="index_banner_jdt">
            	<DIV id=idContainer2 class=container>
                    <TABLE id=idSlider2 border=0 cellSpacing=0 cellPadding=0>
                      <TBODY>
                      <TR>
                        <TD class=td_f><A href="http://www.zzhaoz.com/" target="_blank"><IMG src="img/1.jpg"></A></TD>
                        <TD class=td_f><A href="http://www.zzhaoz.com/" target="_blank"><IMG src="img/2.jpg"></A></TD>
                        <TD class=td_f><A href="http://www.zzhaoz.com/" target="_blank"><IMG src="img/3.jpg"></A></TD>
                        <TD class=td_f><A href="http://www.zzhaoz.com/" target="_blank"><IMG src="img/4.jpg"></A></TD>
                        <TD class=td_f><A href="http://www.zzhaoz.com/" target="_blank"><IMG src="img/5.jpg"></A></TD>
                       </TR></TBODY></TABLE>
                    <UL id=idNum class=num></UL>
                    </DIV>
            </div> 	   
        	<div>
    <table align=center width="350">
       <tr>
          <td><p align=center><h2><strong>大类搜素</strong></p></td>
          <td><p align=center><a href="user/fengleiResult.jsp?key=电脑" ><strong>电脑</strong></a></p></td>
          <td><p align=center><a href="user/fengleiResult.jsp?key=相机"><strong>相机</strong></a></p></td>
       </tr>
       <tr>
          <td><p align=center><a href="user/fengleiResult.jsp?key=手机"><strong>手机</strong></a></p></td>
          <td><p align=center><a href="user/user/fengleiResult.jsp?key=箱包"><strong>箱包</strong></a></p></td>
          <td><p align=center><a href="user/fengleiResult.jsp?key=服饰"><h3><strong>服饰</strong></a></p></td>
       </tr>
       <tr>
          <td><p align=center><a href="user/fengleiResult.jsp?key=图书"><strong>图书</strong></a></p></td>
          <td><p align=center><a href="user/fengleiResult.jsp?key=寝室家电"><strong>寝室家电</strong></a></p></td>
          <td><p align=center><a href="user/fengleiResult.jsp?key=寝室家居"><strong>寝室家居</strong></a></p></br></td>
       </tr>
       <tr>

          <td><p align=center><a href="user/fengleiResult.jsp?key=耳机"><strong>耳机</strong></a></p></td>
          <td><p align=center><a href="user/fengleiResult.jsp?key=自行车"><strong>自行车</strong></a></p></td>
          <td><p align=center><a href="user/fengleiResult.jsp?key=其它数码"><strong>其它数码</strong></a></p></td>
       </tr>
   </table>
              </div>
            </div>
    </div>
</div>
<br><br><br> 
 </div>
	  <div class="nav2">
      </div>
</center> 
<script type="text/javascript" src="js/index_bottom.js"></script>     
</body>
</html>
