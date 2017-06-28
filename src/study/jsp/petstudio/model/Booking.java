package study.jsp.petstudio.model;

public class Booking {
	private int id;
	private String userName;
	private String tel;
	private String depositName;
	private String depositDate;
	private String petName;
	private String petGender;
	private String petAge;
	private int admissionAdult;
	private int admissionChild;
	private int admissionPet;
	private String filmingDate;
	private String filmingTime;
	private String cameraRental;
	private String professionalFilming;
	private String questionContent;
	private String bookingStatus;
	private String regDate;
	private String editDate;
	private int memberId;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getDepositName() {
		return depositName;
	}
	public void setDepositName(String depositName) {
		this.depositName = depositName;
	}
	public String getDepositDate() {
		return depositDate;
	}
	public void setDepositDate(String depositDate) {
		this.depositDate = depositDate;
	}
	public String getPetName() {
		return petName;
	}
	public void setPetName(String petName) {
		this.petName = petName;
	}
	public String getPetGender() {
		return petGender;
	}
	public void setPetGender(String petGender) {
		this.petGender = petGender;
	}
	public String getPetAge() {
		return petAge;
	}
	public void setPetAge(String petAge) {
		this.petAge = petAge;
	}
	public int getAdmissionAdult() {
		return admissionAdult;
	}
	public void setAdmissionAdult(int admissionAdult) {
		this.admissionAdult = admissionAdult;
	}
	public int getAdmissionChild() {
		return admissionChild;
	}
	public void setAdmissionChild(int admissionChild) {
		this.admissionChild = admissionChild;
	}
	public int getAdmissionPet() {
		return admissionPet;
	}
	public void setAdmissionPet(int admissionPet) {
		this.admissionPet = admissionPet;
	}
	public String getFilmingDate() {
		return filmingDate;
	}
	public void setFilmingDate(String filmingDate) {
		this.filmingDate = filmingDate;
	}
	public String getFilmingTime() {
		return filmingTime;
	}
	public void setFilmingTime(String filmingTime) {
		this.filmingTime = filmingTime;
	}
	public String getCameraRental() {
		return cameraRental;
	}
	public void setCameraRental(String cameraRental) {
		this.cameraRental = cameraRental;
	}
	public String getProfessionalFilming() {
		return professionalFilming;
	}
	public void setProfessionalFilming(String professionalFilming) {
		this.professionalFilming = professionalFilming;
	}
	public String getQuestionContent() {
		return questionContent;
	}
	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}
	public String getBookingStatus() {
		return bookingStatus;
	}
	public void setBookingStatus(String bookingStatus) {
		this.bookingStatus = bookingStatus;
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
		return "Booking [id=" + id + ", userName=" + userName + ", tel=" + tel + ", depositName=" + depositName
				+ ", depositDate=" + depositDate + ", petName=" + petName + ", petGender=" + petGender + ", petAge="
				+ petAge + ", admissionAdult=" + admissionAdult + ", admissionChild=" + admissionChild
				+ ", admissionPet=" + admissionPet + ", filmingDate=" + filmingDate + ", filmingTime=" + filmingTime
				+ ", cameraRental=" + cameraRental + ", professionalFilming=" + professionalFilming
				+ ", questionContent=" + questionContent + ", bookingStatus=" + bookingStatus + ", regDate=" + regDate
				+ ", editDate=" + editDate + ", memberId=" + memberId + "]";
	}
	
	
}
