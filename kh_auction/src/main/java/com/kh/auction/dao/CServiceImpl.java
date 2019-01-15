package com.kh.auction.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.CBean;

@Service("cService")
public class CServiceImpl implements CService {

	//Autowired �մ��� ������
	@Autowired
	private CDAOImpl choiDAO;
	
	//���� ����.
	@Override
	public void insertBbs(BbsBean_sample bbsbean) throws Exception {
		// TODO Auto-generated method stub
		choiDAO.insertBbs(bbsbean);
	}

	@Override
	public int getListCount() throws Exception {
		// TODO Auto-generated method stub
		return choiDAO.getListCount();
	}

	@Override
	public List<BbsBean_sample> getBbsList(int page) throws Exception {
		
		return choiDAO.getBbsList(page);
	}
	//���� ��. �����Ӱ� �ۼ��ϼ��� ������ ������ �˴ϴ�.
	public void testIn(CBean cb) throws Exception {
		choiDAO.testIn(cb);
	}
}
