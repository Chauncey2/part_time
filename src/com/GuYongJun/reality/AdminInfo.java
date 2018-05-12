package com.GuYongJun.reality;

public class AdminInfo {

	private int id;//id
	private String adAccount; //管理员账号
	private String adPassword; //管理员登录密码
	private String adTel;  //管理员电话
	private String adMail;  //管理员邮箱
	
	public AdminInfo() {
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAdAccount() {
		return adAccount;
	}

	public void setAdAccount(String adAccount) {
		this.adAccount = adAccount;
	}

	public String getAdPassword() {
		return adPassword;
	}

	public void setAdPassword(String adPassword) {
		this.adPassword = adPassword;
	}

	public String getAdTel() {
		return adTel;
	}

	public void setAdTel(String adTel) {
		this.adTel = adTel;
	}

	public String getAdMail() {
		return adMail;
	}

	public void setAdMail(String adMail) {
		this.adMail = adMail;
	}

	@Override
	public String toString() {
		return "AdminInfo [id=" + id + ", adAccount=" + adAccount + ", adPassword=" + adPassword + ", adTel=" + adTel
				+ ", adMail=" + adMail + "]";
	}
	
	
}
