package com.toymarket.web.cart;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;

import com.toymarket.dao.cart.CartDao;
import com.toymarket.vo.Customer;
import com.toymarket.vo.cart.Cart;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;




@WebServlet("/cart/count")
public class CartCountServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
		
		HttpSession session = req.getSession();
		Customer user = (Customer) session.getAttribute("LOGINED_USER_INFO");
		
			CartDao cartDao = CartDao.getInstance();
			
			// 상품번호, 카트번호, 수량, 아이디를 전달 받는다.
			String userId = user.getId();
			String cartNo = req.getParameter("cartNo");
			String amount = req.getParameter("amount");
			
			
			HashMap<String, Object> cartCount = new HashMap<String, Object>();
			cartCount.put("cartNo", cartNo);
			cartCount.put("amount", amount);
			
			// 전달받은 것은 dao에 넘겨준다.	
			cartDao.updateCart(cartCount);

			req.getRequestDispatcher("/cart/list").forward(req, rep);
	}
}