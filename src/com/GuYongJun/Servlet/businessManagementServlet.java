package com.GuYongJun.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GuYongJun.reality.businessInfo;
import com.GuYongJun.service.MaintainService;

/**
 * Servlet implementation class businessManagementServlet
 */
@WebServlet("/businessManagementServlet")
public class businessManagementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public businessManagementServlet() {
    	
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MaintainService mainService=new MaintainService();
		List<businessInfo> buList=new ArrayList<businessInfo>();
		/**
		 * form表单提交信息后，验证通过就将用户的信息储存在session里，然后前台显示session中储存的值
		 * */
		request.setCharacterEncoding("UTF-8");
		businessInfo busUser=new businessInfo();
		//获取用户列表
		buList=mainService.getBusinessInfo();  
		
		System.out.println(buList.get(0).toString());
		
		businessInfo busInfo=buList.get(0);
		request.setAttribute("busInfo", busInfo);
		request.getRequestDispatcher("/bussinessManagement.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.doGet(request, response);
	}

}
