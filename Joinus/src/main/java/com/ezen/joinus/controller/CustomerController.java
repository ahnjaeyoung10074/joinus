package com.ezen.joinus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CustomerController {

    @GetMapping("/myinformation")
    public String customerinfo(){
        return "customer/customerinformation";
    }
}
