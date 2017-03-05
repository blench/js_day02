package cn.itcast.js_02.checkcode;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import freemarker.ext.servlet.HttpRequestHashModel;

public class CheckcodeAction extends ActionSupport{
	private String checkcode;
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	
	/**
	 * 验证
	 * @return null
	 * @throws Exception
	 */
	public String check() throws Exception
	{
		//从服务器中获取session的值
		String checkServer= (String) ActionContext.getContext().getSession().get("CHECKNUM");
		String tip = "images/MsgError.gif";
		//将服务器端的验证码与客户端的验证码进行比较
		if(checkServer.equals(this.checkcode))
		{
			tip = "images/MsgSent.gif";
		}
		
		//以IO流的方式将tip变量的值输出到AJAX异步通讯对象中
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter pw = response.getWriter();
		pw.write(tip);
		pw.flush();
		pw.close();
		//以下方式不是最好的，但是可以完成AJAX验证
		return null;
	}
}
