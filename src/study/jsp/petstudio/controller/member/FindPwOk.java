package study.jsp.petstudio.controller.member;

import java.io.IOException;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.helper.BaseController;
import study.jsp.helper.MailHelper;
import study.jsp.helper.Util;
import study.jsp.helper.WebHelper;
import study.jsp.petstudio.dao.MyBatisConnectionFactory;
import study.jsp.petstudio.model.Member;
import study.jsp.petstudio.service.MemberService;
import study.jsp.petstudio.service.impl.MemberServiceImpl;

@WebServlet("/member/find_pw_ok.do")
public class FindPwOk extends BaseController {
	private static final long serialVersionUID = 1L;
       
	/** (1) 사용하고자 하는 Helper 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	MailHelper mail;
	Util util;
	MemberService memberService;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		mail = MailHelper.getInstance();
		util = Util.getInstance();
		memberService = new MemberServiceImpl(sqlSession, logger);
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 이용할 수 없다.
		if (web.getSession("loginInfo") != null) {
			sqlSession.close();
			web.redirect(web.getRootPath() + "/main.do", "이미 로그인 중입니다.");
			return null;
		}
		
		/** (4) 파라미터 처리 */
		String userId = web.getString("user_id");
		
		logger.debug("userId=" + userId);
		
		// 아이디(이메일) 검사
		if(userId == null) {
			sqlSession.close();
			web.redirect(null, "이메일 주소를 입력하세요.");
			return null;
		}
		
		/** (5) 임시 비밀번호 생성하기*/
		String newPassword = Util.getInstance().getRandomPassword();
		
		/** (6) 입력값을 JavaBeans에 저장하기*/
		Member member = new Member();
		member.setUserId(userId);
		member.setUserPw(newPassword);
		
		/** (7) Service를 통한 비밀번호 갱신 */
		try {
			memberService.updateMemberPasswordByEmail(member);
		} catch(Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/** (8) 발급된 비밀번호를 메일로 발송하기 */
		String sender = "pet123@petstudio.com";
		String subject = "petstudio 비밀번호 변경 안내 입니다.";
		String content = "회원님의 새로운 비밀번호는 <strong>" + newPassword + "</strong>입니다.";
		
		try {
			// 사용자가 입력한 메일주소를 수신자로 설정하여 메일 발송하기
			mail.sendMail(sender, userId, subject, content);
		} catch (MessagingException e) {
			web.redirect(null, "메일 발송에 실패했습니다. 관리자에게 문의 바랍니다.");
			return null;
		}
		
		/** (9) 결과 페이지로 이동 */
		// 여기서는 이전 페이지로 이동함
		web.redirect(web.getRootPath() + "/member/login.do", "새로운 비밀번호가 메일로 발송되었습니다. 로그인 화면으로 넘어갑니다.");
		return null;
	}

}
