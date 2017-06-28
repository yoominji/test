package study.jsp.petstudio.controller.admin.bbs;

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
import study.jsp.petstudio.controller.bbs.BBSCommon;
import study.jsp.petstudio.dao.MyBatisConnectionFactory;

@WebServlet("/admin/bbs/document_write.do")
public class AdminDocumentWrite extends BaseController {
	private static final long serialVersionUID = 1L;
	
	/** 1. Helper 객체 선언*/
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	
	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** 2. 사용하고자 하는 객체 생성*/
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		
		/** (3) 로그인 여부 검사 */
		if(web.getSession("adminLogin") == null) {
			web.redirect(web.getRootPath() + "/admin/login.do", "관리자 로그인 후에 이용 가능합니다.");
			return null;
		}
		
		/** 4. 게시판 카테고리 view 전달 */
		String bbsType = web.getString("bbsType");
		request.setAttribute("bbsType", bbsType);
		
		String category = web.getString("category");
		request.setAttribute("category", category);
		
		/** 5. 존재하는 게시판 판별 */
		try {
			String bbsName = bbs.getBbsName(bbsType);
			request.setAttribute("bbsName", bbsName);
			if(bbsType.equals("gallery")) {
				String bbsCategoryName = bbs.getBbsCategoryName(category);
				request.setAttribute("bbsCategoryName", bbsCategoryName);
			}
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		return "admin/bbs/document_write";
	}
    
}
