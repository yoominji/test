<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/admin_head.jsp"%>
<script type="text/javascript">
	$(function() {
		if($("#bbsType").val() == "gallery") {
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
	
			$.validator.addMethod("select", function(value, element) {
				console.log(element.selectedIndex)
				if (element.selectedIndex == 0) {
					return false;
				} else {
					return true;
				}
			});

			$("#documentFrm").validate({
				rules : {
					subject : "required",
					selCategory : "select",
					file : {
						required : true,
						extension : "jpg|gif|png"
					}
				},
				messages : {
					subject : "제목을 입력하세요.",
					selCategory : "카테고리를 선택하세요.",
					file : {
						required : "사진파일을 선택하세요.",
						extension : "사진은 jpg,png,gif 형식만 가능합니다."
					}
				}
			});
		
		} else {
			$("button[type=submit]").click(function(){
				if($("#subject").val()==""){
					swal({
						title : "에러",
						text : "제목을 입력하세요.",
						type : "error"
					}, function() {
						setTimeout(function() {
							$("#subject").val("");
							$("#subject").focus();
						}, 100);
					});
					return false;
				}
				var ckeditor = CKEDITOR.instances['contents']; 
				if (ckeditor.getData()=="")
				{
					swal({
						title : "에러",
						text : "내용을 입력하세요.",
						type : "error"
					}, function() {
						setTimeout(function() {
							ckeditor.focus();
						}, 100);
					});
					return false;
				}
				$("#documentFrm").submit();
			});

			$("button[type=reset]").click(function(){
				var ckeditor = CKEDITOR.instances['contents']; 
				ckeditor.setData('');
			});
		}
		
		$("#list").click(function() {
			var $form = $("#documentFrm");
			$form.action("/admin/bbs/document_list.do");
			$form.submit();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/inc/admin_topbar.jsp"%>

		<!-- 경로 및 해당 페이지 타이틀 시작 -->
		<div class="location">
			<ol class="breadcrumb pull-right">
				<li><a href="#">Home</a></li>
				<li class="active">${bbsName}</li>
			</ol>
		</div>
		<hr />
        <h3 class="title">${bbsName}</h3>
		<!-- 경로 및 해당 페이지 타이틀 끝 -->
		<!-- 내용 영역 -->
		<div class="content">
			<form id="documentFrm" name="documentFrm" class="form-horizontal" method="post" enctype="multipart/form-data"  
				action="${pageContext.request.contextPath}/admin/bbs/document_write_ok.do">
				<!-- 게시판 카테고리에 대한 상태유지 -->
				<input type="hidden" id="bbsType" name="bbsType" value="${bbsType}" /> 
				<input type="hidden" id="category" name="category" value="${category}" />
				<!-- 제목 -->
				<div class="form-group">
					<label for="subject" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="subject" name="subject" />
					</div>
				</div>
				<!-- 카테고리 -->
				<c:choose>
					<c:when test="${bbsType == 'gallery'}">
						<div class="form-group">
							<label class="col-md-2 control-label" for="selCategory">카테고리</label>
							<div class="col-md-10">
								<select class="form-control" name="selCategory" id="selCategory">
									<option>---- 선택해주세요 -----</option>
									<option value="dog">DOG</option>
									<option value="cat">CAT</option>
									<option value="celeb">CELEB</option>
								</select>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<!-- 내용 -->
						<div class="form-group">
							<label for="contents" class="col-sm-2 control-label">내용</label>
							<div class="col-sm-10">
								<textarea id="contents" name="contents" class="ckeditor"></textarea>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
				<!-- 파일업로드 -->
				<c:if test="${bbsType != 'qna'}">
					<div class="form-group">
						<label for="file" class="col-sm-2 control-label">파일첨부</label>
						<div class="col-sm-10">
							<input type="file" class="form-control" id="file" name="file" multiple />
						</div>
					</div>
				</c:if>
				<!-- 버튼들 -->
				<div class="form-group">
					<div class="col-md-12 text-right">
						<button type="submit" class="btnBlue">등록</button>
						<button type="reset" class="btnLightRed">다시 작성</button>
						<button type="button" id="list" class="btnWrite">목록</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>