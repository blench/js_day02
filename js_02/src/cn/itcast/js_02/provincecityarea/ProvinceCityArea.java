package cn.itcast.js_02.provincecityarea;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

public class ProvinceCityArea extends ActionSupport {
	
	private Bean bean;
	public void setBean(Bean bean) {
		this.bean = bean;
	}
	public Bean getBean() {
		return bean;
	}

	public String findCityByProvince() throws Exception {
		// TODO Auto-generated method stub
		cityList = new ArrayList<String>();
		if("湖北".equals(bean.getProvince()))
		{
			cityList.add("武汉");
			cityList.add("孝感");
			cityList.add("黄冈");
		}else if("湖南".equals(bean.getProvince()))
		{
			cityList.add("长沙");
			cityList.add("株洲");
			cityList.add("岳阳");
			cityList.add("湖南");
		}else if("江西".equals(bean.getProvince()))
		{
			cityList.add("南昌");
			cityList.add("南昌");
			cityList.add("南昌");
			cityList.add("南昌");
		}
		
		//配置让struts2自动将List/Set/Map<String>转换为JSON文本
		return this.SUCCESS;
	}
	
	/**
	 * 通过城市查找区域
	 * @return
	 * @throws Exception
	 */
	
	public String findAreaByCity() throws Exception {
		// TODO Auto-generated method stub
		areaList = new ArrayList<String>();
		if("武汉".equals(bean.getCity()))
		{
			areaList.add("AA");
			areaList.add("BB");
			areaList.add("CC");
		}else if("南昌".equals(bean.getCity()))
		{
			areaList.add("DD");
			areaList.add("EE");
			areaList.add("FF");
		}else if("长沙".equals(bean.getCity()))
		{
			areaList.add("GG");
			areaList.add("HH");
			areaList.add("II");
		}
		
		//配置让struts2自动将List/Set/Map<String>转换为JSON文本
		return this.SUCCESS;
	}
	
	private List<String> cityList;
	private List<String> areaList;
	public List<String> getAreaList() {
		return areaList;
	}
	public List<String> getCityList()
	{
		return this.cityList;
	}
}
