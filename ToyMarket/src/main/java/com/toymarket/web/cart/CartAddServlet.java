package com.toymarket.web.cart;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.toymarket.dao.cart.CartDao;
import com.toymarket.dto.cart.CartAddDto;
import com.toymarket.dto.cart.CartItemDto;
import com.toymarket.dto.order.OrderListDto;
import com.toymarket.vo.Customer;
import com.toymarket.vo.cart.Cart;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/cart/add")
public class CartAddServlet extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {

		HttpSession session = req.getSession();
		//로그인 후 장바구니 이용가능 

		Customer user = (Customer) session.getAttribute("LOGINED_USER_INFO");
		if (user == null) { // 만약로그인이 안되어있다면 그아래에 sendRedirect가 로그인안되어있음
			rep.sendRedirect("/user/login");
			return;
		}

			CartDao cartDao = CartDao.getInstance();
		
	
				//프론트에서 고객의 아이템번호, 수량, 가격을 받는다.
				int productNo = Integer.parseInt(req.getParameter("productNo"));
				int amount = Integer.parseInt(req.getParameter("amount"));
				int buyPrice = Integer.parseInt(req.getParameter("buyPrice"));
				String userId = user.getId();
				
				
				//전달받은 파라미터들을 CartAddDto체를 생성하여 넣는다.
				CartAddDto cartAdd = new CartAddDto(productNo, amount, buyPrice, userId );
				
				// cart객체를 dao에게 넘겨준다.
				cartDao.insertCart(cartAdd);
				
				//장바구니 서블을 호출한다.
				
		
				req.getRequestDispatcher("/cart/list").forward(req, rep);
		

	}
}