package com.ezen.joinus.service;

import com.ezen.joinus.vo.CartVO;
import com.ezen.joinus.vo.WishlistVO;

public interface CartService {
    void addCart(CartVO cartVO);
    void deleteCart(int pno, String u_id);
    CartVO getCartByPnoAndUid(int pno, String u_id);
}
