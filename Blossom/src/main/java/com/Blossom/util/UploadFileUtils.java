package com.Blossom.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.UUID;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.util.FileCopyUtils;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class UploadFileUtils {
	public static String uploadFile(String uploadPath, String originalName, byte[] fileData) throws Exception{
		// file , DB 처리는 예외처리가 필요 
		
		// uuid  발급
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalName;
		// UUID 중복된 이름의 파일이 들어오는 것을 방지
		// 똑같은 이름의 파일이 들어와도 앞에 random 한 값을 붙여서 방지
		
		
		//업로드할 디렉토리 생성
		String savedPath = calcPath(uploadPath);
		//calcPath : D드라이브에 오늘날짜로 된 파일을 하나더 만들어서 
		//           오늘 날짜에 들어온 파일들을 생성한 폴더에 저장 
		
		File target = new File(uploadPath + savedPath, savedName);	
		// uploadPath + savedPath = uploadpth 는 D:/developer/uplod 까지만 경로를 타는데 위에 clacpath로 
		//                           그날짜에 생성한 폴더에 파일을 넣어뒀기 때문에 savedPath랑 합쳐야 경로가 나온다 
		// target : 이름과 경로가 담기 
		
		
		
		// 임시 디렉토리에 업로드된 파일을 지정된 디렉토리로 복사 
		FileCopyUtils.copy(fileData, target);
		// target : 어디에 어떤이름으로 
		// fileData : 첨부파일로 넣어라 
		
		//파일의 확장자 검사
		// a.jpg / aaa.bbb.ccc.jpg
		String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);
		// formatName = 확장자가 들어온다 
		// .을찾고 한칸뒤로 가라 
		  
		String uploadedFileName = null;
		// 이미지 파일은 썸네일 사용 
		if (MediaUtils.getMediaType(formatName) !=null) {
			//썸네일 생성
			// null이아니다 -> 이미지 
			uploadedFileName = makeThumbnail(uploadPath, savedPath, savedName);
		} else {
			// null이다 -> 일반파일
			uploadedFileName = makeIcon(uploadPath, savedPath, savedName);
		}
		
		return uploadedFileName;
	}
	
	private static String calcPath(String uploadPath) {
		Calendar cal = Calendar.getInstance();
		 // 오늘치 달력값을 가지고와라 
		
		String yearPath = File.separator + cal.get(Calendar.YEAR);
		//separator 구분자 (\) + 오늘치 달력 값에서 year을 가지고 와라 
		
		String monthPath = yearPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.MONTH)+1);
		
		// new DecimalFormat("00") -> 예를들어 4월의 경우 04로 나오도록 변환 
		// \2020 + \ + 04  
		
		String datePath = monthPath + File.separator + new DecimalFormat("00").format(cal.get(Calendar.DATE));
		// \2020\04\09
		
		
		makeDir(uploadPath, yearPath, monthPath, datePath);
		// 디렉토리를 만들어서 uploadPath, yearPath, monthPath, datePath 담는다 
		// 같은 클래스 내에 있어서 객체 생성할 필요가 없다
		
		log.info(datePath);
		return datePath;
	}
	
	private static void makeDir(String uploadPath, String... paths) {
		//다른 디렉토리가 존재하면 skip
		//String... : 동일한 type의 매게변수를 여러개 받을때 사용 한다. 동적으로 매게변수 갯수가 바뀌어야 할때 사용 
		// paths : 배열로만들어서 넣어준다 
		if(new File(paths[paths.length - 1]).exists()) {
			//paths[paths.length - 1] = path [3 -1 ] -> 년 월 일  
			// exists 그날짜에 생성된 파일이 있는지 확인 있으면 true  그파일에 없으면 false 아래 for문으로 이동  
			return;
		 }
		   for (String path : paths) {
			   // for each문 
			   // paths에서 하나씩 꺼내서 String path 담는다 
			File dirPath = new File(uploadPath + path);
				// C://developer/upload + \2020
			if (!dirPath.exists()) {
				dirPath.mkdir(); 
				// 디렉토리 생성
				// C://developer/upload + \2020 
				// C://developer/upload + \2020  + \04 ,2020년 아래에 하위 폴더 생성
				// C://developer/upload+ \2020  + \04 + /08 ,04월 하위폴더에 /08일 폴더 생성 
			}
		}
	}
	
	// 아이콘 생성 
	// savedPath  -> path : /2020/ 04/ 08
	// savedName -> fileName : asl;kdj13lie _abc.text
	private static String makeIcon(String uploadPath, String path, String fileName ) throws Exception {
		//아이콘의 이름
		String iconName = uploadPath + path + File.separator + fileName;
		// C://developer/upload + \2020\ 04\ 08 + / + asl;kdj13lie _abc.text
		
		//아이콘 이름을 리턴
		//Fiie.separatiorChar: 디렉토리 구분자
		// 윈도우 \ , 유닉스 (리눅스 ) /
		return iconName.substring(uploadPath.length()).replace(File.separatorChar, '/');
		// substring(uploadPath.length()) =  C://developer/upload 이부분을 자르고 
		// .replace(File.separatorChar, '/') = separatorChar 윈도우에서는 \로 표현되어있는데
        //	                                   앞에서 subString으로 자른 나머지부분에 \표시를  
		//                                     /로 치환해라 		                                       
	}
	
	private static String makeThumbnail(String uploadPath, String path, String fileName )throws Exception {
		//이미지를 읽기 위한 버퍼
		//sourceImg 원본이미지 
		BufferedImage sourceImg = ImageIO.read(new File(uploadPath + path, fileName));
		
		// 100픽셀 단위의 썸네일 생성
		// Scalr 썸네일 만들어준다 (원본이미지의 화소를 축소 해준다 )
		// Scalr.Mode.FIT_TO_HEIGHT(세로 기준), 100  (100px에 맞게) Scalr.Method.AUTOMATIC(비율에따라) 축소해라 
		BufferedImage destImg = Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT, 100);
		
		//썸네일 이름
		//  C://developer/upload \2020\04\08 + \ + s_ +  asl;kdj13lie_abc.text
		// 썸네일 이미지 앞에는 S_가 붙게 된다 
		String thumbnailName= uploadPath + path +File.separator + "s_" + fileName;
		
		// 파일을 새로 생성 
		File newFile = new File(thumbnailName);
		
		// fileName.substring 에서 .부분을 잘라라 
		// asl;kdj13lie_abc.
		String formatName = fileName.substring(fileName.lastIndexOf(".") + 1);
	    
		// 썸네일 생성
	    ImageIO.write(destImg, formatName.toUpperCase(), newFile);
		
	    // 썸네일의 이름을 리턴함
		return thumbnailName.substring(uploadPath.length()).replace(File.separatorChar, '/');
	}
}
