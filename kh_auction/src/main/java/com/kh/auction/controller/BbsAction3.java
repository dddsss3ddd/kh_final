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
	
	/*자료실 입력 폼*/
	@RequestMapping(value="bbs_write.nhn")
	public String bbs_write() {
		return "bbs/bbs_write"; //bbs 폴더의 bbs_write.jsp 뷰
	}
	
	@RequestMapping(value="/bbs_write_ok.nhn",method=RequestMethod.POST)
	public String bbs_write_ok(BbsBean bbsbean) throws Exception{
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
		
		this.bbsService.insertBbs(bbsbean); //저장 메서드 호출
		
		return "redirect:bbs_list.nhn";
	}
	
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
		String refileName="bbs"+year+month+date+random+"."+fileExtension;
		System.out.println("refileName = " + refileName);
		
		//오라클 BD에 저장될 값
		String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
		System.out.println("fileDBName = " + fileDBName);
		
		return fileDBName;
	}
	
	/* 자료실 삭제 */
	//@RequestMapping(value="/bbs_delete_ok.nhn",method=RequestMethod.POST)
	//public ModelAcdView bbs_delete_ok()
	
	
	@RequestMapping(value="/bbs_list.nhn",method={RequestMethod.POST, RequestMethod.GET})
public ModelAndView bbs_list(@RequestParam(value="page",defaultValue="1") int page) throws Exception{
		
		System.out.println(page);
		List<BbsBean> bbslist=new ArrayList<BbsBean>();
		
		//초기화
		int limit=10; //한 화면에 출력할 레코드 갯수
		int listcount=bbsService.getListCount();//총 리스트수를 받음

		//총 페이지 수
		int maxpage=(listcount+limit-1)/limit;
		
		//현재 페이지에 보여줄 시작 페이지 수(1,11,21등...)
		int startpage=((page-1)/10)*10+1;
		
		//형재 페이지에 보여줄 마지막 페이지수(10,20,30등...)
		int endpage=startpage+10-1;
		
		if(endpage>maxpage) endpage=maxpage;
		
		bbslist=bbsService.getBbsList(page); //리스트를 받아옴
		
		System.out.println("리스트 0번에서 보드이름 출력?"+bbslist.get(0).getBbs_name());
		
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
		 if(state.equals("cont")) {//내용 보기 일때만
			 bbsService.bbsHit(bbs_num);
		 }
	 
		 BbsBean bbs=bbsService.getBbsCont(bbs_num);
	 
		 ModelAndView contM=new ModelAndView();
		 contM.addObject("bcont",bbs);
		 contM.addObject("page",page);
	 
		 if(state.equals("cont")) {//내용보기 일때
			 contM.setViewName("bbs/bbs_cont");//내용보기 페이지 설정
			 
		 }else if(state.equals("edit")) {//수정폼
			 contM.setViewName("bbs/bbs_edit");
		 }else if(state.equals("del")) {//삭제폼
			 contM.setViewName("bbs/bbs_del");
		 }else if(state.equals("reply")) {//답변달기 폼
			 contM.setViewName("bbs/bbs_reply");
		 }
	 
	 return contM;
	 
	 }
	
}
