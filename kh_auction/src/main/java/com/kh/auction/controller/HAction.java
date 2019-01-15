package com.kh.auction.controller;

//����� ����
import java.awt.image.BufferedImage;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Random;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.kh.auction.dao.HService;
import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.HAucBean;
import com.kh.auction.model.HBean;

@Controller
public class HAction {
	
	@Autowired
	private HService hService;
	
	//���������� �� ��� �Ʒ� ��θ� �˸°� �����ؾ��մϴ�. ��� ������ upload������ �޴� ������ �ϰڽ��ϴ�.
	private String saveFolder="D:/final/kh_final/kh_auction/src/main/webapp/resources/upload";
	private String thumbFolder="D:/final/kh_final/kh_auction/src/main/webapp/resources/upload/thumbnail/";
	
	
	//===============================�ּ� ������ �κ��� ���� ������ ������ �ϵ��� �մϴ�.
	//���� �۾������̶�� �����Ͽ� �����ϵ��� �ϰ� �̿� ���� �۾��̶�� ���� Ȯ���ڸ��� ����ϵ��� �մϴ�.

	//���� �޼��� �Դϴ�.
	@RequestMapping(value="bbs_sdf3write.nhn")
	public String bbs_write() {
		return "bbs/bbs_write"; //bbs ������ bbs_write.jsp ��
	}
	
	//���� �޼��� �Դϴ�.
	@RequestMapping(value="/bbs_wr3fite_ok.nhn",method=RequestMethod.POST)
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
		
		this.hService.insertBbs(bbsbean); //���� �޼��� ȣ��
		
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
		String refileName="auc"+year+month+date+random+"."+fileExtension;
		System.out.println("refileName = " + refileName);
		
		//����Ŭ BD�� ����� ��
		String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
		System.out.println("fileDBName = " + fileDBName);
		
		return fileDBName;
	}
	
	@RequestMapping(value="sejin_in.hh")
	public String gosgos (	) throws Exception {
		return "han/test";
	}
	
	@RequestMapping(value="sejin.hh")
	public String testin (
			HBean hb
			) throws Exception {
		hService.testIn(hb);
		return "kim/test";
	}
	
	@RequestMapping(value="test.hh")
	public String testin (
			) throws Exception {
		return "main/main";
	}
	
	@RequestMapping(value="auction_upload.hh")
	public String upload_auction (
			) throws Exception {
		return "han/auction_upload";
	}
	
	@RequestMapping(value="getconfuser.hh",method=RequestMethod.POST)
	@ResponseBody
	public String getconfuser (
			@RequestParam("con_id") String user_id
			) throws Exception {
		String ans = hService.getconfuser(user_id);
		if(ans==null) ans="_none";
		return ans;
	}
	
	@RequestMapping(value="auction_up_ok.hh",method=RequestMethod.POST)
	public String auction_up_ok (
			HAucBean ab
			) throws Exception {

		ab.setAuc_start(ab.getAuc_start1()+" "+ab.getS_hour()+":"+ab.getS_min()+":00");

		SimpleDateFormat dateform = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date auc_start=dateform.parse(ab.getAuc_start());
		Date auc_system=dateform.parse(hService.getdate());

		if(auc_start.compareTo(auc_system)==-1) {
			ab.setAuto_date_s("start_default");
		}
		if(ab.getE_date()==0 && ab.getE_hour()==0) ab.setAuto_date_e("end_default");
		
		String img2 = "";
		if(ab.getAuc_img() !=null) {
			for(int i=0; i<ab.getAuc_img().length;i++) {
				String fileDBName = getFileDBName(ab.getAuc_img()[i].getOriginalFilename());
				ab.getAuc_img()[i].transferTo(new File(saveFolder + fileDBName));
				img2+="resources/upload"+fileDBName;
				if(i+1<ab.getAuc_img().length) img2+=",";
			}
		}
		ab.setAuc_img2(img2);
		
		if(!img2.equals("")) {
			String thumb_dir="D:/final/kh_final/kh_auction/src/main/webapp/"+img2.split(",")[0];
			
			System.out.println("����� �����̹����� �������:"+thumb_dir);
			
			int index = img2.split(",")[0].lastIndexOf(".");
		    String fileName = img2.split(",")[0].substring(0, index);
		    String fileExt = img2.split(",")[0].substring(index + 1);
			
		    String thumb_img = makeThumbnail(thumb_dir, fileName.split("/")[fileName.split("/").length-1], fileExt);
		    System.out.println("���� �̸�?"+fileName.split("/")[fileName.split("/").length-1]);
		    ab.setAuc_img1(thumb_img);
		}
		hService.insertAuc(ab);
		return "han/auction_upload";
	}
	
	//����� ���� �޼ҵ�
	private String makeThumbnail(String filePath, String fileName, String fileExt)
			throws Exception {
		// ����� �������Ϸκ��� BufferedImage ��ü�� �����մϴ�.
		
		BufferedImage srcImg = ImageIO.read(new File(filePath));
		// ������� �ʺ�� ���� �Դϴ�.
		int dw = 500, dh = 300;
		// ���� �̹����� �ʺ�� ���� �Դϴ�.
		int ow = srcImg.getWidth();
		int oh = srcImg.getHeight();
		// ���� �ʺ� �������� �Ͽ� ������� ������ ���̸� ����մϴ�.
		int nw = ow;
		int nh = (ow * dh) / dw; 
		// ���� ���̰� �������� ���ٸ� crop�� �ȵǹǷ�
		// ���� ���̸� �������� ������� ������ �ʺ� ����մϴ�.
		if(nh > oh) { nw = (oh * dw) / dh; nh = oh; }
		// ���� ũ��� �����̹����� ������� crop �մϴ�.
		BufferedImage cropImg =
				Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh);
		// crop�� �̹����� ������� �����մϴ�.
		BufferedImage destImg = Scalr.resize(cropImg, dw, dh);
		// ������� �����մϴ�. �̹��� �̸� �տ� "T_" �� �ٿ� ǥ���߽��ϴ�.
		String thumbName = thumbFolder+"T_" + fileName+"."+fileExt;
		File thumbFile = new File(thumbName);
		ImageIO.write(destImg, fileExt.toUpperCase(), thumbFile);
		
		return "resources/upload/thumbnail/T_"+fileName+"."+fileExt.toUpperCase();
	}
}

