package com.Blossom.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.Blossom.domain.MemberDTO;
import com.Blossom.service.member.MemberService;

import lombok.extern.slf4j.Slf4j;

/*
 * SessionAttributes로 설정된 변수(객체)는
 * response를 하기전에 서버의 기억장소 어딘가에 임시로 보관을 해둔다
 * web browser와 Server간에 한번이라도 연결이 이루어 졌으면
 * Session.. 에 등록된 변수는 서버가 중단될때까지 그 값이 그대로 유지된다
 * web은 클라이언트 req를 서버가 받아서
 * res를 수행하고 나면 모든 정보가 사라지는 특성이 있다.
 * 이런 특성과 달리 Spring 기반의 web은 일부 데이터를
 * 메모리에 보관했다가 재사용하는 기법이 있다.
 * 그중 SesisonAttributes라는 기능이 있다.
 * 
 *  SesisonAttributes()에 설정하는 문자열(이름)은
 *  클래스의 표준 객체생성 패턴에 의해 만들어진 이름
 *  MemoDTO memoDTo
 *  
 *  이름을 표준 패턴이 아닌 임의의 이름으로 바꾸고 싶다.
 */


@RequestMapping("/member")
// member은 다와라
@Slf4j
//로그
@Controller
//빈즈등록
@SessionAttributes({"memberDTO"})
public class MemberController {
	@Autowired
	MemberService mService;
	/*
	 * SessionAttributes를 사용하기 위해서는
	 * 반드시 해당 변수를 생성하는 method가 controller에 있어야 하고
	 * 해당 메서드에서는 @ModelAttribute("변수명")가 있어야 한다.
	 */
	
	/*
	 * 초기화 하는 방식
	 * 저장만 하면 찌꺼기 데이터가 남아있음 그래서 초기화 해줘야함
	 * 안해주면 에러남
	 */
	@ModelAttribute("memberDTO")
	public MemberDTO newMember() {
		return new MemberDTO();
	}

	
	
	
	@GetMapping("/join")
	public String join (@ModelAttribute("MemberDTO") MemberDTO mDto,
			@RequestParam(value= "flag", defaultValue="0") String flag,
			 Model model) { //Constract 페이지를 통하면 flag = 1, 비정상 접근시 0
		log.info(">>>> Member/JOIN PAGE GET 출력");
		log.info(mDto.toString());
		
		model.addAttribute("flag", flag);
		return "member/join";
		        
	}
	
	/*
	 * join POST가 mDto 를 수신할때
	 * 입력 form에서 사용자가 입력한 값들이 있으면
	 * 그 값들을 mDto의 필드변수에 setting을 하고
	 * 
	 * 만약 없으면
	 * 메모리 어딘가에 보관중인 SessionAttributes로 설정된
	 * mDto 변수에서 값을 가져와서 비어있는
	 * 필드 변수를 채워서서 매개변수에 주입한다.
	 * 
	 * 따라서 form에서 보이지 않아도 되는 값들은
	 * 별도의 코딩을 하지 않아도
	 * 자동으로 join POST로 전송되는 효과를 낸다.
	 * 단, 이기능을 효율적으로 사용하려면
	 * jsp 코드에서 Spring-form tag로 input을 코딩해야 한다.
	 */
	
	
	
	@PostMapping("/join")
	 public String join(@ModelAttribute("memberDTO") MemberDTO mDto, SessionStatus sessionStatus) {
		log.info(">>MEMBER/JOIN POST DB에 회원정보 저장");
		log.info(mDto.toString());
		 //SessionAttributes를 사용 할때 insert, update가 완료되고
		//view로 보내기전 반드시 setComplet()를 실행하여
		//session에 담긴 값을 clear해줘야 한다 
		
		//2.DB에 회원 등록
		 int result = mService.memInsert(mDto);
		 
		//3.회원 등록 결과
		 if(result > 0) {
			 log.info(">>>>>>>>" + mDto.getId()+ "님 회원가입되셨습니다");
		 }
		
		
		sessionStatus.setComplete();
		return "";
	}
	
	/*
	 * SessionAttributes에서 설정한 변수 (객체)에는
	 * @ModelAttribute를 설정해 두어야 한다
	 * 단,5.x이하에서는 필수 5.x 이상에서는 선택
	 * 
	 * 만약 Attributes의 이름을 표준패턴이 아닌 임의의 이름으로 사용할 경우
	 * @Modelattribute("객체이름")을 필수로 지정해 주어야 한다. 
	 * 
	 */
	@GetMapping("/constract")
	public String viewConstract () {
		log.info(">>>> MEMBER/CONSTRACT PAGE 출력");
		 return "member/constract";
		        
	}
	
	// 회원가입 ID 중복체크
	@ResponseBody
	@PostMapping("/idoverlap")
	public String idOverlap(String id) {
		log.info(">>>> ID OVERLAP CHECk");
		log.info("아이디: " + id);
		
		int cnt = mService.idOverlap(id);
		log.info("cnt :" + cnt);
		String flag = "1";
		if(cnt == 0) {
			flag = "0";
		}
		return flag;
	}
	

	
	
}
	