package com.toymarket.web.order;

import java.io.IOException;
import java.net.URLEncoder;

import com.toymarket.vo.Customer;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order/address")
public class AddressServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
	/*	

		//front에서 파라미터 받기
		HttpSession session = req.getSession();
		Customer user = (Customer) session.getAttribute("LOGINED_USER_INFO");
		if (user == null) { // 만약로그인이 안되어있다면 그아래에 sendRedirect가 로그인안되어있음
			rep.sendRedirect("/user/login");
			return;
		}*/
				
		
		
		req.getRequestDispatcher("/WEB-INF/views/api/jusoPopup.jsp").forward(req, rep);
		
	}
}