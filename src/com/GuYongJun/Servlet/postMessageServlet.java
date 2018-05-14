package com.GuYongJun.Servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.GuYongJun.reality.jobMessage;
import com.GuYongJun.service.MaintainService;

/**
 * Servlet implementation class postMessageServlet
 */
@WebServlet("/postMessageServlet")
public class postMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

  
    public postMessageServlet() {
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		jobMessage job=new jobMessage();
		MaintainService servce=new MaintainService();
		int result=0;
		
		request.setCharacterEncoding("UTF-8"); //设置接收参数为UTF-8 否则会乱码
		String Jname=(String)request.getParameter("Jname"); 	
		String Cname="";		
		String Jtime=(String)request.getParameter("jobTime");
		
		//将前端传过来的时间转换为data类型
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		Date jtime=null;
		try {
			jtime = dateFormat.parse(Jtime);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String JAddress=(String)request.getParameter("address");
		String Jsalary=(String)request.getParameter("salary");
		String Jlocal=(String)request.getParameter("jlocal");		
		Date Jreleasetime=new Date(); //发布时间为系统时间
		String description=(String)request.getParameter("job_description");
		String contacts=(String)request.getParameter("contact_person");
		String ctel=(String)request.getParameter("contact_phone");
		
		job.setJname(Jname);
		job.setCname(Cname);
		job.setJtime(jtime);
		job.setJAddress(JAddress);
		job.setJsalary(Jsalary);
		job.setJlocal(Jlocal);
		job.setJreleasetime(Jreleasetime);
		job.setDescription(description);
		job.setContacts(contacts);
		job.setCtel(ctel);
		
		result=servce.insertJobMessage(job);   //向数据库中插入数据
		System.out.println(job.toString());
		
		if(result==1){
			request.getRequestDispatcher("/recruitManagement.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("/error.jsp").forward(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		this.doGet(request, response);
	}

}
