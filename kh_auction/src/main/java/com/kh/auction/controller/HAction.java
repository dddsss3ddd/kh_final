package com.kh.auction.controller;

//썸네일 생성
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.PrintWriter;
import java.nio.charset.Charset;
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

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.kh.auction.dao.HService;
import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.HAucBean;
import com.kh.auction.model.HBean;
import com.kh.auction.model.HConsBean;
import com.kh.auction.model.HConsConditionBean;
import com.kh.auction.model.HConsUpgradeBean;

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
	@RequestMapping(value="/bbs_writde_ok.nhn",method=RequestMethod.POST)
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
	
	@RequestMapping(value="sejin.hh",produces="text/plain; charset=UTF-8" )
	@ResponseBody
	public String testin (HttpServletResponse response,
			HBean hb
			) throws Exception {
		
		System.out.println("값은??"+hb.getHval1()+hb.getHval2());
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String json = ow.writeValueAsString(hb);
		
		System.out.println(Charset.forName("UTF-8"));
		response.setContentType("text/html;charset=UTF-8");
		response.setCharacterEncoding("text/html;charset=UTF-8");
		return json;
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
		hService.insertCat(ab);
		
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
			@RequestParam(value = "page", required = false, defaultValue = "1") int page,
			@RequestParam(value="search_condition",required=false,defaultValue="all") String search_condition,
			@RequestParam(value="selectt",required=false,defaultValue="init") String selectt,
			HttpSession session
			) throws Exception {
		//빈:페이지,사용자 아이디, (검토중, 감정 진행중,위탁절차 진행중, 위탁신청 완료)
		HConsConditionBean ccb = new HConsConditionBean();
		ccb.setPage(page);
		ccb.setCons_id((String) session.getAttribute("user_id"));
		ccb.setSearch_condition(search_condition);
		List<HConsBean> cons_list = hService.getconslist(ccb);
		int pages=hService.getconslistno(ccb);

		
		String direction="han/cons_list";
		if(selectt.equals("tab")) direction = "han/cons_list_tab";
		else if(selectt.equals("page")) direction = "han/cons_list_page";

		int s_page=1;
		int e_page=pages;
		
		if(pages>1) {
			if(page-3>1) s_page=page-3;
			if(page+4<pages) e_page=page+4;
		}
		System.out.println("페이지 정보:페이지개수,현재페이지,시작페이지,끝페이지"+","+pages+","+page+","+s_page+","+e_page);
		ModelAndView mv = new ModelAndView(direction);
		mv.addObject("search_condition",search_condition);
		mv.addObject("cons_list",cons_list);
		mv.addObject("pages",pages);
		mv.addObject("page",page);
		mv.addObject("s_page",s_page);
		mv.addObject("e_page",e_page);
		
		//댓글 개수를 각각빈에 추가하여 전송할 수 있도록 하자.
		
		return mv;
	}
	
	@RequestMapping(value="cons_detail.hh",method=RequestMethod.GET)
	public ModelAndView cons_details (
			@RequestParam("cons_no") int cons_no,
			HttpServletResponse response,
			HttpSession session
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
		String date_cons_is = hService.getdate_cons(cons_no);

		String time_result = "mod_ok";
		
		if(date_cons_is != null) {
			Date auc_system=dateform.parse(date_cons_is);
			if(auc_start.compareTo(auc_system)==-1) time_result="can_not_mod";
		}

		cb.setCons_content(cb.getCons_content().replaceAll("\n","<br>"));
		mv.addObject("time_compare",time_result);
		mv.addObject("cons",cb);
		session.setAttribute("user_grade","master");
		session.setAttribute("user_id","user3");
		return mv;
	}
	
	@RequestMapping(value="cons_write.hh")
	public ModelAndView cons_write (
			) throws Exception {
		ModelAndView mv = new ModelAndView("han/cons_write");
		return mv;
	}
	
	@RequestMapping(value="cons_write_ok.hh",method=RequestMethod.POST)
	public String cons_write_ok (HConsBean cb,
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
		//여기 다시 돌리기
		//return "redirect:cons_list.hh";
		return "redirect:main.hh";
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
		System.out.println(del_count + "cons_del() 에서 지워진 컬럼 수 리턴 값");
		System.out.println(answer + "cons_del() 에서 answer?");
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
		//콘스 이미지 새로 올리기
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
				
				System.out.println("썸네일 생성이미지의 원본경로:"+thumb_dir);
				
				int index = img2.split(",")[0].lastIndexOf(".");
			    String fileName = img2.split(",")[0].substring(0, index);
			    String fileExt = img2.split(",")[0].substring(index + 1);
				
			    String thumb_img = makeThumbnail(thumb_dir, fileName.split("/")[fileName.split("/").length-1], fileExt);
			    System.out.println("파일 이름?"+fileName.split("/")[fileName.split("/").length-1]);
			    cb.setCons_img1(thumb_img);
			}
			//콘스 이미지 추가하기
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
	
	//오버로딩을 통한 배열/단일 이미지 삭제
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
		if(DelFile.exists()) {//기존 이진 파일이 존재하면
			System.out.println("삭제 파일:"+DelFile.getPath());
			DelFile.delete();//기존 파일 삭제
		}
	}

	//constraint detail 가로탭과 아이콘 업글하기.
	
	
	  @RequestMapping(value="cons_detail_upgrade.hh")	  
	  @ResponseBody public String cons_detail_upgrade ( HConsUpgradeBean cub ,  HttpServletResponse response)
	  throws Exception {
		  response.setContentType("text/html;charset=UTF-8");
	  hService.consdataupdate(cub); cub=hService.consupdatereturn(cub);
	  
	  System.out.println("전달받는 detail infos:"+
	  cub.getAuc_interval()+"/"+cub.getAuc_price()+"/"+
	  cub.getButton_info()+"/"+cub.getCons_ans()+"/"+
	  cub.getCons_ant_price()+"/"+cub.getCons_commit()+"/"+
	  cub.getCons_go_content()+"/"+cub.getCons_go_date()+"/"+
	  cub.getCons_no()+"/"+cub.getCons_result1()+"/"+
	  cub.getCons_result2()+"/"+cub.getCons_result2_date()+"/"+
	  cub.getCons_go_time_f()+"/"+cub.getCons_go_time_t()+"/"+
	  cub.getIdentify_update()+"/"); System.out.println(); System.out.println(cub);
	  
	  return "1";
	  
	  }
	 
	 
	 

	  
	  
}


