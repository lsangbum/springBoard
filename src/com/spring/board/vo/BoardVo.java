package com.spring.board.vo;

import java.util.ArrayList;

public class BoardVo {
	
	private String 	boardType;
	private int 	boardNum;
	private String 	boardTitle;
	private String 	boardComment;
	private String 	creator;
	private String 	createTime;
	private String	modifier;
	private int totalCnt;
	private String CodeName; 
	
	//다중데이터를 한번에 담아 저장하기 위한 변수
	private ArrayList<BoardVo> boardVoList;
	

	public BoardVo() {}

	public BoardVo(String boardTitle, String boardComment) {
		this.boardTitle = boardTitle;
		this.boardComment = boardComment;
	}
	
	public ArrayList<BoardVo> getBoardVoList() {
		return boardVoList;
	}

	public void setBoardVoList(ArrayList<BoardVo> boardVoList) {
		this.boardVoList = boardVoList;
	}

	public int getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getBoardType() {
		return boardType;
	}
	public void setBoardType(String boardType) {
		this.boardType = boardType;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardComment() {
		return boardComment;
	}
	public void setBoardComment(String boardComment) {
		this.boardComment = boardComment;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getModifier() {
		return modifier;
	}
	public void setModifier(String modifier) {
		this.modifier = modifier;
	}
	public String getCodeName() {
		return CodeName;
	}
	public void setCodeName(String codeName) {
		CodeName = codeName;
	}
	
}
