package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	
	//생성자
	public UserDAO() {
		try {
			//67.167.223.168
			String dbURL ="jdbc:mysql://localhost:3306/BBS?autoReconnect=true&amp;useSSL=false";
			String dbID = "root";
			String dbPassword = "dosxmffj505@";
			Class.forName("com.mysql.jdbc.Driver");
			
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
