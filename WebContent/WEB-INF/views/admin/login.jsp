<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<%@ include file="/WEB-INF/inc/admin_head.jsp" %>
    <style type="text/css">
    .content {
        width: 500px;
        margin: 0 auto;
        text-align: center;
    }
    
    img {
        margin: 60px 0;
    }
    </style>
    <script type="text/javascript">
    $(function() {
    	// 처음 페이지가 열렸을 때 포커스 이동 (처음에 있는 input id)
    	$("#admin_id").focus();
    	
        //입력값 유효성 검사
        jQuery.validator.setDefaults({
            onkeyup: false,
            onclick: false,
            onfocusout: false,
            showErrors: function(errorMap, errorList) {
                if (this.numberOfInvalids()) {

                    swal({
                        title: "에러",
                        text: errorList[0].message,
                        type: "error"
                    }, function() {
                        setTimeout(function() {
                            $(errorList[0].element).val('');
                            $(errorList[0].element).focus();
                        }, 100);
                    });
                }
            }
        });
        $("#logFrm").validate({
            rules: {
                admin_id: {
                    required: true,
                    alphanumeric: true
                },
                admin_pw: {
                    required: true,
                    minlength: 4,
                    maxlength: 20
                }
            },
            messages: {
                admin_id: {
                    required: "아이디를 입력하세요.",
                    alphanumeric: "아이디를 영어, 숫자만 입력 가능합니다."
                },

                admin_pw: {
                    required: "비밀번호를 입력하세요.",
                    minlength: "비밀번호는 4글자 이상 입력하셔야 합니다.",
                    maxlength: "비밀번호는 최대 20자까지 가능합니다."
                }
            }
        });
    });
    </script>
</head>
<body>
	<div class="container">
		<!-- 내용 영역 -->
		<div class="content">
			<img src="${pageContext.request.contextPath}/assets/img/logo2.png" />
            <form id="logFrm" name="logFrm" method="post" action="${pageContext.request.contextPath}/admin/login_ok.do" role="form">
                <fieldset>
                    <legend>관리자 로그인</legend>
                    <div class="form-group">
                        <label for="admin_id" class="sr-only">아이디</label>
                        <input type="text" id="admin_id" name="admin_id" class="form-control" placeholder="아이디를 입력하세요." />
                    </div>
                    <div class="form-group">
                        <label for="admin_pw" class="sr-only">비밀번호</label>
                        <input type="password" id="admin_pw" name="admin_pw" class="form-control" placeholder="비밀번호를 입력하세요." />
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">로그인</button>
                </fieldset>
            </form>			
		</div>
		
	</div>
</body>
</html>