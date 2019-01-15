package com.kh.auction.dao;
import java.util.List;
import java.util.Map;

import com.kh.auction.model.BbsBean_sample;
public interface BbsService_sample {
	/*�ڷ�� ����*/
	public void insertBbs(BbsBean_sample bbsbean) throws Exception;

	/* �ڷ�� �� �Խù� ��*/
	public int getListCount() throws Exception;
	
	/* �ڷ�� ��ϰ� ����¡ */
	public List<BbsBean_sample> getBbsList(int page) throws Exception ;

	/*��ȣ�� �������� �ڷ�� ���� �������� */
	public BbsBean_sample getBbsCont(int num) throws Exception;

	/*���뺸�� �Ҷ��� ��ȸ�� ����*/
	public void bbsHit(int num) throws Exception;

	/*�ڷ�� ����*/
	public void editBbs(BbsBean_sample bbsbean) throws Exception;

	/*�ڷ�� ����*/
	public void deleteBbs(int bbs_num) throws Exception;

	/*�˻� ��� �Խù� ��*/
//	public int getListCount3(String find_name,String find_field) throws SQLException{
	public int getListCount3(Map m) throws Exception;

	/*�˻� ��� ����¡ ���*/
	public List<BbsBean_sample> getBbsList3(Map m) throws Exception ;

	/*�亯�� ���� ����*/
	public void refEdit(BbsBean_sample bbsbean) throws Exception;

	/*�亯�� ����*/
	public void bbsReplyOk(BbsBean_sample bbsbean) throws Exception;
}
