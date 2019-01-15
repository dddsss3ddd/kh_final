package com.kh.auction.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.JBean;

@Service("jService")
public class JServiceImpl implements JService {

	//Autowired �մ��� ������
	@Autowired
	private JDAOImpl jungDAO;
	
	//���� ����.
	@Override
	public void insertBbs(BbsBean_sample bbsbean) throws Exception {
		// TODO Auto-generated method stub
		jungDAO.insertBbs(bbsbean);
	}

	@Override
	public int getListCount() throws Exception {
		// TODO Auto-generated method stub
		return jungDAO.getListCount();
	}

	@Override
	public List<BbsBean_sample> getBbsList(int page) throws Exception {
		
		return jungDAO.getBbsList(page);
	}
	//���� ��. �����Ӱ� �ۼ��ϼ��� ������ ������ �˴ϴ�.

	@Override
	public void testIn(JBean jb) throws Exception {
		// TODO Auto-generated method stub
		jungDAO.testIn(jb);
	}
	
}
