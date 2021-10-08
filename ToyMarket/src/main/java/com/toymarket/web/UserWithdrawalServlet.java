package com.toymarket.web;

import java.io.IOException;

import org.apache.commons.codec.digest.DigestUtils;

import com.toymarket.vo.Customer;
import com.toymarktet.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/withdrawal")
public class UserWithdrawalServlet extends HttpServlet {

	// GET방식의 /withdrawal 요청이 왔을 때 실행되는 메소드 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/user/withdrawal.jsp").forward(req, resp);
	}
	
	// POST방식의 /withdrawal 요청이 왔을 때 실행되는 메소드
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		
		Customer userSession = (Customer) session.getAttribute("LOGINED_USER_INFO");
		
		// 폼 입력값을 요청파라미터로 조회
		String id = userSession.getId();
		String password = req.getParameter("password");
		
		// 아이디로 사용자 정보 조회
		UserDao userDao = UserDao.getInstance();
		Customer savedUser = userDao.getCustomerById(id);
		
		if (savedUser == null) {
			resp.sendRedirect("/user/withdrawal?fail=invalid");
			return;
		}
		String pwd = DigestUtils.sha256Hex(password);
		if (!pwd.equals(savedUser.getPassword())) {
			resp.sendRedirect("/user/withdrawal?fail=pwdDiscordance");
			return;
		}
		
		// deleteUserInfo실행해서 사용자정보를 탈퇴상태로 변경한다.
		userDao.deleteCustomer(id);
		
		//세션을 폐기한다.
		session.invalidate();
		
		// 브라우저에게 재요청 URL을 응답으로 보낸다.
		resp.sendRedirect("/result?success=withdrawalMembership");
	}
}
