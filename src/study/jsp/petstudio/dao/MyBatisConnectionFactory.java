package study.jsp.petstudio.dao;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

/** 
 * 1) config.xml파일을 읽어들여서 그 안에 명시된 정보로 데이터베이스 접속을 자동 수행.
 * 2) ~~Mapper.xml 파일을 해석해서 자바 클래스를 자동 생성.
 */
public class MyBatisConnectionFactory {
	/** 데이터베이스 접속 객체*/
	private static SqlSessionFactory sqlSessionFactory;
	
	/** XML에 명시된 접속 정보를 읽어들인다.*/
	static {
		try {
			// 접속 정보를 명시하고 있는 XML의 경로 읽기
			Reader reader = Resources.getResourceAsReader("study/jsp/petstudio/dao/config.xml");
			
			if(sqlSessionFactory == null) {
				sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
			}
		} catch (FileNotFoundException e){
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/** 데이터베이스 접속 객체를 리턴한다.*/
	public static SqlSession getSqlSession() {
		return sqlSessionFactory.openSession();
	}
}
