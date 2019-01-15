package com.kh.auction.controller;

import java.io.File;
import java.util.Calendar;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.kh.auction.dao.CService;
import com.kh.auction.model.BbsBean_sample;
import com.kh.auction.model.CBean;

@Controller
public class CAction {
	
	@Autowired
	private CService cService;
	
	//파일저장을 할 경우 아래 경로를 알맞게 수정해야합니다. 모든 파일은 upload폴더에 받는 것으로 하겠습니다.
	private String saveFolder="D:\\final\\kh_final\\kh_auction\\src\\main\\webapp\\resources\\upload";

	
	
	//===============================주소 마지막 부분은 각자 고유한 값으로 하도록 합니다.
	//공동 작업내용이라면 합의하여 통일하도록 하고 이외 개인 작업이라면 각자 확장자명을 사용하도록 합니다.
	
	//예시 메서드 입니다.
	@RequestMapping(value="bbs_writdse.nhn")
	public String bbs_write() {
		return "bbs/bbs_write"; //bbs 폴더의 bbs_write.jsp 뷰
	}
	
	//예시 메서드 입니다.
	@RequestMapping(value="/bbs_wrasdfite_ok.nhn",method=RequestMethod.POST)
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
		
		this.cService.insertBbs(bbsbean); //저장 메서드 호출
		
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
		String refileName="bbs"+year+month+date+random+"."+fileExtension;
		System.out.println("refileName = " + refileName);
		
		//오라클 BD에 저장될 값
		String fileDBName = "/"+year+"-"+month+"-"+date+"/"+refileName;
		System.out.println("fileDBName = " + fileDBName);
		
		return fileDBName;
	}
	
	@RequestMapping(value="wonsuc_in.cc")
	public String gosgos (	) throws Exception {
		return "choi/test";
	}
	
	@RequestMapping(value="wonsuk.cc")
	public String testin (
			CBean cb
			) throws Exception {
		cService.testIn(cb);
		System.out.println(cb.getCval1()+cb.getCval2());
		return "redirect:sejin_in.hh";
	}
	
	
}
