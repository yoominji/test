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

<div class="container">
<!-- 경로 및 해당 페이지 타이틀 시작 -->
<div class="location">
    <ol class="breadcrumb pull-right">
        <li><a href="#">Home</a></li>
        <li><a href="#">회원</a></li>
        <li class="active">비밀번호 찾기</li>
    </ol>
</div>
<hr />
<h3 class="title">비밀번호 재발급</h3>
<!-- 경로 및 해당 페이지 타이틀 끝 -->
<br />
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<p>
				가입시 입력한 아이디(이메일)를 입력하세요.
				임시 비밀번호를 이메일로 보내드립니다.
			</p>
			<!-- 이메일 주소 입력 폼 시작 -->
			<form name="myform" method="post" action="${pageContext.request.contextPath}/member/find_pw_ok.do">
				<div class="form-group">
					<input type="text" name="user_id" class="form-control" />
				</div>
				<div class="form-group">	
					<button type="submit" class="btn btn-primary btn-block">비밀번호 재설정 하기</button>					
				</div>	
			</form>
			<!-- // 이메일 주소 입력 폼 끝 -->
			
			
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/inc/footer.jsp" %>
</div>
</body>
</html>