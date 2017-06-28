package study.jsp.petstudio.model;

public class BbsComment {
	private int id;
	private String writer;
	private String comment;
	private String regDate;
	private String editDate;
	private int memberId;
	private int bbsDocumentId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
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
	public int getBbsDocumentId() {
		return bbsDocumentId;
	}
	public void setBbsDocumentId(int bbsDocumentId) {
		this.bbsDocumentId = bbsDocumentId;
	}
	
	@Override
	public String toString() {
		return "BbsComment [id=" + id + ", writer=" + writer + ", comment=" + comment + ", regDate=" + regDate
				+ ", editDate=" + editDate + ", memberId=" + memberId + ", bbsDocumentId=" + bbsDocumentId + "]";
	}
	
	
	
}
