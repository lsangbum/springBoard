package com.spring.board.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;

@Service
public class boardServiceImpl implements boardService{
	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectTest();
	}
	
	
	@Override
	public List<BoardVo> SelectBoardList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoardList(map);
	}//###############게시글리스트출력####################
	
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoardCnt();
	}//###############리스트 갯수####################
	
	@Override
	public BoardVo selectBoard(String boardType, int boardNum) throws Exception {
		// TODO Auto-generated method stub
		BoardVo boardVo = new BoardVo();
		
		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);
		
		return boardDao.selectBoard(boardVo);
	}//###############게시글상세보기####################
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		int result = 0;
		if(!boardVo.getBoardVoList().isEmpty()) {
			ArrayList<BoardVo> list = boardVo.getBoardVoList();
			
			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).getBoardTitle() == null) {
					list.remove(i);
				}
			} // null값 제거
			for(int i = 0; i < list.size(); i++) {
				boardVo = list.get(i);
				result = boardDao.boardInsert(boardVo);
			}//boardVoList에 값이 있다면 set후 호출
		}else {
			result = boardDao.boardInsert(boardVo);
		}
		return result;
	}//###############게시글저장####################

	@Override
	public int boardDelete(BoardVo boardVo) throws Exception{
		// TODO Auto-generated method stub
		return boardDao.boardDelete(boardVo);
	}//###############게시글삭제####################

	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception{
		// TODO Auto-generated method stub
		return boardDao.boardUpdate(boardVo);
	}//###############리스트수정####################


	@Override
	public List<ComCodeVo> selectComCodeList() throws Exception{
		// TODO Auto-generated method stub
		return boardDao.selectComCodeList();
	}//###############리스트타입####################

}
