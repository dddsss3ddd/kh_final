package com.kh.auction.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.KBean;

@Service("kService")
public class KServiceImpl implements KService {

	//Autowired 손대지 마세요
	@Autowired
	private KDAOImpl kimDAO;
	
	//이하 샘플.
	@Override
	public void insertBbs(BbsBean_sample bbsbean) throws Exception {
		// TODO Auto-generated method stub
		kimDAO.insertBbs(bbsbean);
	}

	@Override
	public int getListCount() throws Exception {
		// TODO Auto-generated method stub
		return kimDAO.getListCount();
	}

	@Override
	public List<BbsBean_sample> getBbsList(int page) throws Exception {
		
		return kimDAO.getBbsList(page);
	}
	//샘플 끝. 자유롭게 작성하세요 셈플은 지워도 됩니다.
	
	@Override
	public void testIn(KBean kb) {
		kimDAO.testIn(kb);
	}
}
