package com.Blossom.service.reply;

import java.util.List;

import com.Blossom.domain.ReplyDTO;



public interface ReplyService {
	
	public List<ReplyDTO> list(int bno);
	
	public void insert (ReplyDTO rDto);
	
	public void delete (int rno, int bno);
}
