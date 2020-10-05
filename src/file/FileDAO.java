package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FileDAO {
	//DAO(Database Access Object)
	
	private Connection conn;

	private ResultSet rs;
	
	//������
	public FileDAO() {
		try {
			
			Class.forName("org.mariadb.jdbc.Driver");
			String dbURL ="jdbc:mariadb://67.167.223.168:3306/FILE?autoReconnect=true&amp;useSSL=false";
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
	
	public int upload(String fileName, String fileRealName) {
		String SQL = "INSERT INTO FILE VALUES (?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������
			pstmt.setString(1, fileName);//ù��° ����ǥ�� �� ��
			pstmt.setString(2, fileRealName);//�ι�° ����ǥ�� �� ��
			return pstmt.executeUpdate(); //���������� �����Ͱ� ��ȯ�Ǵ°�� 1�� ���� ��ȯ�Ͽ� ���������� ���������� �˸�
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}

}
