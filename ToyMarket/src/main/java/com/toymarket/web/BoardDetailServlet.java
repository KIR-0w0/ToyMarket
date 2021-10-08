package com.toymarket.web;

import java.io.IOException;
import java.util.Date;

import org.apache.commons.lang3.math.NumberUtils;

import com.toymarket.vo.Board;
import com.toymarktet.dao.BoardDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/boarddetail")
public class BoardDetailServlet extends HttpServlet {

	BoardDao boardDao = BoardDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청파라미터에서 게시글 번호를 조회한다.
		int boardNo = NumberUtils.toInt(request.getParameter("no"));
		// 게시글 번호에 해당하는 게시글정보를 조회한다.
		Board board = boardDao.getBoardByNo(boardNo);
		// 요청객체의 속성으로 게시글 정보를 저장한다.
		request.setAttribute("board", board);
		
		// 조회수를 증가시키고, 최종수정일을 대입한다.
		board.setViewCount(board.getViewCount() + 1);
		board.setUpdatedDate(new Date());
		// 변경된 게시글 정보를 데이터베이스에 반영한다.
		boardDao.updateBoard(board);
		
		// 게시글 보기 페이지로 내부이동한다.
		request.getRequestDispatcher("/WEB-INF/views/board/detail.jsp").forward(request, response);
	}
	
}



