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

@WebServlet("/user/login")
public class LoginServlet extends HttpServlet {

	// GET방식의 /login 요청이 왔을 때 실행되는 메소드 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.getRequestDispatcher("/WEB-INF/views/user/loginform.jsp").forward(req, resp);
	}
	
	// POST방식의 /login 요청이 왔을 때 실행되는 메소드
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		// 카카오사용자인지 조회
		String iskakao = req.getParameter("iskakao");
		String isadmin = req.getParameter("isadmin");
		
		// 폼 입력값을 요청파라미터로 조회
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String password = req.getParameter("password");
		
		// 아이디로 사용자 정보 조회
		UserDao userDao = UserDao.getInstance();
		Customer savedUser = userDao.getCustomerById(id);
		
		// 카카오사용자인지 조회 and 아니라면 회원가입으로 iskakao,id,이름을 받아서 넘어감
		if (iskakao.equals("yes") && savedUser == null) {
			req.getRequestDispatcher("/WEB-INF/views/user/registerform.jsp?iskakao="+iskakao+"&id="+id+"&name="+name).forward(req, resp);
			return;
		}
		
		if (savedUser == null) {
			if (isadmin.equals("yes")) {
				resp.sendRedirect("/admin?fail=invalid");
				return;
			}
			resp.sendRedirect("/user/login?fail=invalid");
			return;
		}
		
		// 탈퇴처리된 사용자라면 로그인폼을 재요청
		if (!savedUser.getStatus().equals("N")) {
			if (isadmin.equals("yes")) {
				resp.sendRedirect("/admin?fail=drop");
				return;
			}
			resp.sendRedirect("/user/login?fail=drop");
			return;
		}
		
		// 카카오사용자가 아닌 다른 사용자의 비밀번호가 일치하지 않으면 로그인폼을 재요청
		if (!iskakao.equals("yes")) {
			String pwd = DigestUtils.sha256Hex(password);
				if (!pwd.equals(savedUser.getPassword())) {
					if (isadmin.equals("yes")) {
					resp.sendRedirect("/admin?fail=invalid");
					return;
					}
				resp.sendRedirect("/user/login?fail=invalid");
				return;
			}
		}
		
		if (isadmin.equals("yes") && savedUser != null) {
			// 인증이 완료된 사용자정보를 세션객체에 속성으로 저장하기
			HttpSession session = req.getSession();
			session.setAttribute("LOGINED_USER_INFO", savedUser);
			resp.sendRedirect("/admin");
			return;
		}
		// 인증이 완료된 사용자정보를 세션객체에 속성으로 저장하기
		HttpSession session = req.getSession();
		session.setAttribute("LOGINED_USER_INFO", savedUser);
		
		resp.sendRedirect("/home");
	}
}


