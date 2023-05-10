package com.ezen.joinus.service;

import com.ezen.joinus.vo.WishlistVO;

public interface WishlistService {
    void addWishlist(WishlistVO wishlistVO);
    void deleteWishlist(int pno);
    WishlistVO getWishlistByPno(int pno);
}
