package com.kh.auction.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.auction.model.BbsBean;
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
public class BbsDAOImpl {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//자료실 저장
	public void insertBbs(BbsBean bbsbean) throws Exception{
		sqlSession.insert("bbs_insert",bbsbean);
	}
	
	//자료실 총 게시물 수
	public int getListCount() throws Exception{
		int count=((Integer)sqlSession.selectOne("bbs_count")).intValue();
		return count;
	}
	
	public List<BbsBean> getBbsList(int page) throws Exception {
		List<BbsBean> list=sqlSession.selectList("bbs_list",page);
		return list;
	}


	public BbsBean getBbsCont(int num) throws Exception {
		return sqlSession.selectOne("bbs_cont",num);
	}

	public void bbsHit(int num) throws Exception {
		sqlSession.update("bbs_hit",num);
	}

	public void editBbs(BbsBean bbsbean) throws Exception {
		
		
	}

	public void deleteBbs(int bbs_num) throws Exception {
		
		
	}

	public int getListCount3(Map m) throws Exception {
		
		return 0;
	}

	public List<BbsBean> getBbsList3(Map m) throws Exception {
		
		return null;
	}

	public void refEdit(BbsBean bbsbean) throws Exception {
		
		
	}

	public void bbsReplyOk(BbsBean bbsbean) throws Exception {
		
	}
}
