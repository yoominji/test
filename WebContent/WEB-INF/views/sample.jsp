<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<%@ include file="/WEB-INF/inc/user_head.jsp" %>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/inc/user_topbar.jsp" %>
		
		<!-- 내용 영역 -->
		<div class="content">
			
			<!-- 목록 페이지 하단부의 쓰기버튼+검색폼+페이지 번호 공통 영역 include -->
			<%@ include file="/WEB-INF/inc/bbs_list_bottom.jsp" %>
		</div>
		
		<%@ include file="/WEB-INF/inc/footer.jsp" %>
	</div>
</body>
</html>