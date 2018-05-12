package com.GuYongJun.service;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import com.GuYongJun.Dao.jobMessageDao;
import com.GuYongJun.Dao.signUpDao;
import com.GuYongJun.Dao.userInfoDao;
import com.GuYongJun.reality.jobMessage;
import com.GuYongJun.reality.userBean;
import com.google.gson.Gson;

/**
 * 调用DAO层的Service层，提供接口由Servlet层调用
 * */
public class MaintainService {

	//[start] 获取所有的用户信息(userInfoDao)
	 public List<userBean> getUserInfo(){
		 
		userInfoDao userInfoDao=new userInfoDao();
		List<userBean> userInfoList=userInfoDao.getUserInfo();
		return userInfoList;	
	}
	//[end]
	 
	//[start] 获取查询到的用户信息(userInfoDao)
	 public userBean getUserInfoByAccount(String account,String password){
		 
		 userInfoDao userInfoDao=new userInfoDao();
		 userBean user=new userBean();
		 List<userBean> userInfo=new ArrayList<userBean>();
		 
		try {
			userInfo = userInfoDao.getUserInfoByAccount(account, password);
			user=userInfo.get(0);
			
			/*user.setId(userInfo.get(0).getId());
			user.setAccount(userInfo.get(0).getAccount());
			user.setPassword(userInfo.get(0).getPassword());
			user.setNickName(userInfo.get(0).getNickName());
			user.setRealName(userInfo.get(0).getRealName());
			user.setEmail(userInfo.get(0).getEmail());
			user.setTel(userInfo.get(0).getTel());
			user.setRegTime(userInfo.get(0).getRegTime());*/
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 return user;
			 
	 }
	//[end]

	//[start] 用户注册
	/**
	 * 	用户注册
	 * */
	 public int userSignUp(userBean user){
		 signUpDao sign=new signUpDao();
		 int result=0;
		try {
			result = sign.signUpuser(user);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return result;
	 }
	 //[end]
	
	//[start] 兼职信息查询
	 public List<jobMessage> getJobMessage(){
		 jobMessageDao jobDao=new jobMessageDao();
		 List<jobMessage> jobMessage=new ArrayList<jobMessage>();
		 jobMessage=jobDao.getJobMessage();
		 SimpleDateFormat sdf=new SimpleDateFormat("yy-MM-dd");
		
		 return jobMessage;	 
	 }
	//[end]
}