
import java.util.ArrayList;
import java.util.Date;
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
	public void TestInsertJobMessage(){
		jobMessage job=new jobMessage();
		job.setJname("餐馆服务员");  
		job.setCname("喜联私房菜");	
		job.setJtime(new Date());
		job.setJAddress("大学城淮阴工学院北门200米喜联私房菜");
		job.setJsalary("80元/天");
		job.setJlocal("清浦区");
		job.setJreleasetime(new Date());
		job.setDescription("平时的工作就是收拾桌子和传菜，工资日结");
		job.setContacts("李老板");
		job.setCtel("12345646");
		
		int result=mServie.insertJobMessage(job);
		System.out.println(result);
		
	}
	
	
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
