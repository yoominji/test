package study.jsp.petstudio.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;
import study.jsp.petstudio.dao.MyBatisConnectionFactory;
import study.jsp.petstudio.model.Member;
import study.jsp.petstudio.service.MemberService;
import study.jsp.petstudio.service.impl.MemberServiceImpl;


@WebServlet("/member/check_pw.do")
public class CheckPw extends BaseController {
	private static final long serialVersionUID = 1L;
	
	/* (1) 사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/* (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(sqlSession, logger);
		

		/* (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 탈퇴할 수 없다.
		if(web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		
		/* (4) 파라미터 받기 */
		String userPw = web.getString("user_pw");
		logger.debug("userPw=" + userPw);
		
		if(userPw == null) {
			sqlSession.close();
			web.redirect(null, "비밀번호를 입력하세요.");
			return null;
		}
		
		/* (5) 서비스에 전달하기 위하여 파라미터를 Beans로 묶는다. */
		// 회원번호는 세션을 통해서 획득한 로그인 정보에서 취득
		Member loginInfo = (Member) web.getSession("loginInfo");
		Member member = new Member();
		member.setId(loginInfo.getId());
		member.setUserPw(userPw);
		
		/* (6) Service를 통한 탈퇴 시도 */
		try {
			// 비밀번호 검사 -> 비밀번호가 잘못된 경우 예외발생
			memberService.selectMemberPasswordCount(member);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		// 비밀번호 확인 후 수정, 비밀번호 변경, 탈퇴로 넘어감 
		String page = web.getString("page");
		String alert = " ";
		switch (page){
			case "edit":
			page = "/member/edit.do";
			alert = "수정";
			break;
			
			case "editpw":
			page = "/member/edit_pw.do";
			alert = "비밀번호 변경";
			break;
			
			case "out":
			page = "/member/out.do";
			alert = "탈퇴 신청";
			break;
		}
		web.redirect(web.getRootPath() + page, alert + "페이지로 이동합니다.");
		
		return null;
	}

}
