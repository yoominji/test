<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/user_head.jsp"%>

</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/inc/user_topbar.jsp"%>

		<!-- 내용 영역 -->
		<div class="content">
			<h1 class="page-header">${bbsName} - <small>목록</small></h1>
			
			<!-- 글 목록 시작 -->
		<div class="table-responsive">
			<table class="table table-hover">
				<thead>
					<tr>
						<th class="text-center" style="width: 100px">번호</th>
						<th class="text-center">제목</th>
						<th class="text-center" style="width: 120px">작성자</th>
						<th class="text-center" style="width: 100px">조회수</th>
						<th class="text-center" style="width: 120px">작성일</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${fn:length(documentList) > 0}">
							<c:forEach var="document" items="${documentList}">
								<tr>
									<td class="text-center">${document.id}</td>
									<td>
										<c:url var="readUrl" value="/bbs/document_read.do">
											<c:param name="bbsType" value="${document.bbs_type}"></c:param>
											<c:param name="category" value="${document.categoty}"></c:param>
											<c:param name="document_id" value="${document.id}"></c:param>
										</c:url>
										<a href="${readUrl}">${document.subject}</a>
									</td>
									<td class="text-center">${document.writerName}</td>
									<td class="text-center">${document.hit}</td>
									<td class="text-center">${document.regDate}</td>
								</tr>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<tr>
								<td colspan="5" class="text-center" style="line-height: 100px;">
									조회된 글이 없습니다.</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</tbody>
			</table>
		</div>
			
			<!-- 목록 페이지 하단부의 쓰기버튼+검색폼+페이지 번호 공통 영역 include -->
			<%@ include file="/WEB-INF/inc/bbs_list_bottom.jsp"%>
		</div>

		<%@ include file="/WEB-INF/inc/footer.jsp"%>
	</div>
</body>
</html>