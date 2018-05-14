package com.GuYongJun.Servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GuYongJun.reality.jobMessage;
import com.GuYongJun.service.MaintainService;

/**
 * Servlet implementation class noAuditServlet
 */
@WebServlet("/noAuditServlet")
public class noAuditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public noAuditServlet() {
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MaintainService mainService=new MaintainService();
		List<jobMessage> messageList=new ArrayList<jobMessage>();
		messageList=mainService.getJobMessage();
		request.setAttribute("messageList", messageList);
		System.err.println(messageList);
		request.getRequestDispatcher("/noAudit.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.doGet(request, response);
	}

}
