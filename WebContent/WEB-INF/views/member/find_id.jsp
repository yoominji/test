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

    // 유효성 검사 추가 함수
    $.validator.addMethod("kor", function(value, element) {
        return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value);
    });

    $.validator.addMethod("phone", function(value, element) {
        console.log(value);
        return this.optional(element) || /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test(value) || /^\d{2,3}\d{3,4}\d{4}$/i.test(value);
    });

    // form태그에 부여한 id속성에 대한 유효성 검사 함수 호출
    $("#myform").validate({
        /** 입력검사 규칙 */
        rules: {
            // 필수 입력 + 한글 입력
            name: {
                required: true,
                kor: true
            },
            // 필수 입력 + 전화번호 형식
            tel: {
                required: true,
                phone: true
            }
        },
        /** 규칙이 맞지 않을 경우의 메시지 */
        messages: {
            name: {
                required: "이름을 입력하세요.",
                kor: "이름은 한글만 입력 가능합니다."
            },
            tel: {
                required: "연락처를 입력하세요.",
                phone: "연락처 형식이 잘못되었습니다."
            }
        }
    }); // end validate()

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
        <li class="active">아이디 찾기</li>
    </ol>
</div>
<hr />
<h3 class="title">아이디 찾기</h3>
<!-- 경로 및 해당 페이지 타이틀 끝 -->
<!-- 내용 영역 -->
<div class="content">
	<!-- 아이디 찾기 폼 시작 -->
	 <form class="form-horizontal" id="myform" method="post" action="${pageContext.request.contextPath}/member/find_id_ok.do">
	     <div class="form-group">
	         <label for="name" class="col-md-2">이름</label>
	         <div class="col-md-10">
	             <input type="text" name="name" id="name" class="form-control" placeholder="이름을 입력해주세요." />
	         </div>
	     </div>
	     <div class="form-group">
	         <label for="tel" class="col-md-2">연락처</label>
	         <div class="col-md-10">
	             <input type="tel" name="tel" id="tel" class="form-control" placeholder="'-'없이 숫자만 입력해주세요." />
	         </div>
	     </div>
	     <div class="form-group">
	         <div class="col-md-offset-2 col-md-10 text-right">
	             <button type="submit" class="btn btn-primary btn-block">아이디 찾기</button>
	         </div>
	     </div>
	 </form>
	 <!-- 아이디 찾기 폼 끝 -->
</div>

<%@ include file="/WEB-INF/inc/footer.jsp" %>
</div>
</body>
</html>