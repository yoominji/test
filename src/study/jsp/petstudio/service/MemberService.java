package study.jsp.petstudio.service;

import study.jsp.petstudio.model.Member;

/** 회원 관련 기능을 제공하기 위한 Service 계층 */
public interface MemberService {
	
	/** 아이디 중복검사
	 * @param member -  아이디
	 * @throws Exception - 중복된 데이터인 경우 예외 발생함
	*/
	public void selectUserIdCount(Member member) throws Exception;
	
	/**
	 * 회원가입(아이디, 이메일 중복검사 후 가입처리)
	 * @param	member	- 일련번호, 가입일시, 변경일시를 제외한 모든 정보
	 * @throws Exception
	 */
	public void insertMember(Member member) throws Exception;
	
	/**
	 * 로그인
	 * @param member - 아이디, 비밀번호
	 * @return 회원정보
	 * @throws Exception
	 * */
	public Member selectLoginInfo(Member member) throws Exception;
	
	/**
	 * 일련번호에 의한 회원정보 조회
	 * @param member
	 * @throws Exception
	 * */
	public Member selectMember(Member member) throws Exception;
	
	/**
	 * 비밀번호 검사
	 * @param member
	 * @throws Exception
	 * */
	public void selectMemberPasswordCount(Member member) throws Exception;
	
	/**
	 * 회원정보 수정 : 연락처
	 * @param member
	 * @throws Exception
	 * */
	public void updateMember(Member member) throws Exception;
	
	/**
	 * 회원정보 수정 : 비밀번호
	 * @param member
	 * @throws Exception
	 * */
	public void updateMemberPw (Member member) throws Exception;
	
	/**
	 * 회원정보 수정 : 탈퇴신청 member_out : 'Y'
	 * @param member
	 * @throws Exception
	 * */
	public void updateMemberOut (Member member) throws Exception;
	
	/**
	 * 비밀번호 변경
	 * @param member - 이메일주소, 비밀번호
	 * @throws Exception
	 */
	public void updateMemberPasswordByEmail(Member member) throws Exception;
	
	/**
	 * 아이디 찾기
	 * @param member
	 * @throws Exception
	 * */
	public Member selectFindId(Member member) throws Exception;
	
	/**
	 * 관리자 로그인
	 * @param member - 아이디, 비밀번호
	 * @return 관리자정보
	 * @throws Exception
	 * */
	public Member selectAdminLogin(Member member) throws Exception;

}
