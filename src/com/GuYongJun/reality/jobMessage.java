package com.GuYongJun.reality;

import java.util.Date;

/**
 * 兼职信息实体类
 * */
public class jobMessage {

	private int id; 			//商品信息id
	private String Jname;		//工作名称
	private String Cname;		//商家名称
	private Date Jtime;			//工作时间
	private String JAddress;	//工作地址
	private String Jsalary;		//薪资
	private String Jlocal;		//所在区县
	private  Date Jreleasetime;	//信息发布时间
	private String description; //工作职位描述
	private String contacts;    //联系人
	private String ctel;		//联系电话
	 
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getJname() {
		return Jname;
	}
	public void setJname(String jname) {
		Jname = jname;
	}
	public String getCname() {
		return Cname;
	}
	public void setCname(String cname) {
		Cname = cname;
	}
	public Date getJtime() {
		return Jtime;
	}
	public void setJtime(Date jtime) {
		Jtime = jtime;
	}
	public String getJAddress() {
		return JAddress;
	}
	public void setJAddress(String jAddress) {
		JAddress = jAddress;
	}
	public String getJsalary() {
		return Jsalary;
	}
	public void setJsalary(String jsalary) {
		Jsalary = jsalary;
	}
	public String getJlocal() {
		return Jlocal;
	}
	public void setJlocal(String jlocal) {
		Jlocal = jlocal;
	}
	public Date getJreleasetime() {
		return Jreleasetime;
	}
	public void setJreleasetime(Date jreleasetime) {
		Jreleasetime = jreleasetime;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * 重写toString()方法方便调试
	 * */
	@Override
	public String toString() {
		return "jobMessage [id=" + id + ", Jname=" + Jname + ", Cname=" + Cname + ", Jtime=" + Jtime + ", JAddress="
				+ JAddress + ", Jsalary=" + Jsalary + ", Jlocal=" + Jlocal + ", Jreleasetime=" + Jreleasetime
				+ ", description=" + description + ", contacts=" + contacts + ", ctel=" + ctel + "]";
	}
	
	
	
	
	
}
