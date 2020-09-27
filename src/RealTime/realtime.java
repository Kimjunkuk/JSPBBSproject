package RealTime;

import java.text.SimpleDateFormat;
import java.util.Date;

public class realtime {
	
	public String nowtime() {
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월dd일 HH시mm분ss초");
		
		Date time = new Date();
		
		String time2 = format2.format(time);
		
		return time2;
		
	}

}
