package study.jsp.petstudio.service;

import study.jsp.petstudio.model.BbsFile;

public interface BbsFileService {
	/**
	 * 파일 정보를 저장한다. 
	 * @param file - 파일 데이터 
	 * @throws Exception */
	public void insertFile(BbsFile file) throws Exception;
}
