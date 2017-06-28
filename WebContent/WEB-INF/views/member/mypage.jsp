<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/user_head.jsp" %>
<script type="text/javascript">
 $(function() {

     $("#editmemBtn").click(function() {
    	
        swal({
             title: "본인확인", // 제목
             text: "비밀번호를 입력해주세요.", // 내용
             type : "input",
             inputType : "password",
             showCancelButton: true, // 취소버튼 보여짐
             closeOnConfirm: false, // 확인버튼을 누른 경우 창을 닫지 않음
             inputPlaceholder: "ex)123qwe!@#" // 내용
         }, function(value) { // 확인 버튼을 누른 경우 호출될 콜백함수
             // cancel을 누른 경우
             if (value === false) {
                 return false;
             }

             // 입력값이 없는 경우
             if (value == "") {
                 swal.showInputError("비밀번호를 입력하세요.");
                 return false;
             }
             
		   	 var $form = $('<form></form>');
		     $form.attr('action', '${pageContext.request.contextPath}/member/check_pw.do');
		     $form.attr('method', 'post');
		     $form.appendTo('body');     
		     var page = $('<input type="hidden" name="page" value="edit">');
             var user_pw = $('<input type="hidden" name="user_pw" value="' + value + '">');
             $form.append(page).append(user_pw);
             $form.submit();
         });
     });

     $("#editpwBtn").click(function() {
         swal({
             title: "본인확인", // 제목
             text: "비밀번호를 입력해주세요.", // 내용
            /* type: "prompt", // 다이얼로그 종류 -> inputbox 표시됨*/
             type : "input",
             inputType : "password",
             showCancelButton: true, // 취소버튼 보여짐
             closeOnConfirm: false, // 확인버튼을 누른 경우 창을 닫지 않음
             inputPlaceholder: "ex)123qwe!@#" // 내용
         }, function(value) { // 확인 버튼을 누른 경우 호출될 콜백함수
             // cancel을 누른 경우
             if (value === false) {
                 return false;
             }

             // 입력값이 없는 경우
             if (value == "") {
                 swal.showInputError("비밀번호를 입력하세요.");
                 return false;
             }
             var $form = $('<form></form>');
		     $form.attr('action', '${pageContext.request.contextPath}/member/check_pw.do');
		     $form.attr('method', 'post');
		     $form.appendTo('body');     
		     var page = $('<input type="hidden" name="page" value="editpw">');
             var user_pw = $('<input type="hidden" name="user_pw" value="' + value + '">');
             $form.append(page).append(user_pw);
             $form.submit();
         });
     });

     $("#sessionBtn").click(function() {
         swal({
             title: "본인확인", // 제목
             text: "비밀번호를 입력해주세요.", // 내용
             /*type: "prompt", // 다이얼로그 종류 -> inputbox 표시됨*/
             type : "input",
             inputType : "password",
             showCancelButton: true, // 취소버튼 보여짐
             closeOnConfirm: false, // 확인버튼을 누른 경우 창을 닫지 않음
             inputPlaceholder: "ex)123qwe!@#" // 내용
         }, function(value) { // 확인 버튼을 누른 경우 호출될 콜백함수
             // cancel을 누른 경우
             if (value === false) {
                 return false;
             }

             // 입력값이 없는 경우
             if (value == "") {
                 swal.showInputError("비밀번호를 입력하세요.");
                 return false;
             }
             var $form = $('<form></form>');
		     $form.attr('action', '${pageContext.request.contextPath}/member/check_pw.do');
		     $form.attr('method', 'post');
		     $form.appendTo('body');     
		     var page = $('<input type="hidden" name="page" value="out">');
             var user_pw = $('<input type="hidden" name="user_pw" value="' + value + '">');
             $form.append(page).append(user_pw);
             $form.submit();
         });
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
		<table class="view">
		     <colgroup>
		         <col width="10%">
		         <col width="90%">
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
		             <td>${loginInfo.tel}</td>
		         </tr>
		     </tbody>
		 </table>
		 <!-- 여백 -->
		 <div class="space"></div>
		 <div class="row">
		     <div class="col-md-12 text-right">
		         <button type="button" id="editmemBtn" class="btn btn-primary">수정</button>
		         <button type="button" id="editpwBtn" class="btn btn-warning">비밀번호 변경</button>
		         <button type="button" id="sessionBtn" class="btn btn-danger">탈퇴</button>
		     </div>
		 </div>	
	</div>
	
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</div>
</body>
</html>