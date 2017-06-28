package study.jsp.petstudio.controller.admin.bbs;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.helper.BaseController;
import study.jsp.helper.FileInfo;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.UploadHelper;
import study.jsp.helper.WebHelper;
import study.jsp.petstudio.controller.bbs.BBSCommon;
import study.jsp.petstudio.dao.MyBatisConnectionFactory;
import study.jsp.petstudio.model.BbsDocument;
import study.jsp.petstudio.model.BbsFile;
import study.jsp.petstudio.model.Member;
import study.jsp.petstudio.service.BbsDocumentService;
import study.jsp.petstudio.service.BbsFileService;
import study.jsp.petstudio.service.impl.BbsDocumentServiceImpl;
import study.jsp.petstudio.service.impl.BbsFileServiceImpl;

@WebServlet("/admin/bbs/document_write_ok.do")
public class AdminDocumentWriteOk extends BaseController {
	private static final long serialVersionUID = 1L;
	
	/* (1) 사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	BBSCommon bbs;
	RegexHelper regex;
	UploadHelper upload;
	BbsDocumentService bbsDocumentService;
	BbsFileService bbsFileService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bbs = BBSCommon.getInstance();
		regex = RegexHelper.getInstance();
		upload = UploadHelper.getInstance();
		bbsDocumentService = new BbsDocumentServiceImpl(sqlSession, logger);
		bbsFileService = new BbsFileServiceImpl(sqlSession, logger);
		
		/* (3) 로그인 여부 검사 */
		if(web.getSession("adminLogin") == null) {
			web.redirect(web.getRootPath() + "/admin/login.do", "관리자 로그인 후에 이용 가능합니다.");
			return null;
		}
		
		/* (4) 파일이 포함된 POST 파라미터 받기 */
		try {
			upload.multipartRequest(request);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, "multipart 데이터가 아닙니다.");
			return null;
		}
		
		/* (5) UploadHelper에서 텍스트 형식의 값을 추출 */
		Map<String, String> paramMap = upload.getParamMap();
		String bbsType = paramMap.get("bbsType");
		String category = paramMap.get("category");
		String subject = paramMap.get("subject");
		String selCategory = paramMap.get("selCategory");
		String content = paramMap.get("contents");
		// 회원 일련번호 -> 비 로그인인 경우 0
		int memberId = 0;
		// 로그인 한 경우, 입력하지 않은 이름, 비밀번호, 이메일을 세션정보로 대체
		Member loginInfo = (Member) web.getSession("adminLogin");
		String writer = "";
		if (loginInfo != null) {
			writer = loginInfo.getName();
			memberId = loginInfo.getId();
		}
		
		// 전달받은 파라미터는 값의 정상여부 확인을 위해서 로그로 확인
		logger.debug("bbsType=" + bbsType);
		logger.debug("category=" + category);
		logger.debug("subject=" + subject);
		logger.debug("selCategory=" + selCategory);
		logger.debug("content=" + content);
		logger.debug("writer=" + writer);
		logger.debug("memberId=" + memberId);
		
		/* (6) 게시판 카테고리 값을 받아서 View에 전달 */
		// 파일이 첨부된 경우 WebHelper를 사용할 수 없다.
		request.setAttribute("bbsType", bbsType);
		request.setAttribute("category", category);
		
		/* (7) 존재하는 게시판인지 판별하기 */
		try {
			String bbsName = bbs.getBbsName(bbsType);
			request.setAttribute("bbsName", bbsName);
			if(bbsType.equals("gallery")) {
				String bbsCategoryName = bbs.getBbsCategoryName(category);
				request.setAttribute("bbsCategoryName", bbsCategoryName);
			}
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/* (8) 입력 받은 파라미터에 대한 유효성 검사 */		
		// 제목 및 내용 검사
		if(!regex.isValue(subject)) {
			sqlSession.close();
			web.redirect(null, "글 제목을 입력하세요.");
			return null;
		}
		if(bbsType.equals("gallery")) {
			if(!regex.isValue(selCategory)) {
				sqlSession.close();
				web.redirect(null, "카테고리를 선택하세요.");
				return null;
			}
			
		} else {
			if(!regex.isValue(content)) {
				sqlSession.close();
				web.redirect(null, "내용을 입력하세요.");
				return null;
			}
		}
		
		/* (9) 입력 받은 파라미터를 Beans로 묶기 */
		BbsDocument document = new BbsDocument();
		document.setBbsType(bbsType);
		document.setSubject(subject);
		document.setCategory(selCategory);
		document.setContent(content);
		document.setWriter(writer);
		document.setMemberId(memberId);
		logger.debug("document >> " + document.toString());
		
		/* (10) Service를 통한 게시물 저장 */
		try {
			bbsDocumentService.insertDocument(document);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			return null;
		}
		
		/* (10) 첨부파일 목록 처리 */
		// 업로드 된 파일 목록
		List<FileInfo> fileList = upload.getFileList();
		
		try {
			// 업로드 된 파일의 수 만큼 반복 처리 한다.
			for(int i = 0; i <fileList.size(); i++) {
				// 업로드 된 정보 하나 추출하여 데이터베이스에 저장하기 위한 형태로 가공해야 한다.
				FileInfo info = fileList.get(i);
				
				// DB에 저장하기 위한 항목 생성
				BbsFile file = new BbsFile();
				
				// 몇 번 게시물에 속한 파일인지 지정한다.
				file.setBbsDocumentId(document.getId());
				
				// 데이터 복사
				file.setOriginName(info.getOrginName());
				file.setFileDir(info.getFileDir());
				file.setFileName(info.getFileName());
				file.setContentType(info.getContentType());
				file.setFileSize(info.getFileSize());
				
				// 저장처리
				bbsFileService.insertFile(file);
			}
		} catch (Exception e) {
			web.redirect(null, e.getLocalizedMessage());
			return null;
		} finally {
			sqlSession.close();
		}
		
		/* (11) 저장 완료 후 읽기 페이지로 이동하기 */
		// 읽어들인 게시물을 식별하기 위한 게시물 일련번호값을 전달해야 한다.
		String url = "%s/admin/bbs/document_read.do?bbsType=%s&category=%s&document_id=%d";
		url = String.format(url, web.getRootPath(), document.getBbsType(), document.getCategory(), document.getId());
		web.redirect(url, null);
		return null;
	}
}
