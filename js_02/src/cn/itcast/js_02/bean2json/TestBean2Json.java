package cn.itcast.js_02.bean2json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;

public class TestBean2Json {

	
	public static void javabean2Json()
	{
		City city = new City(1,"广州");
		JSONArray jsonArray = JSONArray.fromObject(city);
		String jsonJAVA = jsonArray.toString();
		System.out.println(jsonJAVA);
		//[{"id":1,"name":"广州"}]
	}
	
	public static void list2json()
	{
		List<City> cityList = new ArrayList<City>();
		cityList.add(new City(1,"广州"));
		cityList.add(new City(2,"深圳"));
		
		Province province = new Province(1,"广东",cityList);
		
		//[{"id":1,"cityList":[{"id":1,"name":"广州"},{"id":2,"name":"深圳"}],"name":"广东"}]
		JSONArray jsonArray = JSONArray.fromObject(province);
		String jsonJAVA = jsonArray.toString();
		System.out.println(jsonJAVA);
		//List集合[{"id":1,"name":"广州"},{"id":2,"name":"深圳"}]
	}
	
	public static void set2json()
	{
		Set<City> citySet= new HashSet<City>();
		citySet.add(new City(1,"广州"));
		citySet.add(new City(2,"深圳"));
		JSONArray jsonArray = JSONArray.fromObject(citySet);
		String jsonJAVA = jsonArray.toString();
		System.out.println(jsonJAVA);
		//[{"id":1,"name":"广州"},{"id":2,"name":"深圳"}]
	}
	public static void map2json()
	{
		List<City> cityList = new ArrayList<City>();
		cityList.add(new City(1,"广州"));
		cityList.add(new City(2,"深圳"));
		
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("total", cityList.size());//表示集合的长度
		map.put("rows", cityList);//表示集合
		/**
		 * [{"total":2,"rows":[{"id":1,"name":"广州"},{"id":2,"name":"深圳"}]}]
		 */
		
		JSONArray jsonArray = JSONArray.fromObject(map);
		String jsonJAVA = jsonArray.toString();
		jsonJAVA = jsonJAVA.substring(1,jsonJAVA.length()-1);
		System.out.println(jsonJAVA);
		//[{"id":1,"name":"广州"},{"id":2,"name":"深圳"}]
	}
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
//		javabean2Json();
//		list2json();
//		set2json();
		map2json();
	}

}
