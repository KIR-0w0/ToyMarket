package com.toymarket.web;

import java.io.IOException;

import org.apache.commons.codec.digest.DigestUtils;

import com.toymarktet.dao.UserDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/result")
public class ResultServlet extends HttpServlet {

	// GET방식의 /result 요청이 왔을 때 실행되는 메소드 
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		if (req.getParameter(getServletInfo()).equals("joinMembership")) {
			req.getRequestDispatcher("/WEB-INF/views/user/resultMembership.jsp").forward(req, resp);
//		}
	}
}	