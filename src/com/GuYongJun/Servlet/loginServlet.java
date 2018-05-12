package com.GuYongJun.Servlet;

import java.io.IOException;

import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.GuYongJun.reality.userBean;
import com.GuYongJun.service.MaintainService;
import com.google.gson.Gson;

/**
 * 处理登录验证的过滤器
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public loginServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("json;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		MaintainService maintainService = new MaintainService();
		// 设置返回给jsp页面的编码格式和数据类型，如果不设置或者设置错误
		Gson gson = new Gson();
		String account = request.getParameter("login");
		String password = request.getParameter("pwd");

		PrintWriter writer = response.getWriter();
		userBean userInfo=new userBean();
		try {
			//如果用户未登录则进行登录查询操作
			HttpSession session=request.getSession();
			//如果用户未登录，则进行登录
			if(session.getAttribute("userInfo")==null){	
				userInfo = maintainService.getUserInfoByAccount(account, password);
				System.out.println(userInfo);
				
				System.out.println("json格式："+gson.toJson(userInfo));		
				writer.append(gson.toJson(userInfo));  //出错导致jsp页面中ajax的回调函数不执行，出错原因就是gson的toJson方法中的参数没有List类型，之前传递的都是List
				request.getSession().setAttribute("userInfo",userInfo);  //将用户信息保存自session中
				System.out.println("保存在session中的用户信息"+userInfo);
				String nickName=userInfo.getNickName();
				request.getSession().setAttribute("nickName", nickName);
			}else{
				//如果用户已经登录，则返回一个空的对象
				writer.append(gson.toJson(userInfo));   //返回一个空的对象
			}
			
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			writer.close();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doGet(request, response);
	}

}
