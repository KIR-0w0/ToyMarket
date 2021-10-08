package com.toymarket.dto.order;

import java.util.List;

import com.toymarket.dto.cart.CartItemDto;
import com.toymarket.vo.order.OrderItems;

public class OrderListDto {

	private String address1;
	private String address2;
	private int userPoint;
	private List<CartItemDto> orderItems;
	
	public	OrderListDto() {}

	public OrderListDto(String address1, String address2, int userPoint, List<CartItemDto> orderItems) {
		super();
		this.address1 = address1;
		this.address2 = address2;
		this.userPoint = userPoint;
		this.orderItems = orderItems;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public int getUserPoint() {
		return userPoint;
	}

	public void setUserPoint(int userPoint) {
		this.userPoint = userPoint;
	}

	public List<CartItemDto> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(List<CartItemDto> orderItems) {
		this.orderItems = orderItems;
	}

	

}
