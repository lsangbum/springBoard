package com.spring.board.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {

	@Autowired
	boardService boardService;

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	// #############################게시글 리스트(boardList)##############################
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, BoardVo boardVo, Model model, PageVo pageVo) throws Exception {
		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		Map<String, Object> map = new HashMap<String, Object>();
		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();
		
		int page = 1;
		int totalCnt = 0;
		String result = "board/boardList";
		
		if (pageVo.getPageNo() == 0) 
				pageVo.setPageNo(page);//페이지 기본값
		
		if(boardVo.getBoardType() != null) {
			String[] boardType =boardVo.getBoardType().split(",");//체크박스선택시 전달
			map.put("boardType", boardType);
			result = "board/boardListAction_data";
		}
		
		map.put("pageNo", pageVo.getPageNo());
		
		boardList = boardService.SelectBoardList(map);//전체 리스트
        totalCnt = boardService.selectBoardCnt();//전체글 수
        comCodeList = boardService.selectComCodeList();//게시글 타입
		         
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("comCodeList", comCodeList); 
		model.addAttribute("pageNo", pageVo.getPageNo());

		return result;
	}
	// #############################게시글 리스트(boardList)##############################
	
	// #############################게시글 상세(boardView)##############################
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model, @PathVariable("boardType") String boardType,
			@PathVariable("boardNum") int boardNum, PageVo pageVo) throws Exception {
		BoardVo boardVo = new BoardVo();

		int page = 1;
		//int totalCnt = 0;

		if (pageVo.getPageNo() == 0) 
				pageVo.setPageNo(page);

		boardVo = boardService.selectBoard(boardType, boardNum);

		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		model.addAttribute("page", pageVo);
		return "board/boardView";
	}
	// #############################게시글 상세(boardView)##############################
	
	// #############################게시글 작성1(boardWrite)##############################
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model, int pageNo) throws Exception {
		
		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();
		comCodeList = boardService.selectComCodeList();
		model.addAttribute("comCodeList", comCodeList);
		model.addAttribute("pageNo", pageNo);
		
		return "board/boardWrite";
	}
	// #############################게시글 작성1(boardWrite)##############################
	
	// #############################게시글 작성2(boardWriteAction)##############################
	
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody 
	public String boardWriteAction(Locale locale, BoardVo boardVo, Model model) throws Exception {
		  
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		//다수의 VO를 한번에 저장시키기 위해 boardVo에 List<BoardVo> 변수를 생성한 뒤 그 변수 명에 맞춰 jsp태그 name + [index] 를 준다.
		//그럼 데이터가 넘어오면서 boardVo에 있는 List변수를 참조하여 데이터가 삽입된다.
		
		int resultCnt = boardService.boardInsert(boardVo);
		System.out.println("boardType : " + boardVo.getBoardType());
		
		result.put("success", (resultCnt > 0) ? "Y" : "N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);
		System.out.println("callbackMsg::" + callbackMsg);
	    return callbackMsg; 
	  }
	
	// #############################게시글 작성2(boardWriteAction)##############################
	
	// #############################게시글 삭제(boardDelete)##############################
	@RequestMapping(value = "/board/boardDelete.do", method = RequestMethod.GET)
	public String boardDelete(BoardVo boardVo, PageVo pageVo, Model model) throws Exception {

		int result = boardService.boardDelete(boardVo);

		model.addAttribute("result", result);// 데이터 삭제 성공여부
		model.addAttribute("page", pageVo);
		model.addAttribute("boardNum", boardVo.getBoardNum());

		return "board/boardDelete";
	}
	// #############################게시글 삭제(boardDelete)##############################
	
	// #############################게시글 수정1(boardUpdate)##############################
	@RequestMapping(value = "/board/boardUpdate.do", method = RequestMethod.GET)
	public String boardUpdate(Model model, BoardVo boardVo, PageVo pageVo) throws Exception {

		int page = 1;
		int totalCnt = 0;

		if (pageVo.getPageNo() == 0) 
				pageVo.setPageNo(page);

		boardVo = boardService.selectBoard(boardVo.getBoardType(), boardVo.getBoardNum());

		model.addAttribute("board", boardVo);
		model.addAttribute("page", pageVo);
		return "board/boardUpdate";
	}
	// #############################게시글 수정1(boardUpdate)##############################	 

	// #############################게시글 수정2(boardUpdateAction)##############################
	// ####게시글 수정####JSON데이터에 문자손상 있을경우 produces 를 활용하여 encode해준다.
	@RequestMapping(value = "/board/boardUpdateAction.do", method = RequestMethod.POST,
			produces = "application/json; charset=utf8")
	@ResponseBody
	public String boardUpdateAction(Locale locale, BoardVo boardVo, Model model) throws Exception {

		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();

		int resultCnt = boardService.boardUpdate(boardVo);

		result.put("success", (resultCnt == 0) ? "업데이트 된 글이 없습니다." : (resultCnt > 0) ? boardVo.getBoardNum() + "번 글이 수정되었습니다." : " ");
		
		String callbackMsg = commonUtil.getJsonCallBackString(" ", result);

		System.out.println("callbackMsg::" + callbackMsg);

		return callbackMsg;
	}
	// #############################게시글 수정2(boardUpdateAction)##############################
	
	// #############################회원가입 페에지 이동(memberJoin)##############################
	@RequestMapping(value = "/member/memberJoin.do", method = RequestMethod.GET)
	public String memberJoin(PageVo pageVo, Model model) throws Exception {

		List<ComCodeVo> comCodeList = new ArrayList<ComCodeVo>();
		comCodeList = boardService.selectComCodeList();
		model.addAttribute("comCodeList", comCodeList);
		model.addAttribute("pageNo", pageVo);

		return "member/memberJoin";
	}
	// #############################게시글 삭제(boardDelete)##############################
	// #############################게시글 삭제(boardDelete)##############################
	@RequestMapping(value = "/member/memberLogin.do", method = RequestMethod.GET)
	public String memberLogin() throws Exception {


		return "member/memberLogin";
	}
	// #############################게시글 삭제(boardDelete)##############################
	
}// class
