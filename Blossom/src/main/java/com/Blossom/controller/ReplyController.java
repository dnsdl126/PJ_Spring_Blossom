package com.Blossom.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.Blossom.domain.ReplyDTO;
import com.Blossom.service.reply.ReplyService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/reply")
public class ReplyController {
	
	@Autowired
	private ReplyService rService;
	
	@GetMapping("/list")
	public String list(int bno, Model model) { // int bno는  ajax의  url: ?bno=${one.bno}" 명시된 bno 
		
		log.info(">>>>> GET: Reply List PAGE"); 
		// log처리가 되면 ajax 를 타고 여기까지 잘 왔다는 의미
		// log가 안뜨면 ajax URL 확인이 필요 하다 
		
		
//		for(ReplyDTO replyDTO : list) {
//			log.info(replyDTO.toString());
//		}
		
		model.addAttribute("list", rService.list(bno));
		// model 은 화면단으로 전송할 데이터를 담는다 
		// ("list", rService.list(bno)) ("이름", 데이터 )
		// list라고 이름 붙여서 보낼 데이터는 rService.list(bno) 이다 
		// rService.list(bno) 메서드 호출문으로 데이터를 쓰는 것은
		// 무조건 return값으로 데이터를 받는다는 의미 
		// 해당 댓글의 목록를 list로 만들어서 보내야 하기 때문에
		// return으로  list로 보내야 한다 
		
		return "/board/commentlist"; // ajax의 result
		// 화면단 어디로 이동할것인지 명시 
		// return할 view단의 jsp 파일명과 일치 해야 한다 
		
		// @Responsebody르 붙이면/board/commentlist 를 경로가아닌
		// 데이터자체 로 인식 /board/commentlist 문자그대로 출력하게 되어
		// 붙이지 않는다
		// Model은 화면이동시 쓸수 있으므로 @Responsebody 인식시 사용 불가 
	}

}
