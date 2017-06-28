package study.jsp.petstudio.model;

public class BbsDocument {
	private int id;
	private String bbsType;
	private String subject;
	private String category;
	private String writer;
	private String content;
	private int hit;
	private String regDate;
	private String editDate;
	private int memberId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getBbsType() {
		return bbsType;
	}
	public void setBbsType(String bbsType) {
		this.bbsType = bbsType;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getEditDate() {
		return editDate;
	}
	public void setEditDate(String editDate) {
		this.editDate = editDate;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	
	@Override
	public String toString() {
		return "BbsDocument [id=" + id + ", bbsType=" + bbsType + ", subject=" + subject + ", category=" + category
				+ ", writer=" + writer + ", content=" + content + ", hit=" + hit + ", regDate=" + regDate
				+ ", editDate=" + editDate + ", memberId=" + memberId + "]";
	}
	
	
	
}
