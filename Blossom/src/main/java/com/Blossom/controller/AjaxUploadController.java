package com.Blossom.controller;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Blossom.service.board.BoardService;
import com.Blossom.util.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@Autowired
	BoardService bService;
	
	@Resource(name = "uploadPath")
	String uploadPath;	
	//업로드 디렉토리 sevlet-context.xml에 설정되어 있다
	//@Autowired 는 타입으로
	//@Resource는 이름으로 가지고 온다
	
	@GetMapping("/upload/uploadAjax")
	public String uploadAjax() {
		return "/upload/uploadAjax";
		// post로 날라오게 했지만  혹시  get으로 들어와도 POST 방식으로 해결되게끔 연결 
	}
	
	//upload File 멀티파트 파일에 save
	@ResponseBody // 페이지 이동을 안할때,  ajax를 쓸때 ResponseBody
	@PostMapping(value = "/upload/uploadAjax", produces="text/plain;chareset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception {
	// 내가보낸 파일을 uploadAjax(MultipartFile file) : MultipartFile file 로 받겠다
	// throws Exception  파일은 예외처리가 필요하다 	
	// 업로드한 파일 정보와 Http 상태 코드를 함께리턴
    
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
		// return new : 객체 생성하면 바로 보내라 별도로 new sc = new scan; 처럼 명시할 필요없음  
		// ResponseEntity<String> : < >제네릭, 문지기 역할을 한다 
		//                          ResponseEntity에 String 타입만 들어올수 있다고 명시
	    //UploadFileUtils 클래스를 만들어서
		//uploadPath : 파일 경로(D:/developer/uplod ) 
		// file. : 파일 하나
		// getOriginalFilename() : 파일을 업로드 하면 순수하게 파일 이름만 가지고 온다 
		// file.getBytes() : 첨부파일크기 
		
		// ajax끝나고 view단 이동시
		// 1. 파일 경로 (uploadPath -> D:/developer/uplod )
		// 2. 파일 이름 (getOriginalFilename()) 
		// 3. 파일 크기 (file.getBytes)
		// 4. HttpStatus.ok (성공)
		
	
	}
}
