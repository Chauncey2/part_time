import java.util.ArrayList;
import java.util.List;

import org.junit.Test;

import com.GuYongJun.reality.userBean;
import com.GuYongJun.service.MaintainService;;
public class testLogin {

	@Test
	public void getUserInfoTest(){
		try {
			MaintainService maintainService = new MaintainService();
			List<userBean> list1 = new ArrayList<userBean>();
			userBean list = new userBean();

			list1 = maintainService.getUserInfo();
			System.out.println(list1);
			list=maintainService.getUserInfoByAccount("123","123");
			System.out.println(list.toString());
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
}
