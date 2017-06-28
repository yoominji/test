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
 <!-- 경로 및 해당 페이지 타이틀 시작 -->
<div class="location">
    <ol class="breadcrumb pull-right">
        <li><a href="#">Home</a></li>
        <li><a href="#">회원</a></li>
        <li class="active">아이디 찾기</li>
    </ol>
</div>
<hr />
<h3 class="title">아이디 찾기</h3>
<!-- 경로 및 해당 페이지 타이틀 끝 -->
<br />

<!-- 내용 영역 -->
<div class="content">
	<table class="view">
		  <colgroup>
		      <col width="10%">
		      <col width="90%">
		  </colgroup>
		  <tbody>
			<tr>
			    <th>아이디</th>
			    <td>${IdInfo.userId}</td>
			</tr>
		</tbody>
	</table>
	<div class="space"></div>
		<div class="row">
			<div class="col-md-12 text-right">
				<a href="${pageContext.request.contextPath}/member/find_pw.do" type="button" class="btn btn-warning">비밀번호 찾기</a>
				<a href="${pageContext.request.contextPath}/member/login.do" type="button" class="btn btn-danger">로그인</a>
			</div>
		</div>	

</div>

<%@ include file="/WEB-INF/inc/footer.jsp" %>
</div>
</body>
</html>