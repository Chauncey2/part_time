package com.GuYongJun.db;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/**
 * 获取配置文件连接数据库，创建sqlSession
 * */
public class DBAccess {
	public SqlSession getSqlSession() throws IOException{
		//通过配置文件获取数据库信息
		Reader reader=Resources.getResourceAsReader("com/GuYongJun/config/Configuration.xml");
		//通过获取的配置信息构建一个SqlSessionFactory
		SqlSessionFactory sqlSessionFactory=new SqlSessionFactoryBuilder().build(reader);
		//通过SqlSessionFactory创建一个sqlSession
		SqlSession sqlSession=sqlSessionFactory.openSession();
		return sqlSession;	
	}
}
