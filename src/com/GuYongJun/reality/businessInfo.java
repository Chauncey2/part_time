package com.GuYongJun.reality;

import java.util.Date;

public class businessInfo {
		
	private int id;             //id
	private String baccount;	//账号
	private String bpassword;	//密码
	private String Cname;		//商家名
	private String contacts;	//联系人
	private String email;		//邮箱
	private String ctel;		//联系电话
	private String JAddress;	//详细地址
	private String Jlocal;		//所在区县
	private Date regTime;		//注册时间
	

	public businessInfo() {
		
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBaccount() {
		return baccount;
	}
	public void setBaccount(String baccount) {
		this.baccount = baccount;
	}
	public String getBpassword() {
		return bpassword;
	}
	public void setBpassword(String bpassword) {
		this.bpassword = bpassword;
	}
	public String getCname() {
		return Cname;
	}
	public void setCname(String cname) {
		Cname = cname;
	}
	public String getContacts() {
		return contacts;
	}
	public void setContacts(String contacts) {
		this.contacts = contacts;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCtel() {
		return ctel;
	}
	public void setCtel(String ctel) {
		this.ctel = ctel;
	}
	public String getJAddress() {
		return JAddress;
	}
	public void setJAddress(String jAddress) {
		JAddress = jAddress;
	}
	public String getJlocal() {
		return Jlocal;
	}
	public void setJlocal(String jlocal) {
		Jlocal = jlocal;
	}
	public Date getRegTime() {
		return regTime;
	}
	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}
	@Override
	public String toString() {
		return "businessInfo [id=" + id + ", baccount=" + baccount + ", bpassword=" + bpassword + ", Cname=" + Cname
				+ ", contacts=" + contacts + ", email=" + email + ", ctel=" + ctel + ", JAddress=" + JAddress
				+ ", Jlocal=" + Jlocal + ", regTime=" + regTime + "]";
	}
	
	
}
