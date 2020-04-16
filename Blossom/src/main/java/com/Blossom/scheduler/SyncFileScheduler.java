package com.Blossom.scheduler;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.Blossom.domain.AttachDTO;
import com.Blossom.persistence.BoardDAO;
import com.Blossom.util.MediaUtils;

import lombok.extern.slf4j.Slf4j;

//게시글 첨부파일 사용시
// 로컬에 저장된 첨부파일과
// DB에 저장된 첨부파일 이름이
// 매칭이 안되는 경우 아무도 사용하지 않는 파일
// 고로 로컬에서 삭제!!
// 하루에 한번씩 새벽시간에 전날 로컬 첨부파일 폴더를 대상으로 

@Slf4j
@Component
public class SyncFileScheduler {			
	@Autowired
	private SqlSession sqlSession;
	
	private BoardDAO bDao; 
	
	@Autowired
	public void newBoardDAO() {
		bDao = sqlSession.getMapper(BoardDAO.class);
	}
	
	String uploadPath = "C:/developer/upload";
	
	// 하루 전날 파일 목록 가져오기
	private String getFolderYesterday() {
		
		//format 형식 생성
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		//오늘 날짜 가져오기 ex) 2019-04-16
		Calendar cal = Calendar.getInstance();
		
		//오늘 날짜에서 -1해서 어제로 설정
		cal.add(Calendar.DATE, -1);
		//어제 날짜 yyyy-MM-dd로 설정 ex) 2019-04-15
		String str = sf.format(cal.getTime());
		//File.separator은 \ 또는 /로 파일 경로를 분리
		// 2019-04-15을 2019\04\15으로 변경
		return str.replace("-", File.separator);
	}
	
	// 매일 새벽 2시에 첨부파일 목록과 DB를 비교해서 
	// DB에 없는 첨부파일을 로컬 디렉토리에서 삭제
	@Scheduled(cron = "0 0 2 * * * ")
	public void checkFiles() throws Exception {
		log.info("File Check Task run ....................");
		log.info("" + new Date());
		
		//DB에 등록되어 있는 첨부파일 목록 불러오기
		SimpleDateFormat sf = new SimpleDateFormat("yyyyMMdd");
		//오늘 날짜 가져오기 ex) 2019-04-16
		Calendar cal = Calendar.getInstance();
		cal.add(Calendar.DATE, -1);
		log.info("어제날짜: " + sf.format(cal.getTime()));
		List<AttachDTO> fileList = bDao.getOldFiles(sf.format(cal.getTime()));
		
	//	for (AttachDTO one :fileList) {
	//		log.info(one.toString());
	//	}
		
	// fileList에 담긴 이름
	// fullname = /2020/04/16/s_65873525-d287-4825-bd85-597dafd58daf_icons8-birthday-cake-96.png)
		
		List<Path> fileListPaths = fileList.stream() 
				// stream fileList 에서 값을 하나씩 꺼내온다 
				//파일 경로가 담겨 있음 
				.map(dto -> Paths.get(uploadPath+dto.getFullname())) 
				//  stream에서 하나씩 꺼내온 데이터에 전처리 진행
				// 람다식 방법
				// -> 화살표는 매개 변수 우측이 실행하는 함수 
				.collect(Collectors.toList());
				// 전처리 다된 작업을 Collector에 저장 
		
		
		// 파일목록 : 파일, 썸네일 이미지
		// 이미지 파일이면 DB에 썸네일 이미지 파일이 등록되있기 때문에
		// 파일목록에 원본 이미지 파일도 등록
		
		for(AttachDTO avo : fileList) {
			String fileName = avo.getFullname();
			String formatname=fileName.substring(fileName.lastIndexOf(".")+1);
			MediaType mType = MediaUtils.getMediaType(formatname);
			
			if(mType !=null) {
				String front = fileName.substring(0, 12);
				String end = fileName.substring(14);
				//File.separatorChar : 유닉스 / 윈도우즈 \
				fileListPaths.add(Paths.get(uploadPath+(front+end).replace('/', File.separatorChar)));
				
			}
		}
		// 파일 목록: 파일, 원본이미지, 썸네일 이미지
		fileListPaths.forEach(p -> log.info("" + p));// DB
		File targetDir = Paths.get(uploadPath, getFolderYesterday()).toFile(); //로컬
		
		//디렉토리의 파일목록 (디렉토리 포함)을 File 배열로 반환
		// DB 첨부파일 목록과 하루전폴더의 첨부파일과 매칭
		// -> DB에 없는 첨부파일 목록 = 삭제 목록 생성
		
		 File[] removeFiles = targetDir.listFiles(file -> fileListPaths.contains(file.toPath()) == false);
		 
		 //DB에 등록되지 않은 첨부파일 삭제 시작
		 
		 log.warn("==========================================================");
		 for(File file : removeFiles) {
			 log.warn(file.getAbsolutePath());
			 file.delete();
		 }
	}
	
	
	
	
}
