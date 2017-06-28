package study.jsp.petstudio.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.logging.log4j.Logger;

import study.jsp.petstudio.model.BbsDocument;
import study.jsp.petstudio.service.BbsDocumentService;

public class BbsDocumentServiceImpl implements BbsDocumentService{
	/** 처리 결과를 기록할 Log4j 객체 생성 */
	Logger logger;
	/** MyBatis */
	SqlSession sqlSession;
	/** 생성자를 통한 객체 생성 */
	public BbsDocumentServiceImpl(SqlSession sqlSession, Logger logger) {
		this.sqlSession = sqlSession;
		this.logger = logger;
	}
	
	@Override
	public void insertDocument(BbsDocument document) throws Exception {
		try {
			int result = sqlSession.insert("BbsDocumentMapper.insertDocument", document);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("저장된 게시물이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 등록에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public void updateDocument(BbsDocument document) throws Exception {
		try {
			int result = sqlSession.update("BbsDocumentMapper.updateDocument", document);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			sqlSession.rollback();
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		} catch (Exception e) {
			sqlSession.rollback();
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 수정에 실패했습니다.");
		} finally {
			sqlSession.commit();
		}
	}

	@Override
	public BbsDocument selectDocument(BbsDocument document) throws Exception {
		BbsDocument item = null;
		
		try {
			item = sqlSession.selectOne("BbsDocumentMapper.selectDocument",document);
			if (item == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 게시물이 없습니다.");
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 조회에 실패했습니다.");
		}
		return item;
	}

	@Override
	public List<BbsDocument> selectDocumentList(BbsDocument document) 
			throws Exception {
		List<BbsDocument> list = null;
		
		try {
			list = sqlSession.selectList("BbsDocumentMapper.selectDocumentList", document);
			if (list == null) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			throw new Exception("조회된 글 목록이 없습니다.");
		} catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시글 목록 조회에 실패했습니다.");
		}
		return list;
	}

	@Override
	public void deleteDocument(BbsDocument document) throws Exception {
		try {
			int result = sqlSession.delete("BbsDocumentMapper.deleteDocument", document);
			if (result == 0) {
				throw new NullPointerException();
			}
		} catch (NullPointerException e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("존재하지 않는 게시물에 대한 요청입니다.");
		}catch (Exception e) {
			logger.error(e.getLocalizedMessage());
			throw new Exception("게시물 삭제에 실패했습니다.");
		}finally {
			sqlSession.commit();
		}
	}
}
