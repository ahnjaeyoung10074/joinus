package com.ezen.joinus.mappers;

import com.ezen.joinus.vo.BusinessUserVO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
    public void insert(BusinessUserVO vo);
    public int b_idCheck(String b_id);
    public BusinessUserVO MemberLogin(String b_id) throws Exception;




}
