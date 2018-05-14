package com.GuYongJun.Dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.GuYongJun.db.DBAccess;
import com.GuYongJun.reality.businessInfo;

public class businessInfoDao {

	private DBAccess DBaccess=new DBAccess();
	private SqlSession sqlSession=null;
	
	public List<businessInfo> getBusinessInfoByAccount(businessInfo bussiness) throws IOException{
		
		sqlSession=DBaccess.getSqlSession();
		List<businessInfo> buList=new ArrayList<businessInfo>();
		buList=sqlSession.selectList("queryBusinessUserInfo",bussiness);
		
		sqlSession.close();
		
		return buList;
	}
	
	public List<businessInfo> getBusinessInfo() throws IOException{
		
		sqlSession=DBaccess.getSqlSession();
		List<businessInfo> buList=new ArrayList<businessInfo>();
		buList=sqlSession.selectList("queryBusinessUserInfo");
		
		sqlSession.close();
		
		return buList;
	}
	
}
