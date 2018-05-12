package com.GuYongJun.Dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.GuYongJun.db.DBAccess;
import com.GuYongJun.reality.userBean;

/**
 * 获取用户信息列表
 * */
public class userInfoDao {
	
	//[start] getUserInfo()
	public List<userBean> getUserInfo(){
		
		DBAccess dbAccess=new DBAccess();
		SqlSession sqlSession=null;
		List<userBean> userInfoList=new ArrayList<userBean>();
		try {
			sqlSession=dbAccess.getSqlSession();  //获取SqlSession
			//SqlSession执行查询
			userBean user=new userBean();
			userInfoList=sqlSession.selectList("queryUserInfo",user);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(sqlSession!=null){
				sqlSession.close();
			}
		}
		return userInfoList;	
	}
	//[end]

	//[start] 条件查询用户信息，验证用户登录
	public List<userBean> getUserInfoByAccount(String account,String password){
		DBAccess access =new DBAccess(); //获取数据库连接
		SqlSession sqlSession=null;
		List<userBean> userlist=new ArrayList<userBean>();
		
		try {
			sqlSession=access.getSqlSession();
			userBean user=new userBean();
			user.setAccount(account);
			user.setPassword(password);
			userlist=sqlSession.selectList("queryUserInfo",user);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return userlist;
	}
	//[end]
}
