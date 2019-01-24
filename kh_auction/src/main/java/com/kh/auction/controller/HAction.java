package com.kh.auction.controller;

//����� ����
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.imgscalr.Scalr;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.auction.dao.HService;
import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.HAucBean;
import com.kh.auction.model.HBean;
import com.kh.auction.model.HConsBean;
import com.kh.auction.model.HConsUpgradeBean;

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
		//(���ϸ� ���� ������ ���� ��� �Ǹ������� �߰ߵǴ� ���ڿ��� ��ġ�� �����Ѵ�.)
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
	
	@RequestMapping(value="main.hh")
	public String testin (
			) throws Exception {
		return "han/main";
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
		Date auc_start= new Date();
		if(ab.getAuto_date_s() ==null) auc_start = dateform.parse(ab.getAuc_start());
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
		
		return "resources/upload/thumbnail/T_"+fileName+"."+fileExt;
	}
	//==============================================================�̻��� �ű����� ������ �������� ����.
	
	
	@RequestMapping(value="FAQ.hh")
	public String faq (
			) throws Exception {
		return "han/FAQ";
	}
	
	@RequestMapping(value="cons_list.hh")
	public ModelAndView cons_list (
			) throws Exception {
		ModelAndView mv = new ModelAndView("han/cons_list");
		
		List<HConsBean> cons_list = hService.getconslist();
		int pages = hService.getconslistno();
		mv.addObject("cons_list",cons_list);
		mv.addObject("pages",pages);
		
		//��� ������ ������ �߰��Ͽ� ������ �� �ֵ��� ����.
		
		return mv;
	}
	
	@RequestMapping(value="cons_detail.hh",method=RequestMethod.GET)
	public ModelAndView cons_details (
			@RequestParam("cons_no") int cons_no,
			HttpServletResponse response
			) throws Exception {
		ModelAndView mv = new ModelAndView("han/cons_details");
		
		HConsBean cb = hService.getconsdetail(cons_no);
		if(cb == null) {
			response.setCharacterEncoding("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('�ش��ϴ� ��ȣ�� ��Ű� �����ϴ�.');");
			out.println("history.back();</script>");
			out.close();
		}
		SimpleDateFormat dateform = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date auc_start= new Date();
		String date_cons_is = hService.getdate_cons(cons_no);

		String time_result = "mod_ok";
		
		if(date_cons_is != null) {
			Date auc_system=dateform.parse(date_cons_is);
			if(auc_start.compareTo(auc_system)==-1) time_result="can_not_mod";
		}

		System.out.println("����"+cb.getCons_content());
		cb.setCons_content(cb.getCons_content().replaceAll("\n","<br>"));
		System.out.println("����"+cb.getCons_content());
		mv.addObject("time_compare",time_result);
		mv.addObject("cons",cb);
		
		return mv;
	}
	
	@RequestMapping(value="cons_write.hh")
	public ModelAndView cons_write (
			) throws Exception {
		ModelAndView mv = new ModelAndView("han/cons_write");
		return mv;
	}
	
	@RequestMapping(value="cons_write_ok.hh",method=RequestMethod.POST)
	public ModelAndView cons_write_ok (HConsBean cb,
			HttpServletRequest request,
			HttpServletResponse response,
			HttpSession session
			) throws Exception {
		cb.setCons_id((String)session.getAttribute("user_id"));
		
		String img2 = "";
		if(cb.getCons_img() !=null) {
			for(int i=0; i<cb.getCons_img().length;i++) {
				String fileDBName = getFileDBName(cb.getCons_img()[i].getOriginalFilename());
				cb.getCons_img()[i].transferTo(new File(saveFolder + fileDBName));
				img2+="resources/upload"+fileDBName;
				if(i+1<cb.getCons_img().length) img2+=",";
			}
		}
		cb.setCons_img2(img2);
		
		if(!img2.equals("")) {
			String thumb_dir="D:/final/kh_final/kh_auction/src/main/webapp/"+img2.split(",")[0];
			
			System.out.println("����� �����̹����� �������:"+thumb_dir);
			
			int index = img2.split(",")[0].lastIndexOf(".");
		    String fileName = img2.split(",")[0].substring(0, index);
		    String fileExt = img2.split(",")[0].substring(index + 1);
			
		    String thumb_img = makeThumbnail(thumb_dir, fileName.split("/")[fileName.split("/").length-1], fileExt);
		    System.out.println("���� �̸�?"+fileName.split("/")[fileName.split("/").length-1]);
		    cb.setCons_img1(thumb_img);
		}
		hService.insertcons(cb);
		
		ModelAndView mv = new ModelAndView("han/cons_list");
		return mv;
	}
	
	@RequestMapping(value="cons_del.hh",method=RequestMethod.POST)
	@ResponseBody
	public String cons_del (
			@RequestParam(value="cons_no",defaultValue="0") int cons_no,
			HttpSession session
			) throws Exception {
		String answer = "deny";
		String user_id = (String)session.getAttribute("user_id");
		String user_grade = (String)session.getAttribute("user_grade");
		
		HConsBean cb = hService.getconsdetail(cons_no);
		int del_count=0;
		if(user_id.equals(cb.getCons_id()) || user_grade.equals("master") || user_grade.equals("admin")) {
			del_count=hService.consdel(cons_no);
		}
		if(del_count != 0) {
			answer = "deleted";
			image_remover(cb.getCons_img1());
			
			if(cb.getCons_img2() != null && !cb.getCons_img2().equals("")){
				image_remover(cb.getCons_img2().split(","));
			}
		}
		System.out.println(del_count + "cons_del() ���� ������ �÷� �� ���� ��");
		System.out.println(answer + "cons_del() ���� answer?");
		return answer;
	}
	
	@RequestMapping(value="cons_mod.hh",method=RequestMethod.GET)
	public ModelAndView cons_mod (
			@RequestParam("cons_no") int cons_no
			) throws Exception {
		ModelAndView mv = new ModelAndView("han/cons_mod_write");
		HConsBean cb = hService.getconsdetail(cons_no);
		mv.addObject("cons",cb);
		
		return mv;
	}
	
	@RequestMapping(value="cons_mod_ok.hh",method=RequestMethod.POST)
	public String cons_mod_ok (
			HConsBean cb,
			@RequestParam("img_control") String img_control
			) throws Exception {
		//�ܽ� �̹��� ���� �ø���
		if(img_control.equals("img_change")) {
			if(cb.getCons_img1() != null || !cb.getCons_img1().trim().equals("")) image_remover(cb.getCons_img1());
			if(cb.getCons_img2() != null) image_remover(cb.getCons_img2().split(","));
			
			String img2 = "";
			if(cb.getCons_img() !=null) {
				for(int i=0; i<cb.getCons_img().length;i++) {
					String fileDBName = getFileDBName(cb.getCons_img()[i].getOriginalFilename());
					cb.getCons_img()[i].transferTo(new File(saveFolder + fileDBName));
					img2+="resources/upload"+fileDBName;
					if(i+1<cb.getCons_img().length) img2+=",";
				}
			}
			cb.setCons_img2(img2);
			
			if(!img2.equals("")) {
				String thumb_dir="D:/final/kh_final/kh_auction/src/main/webapp/"+img2.split(",")[0];
				
				System.out.println("����� �����̹����� �������:"+thumb_dir);
				
				int index = img2.split(",")[0].lastIndexOf(".");
			    String fileName = img2.split(",")[0].substring(0, index);
			    String fileExt = img2.split(",")[0].substring(index + 1);
				
			    String thumb_img = makeThumbnail(thumb_dir, fileName.split("/")[fileName.split("/").length-1], fileExt);
			    System.out.println("���� �̸�?"+fileName.split("/")[fileName.split("/").length-1]);
			    cb.setCons_img1(thumb_img);
			}
			//�ܽ� �̹��� �߰��ϱ�
		}else if(img_control.equals("img_add")) {
			String img2 = "";
			if(!cb.getCons_img2().trim().equals("") && cb.getCons_img2()!= null) img2 += ",";
			if(cb.getCons_img() !=null) {
				for(int i=0; i<cb.getCons_img().length;i++) {
					String fileDBName = getFileDBName(cb.getCons_img()[i].getOriginalFilename());
					cb.getCons_img()[i].transferTo(new File(saveFolder + fileDBName));
					img2+="resources/upload"+fileDBName;
					if(i+1<cb.getCons_img().length) img2+=",";
				}
			}
			cb.setCons_img2(cb.getCons_img2()+img2);
		}
		return "han/cons_detail?cons_no="+cb.getCons_no();
	}
	
	//�����ε��� ���� �迭/���� �̹��� ����
	public void image_remover(String[] img2) {
		for(int i=0;i<img2.length;i++) {
			image_remove_task(saveFolder,img2[i]);
		}
	}
	public void image_remover(String img) {
		image_remove_task(thumbFolder,img);
	}
	
	public void image_remove_task(String savedir,String save_file) {
		File DelFile=new File(savedir+save_file);
		if(DelFile.exists()) {//���� ���� ������ �����ϸ�
			System.out.println("���� ����:"+DelFile.getPath());
			DelFile.delete();//���� ���� ����
		}
	}

	//constraint detail �����ǰ� ������ �����ϱ�.
	@RequestMapping(value="cons_detail_upgrade.hh",method=RequestMethod.GET)
	@ResponseBody
	public Object cons_detail_upgrade (
			HConsUpgradeBean cub
			) throws Exception {
		
		hService.consdataupdate(cub);
		cub=hService.consupdatereturn(cub);
		
		return cub;
	}
}


