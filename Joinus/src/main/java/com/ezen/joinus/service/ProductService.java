package com.ezen.joinus.service;

import com.ezen.joinus.vo.ProductVO;

import java.util.List;

public interface ProductService {
    List<ProductVO> getListAll();

    ProductVO getProductContents(int pno);
}
