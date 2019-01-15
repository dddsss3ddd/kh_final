package com.kh.auction.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.HAucBean;
import com.kh.auction.model.HBean;

@Service("hService")
public class HServiceImpl implements HService {

	//Autowired �մ��� ������
	@Autowired
	private HDAOImpl hanDAO;
	
	//���� ����.
	@Override
	public void insertBbs(BbsBean_sample bbsbean) throws Exception {
		// TODO Auto-generated method stub
		hanDAO.insertBbs(bbsbean);
	}

	@Override
	public int getListCount() throws Exception {
		// TODO Auto-generated method stub
		return hanDAO.getListCount();
	}

	@Override
	public List<BbsBean_sample> getBbsList(int page) throws Exception {
		
		return hanDAO.getBbsList(page);
	}
	//���� ��. �����Ӱ� �ۼ��ϼ��� ������ ������ �˴ϴ�.

	@Override
	public void testIn(HBean hb) throws Exception {
		// TODO Auto-generated method stub
		hanDAO.testIn(hb);
	}
	
	public void insertAuc(HAucBean ab) {
		hanDAO.insertAuc(ab);
	}

	@Override
	public String getdate() throws Exception {
		return hanDAO.getdate();
	}

	@Override
	public String getconfuser(String user_id) throws Exception {
		return hanDAO.getconfuser(user_id);
	}
	
	
}
