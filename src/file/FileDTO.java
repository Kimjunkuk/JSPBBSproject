package file;

public class FileDTO {
	//DTO(Database Transfer Object)
	
	String fileName;
	String fileRealName;
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileRealName() {
		return fileRealName;
	}
	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}
	
	//������ : ���������� �ڵ����� �ʱ�ȭ�������� ������
	public FileDTO(String fileName, String fileRealName) {
		super();
		this.fileName = fileName;
		this.fileRealName = fileRealName;
	}
	

}
