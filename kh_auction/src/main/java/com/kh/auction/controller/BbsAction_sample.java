package com.kh.auction.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.auction.dao.BbsService;
import com.kh.auction.model.BbsBean;

@Controller
public class BbsAction3 {
	
	@Autowired
	private BbsService bbsService;
	
	private String saveFolder="D:\\spring_work\\Spring6_MVC_Bbs\\src\\main\\webapp\\resources\\upload";
	
	/*�ڷ�� �Է� ��*/
	@RequestMapping(value="bbs_write.nhn")
	public String bbs_write() {
		return "bbs/bbs_write"; //bbs ������ bbs_write.jsp ��
	}
	
	@RequestMapping(value="/bbs_write_ok.nhn",method=RequestMethod.POST)
	public String bbs_write_ok(BbsBean bbsbean) throws Exception{
		MultipartFile uploadfile=bbsbean.getUploadfile();
		
		if(!uploadfile.isEmpty()) {
			//���� ���ϸ� ���ؿ���
			String fileName = uploadfile.getOriginalFilename();
			
			//���� ���ϸ� ����
			bbsbean.setBbs_original(fileName);
			
			//DB�� ������ ���ϸ� ���ؿ´�.
			String fileDBName = getFileDBName(fileName);
			
			//transferTo(File path) : ���ε��� ������ �Ű������� ��ο� �����Ѵ�.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			
			//�ٲ� ���ϸ����� ����
			bbsbean.setBbs_file(fileDBName);
		}
		
		this.bbsService.insertBbs(bbsbean); //���� �޼��� ȣ��
		
		return "redirect:bbs_list.nhn";
	}
	
	private String getFileDBName(String fileName) throws Exception{
		Calendar c=Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		int date = c.get(Calendar.DATE);
		String homedir = saveFolder+"/"+year+"-"+month+"-"+date;
		
		//homedir�� file ��ü ����
		File path1 = new File(homedir);
		
		if(!path1.isFile()) {
			System.out.println("������ �������� �ʽ��ϴ�.");
		}
		if(!(path1.exists())) {
			System.out.println("���� �����.");
			path1.mkdir();//���ο� ������ ����
		}
		
		//������ ���Ѵ�.
		Random r=new Random();
		int random=r.nextInt(100000000);
		
		/******Ȯ���� ���ϱ� ����******/
		int index = fileName.lastIndexOf(".");
		//���ڿ����� Ư�� ���ڿ��� ��ġ ��(index)�� ��ȯ�Ѵ�.
		//indexOf�� ó�� �߰ߵǴ� ���ڿ��� ���� index�� ��ȯ�ϴ� �ݸ�
		//lastIndexOf�� ���������� �߰ߵǴ� ���ڿ��� index�� ��ȯ�Ѵ�.
		//(���ϸ� ���� ������ ���� ��� �Ǹ������� �߰ߵǴ� ���ڿ��� ��ġ�� �����Ѵ�.)
		System.out.println("index="+index);
		
		String fileExtension = fileName.substring(index+1);
		System.out.println("fileExtension = " + fileExtension);
		/****Ȯ���� ���ϱ� ��****/
		
		//���ο� ���ϸ��� �����.
		String refileName="bbs"+year+month+date+random+"."+fileExtension;
		System.out.println("refileName = " + refileName);
		
		//����Ŭ BD�� ����� ��
		String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
		System.out.println("fileDBName = " + fileDBName);
		
		return fileDBName;
	}
	
	/* �ڷ�� ���� */
	//@RequestMapping(value="/bbs_delete_ok.nhn",method=RequestMethod.POST)
	//public ModelAcdView bbs_delete_ok()
	
	
	@RequestMapping(value="/bbs_list.nhn",method={RequestMethod.POST, RequestMethod.GET})
public ModelAndView bbs_list(@RequestParam(value="page",defaultValue="1") int page) throws Exception{
		
		System.out.println(page);
		List<BbsBean> bbslist=new ArrayList<BbsBean>();
		
		//�ʱ�ȭ
		int limit=10; //�� ȭ�鿡 ����� ���ڵ� ����
		int listcount=bbsService.getListCount();//�� ����Ʈ���� ����

		//�� ������ ��
		int maxpage=(listcount+limit-1)/limit;
		
		//���� �������� ������ ���� ������ ��(1,11,21��...)
		int startpage=((page-1)/10)*10+1;
		
		//���� �������� ������ ������ ��������(10,20,30��...)
		int endpage=startpage+10-1;
		
		if(endpage>maxpage) endpage=maxpage;
		
		bbslist=bbsService.getBbsList(page); //����Ʈ�� �޾ƿ�
		
		System.out.println("����Ʈ 0������ �����̸� ���?"+bbslist.get(0).getBbs_name());
		
		ModelAndView bbsListM=new ModelAndView("bbs/bbs_list");
		bbsListM.addObject("page",page);
		bbsListM.addObject("maxpage",maxpage);
		bbsListM.addObject("startpage",startpage);
		bbsListM.addObject("endpage",endpage);
		bbsListM.addObject("listcount",listcount);
		bbsListM.addObject("bbslist",bbslist);
		return bbsListM;
	}
	//getBbsCont
	
	@RequestMapping(value="/bbs_cont.nhn") 
	 public ModelAndView bbs_cont(
	 
	 @RequestParam("bbs_num") int bbs_num,
	 @RequestParam("page") int page,
	 @RequestParam("state") String state
	 )throws Exception{
		 if(state.equals("cont")) {//���� ���� �϶���
			 bbsService.bbsHit(bbs_num);
		 }
	 
		 BbsBean bbs=bbsService.getBbsCont(bbs_num);
	 
		 ModelAndView contM=new ModelAndView();
		 contM.addObject("bcont",bbs);
		 contM.addObject("page",page);
	 
		 if(state.equals("cont")) {//���뺸�� �϶�
			 contM.setViewName("bbs/bbs_cont");//���뺸�� ������ ����
			 
		 }else if(state.equals("edit")) {//������
			 contM.setViewName("bbs/bbs_edit");
		 }else if(state.equals("del")) {//������
			 contM.setViewName("bbs/bbs_del");
		 }else if(state.equals("reply")) {//�亯�ޱ� ��
			 contM.setViewName("bbs/bbs_reply");
		 }
	 
	 return contM;
	 
	 }
	
}
