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
	
//	//������
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
//			System.out.println("����̹� �ε� ����");
//			e.printStackTrace();
//		} catch (SQLException e) {
//			System.out.println("DB ���ӽ���");
//			e.printStackTrace();
//		}
//		

	 
	public UserDAO() {
		try {
			
			Class.forName("org.mariadb.jdbc.Driver");
			String dbURL ="jdbc:mariadb://67.167.223.168:3306/bbs?autoReconnect=true&amp;useSSL=false";
			//?autoReconnect=true&amp;useSSL=false
			//?serverTimezone=Asia/Seoul&useSSL=false
			//?autoReconnect=true&amp;useSSL=false
			//DB�� �ߺ����� ������쿡�� �ش� ���� �߻��Ǵ°����� �Ǵܵ�
			String dbID = "root";
			String dbPassword = "Dosxmffj505@#";
			
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	

	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword FROM user WHERE userID = ?";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1; //�α��� ����
				}
				else
					return 0; //��й�ȣ ����ġ
			}
			return -1; //���̵� ����
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2; //������ ���̽� ����
	}
	
	//UserŬ������ �̿��Ͽ� ������� �� �ִ� �ϳ��� �ν��Ͻ� 
	public int join(User user) {
		String SQL = "INSERT INTO user VALUES (?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  user.getUserID());
			pstmt.setString(2,  user.getUserPassword());
			pstmt.setString(3,  user.getUserName());
			pstmt.setString(4,  user.getUserGender());
			pstmt.setString(5,  user.getUserEmail());
			return pstmt.executeUpdate(); //�ش� statement�� ������ ����� ���� �� �ֵ��� ����
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //Database Error
	}
}
