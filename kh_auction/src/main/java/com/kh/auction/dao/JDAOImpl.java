package com.kh.auction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.JBean;
/*
@Component를 이용해서 스프링 컨테이너가 해당 클래스 객체를 생성하도록 설정할 수 있지만
모든 클래스에 @Component를 할당하면 어떤 클래스가 어떤 역활을 수행하는지 파악하기
어렵습니다.스프링 프레임워크에서는 이런 클래스들을 분류하기 위해서
@Component를 상속하여 다음과 같은 세 개의 애노테이션을 제공합니다.

1.@Controller - 사용자의 요청을 제어하는 Controller 클래스
2.@Repository - 데이터 베이스 연동을 처리하는 DAO클래스
3.@Service -  비즈니스 로직을 처리하는 Service 클래스

 */
@Repository
public class JDAOImpl {

	//Autowired 손대지 마세요
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//예시 메서드
	public void insertBbs(BbsBean_sample bbsbean) throws Exception{
		sqlSession.insert("Jung.bbs_insert",bbsbean);
	}
	
	//자료실 총 게시물 수
	public int getListCount() throws Exception{
		int count=((Integer)sqlSession.selectOne("Jung.bbs_count")).intValue();
		return count;
	}
	
	public List<BbsBean_sample> getBbsList(int page) throws Exception {
		List<BbsBean_sample> list=sqlSession.selectList("Jung.bbs_list",page);
		return list;
	}
	
	public void testIn(JBean jb) {
		sqlSession.insert("Jung.t_in",jb);
	}
    //예시 끝 예시는 지워도 됩니다.

	//이하 자유롭게 작성하세요
	
	
}
