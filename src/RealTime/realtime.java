package RealTime;

import java.text.SimpleDateFormat;
import java.util.Date;

public class realtime {
	
	public String nowtime() {
		
		SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy�� MM��dd�� HH��mm��ss��");
		
		Date time = new Date();
		
		String time2 = format2.format(time);
		
		return time2;
		
	}

}
