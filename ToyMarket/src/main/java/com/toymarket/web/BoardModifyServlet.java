package com.toymarket.web;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.Date;

import org.apache.commons.lang3.math.NumberUtils;

import com.toymarket.vo.Board;
import com.toymarket.vo.Customer;
import com.toymarktet.dao.BoardDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/boardmodify")
public class BoardModifyServlet extends HttpServlet {
	
	BoardDao boardDao = BoardDao.getInstance();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인여부를 체크하기
		HttpSession session = request.getSession();
		Customer loginUser = (Customer) session.getAttribute("LOGINED_USER_INFO");
		if (loginUser == null) {
//			response.sendRedirect("../user/login?fail=deny&job=" + URLEncoder.encode("글수정하기", "utf-8"));
			response.sendRedirect("../user/loginSelect");
			return;
		}
		
		// 요청파라미터에서 수정할 게시글 번호 조회하기
		int boardNo = NumberUtils.toInt(request.getParameter("no"));
		Board board = boardDao.getBoardByNo(boardNo);
		// 요청객체에 속성으로 게시글 정보 저장하기
		request.setAttribute("board", board);
		
		// 게시글 입력폼 페이지로 내부이동 시키기
		request.getRequestDispatcher("/WEB-INF/views/board/modifyform.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인여부를 체크하기
		HttpSession session = request.getSession();
		Customer loginUser = (Customer) session.getAttribute("LOGINED_USER_INFO");
		if (loginUser == null) {
//			response.sendRedirect("../user/login?fail=deny&job=" + URLEncoder.encode("글수정하기", "utf-8"));
			response.sendRedirect("../user/loginSelect");
			return;
		}
		
		// 요청파라미터에서 수정폼의 입력값을 조회한다.
		int boardNo = NumberUtils.toInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 게시글번호에 해당하는 게시글정보를 조회한다.
		Board board = boardDao.getBoardByNo(boardNo);
		// 게시글 정보를 수정폼의 입력값으로 갱신한다.
		board.setTitle(title);
		board.setContent(content);
		board.setUpdatedDate(new Date());
		// 변경된 게시글정보를 데이터베이스에 반영한다.
		boardDao.updateBoard(board);
		
		// 페이징처리를 위해서 요청파라미터에서 페이지번호를 조회한다.
		int pageNo = NumberUtils.toInt(request.getParameter("page"));
		
		// 게시글 목록을 재요청하는 URL을 응답으로 보낸다.
		response.sendRedirect("boarddetail?no=" + pageNo + "&page=" + pageNo);
	}
}
