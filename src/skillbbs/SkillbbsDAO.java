package skillbbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class SkillbbsDAO {

	
	private Connection conn;

	private ResultSet rs;
	
	//생성자
	public SkillbbsDAO() {
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
	
	//현제 시간을 가져오는 함수 (서버 시간 기준)
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL문장을 실행 준비단계로 설정함
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //데이터베이스 오류
	}
	
	
	public int getNext() {
		String SQL = "SELECT skillbbsID FROM SKILLBBS ORDER BY skillbbsID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL문장을 실행 준비단계로 설정함
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) +1;
			}
			return 1; //첫번째 게시물인 경우
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public int write(String skillbbsTitle, String userID, String skillbbsContent) {
		String SQL = "INSERT INTO SKILLBBS VALUES (?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL문장을 실행 준비단계로 설정함
			
			//여기서 하나씩 값을 넣어줄 수 있도록 한다.
			pstmt.setInt(1, getNext());
			pstmt.setString(2, skillbbsTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, skillbbsContent);
			pstmt.setInt(6, 1);
	
			return pstmt.executeUpdate(); //첫번째 게시물인 경우
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	public ArrayList<Skillbbs> getList(int pageNumber){
		
		//DESC LIMIT : 한페이지 노출 게시물 수 // skillbbsAvailable =1  삭제되지 않은 게시물만 노출 시킬것 
		String SQL = "SELECT * FROM SKILLBBS WHERE skillbbsID < ? AND skillbbsAvailable = 1 ORDER BY skillbbsID DESC LIMIT 10";
		
		//skillbbs에서 나올 수 있는 인스턴스를 보관하는 ArrayList생성 
		ArrayList<Skillbbs> list = new ArrayList<Skillbbs>();
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL문장을 실행 준비단계로 설정함
			
			//getNext는 그다음으로 작성될 글의 번호를 의미한다. 이와같이 표현하지 않으면 작성글이 5개가 넘어갈때 마다 다음 페이지로 넘어가게 되는 문제가 발생하게 된다.
			pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Skillbbs skillbbs = new Skillbbs();
				
				//위의 SQL쿼리에서 skillbbs에 담긴 모든 속성을 다 빼올 것이기 때문에 아래와 같이 작성되었다. 
				//아래와 같이 Get으로 데이터를 전부 받아서 위의 skillbbs에 담아주는것이다.
				skillbbs.setSkillbbsID(rs.getInt(1)); 
				skillbbs.setSkillbbsTitle(rs.getString(2)); 
				skillbbs.setUserID(rs.getString(3)); 
				skillbbs.setSkillbbsDate(rs.getString(4)); 
				skillbbs.setSkillbbsContent(rs.getString(5)); 
				skillbbs.setSkillbbsAvailable(rs.getInt(6)); 
				list.add(skillbbs);//리스트에 해당 인스턴스를 담아서 반환한다
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; // ArrayList 함수는 리스트를 리턴한다
	}
	
	
	// 지정된 페이지 이상 데이터가 존재 할경우 제어 메소드
	public boolean nextPage(int pageNumber) {
		//DESC LIMIT : 한페이지 노출 게시물 수 // skillbbsAvailable =1  삭제되지 않은 게시물만 노출 시킬것 
		String SQL = "SELECT * FROM SKILLBBS WHERE skillbbsID < ? AND skillbbsAvailable = 1 ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL문장을 실행 준비단계로 설정함
			
			//getNext는 그다음으로 작성될 글의 번호를 의미한다. 이와같이 표현하지 않으면 작성글이 5개가 넘어갈때 마다 다음 페이지로 넘어가게 되는 문제가 발생하게 된다.
			pstmt.setInt(1, getNext() - (pageNumber - 1 ) * 10);
			
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; // ArrayList 함수는 리스트를 리턴한다
	}
	
	
	//view를 눌렀을때 게시글을 가져오는 함수
	public Skillbbs getSkillbbs(int skillbbsID) {
		//skillbbsID에 해당하는 게시글의 번호를 넣어서 그값을 SQL에 담아 그대로 가져오는것이다 
		String SQL = "SELECT * FROM SKILLBBS WHERE skillbbsID = ? ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL문장을 실행 준비단계로 설정함
			
			//getNext는 그다음으로 작성될 글의 번호를 의미한다. 이와같이 표현하지 않으면 작성글이 5개가 넘어갈때 마다 다음 페이지로 넘어가게 되는 문제가 발생하게 된다.
			pstmt.setInt(1, skillbbsID);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				
				Skillbbs skillbbs = new Skillbbs();
				
				//아래와 같이 Get으로 데이터를 전부 받아서 위의 skillbbs에 담아 getSkillbbs함수를 호출한 대상한테 반환해 준다.
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
		return null; // ArrayList 함수는 리스트를 리턴한다
	}
	
	//게시물 수정 함수 
	public int update(int skillbbsID, String skillbbsTitle, String skillbbsContent) {
		
		//특정 아이디에 해당하는 제목과 내용을 바꿔주겠다는 내용
		String SQL = "UPDATE SKILLBBS SET skillbbsTitle =?, skillbbsContent = ? WHERE skillbbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL문장을 실행 준비단계로 설정함
			

			pstmt.setString(1, skillbbsTitle);
			pstmt.setString(2, skillbbsContent);
			pstmt.setInt(3, skillbbsID);
	
			return pstmt.executeUpdate(); //첫번째 게시물인 경우
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	}
	
	//게시물 삭제 함수
	public int delete(int skillbbsID) {
		//특정 아이디에 해당하는 제목과 내용을 바꿔주겠다는 내용
		String SQL = "UPDATE SKILLBBS SET skillbbsAvailable = 0 WHERE skillbbsID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL); //SQL문장을 실행 준비단계로 설정함
			pstmt.setInt(1, skillbbsID);

			return pstmt.executeUpdate(); 
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //데이터베이스 오류
	
	}
	
	
	
	
}
