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
import study.jsp.helper.RegexHelper;
import study.jsp.helper.WebHelper;
import study.jsp.petstudio.model.Member;
import study.jsp.petstudio.model.BbsDocument;
import study.jsp.petstudio.service.impl.BbsDocumentServiceImpl;
import study.jsp.petstudio.service.BbsDocumentService;
import study.jsp.petstudio.dao.MyBatisConnectionFactory;

@WebServlet("/bbs/document_write_ok.do")
public class DocumentWriteOk extends BaseController {
	private static final long serialVersionUID = 1L;
	/** 1. Helper 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	BbsDocumentService bbsDocumentService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/** 2. 사용하고자 하는 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		regex = RegexHelper.getInstance();
		bbsDocumentService = new BbsDocumentServiceImpl(sqlSession, logger);
		
		/** 3. 로그인 여부 검사 */
		if(web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/member/login.do", "로그인 후에 이용 가능합니다.");
			return null;
		}

		/** 4. POST 파라미터 받기 */
		String bbsType = web.getString("bbsType");
		String subject = web.getString("subject");
		String content = web.getString("contents");
		
		// 로그인 한 경우, 입력하지 않은 이름을 세션정보로 대체
		Member loginInfo = (Member) web.getSession("loginInfo");
		String writer = "";
		int memberId = 0;
		if (loginInfo != null) {
			writer = loginInfo.getName();
			memberId = loginInfo.getId();
		}
		
		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("bbsType=" + bbsType);
		logger.debug("subject=" + subject);
		logger.debug("content=" + content);
		logger.debug("writer=" + writer);
		logger.debug("memberId=" + memberId);

		/** 5. 입력 받은 파라미터에 대한 유효성 검사 */
		// 제목 및 내용 검사
		if (!regex.isValue(subject)) {
			sqlSession.close();
			web.redirect(null, "글 제목을 입력하세요.");
			return null;
		}

		if (!regex.isValue(content)) {
			sqlSession.close();
			web.redirect(null, "내용을 입력하세요.");
			return null;
		}

		/** 6. 입력 받은 파라미터를 Beans로 묶기 */
		BbsDocument document = new BbsDocument();
		document.setBbsType("qna");
		document.setSubject(subject);
		document.setContent(content);
		document.setWriter(writer);
		document.setMemberId(memberId);
		logger.debug("document >> " + document.toString());

		/** 7. Service를 통한 게시물 저장 */
		try {
			bbsDocumentService.insertDocument(document);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/** 8. 저장 완료 후 읽기 페이지로 이동하기 */
		// 읽어들일 게시물을 식별하기 위한 게시물 일련번호 값을 전달해야 한다.
		String url = "%s/bbs/document_read.do?bbsType=qna&document_id=%d";
		url = String.format(url, web.getRootPath(), document.getId());
		web.redirect(url, null);
		return null;
	}

}
