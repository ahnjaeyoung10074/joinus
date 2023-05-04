package com.ezen.joinus.service;

import java.util.List;

import com.ezen.joinus.mappers.ProductMapper;
import com.ezen.joinus.vo.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ProductServiceImpl implements ProductService{
	@Setter(onMethod_=@Autowired)
	ProductMapper pmapper;
	@Override
	public List<ProductVO> getListAll() {
		return pmapper.getListAll();
	}

	@Override
	public ProductVO getProductContents(int pno) {
		return pmapper.getProductContents(pno);
	}


}
