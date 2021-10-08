package com.toymarket.dao.order;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toymarket.dto.cart.CartItemDto;
import com.toymarket.dto.order.OrderItemDto;
import com.toymarket.dto.order.OrderListDto;
import com.toymarket.dto.order.PointUpdateDto;
import com.toymarket.utils.MybatisUtils;
import com.toymarket.vo.order.Order;
import com.toymarket.vo.order.OrderItems;

public class OrderDao {

	public static OrderDao instance = new OrderDao();
	
	public OrderDao() {
		OrderDao.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	
	public static OrderDao getInstance() {
		return instance;
	}
	
	private static SqlSessionFactory sqlSessionFactory;
	
	
	/**
	 * 사용자 아이디를 전달받아 order을 반환한다.
	 * @param userId
	 * @return
	 */
	public Order getOrderByCustomerNo(int customerNo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		Order order = session.selectOne("getOrderByCustomerNo",customerNo);
		List<OrderItems> orderItem = session.selectList("getOrderItemByCustomerNo",order);
		order.setOrderList(orderItem);
		session.close();
		return order;
	}
	
	/**
	 * 사용자 아이디를 전달받아 주문한 구매금액에 따라 적립금이 추가된다. 
	 * @param order
	 */
	public void insertOrder(Order order) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("insertOrder", order);
		session.close();
	}
	
	/**
	 * 사용자 아이디, 상품번호 , 오더번호를 받아 아이템테이블에 추가한다.
	 * @param order
	 */
	public void insertOrderItem(OrderItemDto item) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.insert("insertOrderItem", item);
		session.close();
	}

	/**
	 * 사용자 아이디를 전달받아 사용자의 배송지, 적립금 정보를 가져온다.
	 * @param userId
	 */
	public OrderListDto getOrderList(String userId) {
		SqlSession session = sqlSessionFactory.openSession(true);
		OrderListDto orderListDto = session.selectOne("getOrderList",userId);
		session.close();
		return orderListDto;
	}
	
	/**
	 * 사용자 아이디를 전달받아 사용자의 적립금을 차,증감한다.
	 * @param userId, 차,증감할 포인트
	 */
	public void updatePoint(String userId, int updatePoint) {
		SqlSession session = sqlSessionFactory.openSession(true);
		PointUpdateDto param = new PointUpdateDto(userId, updatePoint);
		session.update("updatePoint", param);
		session.close();
	}
	
	
	/**
	 * 주문한 상풍 정보를 반환한다.
	 * @param itemNo
	 * @return
	 */
	public CartItemDto getItemDataByItemNo(String itemNo){
	SqlSession session = sqlSessionFactory.openSession(true);
	CartItemDto order = session.selectOne("getItemDataByItemNo",itemNo);
	session.close();
	return order;
	}


}
