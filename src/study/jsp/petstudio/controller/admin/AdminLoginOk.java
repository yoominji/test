package study.jsp.petstudio.controller.admin;

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

@WebServlet("/admin/login_ok.do")
public class AdminLoginOk extends BaseController {
	private static final long serialVersionUID = 1L;
	
	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MemberService memberService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 확인 */
		// 로그인 중이라면 이 페이지를 동작시켜서는 안된다.
		if(web.getSession("adminLogin") != null) {
			// 이미 sqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/admin/main.do", "이미 관리자로 로그인 하셨습니다.");
			return null;
		}
		
		/** (4) 파라미터 처리 */
		String userId = web.getString("admin_id");
		String userPw = web.getString("admin_pw");
		
		logger.debug("userId=" + userId);
		logger.debug("userPw=" + userPw);
		
		if (userId == null || userPw == null) {
			sqlSession.close();
			web.redirect(null, "아이디나 비밀번호가 없습니다.");
			return null;
		}
		
		/** (5) 전달받은 파라미터를 Beans에 설정한다. */
		Member member = new Member();
		member.setUserId(userId);
		member.setUserPw(userPw);
		
		/** (6) Service를 통한 회원 인증 */
		Member loginInfo = null;
		try {
			// 아이디와 비밀번호가 일치하는 회원 정보를 조회하여 리턴한다.
			loginInfo = memberService.selectAdminLogin(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (7) 조회된 회원 정보를 세션에 저장 */
		// 로그인 처리는 아이디와 비밀번호를 기반으로 조회된 정보를
		// 세션에 보관하는 과정을 말한다.
		// 로그인에 대한 판별은 저장된 세션정보의 존재 여부로 판별한다.
		web.setSession("adminLogin", loginInfo);
		
		/** (8) 페이지 이동 */		
		sqlSession.close();
		web.redirect(web.getRootPath() + "/admin/main.do", "관리자로 로그인이 되었습니다.");
		
		return null;
	}

}
