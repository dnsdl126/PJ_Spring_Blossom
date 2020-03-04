package com.Blossom.service.mail;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.Blossom.persistence.MemberDAO;

@Service
public class MailServiceImpl implements MailService{
	
	 @Autowired
	  JavaMailSender mailSender;
	 
	 @Autowired
	 private SqlSession sqlSession;
	 
	 
	 private MemberDAO mDao;
	 @Autowired
	 private void MemberDAO() {
		 mDao = sqlSession.getMapper(MemberDAO.class);
	 }
	 // 이메일 난수 생성 메서드
	 private String init() {
		 Random ran = new Random();
		 StringBuffer sb = new StringBuffer();
		 
		 //String만 써도 작업은 되지만 문자열 효율성때문에 StringBuffer을 사용
		 //String 은 불변값 값을 바꿀수가 없다.
		 // 값을 새로 만들면 기존 데이터를 버리고 새로운 데이터를 저장 --> 20개의 객체를 만들어 버린다 
		 //buffer : 임시저장소. 속도차이 때문에 사용  buffer 영역에 뒀다가 최종적으로 끝났을때
		 //         한번에 데이터를 저장하겠다 
		 
		 int num = 0;
		  
		 // do - while 문 : do실행후 while 실행 
		 do {
			 num = ran.nextInt(75) + 48; //num에 무작위 숫자가 들어온다 
			 if((num >= 48 && num <=57) || (num >= 65 && num <=90) || (num >= 97 && num <=122)) {
				  // ex) char=48 을 문자로 변환 
				  // 숫자가 문자로 변환 된다 ex ac!welifl... 
				 sb.append((char) num); //append 추가 하라 
		 		} else {
			       continue;
		 		}
			 
		 	} while (sb.length() < size); // 길이가 20까지 늘어날때 까지 반복 
		   if(lowerCheck) {
			   return sb.toString().toLowerCase();
		   }
	     return sb.toString(); // init 에서 만들어진 난수를 리턴 
    }
	 //난수를 이용한 키 생성
	 private boolean lowerCheck;
	 private int size;
	 
	 
	 private String getKey(boolean lowerCheck, int size) {
		 this.lowerCheck = lowerCheck;
		 this.size = size;
		 return init();
	 }
	 
	 
	 // 회원가입 발송 이메일 (인증키 발송)
	 @Override
	  public void mailSendUser (String email, String id, HttpServletRequest request) {
	     String key = getKey(false, 20); //길이 20의 난수 생성
	    mDao.getKey(email, key);
	    MimeMessage mail = mailSender.createMimeMessage(); // Mime타입 : 사진이나 동영상을 형변환 하는 타입
	    String htmlTxt = "<h2> 안녕하세요 Blossom 입니다 :)</h2><br><br>"
	    		       + "<h3>" + id + "님</h3>" + "<p>인증하기 버튼을 누르시면 Blossom 사이트 활동이 가능합니다"
	    		       + "<a href='http://localhost:8081" + request.getContextPath() + "/member/keyauth?id="
	    		       + email + "&key="+key+"'>인증하기</a></p>"
	    		       + "(Blossom에 가입한 적이 없다면 무시하셔도 됩니다:) )";//모델1방식 
	     try {
	    	 mail.setSubject("본인인증"); // 메일 제목 
	    	 mail.setText(htmlTxt, "utf-8", "html"); // 메일 내용 인식 
	    	 mail.addRecipient(RecipientType.TO, new  InternetAddress(email)); //메일수신자(사용자가입력한 email)
	    	 mailSender.send(mail); //메일발송
	      } catch (MessagingException e) {
	    	  e.printStackTrace();
	      }
	   }

	@Override
	public int keyAuth(String id, String key) {
		// TODO Auto-generated method stub
		return mDao.alterKey(id, key);
	}
}