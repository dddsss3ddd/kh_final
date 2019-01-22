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
/*
@Component�� �̿��ؼ� ������ �����̳ʰ� �ش� Ŭ���� ��ü�� �����ϵ��� ������ �� ������
��� Ŭ������ @Component�� �Ҵ��ϸ� � Ŭ������ � ��Ȱ�� �����ϴ��� �ľ��ϱ�
��ƽ��ϴ�.������ �����ӿ�ũ������ �̷� Ŭ�������� �з��ϱ� ���ؼ�
@Component�� ����Ͽ� ������ ���� �� ���� �ֳ����̼��� �����մϴ�.

1.@Controller - ������� ��û�� �����ϴ� Controller Ŭ����
2.@Repository - ������ ���̽� ������ ó���ϴ� DAOŬ����
3.@Service -  ����Ͻ� ������ ó���ϴ� Service Ŭ����

 */
@Repository
public class HDAOImpl {

	//Autowired �մ��� ������
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//���� �޼���
	public void insertBbs(BbsBean_sample bbsbean) throws Exception{
		sqlSession.insert("bbs_insert",bbsbean);
	}
	
	public int getListCount() throws Exception{
		int count=((Integer)sqlSession.selectOne("bbs_count")).intValue();
		return count;
	}
	
	public List<BbsBean_sample> getBbsList(int page) throws Exception {
		List<BbsBean_sample> list=sqlSession.selectList("bbs_list",page);
		return list;
	}
	public void testIn(HBean hb) {
		sqlSession.insert("Han.t_in",hb);
	}
    //���� �� ���ô� ������ �˴ϴ�.

	//���� �����Ӱ� �ۼ��ϼ���
	
	public void insertAuc(HAucBean ab) {
		sqlSession.insert("insertAuc",ab);
	}
	
	public String getdate() {
		return sqlSession.selectOne("getdate");
	}

	public String getconfuser(String user_id) {
		return sqlSession.selectOne("getconfuser",user_id);
	}

	public void insertcons(HConsBean cb) {
		sqlSession.insert("insertcons", cb);
	}
	
	public List<HConsBean> getconslist() {
		return sqlSession.selectList("getconslist");
	}

	public int getconslistno() {
		return sqlSession.selectOne("getconslistno");
	}

	public HConsBean getconsdetail(int cons_no) {
		return sqlSession.selectOne("getconsdetail",cons_no);
	}
	
	
}
