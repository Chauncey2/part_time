import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.GuYongJun.reality.businessInfo;
import com.GuYongJun.service.MaintainService;

public class testBusinessInfo {

	MaintainService mainService=new MaintainService();
	
	
	@Test
	public void getBusinessInfo(){
		try {
			List<businessInfo> buList = new ArrayList<businessInfo>();
			businessInfo business=new businessInfo();
			business.setBaccount("123");
			business.setBpassword("123");
			buList = mainService.getBusinessInfo(business);
			System.out.println(buList);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Before
	public void init(){
		
	}
	@After
	public void destory(){
		
	}
}
