<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/user_head.jsp" %>
<!-- 사용자 정의 스크립트 -->
<script type="text/javascript">
$(function() {
    /** 플러그인의 기본 설정 옵션 추가 */
    jQuery.validator.setDefaults({
        onkeyup: false, // 키보드입력시 검사 안함
        onclick: false, // <input>태그 클릭시 검사 안함
        onfocusout: false, // 포커스가 빠져나올 때 검사 안함
        showErrors: function(errorMap, errorList) { // 에러 발생시 호출되는 함수 재정의
            // 에러가 있을 때만..
            if (this.numberOfInvalids()) {
                // 0번째 에러 메시지에 대한 javascript 기본 alert 함수 사용
                //alert(errorList[0].message);
                // 0번째 에러 발생 항목에 포커스 지정
                //$(errorList[0].element).focus();

                swal({
                    title: "에러",
                    text: errorList[0].message,
                    type: "error"
                }, function() {
                    // 창이 닫히는 애니메이션의 시간이 있으므로,
                    // 0.1초의 딜레이 적용 후 포커스 이동
                    setTimeout(function() {
                        $(errorList[0].element).val('');
                        $(errorList[0].element).focus();
                    }, 100);
                });
            }
        }
    });

    // form태그에 부여한 id속성에 대한 유효성 검사 함수 호출
    $("#myform").validate({
        /** 입력검사 규칙 */
        rules: {
            // 필수입력 + 이메일 형식 일치 필요
            email: {
                required: true,
                email: true
            },
            // 필수입력 + 글자수 길이 제한
            user_pw: {
                required: true,
                minlength: 8,
                maxlength: 20
            }
        },
        /** 규칙이 맞지 않을 경우의 메시지 */
        messages: {
            email: {
                required: "아이디(이메일)를 입력하세요.",
                email: "아이디(이메일) 형식이 잘못되었습니다."
            },
            user_pw: {
                required: "비밀번호를 입력하세요.",
                minlength: "비밀번호는 8글자 이상 입력하셔야 합니다.",
                maxlength: "비밀번호는 최대 20자까지 가능합니다."
            }
        }
    }); // end validate()

});
</script>
</head>
<body>
<div class="container">
	<%@ include file="/WEB-INF/inc/user_topbar.jsp" %>
		
	<!-- 내용 영역 -->
	<!-- 경로 및 해당 페이지 타이틀 시작 -->
    <div class="location">
        <ol class="breadcrumb pull-right">
            <li><a href="#">Home</a></li>
            <li><a href="#">회원</a></li>
            <li class="active">로그인</li>
        </ol>
    </div>
    <hr />
    <h3 class="title">로그인</h3>
    <br />
    <!-- 경로 및 해당 페이지 타이틀 끝 -->
	<div class="content">
		<form class="form-horizontal" id="myform" method="post"
				action="${pageContext.request.contextPath}/member/login_ok.do">
	        <div class="form-group">
	            <label for="user_id" class="col-md-2">아이디(이메일주소)</label>
	            <div class="col-md-10">
	                <input type="email" name="user_id" id="user_id" class="form-control" placeholder="아이디를 입력해주세요." />
	            </div>
	        </div>
	        <div class="form-group">
	            <label for="user_pw" class="col-md-2">비밀번호</label>
	            <div class="col-md-10">
	                <input type="password" name="user_pw" id="user_pw" class="form-control" placeholder="비밀번호를 입력해주세요." />
	            </div>
	        </div>
	        <div class="form-group">
	            <div class="col-md-offset-2 col-md-10">
	                <button type="submit" class="btn btn-primary btn-block">로그인</button>
	            </div>
	        </div>
	        <div class="a-group">
	            <div class="col-md-offset-2 col-md 10 text-center">
	                <a href="${pageContext.request.contextPath}/member/join.do" type="button" class="btn btn-link">회원가입</a>
	                <a href="${pageContext.request.contextPath}/member/find_id.do" type="button" class="btn btn-link">아이디 찾기</a>
	                <a href="${pageContext.request.contextPath}/member/find_pw.do" type="button" class="btn btn-link">비밀번호 찾기</a>
	            </div>
	        </div>
	    </form>	
		
	</div>
		
	<%@ include file="/WEB-INF/inc/footer.jsp" %>
</div>
</body>
</html>