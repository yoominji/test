<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/user_head.jsp" %>
<script type="text/javascript">
	$(function() {
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
		
		$("#list").click(function() {
			var $form = $("#documentFrm");
			$form.action("/bbs/document_list.do");
			$form.submit();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/inc/user_topbar.jsp" %>
		<!-- 경로 및 해당 페이지 타이틀 시작 -->
		<div class="location">
			<ol class="breadcrumb pull-right">
				<li><a href="#">Home</a></li>
				<li><a href="${pageContext.request.contextPath}/bbs/document_list.do?bbsType=notice">BOARD</a></li>
				<li class="active">질의응답</li>
			</ol>
		</div>
		<hr />
        <h3 class="title">질의응답</h3>
		<!-- 경로 및 해당 페이지 타이틀 끝 -->
		<!-- 내용 영역 -->
		<div class="content">
			<form id="documentFrm" name="documentFrm" class="form-horizontal" method="post"  
				action="${pageContext.request.contextPath}/bbs/document_write_ok.do">
				<!-- 제목 -->
				<div class="form-group">
					<label for="subject" class="col-sm-2 control-label">제목</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="subject" name="subject" />
					</div>
				</div>
				<div class="form-group">
					<label for="contents" class="col-sm-2 control-label">내용</label>
					<div class="col-sm-10">
						<textarea id="contents" name="contents" class="ckeditor"></textarea>
					</div>
				</div>
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
		
		<%@ include file="/WEB-INF/inc/footer.jsp" %>
	</div>
</body>
</html>