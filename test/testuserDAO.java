import java.util.List;

import org.junit.Test;

import com.GuYongJun.Dao.userInfoDao;
import com.GuYongJun.reality.userBean;

public class testuserDAO {

	@Test
	public void testQueryList(){
		userInfoDao userInfoDAO=new userInfoDao();
		
		List<userBean> list= userInfoDAO.getUserInfo();
		for (userBean user : list) {
			System.out.println(user.getId());
		}
	}
}
