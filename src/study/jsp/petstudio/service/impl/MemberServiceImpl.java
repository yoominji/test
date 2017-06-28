package study.jsp.petstudio.service.impl;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.petstudio.model.Member;
import study.jsp.petstudio.service.MemberService;

public class MemberServiceImpl implements MemberService {
	
	/** 처리 결과를 기록할 Log4J 객체 생성*/
	Logger logger;
	
	/** MyBatis */
	SqlSession sqlSession;
	
	/** 생성자를 통한 객체 생성*/
	public MemberServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public void selectUserIdCount(Member member) throws Exception {
		try {
			int result = sqlSession.selectOne("MemberMapper.selectUserIdCount", member);
			
			// 중복된 데이터가 존재한다면?
			if (result > 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("이미 사용중인 아이디 입니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("아이디 중복 검사에 실패했습니다.");
		}
	}

	@Override
	public void insertMember(Member member) throws Exception {
		
		// 아이디 중복검사 및 이메일 중복검사 호출
		selectUserIdCount(member);
		
		// 데이터 저장처리 = 가입
		// not null로 설정된 값이 설정되지 않았다면 예외발생됨
		try {
			int result = sqlSession.insert("MemberMapper.insertMember", member);
			
			if(result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 회원정보가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원가입에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public Member selectLoginInfo(Member member) throws Exception {
		Member result = null;
		
		try {
			result = sqlSession.selectOne("MemberMapper.selectLoginInfo", member);
	
			// 조회된 데이터가 없다는 것은 Where절 조건에 맞는 데이터가 없다는 것.
			// -> Where절은 아이디와 비밀번호가 일치하는 항목을 지정하므로,
			//	  조회된 데이터가 없다는 것은 아이디나 비밀번호가 잘못되었음을 의미한다.
			if(result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("아이디나 비밀번호가 잘못되었습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("로그인에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public Member selectMember(Member member) throws Exception {
		Member result = null;
		
		try {
			result = sqlSession.selectOne("MemberMapper.selectMember", member);
			if(result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 정보가 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원정보 조회에 실패했습니다.");
		}
		return result;
	}

	@Override
	public void selectMemberPasswordCount(Member member) throws Exception {
		try {
			int result = sqlSession.selectOne("MemberMapper.selectMemberPasswordCount", member);

			// 회원번호와 비밀번호가 일치하는 데이터가 0이라면, 비밀번호가 잘못된 상태
			if(result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("잘못된 비밀번호 입니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("비밀번호 검사에 실패했습니다.");
		}
		
	}

	@Override
	public void updateMember(Member member) throws Exception {
		try {
			int result = sqlSession.update("MemberMapper.updateMember", member);
			if(result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("변경된 회원정보가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원정보 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}		
		
	}

	@Override
	public Member selectAdminLogin(Member member) throws Exception {
		Member result = null;
		
		try {
			result = sqlSession.selectOne("MemberMapper.selectAdminLogin", member);
	
			// 조회된 데이터가 없다는 것은 Where절 조건에 맞는 데이터가 없다는 것.
			// -> Where절은 아이디와 비밀번호가 일치하는 항목을 지정하므로,
			//	  조회된 데이터가 없다는 것은 아이디나 비밀번호가 잘못되었음을 의미한다.
			if(result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("아이디나 비밀번호가 잘못되었습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("로그인에 실패했습니다.");
		}
		
		return result;
	}

	@Override
	public void updateMemberPw(Member member) throws Exception {
		try {
			int result = sqlSession.update("MemberMapper.updateMemberPw", member);
			if(result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("변경된 회원정보가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원정보 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}	
		
	}

	@Override
	public void updateMemberOut(Member member) throws Exception {
		try {
			int result = sqlSession.update("MemberMapper.updateMemberOut", member);
			if(result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("변경된 회원정보가 없습니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("회원정보 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
		
	}

	@Override
	public void updateMemberPasswordByEmail(Member member) throws Exception {
		try {
			int result = sqlSession.update("MemberMapper.updateMemberPasswordByEmail", member);
			// 수정된 행의 수가 없다는 것은 WHERE절 조건이 맞지 않기 떄문이다.
			// 즉, 입력한 이메일과 일치하는 데이터가 없다는 의미
			if(result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("가입된 이메일이 아닙니다..");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("비밀번호 변경에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}	
		
	}

	@Override
	public Member selectFindId(Member member) throws Exception {
		Member result = null;
		
		try {
			result = sqlSession.selectOne("MemberMapper.selectFindId", member);
			if(result == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 아이디가 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("아이디 조회에 실패했습니다.");
		}
		return result;
	}

}
