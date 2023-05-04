package com.ezen.joinus.controller;



import com.ezen.joinus.mappers.UserMapper;
import com.ezen.joinus.vo.BusinessUserVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
;

import javax.servlet.http.HttpServletRequest;


@Controller
public class SignupController {

    @Setter(onMethod_=@Autowired)
    private UserMapper mapper;

    @RequestMapping("/signup")
    public String signup(){
//        mapper.insert(BusinessUserVO);
        return "signup";
    }
    @RequestMapping(value = "/signup", method = RequestMethod.POST)
    public String signupinfo(BusinessUserVO BusinessUserVO){
        try {
            mapper.insert(BusinessUserVO);
        }catch (DuplicateKeyException e){
            return "redirect:/singup?error_code=-1";
        }catch (Exception e){
            e.printStackTrace();
            return "redirect:/singup?error_code=-99";
        }
        return "redirect:/login";

    }
}
