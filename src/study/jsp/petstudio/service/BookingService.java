package study.jsp.petstudio.service;

import java.util.List;

import study.jsp.petstudio.model.Booking;

public interface BookingService {
	/*
	 * 예약 저장
	 * @param booking - 예약 데이터
	 * @throws Exception
	 * */
	public void insertBooking(Booking booking) throws Exception; 
	
	/*
	 * 예약 수정
	 * @param booking - 예약 데이터
	 * @throws Exception
	 * */
	public void updateBooking(Booking booking) throws Exception;
	
	/*
	 * 예약 삭제
	 * @param booking
	 * @throws Exception
	 * */
	public void deleteBooking(Booking booking) throws Exception;
	
	/*
	 * 하나의 예약을 읽어들인다.
	 * @param booking - 읽어들인 예약 일련번호가 저장된 Beans
	 * @return Booking - 읽어들인 예약 내용
	 * @throws Exception
	 * */
	public Booking selectBooking(Booking booking) throws Exception;
	
	/*
	 * 예약 날짜별 조회
	 * @param booking - 예약일자 정보가 저장된 Beans
	 * @return List - 예약 목록
	 * @throws Exception
	 * */
	public List<Booking> selectBookingDate(Booking booking) throws Exception;

}
