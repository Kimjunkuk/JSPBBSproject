package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FileDAO {
	//DAO(Database Access Object)
	
	private Connection conn;

	private ResultSet rs;
	
	//생성자
	public FileDAO() {
		try {
			
			Class.forName("org.mariadb.jdbc.Driver");
			String dbURL ="jdbc:mariadb://67.167.223.168:3306/FILE?autoReconnect=true&amp;useSSL=false";
			//?autoReconnect=true&amp;useSSL=false
			//?serverTimezone=Asia/Seoul&useSSL=false
			//?autoReconnect=true&amp;useSSL=false
			//DB에 중복값이 있을경우에도 해당 오류 발생되는것으로 판단됨
			String dbID = "root";
			String dbPassword = "Dosxmffj505@#";
			
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
	public int upload(String fileName, String fileRealName) {
		String SQL = "INSERT INTO FILE VALUES (?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL문장을 실행 준비단계로 설정함
			pstmt.setString(1, fileName);//첫번째 물음표에 들어갈 값
			pstmt.setString(2, fileRealName);//두번째 물음표에 들어갈 값
			return pstmt.executeUpdate(); //정상적으로 데이터가 반환되는경우 1의 값을 반환하여 정상적으로 진행됬음을 알림
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
