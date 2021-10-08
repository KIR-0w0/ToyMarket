package com.toymarket.dto.order;

public class OrderItemDto {
	
	String cartNo;
	int orderNo;
	
	public OrderItemDto() {}

	public OrderItemDto(String cartNo, int orderNo) {
		super();
		this.cartNo = cartNo;
		this.orderNo = orderNo;
	}

	public String getCartNo() {
		return cartNo;
	}

	public void setCartNo(String cartNo) {
		this.cartNo = cartNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}
	
	

}
