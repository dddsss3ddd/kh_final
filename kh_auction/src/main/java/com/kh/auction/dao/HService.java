package com.kh.auction.dao;
import java.util.List;

import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.HAucBean;
import com.kh.auction.model.HBean;
import com.kh.auction.model.HConsBean;
import com.kh.auction.model.HConsUpgradeBean;
public interface HService {
	/*자료실 저장*/
	public void insertBbs(BbsBean_sample bbsbean) throws Exception;

	/* 자료실 총 게시물 수*/
	public int getListCount() throws Exception;
	
	/* 자료실 목록과 페이징 */
	public List<BbsBean_sample> getBbsList(int page) throws Exception ;

	public void testIn(HBean hb) throws Exception;
	
	//상품등록 ok 메소드
	public void insertAuc(HAucBean ab) throws Exception;
	
	public String getdate() throws Exception;
	
	public String getconfuser(String user_id) throws Exception;
	
	public void insertcons(HConsBean cb) throws Exception;
	
	public List<HConsBean> getconslist() throws Exception;

	public int getconslistno() throws Exception;

	public HConsBean getconsdetail(int cons_no) throws Exception;

	public String getdate_cons(int cons_no) throws Exception;

	public int consdel(int cons_no) throws Exception;

	public void consdataupdate(HConsUpgradeBean cub) throws Exception;

	public HConsUpgradeBean consupdatereturn(HConsUpgradeBean cub) throws Exception;
	
}
