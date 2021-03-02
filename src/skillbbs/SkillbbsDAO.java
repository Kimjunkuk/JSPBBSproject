package skillbbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SkillbbsDAO {

	
	private Connection conn;

	private ResultSet rs;
	
	public SkillbbsDAO() {
		try {
			
			Class.forName("org.mariadb.jdbc.Driver");
			String dbURL ="jdbc:mariadb://67.167.223.168:3306/bbs?autoReconnect=true&amp;useSSL=false";
			String dbID = "root";
			String dbPassword = "Dosxmffj505@#";
			
			
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e){
			e.printStackTrace();
		}
	}
	
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
		String SQL = "SELECT skillbbsID FROM skillbbs ORDER BY skillbbsID DESC";
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
		String SQL = "INSERT INTO skillbbs VALUES (?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������
			
			//���⼭ �ϳ��� ���� �־��� �� �ֵ��� �Ѵ�.
			pstmt.setInt(1, getNext());
			pstmt.setString(2, skillbbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, skillbbsContent);
			pstmt.setInt(6, 1);
			pstmt.setInt(7, 0);
	
			return pstmt.executeUpdate(); //ù��° �Խù��� ���
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	//skillbbsID ���� �������� ���� �Լ�(���� : DESC)
	public ArrayList<Skillbbs> getList(int pageNumber){
		
		//DESC LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		String SQL = "SELECT * FROM skillbbs WHERE skillbbsID < ? AND skillbbsAvailable = 1 ORDER BY skillbbsID DESC LIMIT 10";
		
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
				//�Ʒ��� ���� Get���� �����͸� ���� �޾Ƽ� ���� skillbbs�� �����ϴ� ������ ����ִ°��̴�.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6));
				skillbbs.setSkillbbsCnt(rs.getInt(7)); 
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
		String SQL = "SELECT * FROM skillbbs WHERE skillbbsID < ? AND skillbbsAvailable = 1 ";
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
	
	
	// �� ���ڵ��� ���� ���ϱ� ���� �Լ� 
	public int getCount(int pageNumber) {
		//DESC:���� ���� ����  LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		int count=0;
		String SQL = "SELECT count(*) FROM skillbbs WHERE skillbbsAvailable = 1 ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������
			
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
	
	//view�� �������� �Խñ��� �������� �Լ�
	public Skillbbs getSkillbbs(int skillbbsID) {
		//skillbbsID�� �ش��ϴ� �Խñ��� ��ȣ�� �־ �װ��� SQL�� ��� �״�� �������°��̴� 
		String SQL = "SELECT * FROM skillbbs WHERE skillbbsID = ? ";
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
				skillbbs.setSkillbbsCnt(rs.getInt(7)); 
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
		String SQL = "UPDATE skillbbs SET skillbbsTitle =?, skillbbsContent = ? WHERE skillbbsID = ?";
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
		String SQL = "UPDATE skillbbs SET skillbbsAvailable = 0 WHERE skillbbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������
			pstmt.setInt(1, skillbbsID);

			return pstmt.executeUpdate(); 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	
	}
	
	//��ȸ�� ���� �Լ�
	public int updateBoardCnt(int skillbbsID) {
		//Ư�� ���̵� �ش��ϴ� ��ȸ���� 1���� ��Ű�ڴٴ� ����
		String SQL = "UPDATE skillbbs SET skillbbsCnt = skillbbsCnt+1 WHERE skillbbsID=?";

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������

			pstmt.setInt(1, skillbbsID);

			return pstmt.executeUpdate(); 
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	
	//skillbbsID ���� ���� ���� ���� �Լ� (����:ASC)
	public ArrayList<Skillbbs> downgetList(int pageNumber){
		
		// LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		String SQL = "SELECT * FROM skillbbs WHERE skillbbsID < ? AND skillbbsAvailable = 1 ORDER BY skillbbsID ASC LIMIT 10";
		
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
				//�Ʒ��� ���� Get���� �����͸� ���� �޾Ƽ� ���� skillbbs�� �����ϴ� ������ ����ִ°��̴�.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6));
				skillbbs.setSkillbbsCnt(rs.getInt(7)); 
				list.add(skillbbs);//����Ʈ�� �ش� �ν��Ͻ��� ��Ƽ� ��ȯ�Ѵ�
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
	//skillbbsTitle ���� ���� ���� ���� �Լ� (����:DESC)
	public ArrayList<Skillbbs> upSkillbbstitle(int pageNumber){
		
		// LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		String SQL = "SELECT * FROM skillbbs WHERE skillbbsID < ? AND skillbbsAvailable = 1 ORDER BY skillbbsTitle DESC LIMIT 10";
		
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
				//�Ʒ��� ���� Get���� �����͸� ���� �޾Ƽ� ���� skillbbs�� �����ϴ� ������ ����ִ°��̴�.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6));
				skillbbs.setSkillbbsCnt(rs.getInt(7)); 
				list.add(skillbbs);//����Ʈ�� �ش� �ν��Ͻ��� ��Ƽ� ��ȯ�Ѵ�
			}

			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
	//skillbbsTitle ���� ���� ���� ���� �Լ� (����:ASC)
	public ArrayList<Skillbbs> downSkillbbstitle(int pageNumber){
		
		// LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		String SQL = "SELECT * FROM skillbbs WHERE skillbbsID < ? AND skillbbsAvailable = 1 ORDER BY skillbbsTitle ASC LIMIT 10";
		
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
				//�Ʒ��� ���� Get���� �����͸� ���� �޾Ƽ� ���� skillbbs�� �����ϴ� ������ ����ִ°��̴�.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6));
				skillbbs.setSkillbbsCnt(rs.getInt(7)); 
				list.add(skillbbs);//����Ʈ�� �ش� �ν��Ͻ��� ��Ƽ� ��ȯ�Ѵ�
			}

			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
	//userID ���� ���� ���� ���� �Լ� (����:ASC)
	public ArrayList<Skillbbs> upuserID(int pageNumber){
		
		// LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		String SQL = "SELECT * FROM skillbbs WHERE skillbbsID < ? AND skillbbsAvailable = 1 ORDER BY userID ASC LIMIT 10";
		
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
				//�Ʒ��� ���� Get���� �����͸� ���� �޾Ƽ� ���� skillbbs�� �����ϴ� ������ ����ִ°��̴�.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6));
				skillbbs.setSkillbbsCnt(rs.getInt(7)); 
				list.add(skillbbs);//����Ʈ�� �ش� �ν��Ͻ��� ��Ƽ� ��ȯ�Ѵ�
			}

			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
	//userID ���� ���� ���� ���� �Լ� (����:DESC)
	public ArrayList<Skillbbs> downuserID(int pageNumber){
		
		// LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		String SQL = "SELECT * FROM skillbbs WHERE skillbbsID < ? AND skillbbsAvailable = 1 ORDER BY userID DESC LIMIT 10";
		
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
				//�Ʒ��� ���� Get���� �����͸� ���� �޾Ƽ� ���� skillbbs�� �����ϴ� ������ ����ִ°��̴�.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6));
				skillbbs.setSkillbbsCnt(rs.getInt(7)); 
				list.add(skillbbs);//����Ʈ�� �ش� �ν��Ͻ��� ��Ƽ� ��ȯ�Ѵ�
			}

			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
	//skillbbsDate ���� ���� ���� ���� �Լ� (����:ASC)
	public ArrayList<Skillbbs> upskillbbsDate(int pageNumber){
		
		// LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		String SQL = "SELECT * FROM skillbbs WHERE skillbbsID < ? AND skillbbsAvailable = 1 ORDER BY skillbbsDate ASC LIMIT 10";
		
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
				//�Ʒ��� ���� Get���� �����͸� ���� �޾Ƽ� ���� skillbbs�� �����ϴ� ������ ����ִ°��̴�.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6));
				skillbbs.setSkillbbsCnt(rs.getInt(7)); 
				list.add(skillbbs);//����Ʈ�� �ش� �ν��Ͻ��� ��Ƽ� ��ȯ�Ѵ�
			}

			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
	//skillbbsDate ���� ���� ���� ���� �Լ� (����:DESC)
	public ArrayList<Skillbbs> downskillbbsDate(int pageNumber){
		
		// LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		String SQL = "SELECT * FROM skillbbs WHERE skillbbsID < ? AND skillbbsAvailable = 1 ORDER BY skillbbsDate DESC LIMIT 10";
		
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
				//�Ʒ��� ���� Get���� �����͸� ���� �޾Ƽ� ���� skillbbs�� �����ϴ� ������ ����ִ°��̴�.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6));
				skillbbs.setSkillbbsCnt(rs.getInt(7)); 
				list.add(skillbbs);//����Ʈ�� �ش� �ν��Ͻ��� ��Ƽ� ��ȯ�Ѵ�
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
	//skillbbsCnt ���� ���� ���� ���� �Լ� (����:ASC)
	public ArrayList<Skillbbs> upskillbbsCnt(int pageNumber){
		
		// LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		String SQL = "SELECT * FROM skillbbs WHERE skillbbsID < ? AND skillbbsAvailable = 1 ORDER BY skillbbsCnt ASC LIMIT 10";
		
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
				//�Ʒ��� ���� Get���� �����͸� ���� �޾Ƽ� ���� skillbbs�� �����ϴ� ������ ����ִ°��̴�.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6));
				skillbbs.setSkillbbsCnt(rs.getInt(7)); 
				list.add(skillbbs);//����Ʈ�� �ش� �ν��Ͻ��� ��Ƽ� ��ȯ�Ѵ�
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
	//skillbbsDate ���� ���� ���� ���� �Լ� (����:DESC)
	public ArrayList<Skillbbs> downskillbbsCnt(int pageNumber){
		
		// LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		String SQL = "SELECT * FROM skillbbs WHERE skillbbsID < ? AND skillbbsAvailable = 1 ORDER BY skillbbsCnt DESC LIMIT 10";
		
		
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
				//�Ʒ��� ���� Get���� �����͸� ���� �޾Ƽ� ���� skillbbs�� �����ϴ� ������ ����ִ°��̴�.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6));
				skillbbs.setSkillbbsCnt(rs.getInt(7)); 
				list.add(skillbbs);//����Ʈ�� �ش� �ν��Ͻ��� ��Ƽ� ��ȯ�Ѵ�
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
	//skillbbsDate ���� ���� ���� ���� �Լ� (����:DESC)
	public ArrayList<Skillbbs> searchresultlist(int pageNumber, String strType, String strString){

		// LIMIT : �������� ���� �Խù� �� // skillbbsAvailable =1  �������� ���� �Խù��� ���� ��ų�� 
		String SQL = "SELECT * FROM skillbbs WHERE skillbbsID < ? AND skillbbsAvailable = 1 AND "+strType+" like ?";
		//SELECT * FROM SKILLBBS WHERE skillbbsTitle AND skillbbsAvailable = 1 ORDER BY skillbbsID DESC like '%" + text + "%'  skillbbsID < ? AND skillbbsAvailable = 1

		//skillbbs���� ���� �� �ִ� �ν��Ͻ��� �����ϴ� ArrayList���� 
		ArrayList<Skillbbs> list = new ArrayList<Skillbbs>();

		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL������ ���� �غ�ܰ�� ������
			
			//getNext�� �״������� �ۼ��� ���� ��ȣ�� �ǹ��Ѵ�. �̿Ͱ��� ǥ������ ������ �ۼ����� 5���� �Ѿ�� ���� ���� �������� �Ѿ�� �Ǵ� ������ �߻��ϰ� �ȴ�.
			pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
			pstmt.setString(2, "%"+strString+"%");
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Skillbbs skillbbs = new Skillbbs();
				
				//���� SQL�������� skillbbs�� ��� ��� �Ӽ��� �� ���� ���̱� ������ �Ʒ��� ���� �ۼ��Ǿ���. 
				//�Ʒ��� ���� Get���� �����͸� ���� �޾Ƽ� ���� skillbbs�� �����ϴ� ������ ����ִ°��̴�.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6));
				skillbbs.setSkillbbsCnt(rs.getInt(7)); 
				list.add(skillbbs);//����Ʈ�� �ش� �ν��Ͻ��� ��Ƽ� ��ȯ�Ѵ�
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ArrayList �Լ��� ����Ʈ�� �����Ѵ�
	}
	
}
