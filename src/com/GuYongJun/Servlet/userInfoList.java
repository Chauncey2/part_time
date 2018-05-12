package com.GuYongJun.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GuYongJun.service.MaintainService;

@SuppressWarnings("serial")
public class userInfoList extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		MaintainService mainService=new MaintainService();
	
		req.setAttribute("userInfoList",mainService.getUserInfo());
		req.getRequestDispatcher("WEB-INF/jsp/front/blndex.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doGet(req, resp);
	}

	
}
