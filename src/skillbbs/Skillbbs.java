package skillbbs;

public class Skillbbs {
	
	private int skillbbsID;
	private String skillbbsTitle;
	private String userID;
	private String skillbbsDate;
	private String skillbbsContent;
	private int skillbbsAvailable;
	
	private String saveFileName;//09182020 �̹��� ���ε带 ���� DTO(Database Transfer Object)
	
	private int skillbbsCnt; //12022020 ��ȸ�� ������Ű�� ���� ���� 
	
	
	public int getSkillbbsID() {
		return skillbbsID;
	}
	public void setSkillbbsID(int skillbbsID) {
		this.skillbbsID = skillbbsID;
	}
	public String getSkillbbsTitle() {
		return skillbbsTitle;
	}
	public void setSkillbbsTitle(String skillbbsTitle) {
		this.skillbbsTitle = skillbbsTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getSkillbbsDate() {
		return skillbbsDate;
	}
	public void setSkillbbsDate(String skillbbsDate) {
		this.skillbbsDate = skillbbsDate;
	}
	public String getSkillbbsContent() {
		return skillbbsContent;
	}
	public void setSkillbbsContent(String skillbbsContent) {
		this.skillbbsContent = skillbbsContent;
	}
	public int getSkillbbsAvailable() {
		return skillbbsAvailable;
	}
	public void setSkillbbsAvailable(int skillbbsAvailable) {
		this.skillbbsAvailable = skillbbsAvailable;
	}
	public int getSkillbbsCnt() {
		return skillbbsCnt;
	}//12022020 ��ȸ�� ������Ű�� ���� getter
	public void setSkillbbsCnt(int skillbbsCnt) {
		this.skillbbsCnt = skillbbsCnt;
	}//12022020 ��ȸ�� ������Ű�� ���� setter
	
}
