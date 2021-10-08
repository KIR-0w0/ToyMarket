package com.toymarket.vo.order;

public class OrderItems {
	
	private int itemNo;
	private int orderNo;
	private int productNo;
	private int price;
	private int amount;
	private int orderPrice;
	
	public OrderItems() {}

	public OrderItems(int itemNo, int orderNo, int productNo, int price, int amount, int orderPrice) {
		super();
		this.itemNo = itemNo;
		this.orderNo = orderNo;
		this.productNo = productNo;
		this.price = price;
		this.amount = amount;
		this.orderPrice = orderPrice;
	}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(int orderPrice) {
		this.orderPrice = orderPrice;
	}
	
	

}
