package com.Blossom.controller;

import java.io.FileInputStream;
import java.io.InputStream;

import javax.annotation.Resource;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.Blossom.service.board.BoardService;
import com.Blossom.util.MediaUtils;
import com.Blossom.util.UploadFileUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class AjaxUploadController {
	
	@Autowired
	BoardService bService;
	//@Autowired 는 타입으로 가져온다
	// BoardService는 인터페이스로 객체 생성이 불가능 -> beans 등록 불가  
	// BoardServiceImpl 은 부모 타입을 쓸수 있는데 BoardService 이 부모 이므로 
	// BoardServiceImpl 와 BoardService 두가지 타입을 쓸수있다
	

	@Resource(name = "uploadPath")
	String uploadPath;	
	//업로드 디렉토리 sevlet-context.xml에 설정되어 있다
	// uploadPath 의존성 주입 
	// @Resource는 이름으로 가지고 온다
	// String은 보편적으로 많이쓰기 때문에 이름으로 가져오도록 @Resource 사용 해야 한다
	
	
	
	//upload File 멀티파트 파일에 save
	@ResponseBody // 페이지 이동을 안할때,  ajax를 쓸때 ResponseBody
	@RequestMapping(value = "/upload/uploadAjax", produces="text/plain;charset=utf-8")
	public ResponseEntity<String> uploadAjax(MultipartFile file)throws Exception {

		 log.info("POST: uploadAjax");
	// @RequestMapping 을 써야 GET POST 둘다 탈수 있다 	 
	// 	Multipart를 contorller 가 인식할수 있도록 같이 처리해야 Controller단이 인식을 하는데
	// servelt-context 에 인식할수 있도록 multipartResolver 를 bean으로 생성 해뒀기 때문에 이용이 가능 하다 	
	// 내가보낸 파일을 uploadAjax(MultipartFile file) : file 에 첨부파일 1개 담긴 상태 
	// throws Exception  파일은 예외처리가 필요하다 	
	// 업로드한 파일 정보와 Http 상태 코드를 함께리턴
   
		return new ResponseEntity<String>(UploadFileUtils.uploadFile(uploadPath, file.getOriginalFilename(), file.getBytes()), HttpStatus.OK);
		// return new : 객체 생성하면 바로 보내라  
		// ResponseEntity<String> : < >제네릭, 문지기 역할을 한다 
		//                          ResponseEntity에 String 타입만 들어올수 있다고 명시
	    // UploadFileUtils : 맨앞에가 대문자 (static, 생성자) -> static 은 객체생성안해도 클래스명으로 호출 가능 생성자 메서드는 ()가 들어가기때문에 UploadFileUtils는 static 메서드 이다
		// uploadPath : 파일 경로(D:/developer/uplod ) 
		// file.getOriginalFilename() : 파일을 업로드 하면 순수하게 파일 이름만 가지고 온다 
		// file.getBytes() : 첨부파일크기 
		//                   확장자명이 붙은것은 모두 첨부 파일 
		//                   연속해서 들어오는 데이터를 stream이라고 하는데 한번에 못들어오고 쪼개져서 들어온다 
		
		// ajax끝나고 view단 이동시
		// 1. 파일 경로 (uploadPath -> D:/developer/uplod )
		// 2. 파일 이름 (getOriginalFilename()) 
		// 3. 파일 크기 (file.getBytes)
		// 4. HttpStatus.ok (성공)
	}
	
	//이미지 표시 기능 
	@ResponseBody // view가 아닌 data 리턴
	@RequestMapping("/upload/displayFile")
	public ResponseEntity<byte[]> displayFile(String fileName) throws Exception{
		
		InputStream in = null; // java.io
		ResponseEntity<byte[]> entity = null;
		try{
			// 확장자 검사
			String formatName = fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			// 헤더 구성 객체
			HttpHeaders headers = new HttpHeaders();
			//inputStream 생성
			in = new FileInputStream (uploadPath + fileName);
				 
			    // if (mType !=null) { // 이미지 파일이면
				//	headers.setContentType(mType);
			//	} else { // 이미지가 아니면
					fileName = fileName.substring(fileName.indexOf("_")+1);
				// 다운로드용 컨텐트 타입	
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);		
				//큰 따옴표 내부에 "\" "
				// 바이트 배열을 스트링으로
				// iso - 8859-1 서유럽언어
				// new String (fileName.getBytes("utf-8"), "iso-8859-1"
				headers.add("Content-Disposition", "attachment; filename=\"" + new String(
						fileName.getBytes("utf-8"), "iso-8859-1") + "\"");
				//headers.add("Content-Disposition" ,"attachment; filename='" + fileName+"'");
//				}
				// 바이트배열, 헤더
				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			if(in !=null)
				in.close(); // 스트림 닫기
		}
		return entity;
	
	
	}
}
