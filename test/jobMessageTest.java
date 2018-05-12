import java.util.ArrayList;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import com.GuYongJun.reality.jobMessage;
import com.GuYongJun.service.MaintainService;

public class jobMessageTest {

	private MaintainService mServie=null;
	private List<jobMessage> messageList=null;
	@Test
	public void TestjobMessage(){
		
		try {
			messageList = mServie.getJobMessage();
			for (jobMessage jobMessage : messageList) {
				System.out.println(jobMessage.toString());
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	
	@Before
	public void init(){
		mServie=new MaintainService();
		messageList=new ArrayList<jobMessage>();
	}
	@After
	public void destory(){
		messageList.clear();
	}
}
