package study.jsp.petstudio.controller.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study.jsp.helper.BaseController;
import study.jsp.helper.WebHelper;

@WebServlet("/admin/logout.do")
public class AdminLogout extends BaseController {
	private static final long serialVersionUID = 1L;
    
	/* (1) 사용하고자 하는 Helper + Service 객체 선언 */
	WebHelper web;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* (2) 필요한 헬퍼 객체 생성 */
		web = WebHelper.getInstance(request, response);
		
		/* (3) 로그인 여부 검사 */
		if(web.getSession("adminLogin") == null) {
			web.redirect(web.getRootPath() + "/admin/main.do", "관리자 로그인 후에 이용 가능합니다.");
			return null;
		}
		
		/* (4) 로그아웃 */
		// 로그아웃은 모든 세션 정보를 삭제하는 처리
		web.removeAllSession();
		
		/* (5) 페이지 이동 */
		web.redirect(web.getRootPath() + "/admin/login.do", "로그아웃 되었습니다.");
		
		return null;
	}

}
