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
        <li><a href="#">ABOUT US</a></li>
        <li class="active">소개</li>
    </ol>
</div>
<hr />
<h3 class="title">소개</h3>
<!-- 경로 및 해당 페이지 타이틀 끝 -->
<!-- 내용 영역 -->
<div class="content">
	<br />
    <div class="intro">
        <img alt="intro" src="${pageContext.request.contextPath}/assets/img/intro.png">
    </div>
</div>

<%@ include file="/WEB-INF/inc/footer.jsp" %>
</div>
</body>
</html>