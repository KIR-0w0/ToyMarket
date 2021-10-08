package com.toymarket.web;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/user/loginSelect")
public class LoginSelectServlet extends HttpServlet {

	// GET방식의 /user/loginSelect 요청이 왔을 때 실행되는 메소드 
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/WEB-INF/views/user/loginSelect.jsp").forward(req, resp);
	}
}	