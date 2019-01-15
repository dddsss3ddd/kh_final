package com.kh.auction.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.kh.auction.dao.JService;
import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.JBean;

@Controller
public class JAction {
	
	@Autowired
	private JService jService;
	
	//���������� �� ��� �Ʒ� ��θ� �˸°� �����ؾ��մϴ�. ��� ������ upload������ �޴� ������ �ϰڽ��ϴ�.
	private String saveFolder="D:\\final\\kh_final\\kh_auction\\src\\main\\webapp\\resources\\upload";

	
	
	//===============================�ּ� ������ �κ��� ���� ������ ������ �ϵ��� �մϴ�.
	//���� �۾������̶�� �����Ͽ� �����ϵ��� �ϰ� �̿� ���� �۾��̶�� ���� Ȯ���ڸ��� ����ϵ��� �մϴ�.

	//���� �޼��� �Դϴ�.
	@RequestMapping(value="bbs_w3f3frite.nhn")
	public String bbs_write() {
		return "bbs/bbs_write"; //bbs ������ bbs_write.jsp ��
	}
	
	//���� �޼��� �Դϴ�.
	@RequestMapping(value="/bbs_wr3f3fite_ok.nhn",method=RequestMethod.POST)
	public String bbs_write_ok(BbsBean_sample bbsbean) throws Exception{
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
		
		this.jService.insertBbs(bbsbean); //���� �޼��� ȣ��
		
		return "redirect:bbs_list.nhn";
	}

	//���� ����¿� ���� �޼����Դϴ�. �ʿ��� ��� ���ܵΰ� �۾��ϼ���.
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
		//(���ϸ��� ���� ������ ���� ��� �Ǹ������� �߰ߵǴ� ���ڿ��� ��ġ�� �����Ѵ�.)
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
	
	
	@RequestMapping(value="haech_in.jj")
	public String gosgos (	) throws Exception {
		return "jung/test";
	}
	
	@RequestMapping(value="haech.jj")
	public String testin (
			JBean jb
			) throws Exception {
		jService.testIn(jb);
		System.out.println(jb.getJval1()+jb.getJval2());
		return "redirect:wonsuc_in.cc";
	}
	
}