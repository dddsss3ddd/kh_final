package com.kh.auction.dao;
import java.util.List;

import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.JBean;
public interface JService {
	/*�ڷ�� ����*/
	public void insertBbs(BbsBean_sample bbsbean) throws Exception;

	/* �ڷ�� �� �Խù� ��*/
	public int getListCount() throws Exception;
	
	/* �ڷ�� ��ϰ� ����¡ */
	public List<BbsBean_sample> getBbsList(int page) throws Exception ;

	public void testIn(JBean jb) throws Exception;
}
