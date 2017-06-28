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
         <li class="active">회원탈퇴 신청</li>
     </ol>
 </div>
 <hr />
 <h3 class="title">회원탈퇴 신청</h3>
 <!-- 경로 및 해당 페이지 타이틀 끝 -->
 <br />
<!-- 내용 영역 -->
<div class="content">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			
			<h1>탈퇴 신청 확인</h1>
			<p>탈퇴 신청하시겠습니까? 탈퇴 신청한 아이디는 사용할 수 없습니다.</p>
			<p> 탈퇴를 위해서는 비밀번호를 입력 해주세요.	</p>
			<!-- 비밀번호 입력 폼 시작 -->
			<form name="myform" method="post" action="${pageContext.request.contextPath}/member/out_ok.do">
				<div class="form-group">
					<input type="password" name="user_pw" class="form-control" />
				</div>
				<div class="form-group">	
					<button type="submit" class="btn btn-primary btn-block">회원탈퇴</button>					
				</div>	
			</form>
			<!-- // 비밀번호 입력 폼 끝 -->
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/inc/footer.jsp" %>
</div>
</body>
</html>