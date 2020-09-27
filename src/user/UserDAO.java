package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	
	//09272020_private Connection conn;
	//09272020_private PreparedStatement pstmt;
	//09272020_private ResultSet rs;
    //String driver = "org.mariadb.jdbc.Driver";
    Connection conn;
    PreparedStatement pstmt;
    ResultSet rs;
	
//	//생성자
//	public UserDAO() {
//		try {
//			//67.167.223.168
//			//Class.forName("org.mariadb.jdbc.Driver");
//			Class.forName(driver);
//			conn = DriverManager.getConnection(
//					"jdbc:mariadb://localhost:3306/BBS",
//					"mason",
//					"Dosxmffj505@#"
//					);
//			//String dbURL ="jdbc:mariadb://localhost:3336/BBS";
//			//?autoReconnect=true&amp;useSSL=false
//			//String dbID = "root";
//			//String dbPassword = "Dosxmffj505@#";
//			
//			
//			//conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
//		} catch (ClassNotFoundException e){
//			System.out.println("드라이버 로드 실패");
//			e.printStackTrace();
//		} catch (SQLException e) {
//			System.out.println("DB 접속실패");
//			e.printStackTrace();
//		}
//		

	 
	public UserDAO() {
		try {
			
			Class.forName("org.mariadb.jdbc.Driver");
			String dbURL ="jdbc:mariadb://localhost:3306/BBS?autoReconnect=true&amp;useSSL=false";
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
	

	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM USER WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //로그인 성공
				}
				else
					return 0; //비밀번호 불일치
			}
			return -1; //아이디 없음
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //데이터 베이스 오류 오후
	}
	
	//User클래스를 이용하여 만들어질 수 있는 하나의 인스턴스 
	public int join(User user) {
		String SQL = "INSERT INTO USER VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  user.getUserID());
			pstmt.setString(2,  user.getUserPassword());
			pstmt.setString(3,  user.getUserName());
			pstmt.setString(4,  user.getUserGender());
			pstmt.setString(5,  user.getUserEmail());
			return pstmt.executeUpdate(); //해당 statement를 실행한 결과를 넣을 수 있도록 지정
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //Database Error
	}
}
