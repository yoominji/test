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
import study.jsp.helper.RegexHelper;
import study.jsp.helper.WebHelper;
import study.jsp.petstudio.dao.MyBatisConnectionFactory;
import study.jsp.petstudio.model.Member;
import study.jsp.petstudio.service.MemberService;
import study.jsp.petstudio.service.impl.MemberServiceImpl;


@WebServlet("/member/out_ok.do")
public class OutOk extends BaseController {
	private static final long serialVersionUID = 1L;
       
	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 수정할 수 없다.
		Member loginInfo = (Member) web.getSession("loginInfo");
		if(loginInfo == null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		/** (4) 파일이 포함된 POST 파라미터 받기 */
		String userPw = web.getString("user_pw");
		
		logger.debug("userPw=" + userPw);
		
		
		if(!regex.isValue(userPw)) {
			sqlSession.close();
			web.redirect(null, "비밀번호를 입력하세요");
			return null;
		}
		
		if(!regex.isEngNum(userPw)) {
			sqlSession.close();
			web.redirect(null, "비밀번호는 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}
		
		if(userPw.length() < 8 || userPw.length() > 20) {
			sqlSession.close();
			web.redirect(null, "비밀번호 숫자와 영문의 조합으로 20자까지만 가능합니다.");
			return null;
		}
		/** (5) 전달받은 파라미터를 Beans 객체에 담는다. */
		Member member = new Member();
		member.setId(loginInfo.getId());
		member.setUserPw(userPw);
		
		/** (6) Service를 통한 데이터베이스 저장 처리 */
		// 변경된 정보를 저장하기 위한 객체
		Member editInfo = null;
		try {
			memberService.updateMemberOut(member);
			editInfo = memberService.selectMember(member);
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		// 세션을 갱신한다.
		web.removeSession("loginInfo");
		web.setSession("loginInfo", editInfo);
		
		/** (7) 탈퇴신청이 완료되엇으므로 메인페이지로 이동한다. */
		web.removeAllSession();
		web.redirect(web.getRootPath() + "/main.do", "탈퇴 신청이 완료되었습니다.");
		return null;
		
	}

}
