package study.jsp.petstudio.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.petstudio.model.Booking;
import study.jsp.petstudio.service.BookingService;

public class BookingServiceImpl implements BookingService {
	
	/* 처리 결과를 기록할 Log4J 객체 생성 */
	Logger logger;
	
	/* MyBatis */
	SqlSession sqlSession;
	
	/* 생성자를 통한 객체 생성 */
	public BookingServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}

	@Override
	public void insertBooking(Booking booking) throws Exception {
		try {
			int result = sqlSession.insert("BookingMapper.insertBooking", booking);
			if(result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("신청된 예약이 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("예약 신청에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}		
	}

	@Override
	public void updateBooking(Booking booking) throws Exception {
		try {
			int result = sqlSession.update("BookingMapper.updateBooking", booking);
			if(result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 예약에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("예약 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}		
	}

	@Override
	public void deleteBooking(Booking booking) throws Exception {
		try {
			int result = sqlSession.delete("BookingMapper.deleteBooking", booking);
			if(result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 예약에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("예약 삭제에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}		
	}

	@Override
	public Booking selectBooking(Booking booking) throws Exception {
		Booking result = null;
		
		try {
			result = sqlSession.selectOne("BookingMapper.selectBooking", booking);
			if(result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 예약이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("예약 조회에 실패했습니다.");
		}		
		
		return result;
	}

	@Override
	public List<Booking> selectBookingDate(Booking booking) throws Exception {
		List<Booking> result = null;
		
		try {
			result = sqlSession.selectList("BookingMapper.selectBookingDate", booking);
			if(result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 예약 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("예약 목록 조회에 실패했습니다.");
		}
		return result;
	}

}
