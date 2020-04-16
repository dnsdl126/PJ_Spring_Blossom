package com.Blossom.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SchedulerTest {
	
	// Cron 표기법
	// 초 분 시간 일 월 년도 순으로 작성 
	//@Scheduled(cron="0 52 9  * * * ") 
	
	public void cronTest() {
		log.info("Welcome Seduling :)");
	}

}
