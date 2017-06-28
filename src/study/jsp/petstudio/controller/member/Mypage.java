package study.jsp.petstudio.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;


@WebServlet("/member/mypage.do")
public class Mypage extends BaseController {
	private static final long serialVersionUID = 1L;
	
	/** (1) 사용하고자 하는 Helper + Service 객체 선언 */
	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** (2) 필요한 헬퍼 객체 생성 */
		web = WebHelper.getInstance(request, response);
		
		/** (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 수정할 수 없다.
		if(web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		
		/** (4) 사용할 View의 이름 리턴 */
		return "member/mypage";
	}

}
