package com.kh.auction.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.auction.model.BbsBean;

@Service("boardService")
public class BbsServiceImpl implements BbsService{
	/*
	3���� DAO ������ ������, ���� �ش�Ǵ� DAO ������ �������� ���� @Repository�� �ٿ��ָ� �ȴ�.
	�̷��� DAO ������ �ٲ� ���⼭ �޼ҵ�� �ǵ帮�� �ʰ� Ŭ���� ���� �ٲپ� �ֵ��� �Ѵ�.
	 */
	
	@Autowired
	private BbsDAOImpl bbsDAO;
	//private BbsDAOImpol_old bbsDAO;
	//private BbsDAO_jdbc bbsDAO;
	
	@Override
	public void insertBbs(BbsBean bbsbean) throws Exception {
		// TODO Auto-generated method stub
		bbsDAO.insertBbs(bbsbean);
	}

	@Override
	public int getListCount() throws Exception {
		// TODO Auto-generated method stub
		return bbsDAO.getListCount();
	}

	@Override
	public List<BbsBean> getBbsList(int page) throws Exception {
		
		return bbsDAO.getBbsList(page);
	}

	@Override
	public BbsBean getBbsCont(int num) throws Exception {
		return bbsDAO.getBbsCont(num);
	}

	@Override
	public void bbsHit(int num) throws Exception {
		bbsDAO.bbsHit(num);
	}

	@Override
	public void editBbs(BbsBean bbsbean) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteBbs(int bbs_num) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getListCount3(Map m) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<BbsBean> getBbsList3(Map m) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void refEdit(BbsBean bbsbean) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void bbsReplyOk(BbsBean bbsbean) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
}