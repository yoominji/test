package study.jsp.petstudio.controller.schedule;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import study.jsp.helper.BaseController;
import study.jsp.helper.RegexHelper;
import study.jsp.helper.WebHelper;
import study.jsp.petstudio.dao.MyBatisConnectionFactory;
import study.jsp.petstudio.model.Booking;
import study.jsp.petstudio.service.BookingService;
import study.jsp.petstudio.service.impl.BookingServiceImpl;

@WebServlet("/schedule/booking_write_ok.do")
public class BookingWriteOk extends BaseController {
	private static final long serialVersionUID = 1L;
	
	/* (1) 사용하고자 하는 Helper + Service 객체 선언 */
	Logger logger;
	SqlSession sqlSession;
	WebHelper web;
	RegexHelper regex;
	BookingService bookingService;

	@Override
	public String doRun(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/* (2) 사용하고자 하는 Helper+Service 객체 생성 */
		logger = LogManager.getFormatterLogger(request.getRequestURI());
		sqlSession = MyBatisConnectionFactory.getSqlSession();
		web = WebHelper.getInstance(request, response);
		bookingService = new BookingServiceImpl(sqlSession, logger);
		
		/* (3) 로그인 여부 검사 */
		// 로그인 중이 아니라면 이 페이지를 동작시켜서는 안된다.
		// ================================================ 프로그램 연결시 주석 해제 ==============================================
		/*if(web.getSession("loginInfo") == null) {
			web.redirect(web.getRootPath() + "/member/login.do", "예약 신청은 로그인 후 이용 가능합니다.");
			return null;
		}*/
		
		/* (4) 파라미터 받기 */
		// 입력값 받기
		String user_name = web.getString("user_name");
		String user_hp = web.getString("user_hp");
		String deposit_name = web.getString("deposit_name");
		String deposit_date = web.getString("deposit_date");
		String pet_name = web.getString("pet_name");
		String pet_gender = web.getString("pet_gender");
		String pet_age = web.getString("pet_age");
		Integer admission_adult = web.getInt("admission_adult");
		Integer admission_child = web.getInt("admission_child");
		Integer admission_pet = web.getInt("admission_pet");
		String filming_date = web.getString("filming_date");
		String filming_time = web.getString("filming_time");
		String camera_rental = web.getString("camera_rental");
		String professional_filming = web.getString("professional_filming");
		String question_content = web.getString("question_content");
		
		logger.debug("user_name" + user_name);
		logger.debug("user_hp" + user_hp);
		logger.debug("deposit_name" + deposit_name);
		logger.debug("deposit_date" + deposit_date);
		logger.debug("pet_name" + pet_name);
		logger.debug("pet_gender" + pet_gender);
		logger.debug("pet_age" + pet_age);
		logger.debug("admission_adult" + admission_adult);
		logger.debug("admission_child" + admission_child);
		logger.debug("admission_pet" + admission_pet);
		logger.debug("filming_date" + filming_date);
		logger.debug("filming_time" + filming_time);
		logger.debug("camera_rental" + camera_rental);
		logger.debug("professional_filming" + professional_filming);
		logger.debug("question_content" + question_content);
		
		// 유효성 검사
		if(user_name == null) {
			sqlSession.close();
			web.redirect(null, "성명을 입력하세요.");
			return null;
		}
		if(!regex.isKor(user_name)) {
			sqlSession.close();
			web.redirect(null, "성명은 한글만 입력 가능합니다.");
			return null;
		}
		if(user_name.length() < 2 || user_name.length() > 5) {
			sqlSession.close();
			web.redirect(null, "성명은 2~5글자 까지만 가능합니다.");
			return null;
		}
		// 연락처 검사
		if(!regex.isValue(user_hp)) {
			sqlSession.close();
			web.redirect(null, "연락처를 입력하세요.");
			return null;
		}
		if(!regex.isCellPhone(user_hp) && !regex.isTel(user_hp)) {
			sqlSession.close();
			web.redirect(null, "연락처의 형식이 잘못되었습니다.");
			return null;
		}
		if(deposit_name == null) {
			sqlSession.close();
			web.redirect(null, "예약 입금자명을 입력하세요.");
			return null;
		}
		if(deposit_name.length() > 5) {
			sqlSession.close();
			web.redirect(null, "예약 입금자명은 5글자 까지만 가능합니다.");
			return null;
		}
		if(deposit_date == null) {
			sqlSession.close();
			web.redirect(null, "예약 입금일을 선택하세요.");
			return null;
		}
		if(filming_date == null) {
			sqlSession.close();
			web.redirect(null, "촬영 희망일을 선택하세요.");
			return null;
		}
		if(filming_time == null) {
			sqlSession.close();
			web.redirect(null, "촬영 희망 시간을 선택하세요.");
			return null;
		}
		
		/* (5) 전달받은 파라미터를 Beans 객체에 담는다 */
		Booking booking = new Booking();
		booking.setUserName(user_name);
		booking.setTel(user_hp);
		booking.setDepositName(deposit_name);
		booking.setDepositDate(deposit_date);
		booking.setPetName(pet_name);
		booking.setPetGender(pet_gender);
		booking.setPetAge(pet_age);
		booking.setAdmissionAdult(admission_adult);
		booking.setAdmissionChild(admission_child);
		booking.setAdmissionPet(admission_pet);
		booking.setFilmingDate(filming_date);
		booking.setFilmingTime(filming_time);
		booking.setCameraRental(camera_rental);
		booking.setProfessionalFilming(professional_filming);
		booking.setQuestionContent(question_content);
		
		booking.setMemberId(1);
		/* ================================================ 프로그램 연결시 주석 해제 ==============================================
		Member loginInfo = (Member) web.getSession("loginInfo");
		memberId = loginInfo.getId();
		booking.setMemberId(memberId);*/
		
		/* (6) Service를 통한 데이터베이스 저장 처리 */
		try {
			bookingService.insertBooking(booking);
		} catch (Exception e) {
			sqlSession.close();
			web.redirect(null, e.getLocalizedMessage());
			// 예외가 발생한 경우이므로, 더이상 진행하지 않는다.
			return null;
		}
		
		/* (7) 예약신청 완료 후 예약현황로 이동 */
		sqlSession.close();
		web.redirect(web.getRootPath() + "/schedule/calendar.do", "예약신청이 완료되었습니다. 예약현황으로 이동 합니다.");
		
		return null;
	}

}
