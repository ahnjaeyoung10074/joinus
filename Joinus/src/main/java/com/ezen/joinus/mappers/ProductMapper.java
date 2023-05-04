package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.ProductVO;

import java.util.List;

public interface ProductMapper {
    List<ProductVO> getListAll();

    ProductVO getProductContents(int pno);
}
