package com.kh.auction.dao;
import java.util.List;

import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.HAucBean;
import com.kh.auction.model.HBean;
public interface HService {
	/*�ڷ�� ����*/
	public void insertBbs(BbsBean_sample bbsbean) throws Exception;

	/* �ڷ�� �� �Խù� ��*/
	public int getListCount() throws Exception;
	
	/* �ڷ�� ��ϰ� ����¡ */
	public List<BbsBean_sample> getBbsList(int page) throws Exception ;

	public void testIn(HBean hb) throws Exception;
	
	//��ǰ��� ok �޼ҵ�
	public void insertAuc(HAucBean ab) throws Exception;
	
	public String getdate() throws Exception;
	
	public String getconfuser(String user_id) throws Exception;
}
