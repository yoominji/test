package study.jsp.petstudio.model;

public class Member {
	private int id;
	private String memberType;
	private String userId;
	private String userPw;
	private String name;
	private String tel;
	private String regDate;
	private String editDate;
	private String memberOut;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMemberType() {
		return memberType;
	}
	public void setMemberType(String memberType) {
		this.memberType = memberType;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
	public String getMemberOut() {
		return memberOut;
	}
	public void setMemberOut(String memberOut) {
		this.memberOut = memberOut;
	}
	@Override
	public String toString() {
		return "Member [id=" + id + ", memberType=" + memberType + ", userId=" + userId + ", userPw=" + userPw
				+ ", name=" + name + ", tel=" + tel + ", regDate=" + regDate + ", editDate=" + editDate + ", memberOut="
				+ memberOut + "]";
	}	
}