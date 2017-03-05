<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>struts2实现三级联查询</title>
    
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
  <select id="provinceID" style="width:111px">
  	<option>请选择省份</option>
  	<option>湖北</option>
  	<option>湖南</option>
  	<option>江西</option>
  </select>
  
  <select id="cityID" style="width:111px">
  	<option>请选择城市</option>
  </select>
  
   <select id="areaID" style="width:111px">
  	<option>请选择区域</option>
  </select>
   <script type="text/javascript" src="js/ajax.js"></script>
   <script type="text/javascript">
   document.getElementById("provinceID").onchange = function()
   {
   	var province = this[this.selectedIndex].innerHTML;
   	//清除之前的样式
   	var cityElement = document.getElementById("cityID");
   	cityElement.options.length = 1;
   	//当省份发生变化时,区域也会发生变化
   	var areaElement = document.getElementById("areaID");
   	areaElement.options.length = 1;
   	if("选择省份"!=province)
   	{
   		//NO1)
   		var ajax = createAjax();
   		//NO2)
   		var method = "POST";
   		var url = "${pageContext.request.contextPath}/findCityByProvince?time="+new Date().getTime();
   		ajax.open(method, url);
   		//NO3)
   		ajax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
   		//NO4)
   		var content = "bean.province="+province;
   		ajax.send(content);
   		//------------------------->等待
   		//NO5)
   		ajax.onreadystatechange = function()
   		{
   			if(ajax.readyState == 4)
   			{
   				if(ajax.status == 200)
   				{
   					//NO6)返回JAVA
   					var jsonJAVA = ajax.responseText;
   					var p = eval("("+jsonJAVA+")");
   					var array = p.cityList;
   					var size = array.length;
   					for(var i=0;i<size;i++)
   					{
   						var city=array[i];
   						var option = document.createElement("option");
   						option.innerHTML = city;
   						cityElement.appendChild(option);
   					}
   				}
   			}
   		}
   	}
   }
   
   
   document.getElementById("cityID").onchange = function()
   {
   	var city = this[this.selectedIndex].innerHTML;
   	//清除之前的数据
   	var areaElement = document.getElementById("areaID");
   	areaElement.options.length = 1;
   	if("请选择城市"!=city)
   	{
   		//NO1)
   		var ajax = createAjax();
   		//MO2)	
   		var method = "POST";
   		var url = "${pageContext.request.contextPath}/findAreaByCity?time="+new Date().getTime();
   		ajax.open(method,url);
   		//NO3)
   		ajax.setRequestHeader("content-type", "application/x-www-form-urlencoded");
   		//NO4)
   		var content = "bean.city="+city;
   		ajax.send(content);
   		
   		//----------------------等待
   		ajax.onreadystatechange = function()
   		{
   			//NO5)
   			if(ajax.readyState == 4)
   			{
   				if(ajax.status == 200)
   				{	
   					//NO6)
   					var jsonJAVA = ajax.responseText;
   					var jsonJS = eval("("+jsonJAVA+")");
   					var array = jsonJS.areaList;
   					var size = array.length;
   					for(var i=0;i<size;i++)
   					{
   						var area = array[i];
   						var option = document.createElement("option");
   						option.innerHTML = area;
   						areaElement.appendChild(option);
   					}
   				}
   			}
   		}
   	}
   	
   }
   </script>
  </body>
  <form action="" enctype="application/x-www-form-urlencoded"></form>
</html>
