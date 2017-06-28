<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/user_head.jsp"%>
<style type="text/css">
.carousel-inner>.item>img {
	min-width: 100%;
}
</style>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/inc/user_topbar.jsp"%>

		<!-- 내용 영역 -->
		<div class="content">
			<br />
			<!-- 캐러셀 영역 구성 -->
			<div id="carousel-example-generic" class="carousel slide"
				data-ride="carousel">
				<!-- 현재 위치 표시 -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0"
						class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
					<li data-target="#carousel-example-generic" data-slide-to="2"></li>
				</ol>
				<!-- 내용 영역 -->
				<div class="carousel-inner">
					<!-- 항목(1)  -->
					<div class="item active">
						<img src="${pageContext.request.contextPath}/assets/img/slide-1.jpg" alt="pet(1)">
					</div>
					<!-- //항목(1) -->
					<!-- 항목(2)  -->
					<div class="item">
						<img src="${pageContext.request.contextPath}/assets/img/slide-2.jpg" alt="pet(2)">
					</div>
					<!-- //항목(2) -->
					<!-- 항목(3)  -->
					<div class="item">
						<img src="${pageContext.request.contextPath}/assets/img/slide-3.jpg" alt="pet(3)">
					</div>
					<!-- //항목(3) -->
				</div>
				<!-- //내용 영역 구성 -->
				<!-- 이동버튼 -->
				<a class="left carousel-control" href="#carousel-example-generic"
					data-slide="prev"> <span class="icon-prev"></span>
				</a> <a class="right carousel-control" href="#carousel-example-generic"
					data-slide="next"> <span class="icon-next"></span>
				</a>
			</div>
			<!-- 캐러셀 영역 끝 -->

		</div>

		<%@ include file="/WEB-INF/inc/footer.jsp"%>
	</div>
</body>
</html>