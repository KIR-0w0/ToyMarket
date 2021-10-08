package com.toymarket.web;

import java.io.IOException;
import java.net.URLEncoder;

import org.apache.commons.codec.digest.DigestUtils;

import com.toymarket.vo.Customer;
import com.toymarktet.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/user/detail")
public class UserDetailServlet extends HttpServlet {

	// GET방식의 /user/detail 요청이 왔을 때 실행되는 메소드 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/user/detail.jsp").forward(req, resp);
	}
	
	// POST방식의 /user/detail 요청이 왔을 때 실행되는 메소드
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		 //로그인 후 장바구니 이용가능 
		
		Customer userSession = (Customer) session.getAttribute("LOGINED_USER_INFO");
		
		// 폼 입력값을 요청파라미터로 조회
		String id = userSession.getId();
		String password = req.getParameter("password");
		String name = req.getParameter("name");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
	    String postalCode = req.getParameter("postalCode");;
		String address1 = req.getParameter("address1");
		String address2 = req.getParameter("address2");
		
		// SAMPLE_USERS 테이블에 대한 CRUD 기능이 구현된 UserDao객체를 획득한다.
		UserDao userDao = UserDao.getInstance();
		
		// 이메일 중복확인
		Customer savedUserEmail = userDao.getCustomerByEmail(email);
		if (savedUserEmail != null) {
			resp.sendRedirect("detail?fail=emailOverlap");
			return;
		}
		
		// 전화번호 중복확인
		Customer savedUserPhone = userDao.getCustomerByPhone(phone);
		if (savedUserPhone != null) {
			resp.sendRedirect("detail?fail=phoneOverlap");
			return;
		}
		
		// 비밀번호를 암호화하기
		String sha256Password = DigestUtils.sha256Hex(password);
		
		// User객체를 생성해서 사용자정보를 저장한다.
		Customer user = new Customer();
		user.setId(id);
		user.setPassword(sha256Password);
		user.setName(name);
		user.setEmail(email);
		user.setPhone(phone);
		user.setPostalCode(postalCode);
		user.setAddress1(address1);
		user.setAddress2(address2);
		
		// 사용자 정보를 데이터베이스에 업데이트합니다.
		userDao.updateCustomerInfo(user);
		// 브라우저에게 재요청 URL을 응답으로 보낸다.
		resp.sendRedirect("/result?success=updateMembership");
	}
}	