package com.toymarket.dao.cart;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.toymarket.dto.cart.CartAddDto;
import com.toymarket.utils.MybatisUtils;
import com.toymarket.vo.cart.Cart;

public class CartDao {
	
	public static CartDao instance =  new CartDao();
	public CartDao() {
		CartDao.sqlSessionFactory = MybatisUtils.getSqlSessionFactory();
	}
	
	public static CartDao getInstance() {
		return instance;
	}
	
	private static SqlSessionFactory sqlSessionFactory;
	
	
	/**
	 * 사용자 아이디를 전달해서 cart.vo에 저장된 장바구니 정보를 반환한다. 
	 * @param userId 사용자 아이디 
	 * @return 장바구니 아이템 목록 
	 */
	public List<Cart>getCartByUserNo(String userId){
		SqlSession session = sqlSessionFactory.openSession();
		List<Cart> items = session.selectList("getCartByUserNo", userId);
		session.close();
		return items;
		
	}
	/**
	 * 
	 * @param cartNo
	 * @return
	 */
	public Cart getCartByNo(int cartNo) {
		SqlSession session = sqlSessionFactory.openSession();
		Cart cart = session.selectOne("getCartByUserNo", cartNo);
		session.close();
		return cart;
	}
	
	/**
	 * 상품번호를 전달받아서 cart.vo에서 아이템을 삭제한다. 
	 * @param cartNo
	 */
	public void deleteCart(int cartNo) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.delete("deleteCart",cartNo);
		session.close();
	}
	
	
	/**
	 * 새 장바구니에 아이템정보를 추가한다.
	 * @param cart
	 */
	public void insertCart(CartAddDto cart) {
		SqlSession session = sqlSessionFactory.openSession(true);

		HashMap<String,Object> param = new HashMap<String, Object>();
		param.put("userId", cart.getUserId());
		param.put("productNo", cart.getProductNo());
		param.put("amount", cart.getAmount());
		
		int resultQuery = session.selectOne("cartCheck",param); //장바구니 테이블에 해당 상품이 몇개있어?
		
		if (resultQuery > 0 ) { // 만약 장바구니에 해당 상품이 0개 이상인가?
			session.update("cartAmountPlus",param);
		}else {
			session.insert("insertCart", cart);
		}
		
		session.close();
	}
	
	/**
	 * 상품번호를 전달받아서 원하는 상품의 수량을 변경한다. 
	 * @param productNo
	 */
	public void updateCart(HashMap<String,Object> cart) {
		SqlSession session = sqlSessionFactory.openSession(true);
		session.update("updateCart", cart);
		session.close();
	}
	
	
	
	
	
}
