package com.GuYongJun.Servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GuYongJun.reality.businessInfo;
import com.GuYongJun.reality.userBean;
import com.GuYongJun.service.MaintainService;
import com.google.gson.Gson;

/**
 *  businessLoginServlet 处理商家登录的业务逻辑
 */
@WebServlet("/businessLoginServlet")
public class businessLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public businessLoginServlet() {
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("json;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		MaintainService maintainService = new MaintainService();
		// 设置返回给jsp页面的编码格式和数据类型，如果不设置或者设置错误
		Gson gson = new Gson();
		String baccount = request.getParameter("login");
		String bpassword = request.getParameter("pwd");

		PrintWriter writer = response.getWriter();
		//userBean userInfo=new userBean();
		businessInfo busUser1=new businessInfo();
		businessInfo busUser2=new businessInfo();
		try {
			//如果用户未登录则进行登录查询操作
			HttpSession session=request.getSession();
			//如果用户未登录，则进行登录
			if(session.getAttribute("businessUser")==null){	
				
				busUser1.setBaccount(baccount);
				busUser1.setBpassword(bpassword);
				busUser2=maintainService.getBusinessInfo(busUser1).get(0);
				System.out.println(busUser2);
				
				System.out.println("json格式："+gson.toJson(busUser2));		
				writer.append(gson.toJson(busUser2));  
				request.getSession().setAttribute("businessUser",busUser2);  //将用户信息保存自session中
				System.out.println("保存在session中的用户信息"+busUser2);
				String Cname=busUser2.getCname();
				request.getSession().setAttribute("Cname", Cname);
			}else{
				//如果用户已经登录，则返回一个空的对象
				writer.append(gson.toJson(busUser2));   //返回一个空的对象
			}		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			writer.close();
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.doGet(request, response);
	}

}
