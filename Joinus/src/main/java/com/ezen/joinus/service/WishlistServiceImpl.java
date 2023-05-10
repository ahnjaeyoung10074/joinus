package com.ezen.joinus.service;

import com.ezen.joinus.mappers.WishlistMapper;
import com.ezen.joinus.vo.WishlistVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class WishlistServiceImpl implements WishlistService{
    @Autowired
    private WishlistMapper wishlistMapper;


    @Override
    public void addWishlist(WishlistVO wishlist) {
        System.out.println("여기는 추가 서비스 : " +wishlist);
        wishlistMapper.addWishlist(wishlist);
    }

    @Override
    public void deleteWishlist(int pno) {
        System.out.println("여기는 삭제 서비스 : " + pno);
        wishlistMapper.deleteWishlist(pno);
    }


    @Override
    public WishlistVO getWishlistByPno(int pno) {
        System.out.println("여기는 조회 서비스 : " + pno);
        return wishlistMapper.selectWishlistByPno(pno);
    }
}
