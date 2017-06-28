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
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;
import study.jsp.petstudio.dao.MyBatisConnectionFactory;
import study.jsp.petstudio.model.Member;
import study.jsp.petstudio.service.MemberService;
import study.jsp.petstudio.service.impl.MemberServiceImpl;

@WebServlet("/member/join_ok.do")
public class JoinOk extends BaseController {
	private static final long serialVersionUID = 1L;
    
	/** (1) 사용하고자 하는 Helper + Service 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	UploadHelper upload;
	MemberService memberService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();
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
		String userId = web.getString("user_id");
		String userPw = web.getString("user_pw");
		String userPwRe = web.getString("user_pw_re");
		String name = web.getString("name");
		String tel = web.getString("tel");
		
		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("userId=" + userId);
		logger.debug("userPw=" + userPw);
		logger.debug("userPwRe=" + userPwRe);
		logger.debug("name=" + name);
		logger.debug("tel=" + tel);
		
		/** (5) 입력값의 유효성 검사 */
		// 아이디(이메일) 검사
		if(!regex.isValue(userId)) {
			sqlSession.close();
			web.redirect(null, "이메일을 입력하세요");
			return null;
		}
		
		if(!regex.isEmail(userId)) {
			sqlSession.close();
			web.redirect(null, "이메일의 형식이 잘못되었습니다.");
			return null;
		}
		
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
		
		// 비밀번호 확인
		if(!userPw.equals(userPwRe)) {
			sqlSession.close();
			web.redirect(null, "비밀번호 확인이 잘못되었습니다.");
			return null;
		}
		
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
		
		/** (7) 전달받은 파라미터를 Beans 객체에 담는다. */
		Member member = new Member();
		member.setUserId(userId);
		member.setUserPw(userPwRe);
		member.setName(name);
		member.setTel(tel);
		
		/** (8) Service를 통한 데이터베이스 저장 처리 */
		try {
			memberService.insertMember(member);
		} catch(Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}
		
		/** (9) 가입이 완료 되었스음로 로그인 페이지로 이동 */
		sqlSession.close();
		web.redirect(web.getRootPath() + "/member/login.do", "회원가입이 완료되었습니다. 로그인 화면으로 넘어갑니다.");
		
		return null;
	}

}
