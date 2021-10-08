package com.toymarket.vo.order;

import java.util.Date;
import java.util.List;

public class Order {
	
	private int orderNo;
	private String orderPrice;
	private String totalAmount;
	private String usedPoint;
	private String totalPrice;
	private String depositePoint;
	private String status;
	private Date createdDate;
	private String customerNo;
	private String address1;
	private String address2;
	private List<OrderItems> orderList;
	
	public Order() {}

	public Order(int orderNo, String orderPrice, String totalAmount, String usedPoint, String totalPrice, String depositePoint,
			String status, Date createdDate, String customerNo, String address1, String address2, List<OrderItems> orderList) {
		super();
		this.orderNo = orderNo;
		this.orderPrice = orderPrice;
		this.totalAmount = totalAmount;
		this.usedPoint = usedPoint;
		this.totalPrice = totalPrice;
		this.depositePoint = depositePoint;
		this.status = status;
		this.createdDate = createdDate;
		this.customerNo = customerNo;
		this.address1 = address1;
		this.address2 = address2;
		this.orderList = orderList;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public String getOrderPrice() {
		return orderPrice;
	}

	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}

	public String getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(String totalAmount) {
		this.totalAmount = totalAmount;
	}

	public String getusedPoint() {
		return usedPoint;
	}

	public void setusedPoint(String usedPoint) {
		this.usedPoint = usedPoint;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getdepositePoint() {
		return depositePoint;
	}

	public void setdepositePoint(String depositePoint) {
		this.depositePoint = depositePoint;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getcreatedDate() {
		return createdDate;
	}

	public void setcreatedDatee(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getCustomerNo() {
		return customerNo;
	}

	public void setCustomerNo(String customerNo) {
		this.customerNo = customerNo;
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

	public List<OrderItems> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<OrderItems> orderList) {
		this.orderList = orderList;
	}

	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", orderPrice=" + orderPrice + ", totalAmount=" + totalAmount
				+ ", usedPoint=" + usedPoint + ", totalPrice=" + totalPrice + ", depositePoint=" + depositePoint
				+ ", status=" + status + ", date=" + createdDate + ", customerNo=" + customerNo + ", address1=" + address1
				+ ", address2=" + address2 + ", orderList=" + orderList + "]";
	}

	
	
	

}
