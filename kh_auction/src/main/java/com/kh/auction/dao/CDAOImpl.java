package com.kh.auction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.CBean;
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
public class CDAOImpl {

	//Autowired �մ��� ������
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//���� �޼���
	public void insertBbs(BbsBean_sample bbsbean) throws Exception{
		sqlSession.insert("Choi.bbs_insert",bbsbean);
	}
	
	//�ڷ�� �� �Խù� ��
	public int getListCount() throws Exception{
		int count=((Integer)sqlSession.selectOne("Choi.bbs_count")).intValue();
		return count;
	}
	
	public List<BbsBean_sample> getBbsList(int page) throws Exception {
		List<BbsBean_sample> list=sqlSession.selectList("Choi.bbs_list",page);
		return list;
	}
	public void testIn(CBean cb) {
		sqlSession.insert("Choi.t_in",cb);
	}
    //���� �� ���ô� ������ �˴ϴ�.

	//���� �����Ӱ� �ۼ��ϼ���
	
	
}
