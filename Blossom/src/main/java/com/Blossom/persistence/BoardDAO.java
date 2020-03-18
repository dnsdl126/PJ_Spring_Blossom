package com.Blossom.persistence;

import java.util.List;

import com.Blossom.domain.BoardDTO;



public interface BoardDAO {

	public List<BoardDTO> listAll();
}
