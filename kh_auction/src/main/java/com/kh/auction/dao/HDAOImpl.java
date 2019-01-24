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
    //���� �� ���ô� ������ �˴ϴ�.

	//���� �����Ӱ� �ۼ��ϼ���
	
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
