function $(str)
{
  		//获取str类型的,必须是string类型
	var type = typeof(str);
	if(type == "string")
	{
		//截取字符串的第一个字符
		var first = str.substring(0,1);
		//如果是#的话
		if("#" == first)
		{
			//截取#之后的字符串
			var end = str.substring(1,str.length);
			//根据id定位
			var element = document.getElementById(end);
			if(element != null)
			{
				//返回标签
				return element;
			}else
			{
				alert("查无此标签");
			}
		}
	}else
	{
		alert("输入的格式有误,应当输入字符串类型的数据");
	}
}

function Photo()
{
	//照片
	var img = document.images[0];
	//隐藏
	this.hide = function()
	{
		img.style.visibility = "hidden";
	}
	//显示
	this.show = function()
	{
		img.style.visibility = "visible";
	}
}