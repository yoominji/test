<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/user_head.jsp"%>
<script type="text/javascript">
	$(function() {
		//입력값 유효성 검사
		jQuery.validator.setDefaults({
			onkeyup : false,
			onclick : false,
			onfocusout : false,
			showErrors : function(errorMap, errorList) {
				if (this.numberOfInvalids()) {

					swal({
						title : "에러",
						text : errorList[0].message,
						type : "error"
					}, function() {
						setTimeout(function() {
							$(errorList[0].element).val('');
							$(errorList[0].element).focus();
						}, 100);
					});
				}
			}
		});
		// 유효성 검사 추가 함수
		$.validator.addMethod("phone", function(value, element) {
			console.log(value);
			return this.optional(element)
					|| /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test(value)
					|| /^\d{2,3}\d{3,4}\d{4}$/i.test(value);
		});

		$("#memberFrm").validate({
			rules : {
				tel : {
					required : true,
					phone : true
				}
			},
			messages : {
				tel : {
					required : "연락처를 입력하세요.",
					phone : "연락처 형식이 잘못되었습니다."
				}
			}
		});
	});
</script>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/inc/user_topbar.jsp"%>
		<!-- 경로 및 해당 페이지 타이틀 시작 -->
		<div class="location">
			<ol class="breadcrumb pull-right">
				<li><a href="#">Home</a></li>
				<li><a href="#">회원</a></li>
				<li class="active">마이페이지</li>
			</ol>
		</div>
		<hr />
		<h3 class="title">마이페이지</h3>
		<!-- 경로 및 해당 페이지 타이틀 끝 -->
		<br />
		<!-- 내용 영역 -->
		<div class="content">
			<form class="form-horizontal" id="myform" method="post"	action="${pageContext.request.contextPath}/member/edit_ok.do">
				<table class="view">
					<colgroup>
						<col width="15%">
						<col width="85%">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td>${loginInfo.userId}</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>${loginInfo.name}</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td><input type="text" id="tel" name="tel"
								class="form-control" placeholder="연락처를 입력해주세요."
								value="${loginInfo.tel}"></td>
						</tr>
					</tbody>
				</table>
				<!-- 여백 -->
				<div class="space"></div>
				<div class="row">
					<div class="col-md-12 text-right">
						<button type="submit" id="editBtn" class="btn btn-primary">수정</button>
					</div>
				</div>
			</form>


		</div>

		<%@ include file="/WEB-INF/inc/footer.jsp"%>
	</div>
</body>
</html>