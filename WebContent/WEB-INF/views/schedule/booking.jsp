<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!doctype html>
<html>
<head>
	<%@ include file="/WEB-INF/inc/user_head.jsp" %>
	<!-- pickadate plugin (달력) -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/pickadate/themes/default.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/pickadate/themes/default.date.css" />
	<script src="${pageContext.request.contextPath}/assets/plugins/pickadate/picker.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/pickadate/picker.date.js"></script>
	<script src="${pageContext.request.contextPath}/assets/plugins/pickadate/translations/ko_KR.js"></script>

    <script type="text/javascript">
    $(function() {
		//입장 어른 인원
		for (var i = 1; i <= 20; i++) {
            $("#admission_adult").append("<option value='" + i + "'>" + i + "명</option>");
        }
		//입장 아이 인원
		for (var i = 1; i <= 20; i++) {
            $("#admission_child").append("<option value='" + i + "'>" + i + "명</option>");
        }
		//입장 Pet 마리
		for (var i = 1; i <= 20; i++) {
            $("#admission_pet").append("<option value='" + i + "'>" + i + "마리</option>");
        }

        // 달력 플러그인 사용
        $("#deposit_date, #filming_date").pickadate({
            /** 년,월 선택 버튼 표시 텍스트 */
            labelMonthNext: '다음달로 이동',
            labelMonthPrev: '이전달로 이동',
            labelMonthSelect: '월 선택',
            labelYearSelect: '년도 선택',
            selectMonths: true,
            selectYears: true,

            /** 날짜 형식 */
            format: 'yyyy-mm-dd', // 화면에 보이는 형식

            min: true,
            max: false,

            /** 선택 제한 */
            selectYears: 2, // 현재 년도 기준으로 앞으로 두개
            firstDay: 0 // 시작요일은 일요일로...
        });

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

        $.validator.addMethod("kor", function(value, element) {
            return this.optional(element) || /^[ㄱ-ㅎ가-힣]*$/i.test(value);
        });

        $.validator.addMethod("phone", function(value, element) {
            console.log(value);
            return this.optional(element) || /^01(?:0|1|[6-9])(?:\d{3}|\d{4})\d{4}$/i.test(value) || /^\d{2,3}\d{3,4}\d{4}$/i.test(value);
        });

        $.validator.addMethod("select", function(value, element) {
            console.log(element.selectedIndex)
            if (element.selectedIndex == 0) {
                return false;
            } else {
                return true;
            }

        });

        $("#bookingFrm").validate({
            rules: {
                user_name: {
                    required: true,
                    kor: true
                },

                user_hp: {
                    required: true,
                    phone: true
                },

                deposit_name: "required",

                deposit_date: {
                    required: true,
                    date: true
                },

                filming_date: {
                    required: true,
                    date: true
                },

                filming_time: "select",
                personal_agree: "required"
            },
            messages: {
                user_name: {
                    required: "성명을 입력하세요.",
                    kor: "성명을 한글로 입력하세요."
                },

                user_hp: {
                    required: "연락처를 입력하세요.",
                    phone: "연락처 형식이 잘못되었습니다."
                },

                deposit_name: "예약 입금자명을 입력하세요.",

                deposit_date: {
                    required: "예약 입금일을 선택하세요.",
                    date: "예약 입금일의 형식이 잘못되었습니다."
                },

                filming_date: {
                    required: "촬영 희망일을 선택하세요.",
                    date: "촬영 희망일의 형식이 잘못되었습니다."
                },

                filming_time: "촬영 희망 시간을 선택하세요.",
                personal_agree: "개인정보 수집 및 이용에 동의하셔야 예약 신청이 가능합니다."
            }
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
                <li><a href="/main.do">Home</a></li>
                <li class="active">SCHEDULE</li>
                <li class="active">예약하기</li>
            </ol>
        </div>
        <hr />
        <h3 class="title">예약하기</h3>
        <!-- 경로 및 해당 페이지 타이틀 끝 -->
		
		<!-- 내용 영역 -->
		<div class="content">
			<form name="bookingFrm" id="bookingFrm" method="post" action="${pageContext.request.contextPath}/schedule/booking_write_ok.do" class="form-horizontal" role="form">
                <fieldset>
                    <legend class="sr-only">예약하기</legend>
                    <!-- 입력양식 -->
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="user_name"><i class="glyphicon glyphicon-asterisk"></i> 성명</label>
                        <div class="col-md-10">
                            <input type="text" name="user_name" id="user_name" size="30" maxlength="4" class="form-control-2" placeholder="성명을 입력하세요." />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="user_hp"><i class="glyphicon glyphicon-asterisk"></i> 연락처</label>
                        <div class="col-md-10">
                            <input type="text" name="user_hp" id="user_hp" size="30" maxlength="12" class="form-control-2" placeholder="연락처를 '-'없이 입력하세요." />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="deposit_name"><i class="glyphicon glyphicon-asterisk"></i> 예약 입금자명</label>
                        <div class="col-md-10">
                            <input type="text" name="deposit_name" id="deposit_name" size="30" maxlength="4" class="form-control-2" placeholder="예약 입금자명을 입력하세요." />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="deposit_date"><i class="glyphicon glyphicon-asterisk"></i> 예약 입금일</label>
                        <div class="col-md-10">
                            <input type="text" name="deposit_date" id="deposit_date" size="10" class="form-control-2">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="pet_name">Pet 이름</label>
                        <div class="col-md-10">
                            <input type="text" name="pet_name" id="pet_name" size="30" maxlength="24" class="form-control-2" placeholder="Pet 이름을 입력하세요." />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="pet_gender">Pet 성별</label>
                        <div class="col-md-10">
                            <label class="radio-inline">
                                <input type="radio" name="pet_gender" id="pet_gender1" value="M" checked />숫컷</label>
                            <label class="radio-inline">
                                <input type="radio" name="pet_gender" id="pet_gender2" value="F" />암컷</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="pet_age">Pet 나이(개월)</label>
                        <div class="col-md-10">
                            <input type="text" name="pet_age" id="pet_age" size="30" maxlength="24" class="form-control-2" placeholder="Pet 나이(개월)를 입력하세요." />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="admission_pesonnel">입장 인원</label>
                        <div class="col-md-10"> 
                        	어른 : 
                        	<select name="admission_adult" id="admission_adult" class="form-control-2">
                                <option>인원</option>
                            </select>&nbsp;&nbsp;&nbsp;&nbsp;
							아이 :														
							<select name="admission_child" id="admission_child" class="form-control-2">
								<option>인원</option>
                            </select>&nbsp;&nbsp;&nbsp;&nbsp; 
                            Pet :												
							<select name="admission_pet" id="admission_pet" class="form-control-2">
								<option>마리</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="filming_date_time"><i class="glyphicon glyphicon-asterisk"></i> 촬영 희망일</label>
                        <div class="col-md-10">
                            <input type="text" name="filming_date" id="filming_date" size="10" class="form-control-2" />
                            <select name="filming_time" id="filming_time" class="form-control-2">
                                <option>시간</option>
                                <option value="10">오전 10시</option>
                                <option value="12">오전 12시</option>
                                <option value="14">오후 02시</option>
                                <option value="16">오후 04시</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="camera_rental">카메라 대여 여부</label>
                        <div class="col-md-10">
                            <label class="radio-inline">
                                <input type="radio" name="camera_rental" id="camera_rental1" value="Y" checked />예</label>
                            <label class="radio-inline">
                                <input type="radio" name="camera_rental" id="camera_rental2" value="N" />아니오</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="professional_filming">전문가 촬영 여부</label>
                        <div class="col-md-10">
                            <label class="radio-inline">
                                <input type="radio" name="professional_filming" id="professional_filming1" value="Y" checked />예</label>
                            <label class="radio-inline">
                                <input type="radio" name="professional_filming" id="professional_filming2" value="N" />아니오</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="question_content">문의 내용</label>
                        <div class="col-md-10">
                            <textarea rows="5" name="question_content" id="question_content" class="form-control" placeholder="내용을 입력하세요."></textarea>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-2 control-label" for="personal_agree">개인정보 수집 및 이용 동의</label>
                        <div class="col-md-10">
                            <label class="checkbox-inline">
                                <input type="checkbox" name="personal_agree" id="personal_agree" value="Y" />동의</label>
                            <div class="well well-sm personalinfo">
                                <dl>
                                    <dt>○ 개인정보의 수집 및 이용목적</dt>
                                    <dd>- 서비스 이용에 따른 본인식별, 실명확인, 가입의사 확인, 연령제한 서비스 이용</dd>
                                    <dd>- 고지사항 전달, 불만처리 의사소통 경로 확보, 물품배송 시 정확한 배송지 정보 확보</dd>
                                    <dd>- 신규 서비스 등 최신정보 안내 및 개인맞춤서비스 제공을 위한 자료</dd>
                                    <dd>- 기타 원활한 양질의 서비스 제공 등</dd>
                                    <dt>○ 수집하는 개인정보의 항목</dt>
                                    <dd>- 이름, 연락처, 그 외 선택항목</dd>
                                    <dt>○ 개인정보의 보유 및 이용기간</dt>
                                    <dd>- 원칙적으로 개인정보의 수집 또는 제공받은 목적 달성 시 지체 없이 파기합니다.</dd>
                                    <dd>- 다만, 원활한 서비스의 상담을 위해 상담 완료 후 내용을 3개월간 보유할 수 있으며 전자상거래에서의 소비자보호에 관한 법률 등 타법률에 의해 보존할 필요가 있는 경우에는 일정기간 보존합니다.</dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-12 text-right">
                            <button type="submit" class="btnBlue">예약 신청</button>
                            <button type="reset" class="btnLightRed">다시 작성</button>
                        </div>
                    </div>
                </fieldset>
            </form>
		</div>
		
		<%@ include file="/WEB-INF/inc/footer.jsp" %>
	</div>
</body>
</html>