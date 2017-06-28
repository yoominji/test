<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<!doctype html>
<html>
<head>
<%@ include file="/WEB-INF/inc/user_head.jsp"%>
<!-- 사용자 정의 스크립트 -->
<script type="text/javascript">
	$(function() {
		/** 플러그인의 기본 설정 옵션 추가 */
		jQuery.validator.setDefaults({
			onkeyup : false, // 키보드입력시 검사 안함
			onclick : false, // <input>태그 클릭시 검사 안함
			onfocusout : false, // 포커스가 빠져나올 때 검사 안함
			showErrors : function(errorMap, errorList) { // 에러 발생시 호출되는 함수 재정의
				// 에러가 있을 때만..
				if (this.numberOfInvalids()) {
					// 0번째 에러 메시지에 대한 javascript 기본 alert 함수 사용
					//alert(errorList[0].message);
					// 0번째 에러 발생 항목에 포커스 지정
					//$(errorList[0].element).focus();

					swal({
						title : "에러",
						text : errorList[0].message,
						type : "error"
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
		$.validator.addMethod("select", function(value, element) {
			console.log(element.selectedIndex)
			if (element.selectedIndex == 0) {
				return false;
			} else {
				return true;
			}

		});
		$.validator.addMethod("kor", function(value, element) {
			return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value);
		});

		$.validator.addMethod("phone", function(value, element) {
			console.log(value);
			return this.optional(element)
					|| /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test(value)
					|| /^\d{2,3}\d{3,4}\d{4}$/i.test(value);
		});

		// form태그에 부여한 id속성에 대한 유효성 검사 함수 호출
		$("#myform").validate({
			/** 입력검사 규칙 */
			rules : {
				// 필수입력 + 이메일 형식 일치 필요
				user_id : {
					required : true,
					email : true
				},
				// 필수입력 + 글자수 길이 제한
				user_pw : {
					required : true,
					minlength : 8,
					maxlength : 20
				},
				// 필수입력 + 특정 항목과 일치해야 함 (id로 연결)
				user_pw_re : {
					required : true,
					equalTo : "#user_pw"
				},
				// 필수 입력 + 한글 입력
				name : {
					required : true,
					kor : true
				},
				// 필수 입력 + 전화번호 형식
				tel : {
					required : true,
					phone : true
				},
				personal_agree : "required",
				personal_agree2 : "required"
			},
			/** 규칙이 맞지 않을 경우의 메시지 */
			messages : {
				user_id : {
					required : "이메일을 입력하세요.",
					email : "이메일 형식이 잘못되었습니다."
				},
				user_pw : {
					required : "비밀번호를 입력하세요.",
					minlength : "비밀번호는 8글자 이상 입력하셔야 합니다.",
					maxlength : "비밀번호는 최대 20자까지 가능합니다."
				},
				user_pw_re : {
					required : "비밀번호 확인값을 입력하세요.",
					equalTo : "비밀번호 확인이 잘못되었습니다."
				},
				name : {
					required : "이름을 입력하세요.",
					kor : "이름은 한글만 입력 가능합니다."
				},
				tel : {
					required : "연락처를 입력하세요.",
					phone : "연락처 형식이 잘못되었습니다."
				},
				personal_agree : "개인정보 수집 동의는 필수항목입니다.",
				personal_agree2 : "개인정보 수집 동의는 필수항목입니다."
			}/* ,
			submitHandler : function(form) {
				$(form).attr("action", "login.html");
				$(form).submit();
			} */
		}); // end validate()

	});
</script>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/inc/user_topbar.jsp"%>

		<!-- 내용 영역 -->
		<div class="content">
			<!-- 경로 및 해당 페이지 타이틀 시작 -->
			<div class="location">
				<ol class="breadcrumb pull-right">
					<li><a href="#">Home</a></li>
					<li><a href="#">회원</a></li>
					<li class="active">회원가입</li>
				</ol>
			</div>
			<hr />
			<h3 class="title">회원가입</h3>
			<br />
			<!-- 경로 및 해당 페이지 타이틀 끝 -->
			<form class="form-horizontal" id="myform" method="post"
				action="${pageContext.request.contextPath}/member/join_ok.do">
				<div class="form-group">
					<label for="user_id" class="col-md-2">아이디(이메일주소)*</label>
					<div class="col-md-10">
						<input type="email" name="user_id" id="user_id" class="form-control"
							placeholder="아이디" />
					</div>
				</div>
				<div class="form-group">
					<label for="user_pw" class="col-md-2">비밀번호*</label>
					<div class="col-md-10">
						<input type="password" name="user_pw" id="user_pw"
							class="form-control" placeholder="비밀번호(8자이상)" />
					</div>
				</div>
				<div class="form-group">
					<label for="user_pw_re" class="col-md-2">비밀번호 재확인*</label>
					<div class="col-md-10">
						<input type="password" name="user_pw_re" id="user_pw_re"
							class="form-control" placeholder="비밀번호 재확인" />
					</div>
				</div>

				<div class="form-group">
					<label for="name" class="col-md-2">이름*</label>
					<div class="col-md-10">
						<input type="text" name="name" id="name" class="form-control"
							placeholder="이름" />
					</div>
				</div>
				<div class="form-group">
					<label for="tel" class="col-md-2">연락처*</label>
					<div class="col-md-10">
						<input type="tel" name="tel" id="tel" class="form-control"
							placeholder="'-'없이 입력" />
					</div>
				</div>
				<hr />
				<div class="form-group">
					<label class="col-md-2" for="personal_agree"> 서비스 약관 동의*</label>
					<div class="col-md-10">
						<label class="checkbox-inline"> <input type="checkbox"
							name="personal_agree" id="personal_agree" value="Y" />동의
						</label>
						<div class="space"></div>
						<div class="well well-sm personalinfo">
							<dl>
								<dt>제 1 장 총 칙</dt>
								<br />
								<dt>제 1 조 목 적</dt>
								<dd>본 약관은 서비스 이용자가 주식회사 카카오(이하 “회사”라 합니다)가 제공하는 온라인상의 인터넷
									서비스(이하 “서비스”라고 하며, 접속 가능한 유∙무선 단말기의 종류와는 상관없이 이용 가능한 “회사”가 제공하는
									모든 “서비스”를 의미합니다. 이하 같습니다)에 회원으로 가입하고 이를 이용함에 있어 회사와 회원(본 약관에
									동의하고 회원등록을 완료한 서비스 이용자를 말합니다. 이하 “회원”이라고 합니다)의 권리•의무 및 책임사항을
									규정함을 목적으로 합니다.</dd>
								<br />
								<dt>제 2 조 (약관의 명시, 효력 및 개정)</dt>

								<dd>① 회사는 이 약관의 내용을 회원이 쉽게 알 수 있도록 서비스 초기 화면에 게시합니다. ② 회사는
									온라인 디지털콘텐츠산업 발전법, 전자상거래 등에서의 소비자보호에 관한 법률, 약관의 규제에 관한 법률,
									소비자기본법 등 관련법을 위배하지 않는 범위에서 이 약관을 개정할 수 있습니다. ③ 회사가 약관을 개정할 경우에는
									기존약관과 개정약관 및 개정약관의 적용일자와 개정사유를 명시하여 현행약관과 함께 그 적용일자 일십오(15)일
									전부터 적용일 이후 상당한 기간 동안, 개정 내용이 회원에게 불리한 경우에는 그 적용일자 삼십(30)일 전부터
									적용일 이후 상당한 기간 동안 각각 이를 서비스 홈페이지에 공지하고 기존 회원에게는 회사가 부여한 이메일 주소로
									개정약관을 발송하여 고지합니다. ④ 회사가 전항에 따라 회원에게 통지하면서 공지∙고지일로부터 개정약관 시행일 7일
									후까지 거부의사를 표시하지 아니하면 승인한 것으로 본다는 뜻을 명확하게 고지하였음에도 의사표시가 없는 경우에는
									변경된 약관을 승인한 것으로 봅니다. 회원이 개정약관에 동의하지 않을 경우 회원은 제17조 제1항의 규정에 따라
									이용계약을 해지할 수 있습니다.</dd>
								<br />
								<dt>제 2 장 회원의 가입 및 관리</dt>
								<br />
								<dt>제 3 조 (회원가입절차)</dt>
								<dd>① 서비스 이용자가 본 약관을 읽고 “동의” 버튼을 누르거나 “확인” 등에 체크하는 방법을 취한
									경우 본 약관에 동의한 것으로 간주합니다. ② 회사의 서비스 이용을 위한 회원가입은 서비스 이용자가 제1항과 같이
									동의한 후, 회사가 정한 온라인 회원가입 신청서에 회원 ID를 포함한 필수사항을 입력하고, “등록하기” 내지
									“확인” 단추를 누르는 방법으로 합니다. 다만, 회사가 필요하다고 인정하는 경우 회원에게 별도의 서류를 제출하도록
									할 수 있습니다. ③ 법인고객 회원가입의 경우 회원가입 신청서의 제출, 서비스 이용대금의 납부 이외에 회사가
									정하는 추가 서류의 제출이 추가적으로 필요합니다. ④ 법인고객 회원가입의 경우 서비스 이용자와 이용요금 납입자가
									다를 경우 회사는 이를 확인하기 위하여 제 증명을 요구할 수 있습니다.</dd>
								<br />
								<dd>부칙 본 약관은 2016년 10월 7일부터 적용됩니다. 단, 본 약관의 공지 시점으로부터 적용일
									전일까지 기간 동안에 가입한 신규회원에 대해서는 회원 가입시부터 본 약관이 적용됩니다.</dd>
							</dl>
						</div>
					</div>
				</div>
				<div class="form-group">
					<label class="col-md-2" for="personal_agree2">개인정보 수집·이용
						동의*</label>
					<div class="col-md-10">
						<label class="checkbox-inline"> <input type="checkbox"
							name="personal_agree2" id="personal_agree2" value="Y" />동의
						</label>
						<div class="space"></div>
						<div class="well well-sm personalinfo">
							<dl>
								<dd>펫 스튜디오는 아래의 목적으로 개인정보를 수집 및 이용하며, 회원의 개인정보를 안전하게 취급하는데
									최선을 다합니다.</dd>
								<br />
								<dt>1. 수집목적</dt>
								<dd>• 이용자 식별, 원활한 의사소통, 부정이용 시 제재 및 기록</dd>
								<dd>• 회원제 서비스 제공, 문의사항 또는 불만 처리, 공지사항 전달</dd>
								<dd>• 유료 서비스 이용 시 요금 정산</dd>
								<dd>• 신규 서비스 개발, 이벤트 행사 시 정보 전달, 마케팅 및 광고 등에 활용</dd>
								<dd>• 서비스 이용 기록 및 통계 분석을 통한 서비스 개선 및 맞춤형 서비스 제공</dd>
								<dd>• 프라이버시 보호 측면의 서비스 환경 구축</dd>
								<br />
								<dt>2. 수집항목</dt>
								<dd>(필수) 아이디, 비밀번호, 이름, 연락처(휴대폰번호 또는 이메일 주소 중 1개 선택)</dd>
								<dt>3. 보유기간</dt>
								<br />
								<dd>수집된 정보는 회원탈퇴 후 지체없이 파기됩니다.</dd>
								<dd>서비스 제공을 위해 필요한 최소한의 개인정보이므로 동의를 해 주셔야 서비스 이용이 가능합니다. 더
									자세한 내용에 대해서는 개인정보처리방침을 참고하시기 바랍니다.</dd>
							</dl>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-2 col-md-10 text-right">
						<button type="submit" class="btn btn-primary">회원가입</button>
						<button type="reset" class="btn btn-danger">다시작성</button>
					</div>
				</div>
			</form>

		</div>

		<%@ include file="/WEB-INF/inc/footer.jsp"%>
	</div>
</body>
</html>