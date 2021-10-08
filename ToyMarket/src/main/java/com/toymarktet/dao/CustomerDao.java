package com.toymarktet.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toymarket.dto.order.CustomerOrderDto;
import com.toymarket.utils.MybatisUtils;
import com.toymarket.vo.Customer;

public class CustomerDao {
	
	private SqlSessionFactory sqlSessionFactory;
	
	private static CustomerDao instance = new CustomerDao();
	private CustomerDao() {
		sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	public static CustomerDao getInstance() {
		return instance;
	}
	
	/**
	 * 고객번호로 고객정보를 찾는다.
	 * @param customerNo	회원번호
	 * @return				고객정보를 반환
	 */
	public Customer getCustomerByNo(int customerNo) {
		SqlSession session = sqlSessionFactory.openSession();
		Customer customer = session.selectOne("getCustomerByNo", customerNo);
		session.close();
		return customer;
	}
	
	/**
	 * 검색내용(고객이름, 고객아이디, 고객나이, 고객성별)으로 해당하는 고객들을 찾는다. 페이징처리포함
	 * @param param	검색내용과 페이징처리 내용이 들어있다.
	 * @return	고객정보를 반환
	 */
	public List<Customer> getCustomers(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Customer> customers = session.selectList("getCustomers", param);
		session.close();
		return customers;
		
	}
	
	/**
	 * 페이징처리
	 * @param param	
	 * @return	총인원을 반환
	 */
	public int cGetTotalRows(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("cGetTotalRows", param);
		session.close();
		return totalRows;
	}
	
	/**
	 * 고객이름으로 고객정보를 찾는다.
	 * @param customerName	고객이름
	 * @return	고객정보
	 */
	public Customer getCustomerByName(String customerName) {
		SqlSession session = sqlSessionFactory.openSession();
		Customer customer = session.selectOne("getCustomerByName", customerName);
		session.close();
		return customer;
	}
	
	/**
	 * 고객번호로 주문내역을 찾는다.
	 * @param customerNo	고객번호
	 * @return	주문내역 
	 */
	public List<CustomerOrderDto> getOrdersByCustomerNo(int customerNo) {
		SqlSession session = sqlSessionFactory.openSession();
		List<CustomerOrderDto> customerOrders = session.selectList("getOrdersByCustomerNo", customerNo);
		session.close();
		return customerOrders;
	}
	
	/**
	 * 고객정보를 업데이트한다.
	 * @param customer 업데이트할 고객정보
	 */
	public void updateCustomer(Customer customer) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("updateCustomer", customer);
		session.close();
	}
	
	/**
	 * 탈퇴처리된 고객정보를 찾는다.
	 * @param param	페이징처리 값(몇개 행을 불러올지)
	 * @return	탈퇴처리된 고객정보
	 */
	public List<Customer> getExpiredCustomers(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		List<Customer> customers = session.selectList("getExpiredCustomers", param);
		session.close();
		return customers;
	}
	
	/**
	 * delete페이지 페이징처리
	 * @param param
	 * @return	탈퇴처리된 인원수 반환
	 */
	public int dGetTotalRows(Map<String, Object> param) {
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("dGetTotalRows", param);
		session.close();
		return totalRows;
	}
	
	/**
	 * 최근회원가입한 고객정보를 찾는다.
	 * @return	고객정보
	 */
	public List<Customer> getStatusNCustomers() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Customer> customers = session.selectList("getStatusNCustomers");
		session.close();
		return customers;
	}
	
	/**
	 * 최근회원가입한 고객수
	 * @return	고객수
	 */
	public int getStatusNTotalRows() {
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("getStatusNTotalRows");
		session.close();
		return totalRows;
	}
	
	/**
	 * 최근 탈퇴한 고객정보를 찾는다.
	 * @return 고객정보
	 */
	public List<Customer> getStatusYCustomers() {
		SqlSession session = sqlSessionFactory.openSession();
		List<Customer> customers = session.selectList("getStatusYCustomers");
		session.close();
		return customers;
	}
	
	/**
	 * 최근 탈퇴한 고객수
	 * @return 고객수
	 */
	public int getStatusYTotalRows() {
		SqlSession session = sqlSessionFactory.openSession();
		int totalRows = session.selectOne("getStatusYTotalRows");
		session.close();
		return totalRows;
	}
	
}
