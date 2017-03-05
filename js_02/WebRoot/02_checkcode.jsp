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
   <table align="center">
   	<tr>
  		<th>验证码: </th>
   	<td>
   		<input type="text" size="4" id="checkcodeID" name="checkcode" maxlength="4"/>
   	 </td>
   	 <td><img alt="" src="01_image.jsp"/></td>
   	 <td id="res"></td>
   	</tr>
   </table>
   <script type="text/javascript" src="js/ajax.js"></script>
   <script type="text/javascript">
   	//去掉二边的空格
   	function trim(str)
   	{
   		str = str.replace("/^\s*/","");//"zhau "
   		str = str.replace("/\s*$/","");//" zhao"
   		return str;
   	}
   	
   	document.getElementById("checkcodeID").onkeyup = function()
   	{
   		var checkcode = this.value;
   		checkcode = trim(checkcode);
   		if(checkcode.length == 4)
   		{
   			//NO1)
   			var ajax= createAjax();
   			//N02)
   			method = "POST";
   			url = "pageContext.request.contextPath/check?time="+new Date().getTime();
   			ajax.open(method,url);
   			//NO3)
   			ajax.setRequestHeader("content-type","application/x-www-form-urlencoded");
   			//NO4)
   			var content = "checkcode="+checkcode;
   			ajax.send(content);
   			//------------------------------------等待
   			ajax.onreadystatechange = function()
   			{
   				if(ajax.readyState == 4)
   				{	//NO5)
   					if(ajax.status == 200)
   					{
   						//NO6)
   						var checkText = ajax.responseText;
   						//NO7)
   						var imgElement = document.createElement("img");
   						
   						imgElement.src = checkText;
   						imgElement.style.width = "14px";
   						imgElement.style.height = "14px";
   						var td = document.getElementById("res");
   						td.innerHTML = "";
   						td.appendChild(imgElement);
   					}
   				}
   			}
   	}
   	else{
   		var td = document.getElementById("res");
   		td.innerHTML = "";
   		}
   	}
   </script>
  </body>
</html>
