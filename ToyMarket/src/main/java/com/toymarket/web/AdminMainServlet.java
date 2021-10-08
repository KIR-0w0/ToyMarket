package com.toymarket.web;

import java.io.IOException;
import java.util.List;

import com.toymarket.vo.Customer;
import com.toymarktet.dao.CustomerDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/admin")
public class AdminMainServlet extends HttpServlet{
	
	////////////////////////////////////////////////////////////////////////////////
	// 이동규
	CustomerDao customerDao = CustomerDao.getInstance();
	/////////////////////////////////////////////////////////////////////////////////

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession session = req.getSession();

		session.setMaxInactiveInterval(60*15);
		
		 /////////////////////////////////////////////////////////////////////////
	      // 이동규
	      // 최근회원가입한 회원정보와 인원수를 알아서 요청객체 속성으로 저장하기
	      int nTotalRows = customerDao.getStatusNTotalRows();
	      List<Customer> nCustomers = customerDao.getStatusNCustomers();
	      
	      req.setAttribute("nTotalTows", nTotalRows);
	      req.setAttribute("nCustomers", nCustomers);
	      
	      // 최근탈퇴한 회원정보와 인원수를 알아서 요청객체 속성으로 저장하기
	      int yTotalRows = customerDao.getStatusYTotalRows();
	      List<Customer> yCustomers = customerDao.getStatusYCustomers();
	      
	      req.setAttribute("yTotalRows", yTotalRows);
	      req.setAttribute("yCustomers", yCustomers);
	      ///////////////////////////////////////////////////////////////////////////////

		

		req.getRequestDispatcher("WEB-INF/views/admin/main.jsp").forward(req, resp);
	}
}
