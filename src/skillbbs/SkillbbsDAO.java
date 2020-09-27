package skillbbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SkillbbsDAO {

	
	private Connection conn;

	private ResultSet rs;
	
	//������
	public SkillbbsDAO() {
		try {
			
			Class.forName("org.mariadb.jdbc.Driver");
			String dbURL ="jdbc:mariadb://localhost:3306/BBS?autoReconnect=true&amp;useSSL=false";
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
	
	//���� �ð��� �������� �Լ� (���� �ð� ����)
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //�����ͺ��̽� ����
	}
	
	
	public int getNext() {
		String SQL = "SELECT skillbbsID FROM SKILLBBS ORDER BY skillbbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) +1;
			}
			return 1; //ù��° �Խù��� ���
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	public int write(String skillbbsTitle, String userID, String skillbbsContent) {
		String SQL = "INSERT INTO SKILLBBS VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������
			
			//���⼭ �ϳ��� ���� �־��� �� �ֵ��� �Ѵ�.
			pstmt.setInt(1, getNext());
			pstmt.setString(2, skillbbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, skillbbsContent);
			pstmt.setInt(6, 1);
	
			return pstmt.executeUpdate(); //ù��° �Խù��� ���
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	public ArrayList<Skillbbs> getList(int pageNumber){
		
		//DESC LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		String SQL = "SELECT * FROM SKILLBBS WHERE skillbbsID < ? AND skillbbsAvailable = 1 ORDER BY skillbbsID DESC LIMIT 10";
		
		//skillbbs���� ���� �� �ִ� �ν��Ͻ��� �����ϴ� ArrayList���� 
		ArrayList<Skillbbs> list = new ArrayList<Skillbbs>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������
			
			//getNext�� �״������� �ۼ��� ���� ��ȣ�� �ǹ��Ѵ�. �̿Ͱ��� ǥ������ ������ �ۼ����� 5���� �Ѿ�� ���� ���� �������� �Ѿ�� �Ǵ� ������ �߻��ϰ� �ȴ�.
			pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Skillbbs skillbbs = new Skillbbs();
				
				//���� SQL�������� skillbbs�� ��� ��� �Ӽ��� �� ���� ���̱� ������ �Ʒ��� ���� �ۼ��Ǿ���. 
				//�Ʒ��� ���� Get���� �����͸� ���� �޾Ƽ� ���� skillbbs�� ����ִ°��̴�.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6)); 
				list.add(skillbbs);//����Ʈ�� �ش� �ν��Ͻ��� ��Ƽ� ��ȯ�Ѵ�
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
	
	// ������ ������ �̻� �����Ͱ� ���� �Ұ�� ���� �޼ҵ�
	public boolean nextPage(int pageNumber) {
		//DESC LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		String SQL = "SELECT * FROM SKILLBBS WHERE skillbbsID < ? AND skillbbsAvailable = 1 ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������
			
			//getNext�� �״������� �ۼ��� ���� ��ȣ�� �ǹ��Ѵ�. �̿Ͱ��� ǥ������ ������ �ۼ����� 5���� �Ѿ�� ���� ���� �������� �Ѿ�� �Ǵ� ������ �߻��ϰ� �ȴ�.
			pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
	
	//view�� �������� �Խñ��� �������� �Լ�
	public Skillbbs getSkillbbs(int skillbbsID) {
		//skillbbsID�� �ش��ϴ� �Խñ��� ��ȣ�� �־ �װ��� SQL�� ��� �״�� �������°��̴� 
		String SQL = "SELECT * FROM SKILLBBS WHERE skillbbsID = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������
			
			//getNext�� �״������� �ۼ��� ���� ��ȣ�� �ǹ��Ѵ�. �̿Ͱ��� ǥ������ ������ �ۼ����� 5���� �Ѿ�� ���� ���� �������� �Ѿ�� �Ǵ� ������ �߻��ϰ� �ȴ�.
			pstmt.setInt(1, skillbbsID);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				Skillbbs skillbbs = new Skillbbs();
				
				//�Ʒ��� ���� Get���� �����͸� ���� �޾Ƽ� ���� skillbbs�� ��� getSkillbbs�Լ��� ȣ���� ������� ��ȯ�� �ش�.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6)); 
				return skillbbs;
		
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
	//�Խù� ���� �Լ� 
	public int update(int skillbbsID, String skillbbsTitle, String skillbbsContent) {
		
		//Ư�� ���̵� �ش��ϴ� ����� ������ �ٲ��ְڴٴ� ����
		String SQL = "UPDATE SKILLBBS SET skillbbsTitle =?, skillbbsContent = ? WHERE skillbbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������
			

			pstmt.setString(1, skillbbsTitle);
			pstmt.setString(2, skillbbsContent);
			pstmt.setInt(3, skillbbsID);
	
			return pstmt.executeUpdate(); //ù��° �Խù��� ���
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	//�Խù� ���� �Լ�
	public int delete(int skillbbsID) {
		//Ư�� ���̵� �ش��ϴ� ����� ������ �ٲ��ְڴٴ� ����
		String SQL = "UPDATE SKILLBBS SET skillbbsAvailable = 0 WHERE skillbbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������
			pstmt.setInt(1, skillbbsID);

			return pstmt.executeUpdate(); 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	
	}
	
	
	
	
}
