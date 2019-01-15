package com.kh.auction.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.KBean;
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
public class KDAOImpl {

	//Autowired �մ��� ������
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	//���� �޼���
	public void insertBbs(BbsBean_sample bbsbean) throws Exception{
		sqlSession.insert("Kim.bbs_insert",bbsbean);
	}
	
	//�ڷ�� �� �Խù� ��
	public int getListCount() throws Exception{
		int count=((Integer)sqlSession.selectOne("Kim.bbs_count")).intValue();
		return count;
	}
	
	public List<BbsBean_sample> getBbsList(int page) throws Exception {
		List<BbsBean_sample> list=sqlSession.selectList("Kim.bbs_list",page);
		return list;
	}
	
	public void testIn(KBean kb) {
		sqlSession.insert("Kim.t_in",kb);
	}
	
    //���� �� ���ô� ������ �˴ϴ�.

	//���� �����Ӱ� �ۼ��ϼ���
	
	
}
