package com.toymarket.web.cart;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.toymarket.dao.cart.CartDao;
import com.toymarket.dto.cart.CartItemDto;
import com.toymarket.vo.Customer;
import com.toymarket.vo.cart.Cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/cart/delete")
public class CartDeleteServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
		HttpSession session = req.getSession();
		Customer user = (Customer) session.getAttribute("LOGINED_USER_INFO");
		
		CartDao cartDao = CartDao.getInstance();
		
		// 상품번호, 아이디를 전달 받는다.
		int cartNo = Integer.parseInt(req.getParameter("cartNo"));
		// 전달받은 것은 dao에 넘겨준다.	
		cartDao.deleteCart(cartNo);
		
		req.getRequestDispatcher("/cart/list").forward(req, rep);
		
		
		
	}

}