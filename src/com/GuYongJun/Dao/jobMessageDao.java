package com.GuYongJun.Dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.GuYongJun.db.DBAccess;
import com.GuYongJun.reality.jobMessage;

public class jobMessageDao {

	private DBAccess dbaccess=new DBAccess();
	private SqlSession sqlSession=null;
	
	
	public List<jobMessage> getJobMessage(){
		
		List<jobMessage> jobMessageList=new ArrayList<jobMessage>();
		try {
			sqlSession=dbaccess.getSqlSession();
			jobMessage jmessage=new jobMessage();
			jobMessageList=sqlSession.selectList("queryJobMessage",jmessage);
			for (jobMessage jobMessage : jobMessageList) {
				System.out.println(jobMessage.toString());
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			sqlSession.close();
		}
		
		return jobMessageList;
	}


	//[start] 插入兼职信息
	public int postJobMessage(jobMessage job){
		int result=0;
		try {
			sqlSession=dbaccess.getSqlSession();
			//插入数据，返回影响的函数
			result=sqlSession.insert("postJobMessage",job);  
			//提交事务
			sqlSession.commit();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
			sqlSession.close();
		}
		
		return result;
	}
	
}
