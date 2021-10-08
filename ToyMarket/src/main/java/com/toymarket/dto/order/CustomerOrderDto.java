package com.toymarket.dto.order;

import java.util.Date;

public class CustomerOrderDto {
	
	private int customerNo;			// 회원번호(order)
	private int orderNo;			// 주문번호(order)
	private int orderItemNo;		// 주문아이템일련번호(items)
	private int productNo;			// 상품번호(products)
	private String brand;			// 브랜드(products)
	private String name;			// 상품명(products)
	private int price;				// 상품가격(items)
	private int totalPrice;			// 총구매가격(order)
	private int totalAmount;		// 총구매수량(order)
	private String status;			// 주문상태(order)
	private Date createdDate;		// 주문날짜(order)

	
	public CustomerOrderDto() {}


	public int getCustomerNo() {
		return customerNo;
	}


	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}


	public int getOrderNo() {
		return orderNo;
	}


	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}


	public int getOrderItemNo() {
		return orderItemNo;
	}


	public void setOrderItemNo(int orderItemNo) {
		this.orderItemNo = orderItemNo;
	}


	public int getProductNo() {
		return productNo;
	}


	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}


	public String getBrand() {
		return brand;
	}


	public void setBrand(String brand) {
		this.brand = brand;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public int getTotalPrice() {
		return totalPrice;
	}


	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}


	public int getTotalAmount() {
		return totalAmount;
	}


	public void setTotalAmount(int totalAmount) {
		this.totalAmount = totalAmount;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public Date getCreatedDate() {
		return createdDate;
	}


	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}


	@Override
	public String toString() {
		return "CustomerOrderDto [customerNo=" + customerNo + ", orderNo=" + orderNo + ", orderItemNo=" + orderItemNo
				+ ", productNo=" + productNo + ", brand=" + brand + ", name=" + name + ", price=" + price
				+ ", totalPrice=" + totalPrice + ", totalAmount=" + totalAmount + ", status=" + status
				+ ", createdDate=" + createdDate + "]";
	}
	
	
}
