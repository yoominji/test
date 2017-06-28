package study.jsp.petstudio.controller.bbs;

public class BBSCommon {
	// 싱글톤 객체 생성 시작
	private static BBSCommon current = null;

	public static BBSCommon getInstance() {
		if (current == null) {
			current = new BBSCommon();
		}
		return current;
	}

	public static void freeInstatnce() {
		current = null;
	}

	private BBSCommon() {
		super();
	}

	// 싱글톤 객체 끝

	/**
	 * 카테고리 값을 추출하여 허용된 게시판인지 판별한다. 허용된 게시판일 경우 게시판의 이름을 리턴. 그렇지 않을 경우 예외를
	 * 발생시킨다.
	 * 
	 * @param category
	 * @return 게시판 이름
	 * @throws Exception
	 */
	public String getBbsName(String bbsType) throws Exception {
		// 리턴할 게시판 이름
		String bbsName = null;

		// 카테고리값이 존재할 경우 게시판 이름 판별
		if (bbsType != null) {
			if (bbsType.equals("notice")) {
				bbsName = "공지사항";
			} else if (bbsType.equals("gallery")) {
				bbsName = "갤러리";
			} else if (bbsType.equals("qna")) {
				bbsName = "질의응답";
			}
		}

		// 생성된 게시판 이름이 없다면 예외를 발생시킨다.
		if (bbsName == null) {
			throw new Exception("존재하지 않는 게시판입니다.");
		}

		return bbsName;
	}

	public String getBbsCategoryName(String category) throws Exception {
		// 리턴할 카테고리 이름
		String bbsCategoryName = null;

		if (category != null) {
			if (category.equals("dog")) {
				bbsCategoryName = "DOG";
			} else if (category.equals("cat")) {
				bbsCategoryName = "CAT";
			} else if (category.equals("celeb")) {
				bbsCategoryName = "CELEB";
			} else if (category.equals("clothes")) {
				bbsCategoryName = "clothes";
			}
		}

		// 생성된 카테고리 이름이 없다면 예외를 발생시킨다.
		if (bbsCategoryName == null) {
			throw new Exception("존재하지 않는 카테고리입니다.");
		}

		return bbsCategoryName;
	}
}
