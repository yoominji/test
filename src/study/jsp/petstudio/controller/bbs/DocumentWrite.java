package study.jsp.petstudio.controller.bbs;

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

@WebServlet("/bbs/document_write.do")
public class DocumentWrite extends BaseController {
	private static final long serialVersionUID = 1L;
	
	/** 1. Helper 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** 2. 사용하고자 하는 객체 생성*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		
		/** 3. 로그인 여부 검사 */
		if(web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후에 이용 가능합니다.");
			return null;
		}
		
		return "bbs/document_write";
	}
    
}
