package com.kh.auction.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.JBean;
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
public class JDAOImpl {

	//Autowired �մ��� ������
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//���� �޼���
	public void insertBbs(BbsBean_sample bbsbean) throws Exception{
		sqlSession.insert("Jung.bbs_insert",bbsbean);
	}
	
	//�ڷ�� �� �Խù� ��
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
    //���� �� ���ô� ������ �˴ϴ�.

	//���� �����Ӱ� �ۼ��ϼ���
	
	
}
