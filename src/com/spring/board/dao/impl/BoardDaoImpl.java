package com.spring.board.dao.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		
		String a = sqlSession.selectOne("board.boardList");
		
		return a;
	}
	/**
	 * 
	 * */
	@Override
	public List<BoardVo> selectBoardList(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardList",map);
	}//게시글 리스트 출력
		
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardTotal");
	}//게시글 총 카운트
	
	@Override
	public BoardVo selectBoard(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardView", boardVo);
	}//게시글 상세보기
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.boardInsert", boardVo);
	}//게시글 저장
	
	@Override
	public int boardDelete(BoardVo boardVo) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.delete("board.boardDelete", boardVo);
	}//게시글 삭제
	
	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.update("board.boardUpdate", boardVo);
	}//게시글 수정
	@Override
	public List<ComCodeVo> selectComCodeList() throws Exception{
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.selectComCodeList");
	}
	
	
	
}
