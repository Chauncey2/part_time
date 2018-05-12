package com.GuYongJun.Dao;

import java.io.IOException;


import org.apache.ibatis.session.SqlSession;

import com.GuYongJun.db.DBAccess;
import com.GuYongJun.reality.userBean;

public class signUpDao {

	/**
	 * 添加用户信息
	 * */
	public int signUpuser(userBean user) throws IOException{
		DBAccess access=new DBAccess();
		SqlSession session=access.getSqlSession();
		int insertResult=session.insert("insertTojobMessage", user);
		session.commit();
		session.close();
		return insertResult;
	}
}
