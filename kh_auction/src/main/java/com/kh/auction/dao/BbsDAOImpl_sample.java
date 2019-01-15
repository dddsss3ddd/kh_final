package com.kh.auction.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.auction.model.BbsBean;
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
public class BbsDAOImpl {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//�ڷ�� ����
	public void insertBbs(BbsBean bbsbean) throws Exception{
		sqlSession.insert("bbs_insert",bbsbean);
	}
	
	//�ڷ�� �� �Խù� ��
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
