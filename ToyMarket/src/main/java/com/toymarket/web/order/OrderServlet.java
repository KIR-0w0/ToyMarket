package com.toymarket.web.order;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.toymarket.dao.order.OrderDao;
import com.toymarket.dto.cart.CartItemDto;
import com.toymarket.dto.order.OrderListDto;
import com.toymarket.vo.Customer;
import com.toymarket.vo.order.OrderItems;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/order/list")
public class OrderServlet extends HttpServlet {
	
	OrderDao orderDao = OrderDao.getInstance();

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse rep) throws ServletException, IOException {
		
		//front에서 파라미터 받기
		HttpSession session = req.getSession();
		Customer user = (Customer) session.getAttribute("LOGINED_USER_INFO");                 
		String userId = user.getId();
				
		// 프론트에서 선택된 장바구니 아이템의 번호들을 파라미터로 받음 
		String[] itemNoArray = req.getParameterValues("itemNo");
		
		//  총금액과 총수량을 담을 변수를 선언한다.
		// 프론트에서 상품금액과 상품알인금액을 받는다. 
		String orderPrice = req.getParameter("orderPrice");
		String totalPrice = req.getParameter("totalPrice");
		String totalDiscountRate = req.getParameter("totalDiscountRate");
		
		List<CartItemDto> items = new ArrayList<CartItemDto>();
		
		for(String itemNo : itemNoArray) { // 체크된 상품번호를 이용하여 상품정보를 조회
			items.add(orderDao.getItemDataByItemNo(itemNo));

			// 가격계산 start
			// 조회한 items에서 가격과 수량을 이용해 가격을 계산하고 총가격, 총수량 변수에 합산한다.
		}
		
		OrderListDto orderList = orderDao.getOrderList(userId); // 배송지정보 조회
		
		
		// 주문페이지에 정보 건네줌
		orderList.setOrderItems(items); //조회한 아이템 정보를을 추가
		req.setAttribute("orderList", orderList);
		req.setAttribute("user", user); // 주문자 정보
		req.setAttribute("orderPrice", orderPrice);
		req.setAttribute("totalPrice", totalPrice);
		req.setAttribute("totalDiscountRate", totalDiscountRate);
		
		// 총가격,총수량을 프론트에 전달한다.
		
		req.getRequestDispatcher("/WEB-INF/views/customer/order.jsp").forward(req, rep);
		
	}
}