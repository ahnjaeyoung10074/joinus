package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.WishlistVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface WishlistMapper {
    void addWishlist(WishlistVO wishlist);
    void deleteWishlist(int pno);
    WishlistVO selectWishlistByPno(int pno);
}