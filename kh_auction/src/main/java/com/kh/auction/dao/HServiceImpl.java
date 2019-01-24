package com.kh.auction.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.HAucBean;
import com.kh.auction.model.HBean;
import com.kh.auction.model.HConsBean;
import com.kh.auction.model.HConsUpgradeBean;

@Service("hService")
public class HServiceImpl implements HService {

	//Autowired 손대지 마세요
	@Autowired
	private HDAOImpl hanDAO;
	
	//이하 샘플.
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
	//샘플 끝. 자유롭게 작성하세요 셈플은 지워도 됩니다.

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

	@Override
	public void insertcons(HConsBean cb) throws Exception {
		hanDAO.insertcons(cb);
		
	}

	@Override
	public List<HConsBean> getconslist() throws Exception {
		return hanDAO.getconslist();
	}

	@Override
	public int getconslistno() throws Exception {
		int instno = hanDAO.getconslistno();
		
		return (instno-1)/6 + 1 ;
	}

	@Override
	public HConsBean getconsdetail(int cons_no) throws Exception {
		return hanDAO.getconsdetail(cons_no);
	}

	@Override
	public String getdate_cons(int cons_no) throws Exception {
		return hanDAO.getdate_cons(cons_no);
	}

	@Override
	public int consdel(int cons_no) throws Exception {
		return hanDAO.consdel(cons_no);
	}

	@Override
	public void consdataupdate(HConsUpgradeBean cub) throws Exception {
		hanDAO.consdataupdate(cub);
	}

	@Override
	public HConsUpgradeBean consupdatereturn(HConsUpgradeBean cub) throws Exception {
		return hanDAO.consupdatereturn(cub);
	}
}
