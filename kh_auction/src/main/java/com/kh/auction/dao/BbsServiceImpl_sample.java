package com.kh.auction.dao;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.auction.model.BbsBean_sample;

@Service("boardService")
public class BbsServiceImpl_sample implements BbsService_sample{
	/*
	3개의 DAO 파일이 있을때, 각자 해당되는 DAO 파일을 가져오기 위해 @Repository를 붙여주면 된다.
	이렇게 DAO 파일이 바뀌어도 여기서 메소드는 건드리지 않고 클래스 명만 바꾸어 주도록 한다.
	 */
	
	@Autowired
	private BbsDAOImpl_sample bbsDAO;
	//private BbsDAOImpol_old bbsDAO;
	//private BbsDAO_jdbc bbsDAO;
	
	@Override
	public void insertBbs(BbsBean_sample bbsbean) throws Exception {
		// TODO Auto-generated method stub
		bbsDAO.insertBbs(bbsbean);
	}

	@Override
	public int getListCount() throws Exception {
		// TODO Auto-generated method stub
		return bbsDAO.getListCount();
	}

	@Override
	public List<BbsBean_sample> getBbsList(int page) throws Exception {
		
		return bbsDAO.getBbsList(page);
	}

	@Override
	public BbsBean_sample getBbsCont(int num) throws Exception {
		return bbsDAO.getBbsCont(num);
	}

	@Override
	public void bbsHit(int num) throws Exception {
		bbsDAO.bbsHit(num);
	}

	@Override
	public void editBbs(BbsBean_sample bbsbean) throws Exception {
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
	public List<BbsBean_sample> getBbsList3(Map m) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void refEdit(BbsBean_sample bbsbean) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void bbsReplyOk(BbsBean_sample bbsbean) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	
}
