package com.Blossom.util;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.MediaType;



public class MediaUtils {

	private static Map<String, MediaType> mediaMap;
	
	static {
		mediaMap = new HashMap<>();
		mediaMap.put("JPG", MediaType.IMAGE_JPEG);
		mediaMap.put("GIF", MediaType.IMAGE_GIF);
		mediaMap.put("PNG", MediaType.IMAGE_PNG);
	}
	public static MediaType getMediaType(String type) {
		// toUpperCase() 대문자로 변경 
		//String type : .png, .jpg 등이 들어온다 
		return mediaMap.get(type.toUpperCase());
		// .png 로 들어오면 대문자로 바꿔준다 .PNG
	}
}
