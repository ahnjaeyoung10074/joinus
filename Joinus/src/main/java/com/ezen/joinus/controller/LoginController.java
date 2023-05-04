package com.ezen.joinus.controller;


import com.ezen.joinus.mappers.UserMapper;
import com.ezen.joinus.vo.BusinessUserVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpSession;


@Controller
public class LoginController {

    @Setter(onMethod_=@Autowired)
    private UserMapper mapper;


    @GetMapping("/b_idCheck")
    public @ResponseBody int b_idCheck(String b_id){
        System.out.println("b_id:"+b_id);

        int result = mapper.b_idCheck(b_id);
        System.out.println("result : " + result);
        return result;

    }
    @GetMapping("/login")
    public String login(HttpSession session){
        Long b_id = (Long) session.getAttribute("userid");
        if(b_id !=null){
            return "redirect:/login";
        }
        return "login";
    }

    @PostMapping("/login")
    public String login(String b_id,String b_pwd1, HttpSession session) throws Exception {
        BusinessUserVO BusinessUserVO=mapper.MemberLogin(b_id);
        System.out.println(b_id);
        System.out.println(b_pwd1);
        if(BusinessUserVO==null) return "redirect:/login";
        else { //id는 맞음
            if(!BusinessUserVO.getB_pwd1().equals(b_pwd1)) { //비밀번호는 틀림

                return "redirect:/login";
            }else { //비밀번호도 맞음
                session.setAttribute("BusinessUserVO", BusinessUserVO);
                return "redirect:/product_board";

            }
        }

    }
}

