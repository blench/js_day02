<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP '02_checkcode.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <body>
   <script type="text/javascript">
   //json定义数据的格式
   var p = {
   		id:1,
   		name:'哈哈哈',
   		age:18
   	}
   	
   	document.write(p.id+p.name+p.age+"<br/>");
   	
   	var ps = [
   		{
   			id:1,
   			name:'hha'
   		},
   		{
   			id:2,
   			name:'jack'
   		},
   		{
   			id:3,
   			name:'wek'
   		}
   	];
   	
   	for(var i=0;i<ps.length;i++)
   	{
   		document.write("编号"+ps[i].id+"姓名"+ps[i].name+"<br/>");
   	}
   </script>
  </body>
</html>
