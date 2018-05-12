package com.GuYongJun.reality;

import java.util.Date;

public class userBean {

	private int id; 	//用户id
	private String account;  //账号
	private String password; //密码
	private String nickName; //昵称
	private String realName; //真实姓名
	private String tel; 	 //电话
	private String email;    //邮箱
	private Date regTime;    //注册时间
	private int usertype;    //用户类型
	
	public userBean() {
		
	}

	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegTime() {
		return regTime;
	}

	public void setRegTime(Date regTime) {
		this.regTime = regTime;
	}

	public int getUsertype() {
		return usertype;
	}

	public void setUsertype(int usertype) {
		this.usertype = usertype;
	}


	@Override
	public String toString() {
		return "userBean [id=" + id + ", account=" + account + ", password=" + password + ", nickName=" + nickName
				+ ", realName=" + realName + ", tel=" + tel + ", email=" + email + ", regTime=" + regTime
				+ ", usertype=" + usertype + "]";
	}
	
}
