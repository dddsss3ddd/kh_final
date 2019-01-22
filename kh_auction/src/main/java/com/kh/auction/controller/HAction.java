package com.kh.auction.controller;

//썸네일 생성
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

@Controller
public class HAction {
	
	@Autowired
	private HService hService;
	
	//파일저장을 할 경우 아래 경로를 알맞게 수정해야합니다. 모든 파일은 upload폴더에 받는 것으로 하겠습니다.
	private String saveFolder="D:/final/kh_final/kh_auction/src/main/webapp/resources/upload";
	private String thumbFolder="D:/final/kh_final/kh_auction/src/main/webapp/resources/upload/thumbnail/";
	
	
	//===============================주소 마지막 부분은 각자 고유한 값으로 하도록 합니다.
	//공동 작업내용이라면 합의하여 통일하도록 하고 이외 개인 작업이라면 각자 확장자명을 사용하도록 합니다.

	//예시 메서드 입니다.
	@RequestMapping(value="bbs_sdf3write.nhn")
	public String bbs_write() {
		return "bbs/bbs_write"; //bbs 폴더의 bbs_write.jsp 뷰
	}
	
	//예시 메서드 입니다.
	@RequestMapping(value="/bbs_wr3fite_ok.nhn",method=RequestMethod.POST)
	public String bbs_write_ok(BbsBean_sample bbsbean) throws Exception{
		MultipartFile uploadfile=bbsbean.getUploadfile();
		
		if(!uploadfile.isEmpty()) {
			//원래 파일명 구해오기
			String fileName = uploadfile.getOriginalFilename();
			
			//원래 파일명 저장
			bbsbean.setBbs_original(fileName);
			
			//DB에 저장할 파일명 구해온다.
			String fileDBName = getFileDBName(fileName);
			
			//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장한다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			
			//바뀐 파일명으로 저장
			bbsbean.setBbs_file(fileDBName);
		}
		
		this.hService.insertBbs(bbsbean); //저장 메서드 호출
		
		return "redirect:bbs_list.nhn";
	}

	//파일 입출력에 대한 메서드입니다. 필요한 경우 남겨두고 작업하세요.
	private String getFileDBName(String fileName) throws Exception{
		Calendar c=Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		int month = c.get(Calendar.MONTH)+1;
		int date = c.get(Calendar.DATE);
		String homedir = saveFolder+"/"+year+"-"+month+"-"+date;
		
		//homedir에 file 객체 생성
		File path1 = new File(homedir);
		
		if(!path1.isFile()) {
			System.out.println("파일이 존재하지 않습니다.");
		}
		if(!(path1.exists())) {
			System.out.println("폴더 만든다.");
			path1.mkdir();//새로운 폴더를 생성
		}
		
		//난수를 구한다.
		Random r=new Random();
		int random=r.nextInt(100000000);
		
		/******확장자 구하기 시작******/
		int index = fileName.lastIndexOf(".");
		//문자열에서 특정 문자열의 위치 값(index)를 반환한다.
		//indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면
		//lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환한다.
		//(파일명에 점이 여러개 있을 경우 맨마지막에 발견되는 문자열의 위치를 리턴한다.)
		System.out.println("index="+index);
		
		String fileExtension = fileName.substring(index+1);
		System.out.println("fileExtension = " + fileExtension);
		/****확장자 구하기 끝****/
		
		//새로운 파일명을 만든다.
		String refileName="auc"+year+month+date+random+"."+fileExtension;
		System.out.println("refileName = " + refileName);
		
		//오라클 BD에 저장될 값
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
			
			System.out.println("썸네일 생성이미지의 원본경로:"+thumb_dir);
			
			int index = img2.split(",")[0].lastIndexOf(".");
		    String fileName = img2.split(",")[0].substring(0, index);
		    String fileExt = img2.split(",")[0].substring(index + 1);
			
		    String thumb_img = makeThumbnail(thumb_dir, fileName.split("/")[fileName.split("/").length-1], fileExt);
		    System.out.println("파일 이름?"+fileName.split("/")[fileName.split("/").length-1]);
		    ab.setAuc_img1(thumb_img);
		}
		hService.insertAuc(ab);
		return "han/auction_upload";
	}
	
	//썸네일 생성 메소드
	private String makeThumbnail(String filePath, String fileName, String fileExt)
			throws Exception {
		// 저장된 원본파일로부터 BufferedImage 객체를 생성합니다.
		
		BufferedImage srcImg = ImageIO.read(new File(filePath));
		// 썸네일의 너비와 높이 입니다.
		int dw = 500, dh = 300;
		// 원본 이미지의 너비와 높이 입니다.
		int ow = srcImg.getWidth();
		int oh = srcImg.getHeight();
		// 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다.
		int nw = ow;
		int nh = (ow * dh) / dw; 
		// 계산된 높이가 원본보다 높다면 crop이 안되므로
		// 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다.
		if(nh > oh) { nw = (oh * dw) / dh; nh = oh; }
		// 계산된 크기로 원본이미지를 가운데에서 crop 합니다.
		BufferedImage cropImg =
				Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh);
		// crop된 이미지로 썸네일을 생성합니다.
		BufferedImage destImg = Scalr.resize(cropImg, dw, dh);
		// 썸네일을 저장합니다. 이미지 이름 앞에 "T_" 를 붙여 표시했습니다.
		String thumbName = thumbFolder+"T_" + fileName+"."+fileExt;
		File thumbFile = new File(thumbName);
		ImageIO.write(destImg, fileExt.toUpperCase(), thumbFile);
		
		return "resources/upload/thumbnail/T_"+fileName+"."+fileExt;
	}
	//==============================================================이상은 옮김으로 가능한 수정하지 말것.
	
	
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
		
		//댓글 개수를 각각빈에 추가하여 전송할 수 있도록 하자.
		
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
			out.println("<script>alert('해당하는 번호의 경매가 없습니다.');");
			out.println("history.back();</script>");
			out.close();
		}
		SimpleDateFormat dateform = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date auc_start= new Date();
		Date auc_system=dateform.parse(hService.getdate());
		String time_result = "";
		if(auc_start.compareTo(auc_system)==-1) time_result="can_not_mod";
		
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
			
			System.out.println("썸네일 생성이미지의 원본경로:"+thumb_dir);
			
			int index = img2.split(",")[0].lastIndexOf(".");
		    String fileName = img2.split(",")[0].substring(0, index);
		    String fileExt = img2.split(",")[0].substring(index + 1);
			
		    String thumb_img = makeThumbnail(thumb_dir, fileName.split("/")[fileName.split("/").length-1], fileExt);
		    System.out.println("파일 이름?"+fileName.split("/")[fileName.split("/").length-1]);
		    cb.setCons_img1(thumb_img);
		}
		hService.insertcons(cb);
		
		ModelAndView mv = new ModelAndView("han/cons_write");
		return mv;
	}
	
	@RequestMapping(value="cons_mod.hh")
	public ModelAndView cons_mod (
			) throws Exception {
		ModelAndView mv = new ModelAndView("han/cons_mod");
		return mv;
	}
	
	
	
	
	
	
	
	
	
}


