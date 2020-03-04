package com.Blossom.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.Blossom.domain.MemberDTO;
import com.Blossom.service.mail.MailService;
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
	PasswordEncoder passwordEncoder;
	
	@Autowired
	private MailService mailService;
	
	// 권한 부여 (IOC : 개발자의 객체생성권한을 Spring 한테 넘김, @Service, @contorller, )
	//오버라이드는 DI 패턴만 가능 객체에대한 권한을 Spring이 가지고 있을때만 가능하다.	
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

	
	

	@GetMapping("/join") // view(cosntract.jsp) -> view(join.jsp) 이동시에도 Controller 단을 타야 한다 
	public String join (@ModelAttribute("MemberDTO") MemberDTO mDto,
			@RequestParam(value= "flag", defaultValue="0") String flag, 
			 Model model) { //Constract 페이지를 통하면 flag = 1, 비정상 접근시 0
		log.info(">>>> Member/JOIN PAGE GET 출력");
		log.info(mDto.toString());
		//비정상 적인 접근일 경우 약관 동의 페이지로 이동
		if(!flag.equals("1")) {
			
			return "member/constract"; 
			// Constrat에서 접근시 1의 값이 넘어오는데
			// String flag = 0; 으로 선언하면
		    // 값이 1이 들어와도 0으로 초기화 되버림
		    // String flag;는 Default를 설정 불가 @Requestparam으로 선언하여 기본값 속성을 사용 
		    // flag는 MemberDTO 값에 담겨있지 않아
		    // String flag를 입력해야 함 
		}
		
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
	 public String join(@ModelAttribute("memberDTO") MemberDTO mDto, 
			                            SessionStatus sessionStatus, 
			                            HttpServletRequest request,
			                            RedirectAttributes rttr)
	                   
	     //View 단에서  Controller 단으로 이동
	   { log.info(">>MEMBER/JOIN PAGE Post 출력");
		 
	    // View 단에서 전송된 데이터가 잘 전달 되었는지 확인 
	   log.info(mDto.toString());
	   
		
		
		log.info("Password: " + mDto.getPw()); // 사용자 입력 값 pw 값
		//1. 사용자 암호 hash  변환
		String encPw = passwordEncoder.encode(mDto.getPw());
	      // encPw = 암호화 된 비밀번호 
		  // security에 담긴 기능 
		
		mDto.setPw(encPw);
		  // 기존에 암호화 안된 비밀번호 말고  encPw 암호화된 비밀번호 담아라 
		log.info("Password(+Hash):" + mDto.getPw());
		             
		
		
		//2.DB에 회원 등록
		 int result = mService.memInsert(mDto);
		        //mService (MemberService 의 객체)위에 Autowired로 의존성 주입을 해둔상태
		 		// 별도 객체생성을 할필요 없다.
		        // MemberService 의 memInsert에가서 mDto 전달  
		        
		//3.회원 등록 결과
		 if(result > 0) {
			 log.info(">>>>>>>>" + mDto.getId()+ "님 회원가입되셨습니다");
		 }
		 //4.회원가입 인증 메일 보내기
		 mailService.mailSendUser(mDto.getEmail(), mDto.getId(), request);
		 //SessionAttributes를 사용 할때 insert, update가 완료되고
		 //view로 보내기전 반드시 setComplet()를 실행하여
		 //session에 담긴 값을 clear해줘야 한다 
		
		sessionStatus.setComplete();
		
		//회원가입 후 메시지 출력을 위한 값 
		rttr.addFlashAttribute("id", mDto.getId()); // ~님
		rttr.addFlashAttribute("email", mDto.getEmail()); // ~메일로 
		rttr.addFlashAttribute("key", "join");
		
		return "redirect:/";
		
		//redirect:/ mapping을 새로 타라 -> index 페이지를 새로 띄움
		// 서버단에서 view 단으로 갈때 포워드 방식와 샌드리다이렉트 2가지 방식이 있다 
		// 포워드는 페이지 이동을하지 않고 기존 페이지에 내용만 덮어준다
		// 포워드는 DB에 변환작업이 들어가는 경우 사용하면 안된다
		// 포워드가 디폴트 여서 리다이렉트 사용시 선언해줘야 한다 
		// 샌드리다이렉트는 페이지를 새로만들면서 주소가 변경된다 
		// 리다이렉트는 값이 바뀌는 경우 사용 
	}
	
	//회원가입후 email 인증
	@GetMapping("/keyauth")
	 public String keyAuth(String id, String key, RedirectAttributes rttr) {
		
		mailService.keyAuth(id, key);
		
		//인증후 메시지 출력을 위한 값 전달
		rttr.addFlashAttribute("id", id);
		rttr.addFlashAttribute("key", "auth" );
		
		return "redirect:/";
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
	public String viewConstract () { // 따로 GET, Post 설정이 안되어 있기 때문에 
		                             // @controller 를 가진 /member 에서 GEt이 붙은 /constract를 찾음
		log.info(">>>> MEMBER/CONSTRACT PAGE 출력");
		 return "member/constract"; // 환면단 결정 핸들러 어뎁터한테 전달 
		        
	}
	
	// 회원가입 ID 중복체크
	@ResponseBody // 화면단을 결정하는 것이 아니므로 ResponseBody를 붙인다 return 값을 화면단을 인식하지 않고 데이터로 인식 
	@PostMapping("/idoverlap")
	public String idOverlap(String id) {
		log.info(">>>> ID OVERLAP CHECk");
		log.info("아이디: " + id);
		
		int cnt = mService.idOverlap(id);
		log.info("cnt :" + cnt);
		String flag = "1"; // ajax는 반한되서 받을 때 String만 받을수 있어서   ajax가 인식하도록  String flag 사용 
		if(cnt == 0) {
			flag = "0";
		}
		return flag;
	}
	
	//회원 정보 수정
	@GetMapping("/update")
	public String memUpdate(HttpSession session, Model model) {
		log.info(">>>>>> GET : Member Update Page ");
		
		//현재 로그인 상태를 확인
		// session 에 담는 순간 자신의 타입을 읽어버리고 object 타입이 된다
		// (String)으로 형변환 필요
		String id = (String)session.getAttribute("userid");
		
		if(id == null) { // null : 로그인이 안됨
			
			return "redirect:/";
		}
		
		// 로그인된 유저의 정보를 GET하여
		// 회원정보 수정 페이지로 보내기 
//		MemberDTO mDto = mService.userView(id);
		model.addAttribute("user", mService.userView(id));
		
		return "member/join";
		
	}
		
	
}
	