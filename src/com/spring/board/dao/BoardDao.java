package com.spring.board.dao;

import java.util.List;
import java.util.Map;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;

public interface BoardDao {
	//Test
	public String selectTest() throws Exception;
	//게시글리스트출력
	public List<BoardVo> selectBoardList(Map<String, Object> map) throws Exception;
	//게시글상세출력
	public BoardVo selectBoard(BoardVo boardVo) throws Exception;
	//게시글갯수출력
	public int selectBoardCnt() throws Exception;
	//게시글저장
	public int boardInsert(BoardVo boardVo) throws Exception;
	//게시글삭제
	public int boardDelete(BoardVo boardVo) throws Exception;
	//게시글수정
	public int boardUpdate(BoardVo boardVo) throws Exception;
	//게시글 타입
	public List<ComCodeVo> selectComCodeList() throws Exception;

}
