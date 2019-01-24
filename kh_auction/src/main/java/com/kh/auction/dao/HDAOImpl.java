package com.kh.auction.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.HAucBean;
import com.kh.auction.model.HBean;
import com.kh.auction.model.HConsBean;
import com.kh.auction.model.HConsUpgradeBean;
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
public class HDAOImpl {

	//Autowired 손대지 마세요
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//예시 메서드
	public void insertBbs(BbsBean_sample bbsbean) throws Exception{
		sqlSession.insert("Han.bbs_insert",bbsbean);
	}
	
	public int getListCount() throws Exception{
		int count=((Integer)sqlSession.selectOne("Han.bbs_count")).intValue();
		return count;
	}
	
	public List<BbsBean_sample> getBbsList(int page) throws Exception {
		List<BbsBean_sample> list=sqlSession.selectList("Han.bbs_list",page);
		return list;
	}
	public void testIn(HBean hb) {
		sqlSession.insert("Han.t_in",hb);
	}
    //예시 끝 예시는 지워도 됩니다.

	//이하 자유롭게 작성하세요
	
	public void insertAuc(HAucBean ab) {
		sqlSession.insert("Han.insertAuc",ab);
	}
	
	public String getdate() {
		return sqlSession.selectOne("Han.getdate");
	}

	public String getconfuser(String user_id) {
		return sqlSession.selectOne("Han.getconfuser",user_id);
	}

	public void insertcons(HConsBean cb) {
		sqlSession.insert("Han.insertcons", cb);
	}
	
	public List<HConsBean> getconslist() {
		return sqlSession.selectList("Han.getconslist");
	}

	public int getconslistno() {
		return sqlSession.selectOne("Han.getconslistno");
	}

	public HConsBean getconsdetail(int cons_no) {
		return sqlSession.selectOne("Han.getconsdetail",cons_no);
	}

	public String getdate_cons(int cons_no) {
		return sqlSession.selectOne("Han.getdate_cons", cons_no);
	}

	public int consdel(int cons_no) {
		return sqlSession.delete("Han.consdel", cons_no);
	}

	public void consdataupdate(HConsUpgradeBean cub) {
		sqlSession.update("Han.consdataupdate", cub);
	}

	public HConsUpgradeBean consupdatereturn(HConsUpgradeBean cub) {
		return sqlSession.selectOne("Han.consupdatereturn",cub.getCons_no());
	}
}
