package com.spring.board.service;

import java.util.List;
import java.util.Map;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;

public interface boardService {
	//Test
	public String selectTest() throws Exception;
	//게시글리스트출력
	public List<BoardVo> SelectBoardList(Map<String, Object> map) throws Exception;
	//게시글상세출력
	public BoardVo selectBoard(String boardType, int boardNum) throws Exception;
	//게시글갯수출력
	public int selectBoardCnt() throws Exception;
	//게시글저장
	public int boardInsert(BoardVo boardVo) throws Exception;
	//게시글삭제
	public int boardDelete(BoardVo boardVo) throws Exception;
	//게시글수정
	public int boardUpdate(BoardVo boardVo) throws Exception;
	//게시글타입출력
	public List<ComCodeVo> selectComCodeList() throws Exception;

}//interface
