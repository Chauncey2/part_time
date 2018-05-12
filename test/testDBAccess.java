import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.GuYongJun.Dao.signUpDao;
import com.GuYongJun.db.DBAccess;
import com.GuYongJun.reality.AdminInfo;
import com.GuYongJun.reality.userBean;


public class testDBAccess {
	private SqlSession sqlSession=null;
	
	@Before
	public void init(){
		 DBAccess dbaccess=new DBAccess();
		try {
			sqlSession=dbaccess.getSqlSession();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void testAccess() throws IOException{
		
		if(sqlSession==null){
			System.out.println("false");
		}else{
			System.out.println("true");
			List<userBean>list=new ArrayList<userBean>();
			list=sqlSession.selectList("queryUserInfo");
			for (userBean user : list) {
				System.out.println(user.toString());
			}
			System.out.println();
		}
		
	}

	@Test
	public void testAdminInfo(){
		
		try {
			if (sqlSession != null) {
				List<AdminInfo> list = new ArrayList<AdminInfo>();
				list = sqlSession.selectList("queryAdminInfo");
				for (AdminInfo user : list) {
					System.out.println(user.toString());
				}
			} 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	@Test
	public void testInsert(){
		signUpDao s=new signUpDao();
	try {				
			userBean user=new userBean();
			user.setAccount("1");
			user.setPassword("1122");
			user.setNickName("sdasd");
			user.setRealName("sds");
			user.setTel("2315646565");
			user.setEmail("1540433618@qq.com");
			user.setRegTime(null);
			user.setUsertype(1);
			int  result=s.signUpuser(user);
			System.err.println(result);
			//sqlSession.insert("insertUser", user);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
	}
	
	
	
	@After
	public void destorySession(){
		if(sqlSession!=null){
			sqlSession.close();
		}
	}
}
