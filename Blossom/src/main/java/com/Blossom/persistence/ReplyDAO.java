package com.Blossom.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.Blossom.domain.ReplyDTO;

public interface ReplyDAO {

	public List<ReplyDTO> list(@Param("bno") int bno);
	// @Param 이라는 이름표를 붙여줬기 때문에
	// 내가 원하는 명으로 mapper를 사용할수 있다 
	// bno로 꺼내주면 된다 
	// public List<ReplyDTO> list(int bno);
	// 이럴경우는 @param1 으로 적용됨
	
	public void insert(ReplyDTO rDto);
	
	//댓글 수 +1
	public void replyUpdate(@Param("bno") int bno, @Param("type") String type);
	// Map으로 처리 방법
//	public void replyUpdate(@Param("map") Hashmap<String, object> map);
	
	
	public void delete(@Param("rno") int rno);
	
	
}
