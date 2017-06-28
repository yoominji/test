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

@WebServlet("/member/find_id_ok.do")
public class FindIdOk extends BaseController {
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
		// 로그인 중이라면 이 페이지를 동작시켜서는 안된다.
		if(web.getSession("loginInfo") != null) {
			// 이미 sqlSession 객체를 생성했으므로, 데이터베이스 접속을 해제해야 한다.
			sqlSession.close();
			web.redirect(web.getRootPath() + "/main.do", "이미 로그인 하셨습니다.");
			return null;
		}
		/** (4) 파일이 포함된 POST 파라미터 받기 */
		String name = web.getString("name");
		String tel = web.getString("tel");
		
		logger.debug("name=" + name);
		logger.debug("tel=" + tel);
		
		/** (5) 입력값의 유효성 검사 */
		// 이름 검사
		if(!regex.isValue(name)) {
			sqlSession.close();
			web.redirect(null, "이름을 입력하세요");
			return null;
		}
		
		if(!regex.isKor(name)) {
			sqlSession.close();
			web.redirect(null, "이름은 한글만 입력 가능합니다.");
			return null;
		}
		
		if(name.length() < 2 || name.length() > 5) {
			sqlSession.close();
			web.redirect(null, "이름은 2~5글자 까지만 가능합니다.");
			return null;
		}
		
		// 연락처 검사
		if(!regex.isValue(tel)) {
			sqlSession.close();
			web.redirect(null, "연락처를 입력하세요");
			return null;
		}
		
		if(!regex.isCellPhone(tel) && !regex.isTel(tel)) {
			sqlSession.close();
			web.redirect(null, "연락처의 형식이 잘못되었습니다.");
			return null;
		}
		
		/** (6) 전달받은 파라미터를 Beans 객체에 담는다. */
		Member member = new Member();
		member.setName(name);
		member.setTel(tel);
		
		/** (7) Service를 통한 데이터베이스 저장 처리 */
		Member IdInfo = null;
		try {
			// 이름과 전화번호가 일치하는 회원 정보를 조회하여 리턴한다.
			IdInfo = memberService.selectFindId(member);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** (8) 조회된 회원 정보를 세션에 저장 */
		web.setSession("IdInfo", IdInfo);
		
		sqlSession.close();
		web.redirect(web.getRootPath() + "/member/find_id_true.do", "페이지로 넘어갑니다.");
		
		
		return null;
	}

}
