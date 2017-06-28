package study.jsp.petstudio.service;

import java.util.List;

import study.jsp.petstudio.model.BbsDocument;

public interface BbsDocumentService {
	/**
	 * 게시물을 저장한다.
	 * @param document - 게시물 데이터
	 * @throws Exception */
	public void insertDocument (BbsDocument document) throws Exception;
	
	/**
	 * 게시물을 수정한다.
	 * @param document - 게시물 데이터
	 * @throws Exception */
	public void updateDocument (BbsDocument document) throws Exception;
	
	/**
	 * 하나의 게시물을 읽어들인다.
	 * @param document - 읽어들일 게시물 일련번호가 저장된 Beans
	 * @param BbsDocument - 읽어들인 게시물 내용 
	 * @throws Exception */
	public BbsDocument selectDocument (BbsDocument document) throws Exception;
	
	/**
	 * 게시글 목록 조회
	 * @param document - 카테고리 정보가 저장된 Beans
	 * @return List - 게시물 목록
	 * @throws Exception */
	public List<BbsDocument> selectDocumentList(BbsDocument document) throws Exception;
	
	/**
	 * 게시글을 삭제한다
	 * @param document
	 * @throws Exception */
	public void deleteDocument (BbsDocument document) throws Exception;
}
