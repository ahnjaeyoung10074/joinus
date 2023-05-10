package com.ezen.joinus.controller;



import com.ezen.joinus.mappers.BusinessUserMapper;
import com.ezen.joinus.service.BoardService;
import com.ezen.joinus.service.BusinessService;
import com.ezen.joinus.service.ProductService;
import com.ezen.joinus.service.WishlistService;
import com.ezen.joinus.vo.BusinessUserVO;
import com.ezen.joinus.vo.PagingVO;
import com.ezen.joinus.vo.ProductVO;
import com.ezen.joinus.vo.WishlistVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
public class HomeController {
    @Setter(onMethod_=@Autowired)
    private BoardService boardService;
    @Setter(onMethod_=@Autowired)
    private ProductService productService;
    @Autowired
    private BusinessService businessService;
    @Setter(onMethod_=@Autowired)
    private BusinessUserMapper businessUserMapper;

    //페이징 처리
    @GetMapping("/product_board")
    public String boardList(PagingVO vo, Model model
            , @RequestParam(value="nowPage", required=false)String nowPage
            , @RequestParam(value="cntPerPage", required=false)String cntPerPage) {

        int total = boardService.countBoard();
//        System.out.println("@@@@@@@@@@@@@@@@"+total);
        if (nowPage == null && cntPerPage == null) {
            nowPage = "1";
            cntPerPage = "5";
        } else if (nowPage == null) {
            nowPage = "1";
        } else if (cntPerPage == null) {
            cntPerPage = "5";
        }
        vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
        model.addAttribute("paging", vo);
        model.addAttribute("viewAll", boardService.selectBoard(vo));
        return "about";
    }
    // 게시물 이동

    @RequestMapping(value = "/board/read", method = RequestMethod.GET)
    public String read(@ModelAttribute("ProductVO") ProductVO productVO, Model model, @RequestParam("pno") int pno, HttpSession session){
        // 상품 정보 가져오기
        productVO = productService.getProductContents(pno);
        System.out.println(productVO);
        model.addAttribute("productVO", productVO);

        // 사업자 정보 가져오기
        String b_id = (String) session.getAttribute("id");
        System.out.println("로그인 된 비지니스 사용자 아이디 불러오나?:"+b_id);
        BusinessUserVO businessUserVO = businessService.getBusinessById(b_id);
        System.out.println(businessUserVO);
        model.addAttribute("businessUserVO", businessUserVO);

        if (null != wishlistService.getWishlistByPno(pno)){
            model.addAttribute("like", 1);
        }else {
            model.addAttribute("like", 0);
        }


        return "/board/read";
    }


    @Autowired
    private WishlistService wishlistService;


//    @Autowired
//    private CustomerService customerService;
//

    // 해당 상품을 찜 목록에 추가하는 기능
    @PostMapping("/wishlist/add")
    public ResponseEntity<String> addWishlist(WishlistVO vo, HttpSession session) {
        String id = (String) session.getAttribute("id");
        System.out.println("찜 컨트롤러에 아이디 불러오나?:"+vo);
//        // 개인 고객인 경우
//        CustomerDto customerDto = customerService.getCustomerById(id);
//        if (customerDto != null) {
//            WishlistDto wishlistDto = new WishlistDto();
//            wishlistDto.setPno(pno);
//            wishlistDto.setU_id(id);
//            wishlistDto.setW_date(new Date());
//            wishlistService.addWishlist(wishlistDto);
//
//            model.addAttribute("msg", "찜 목록에 추가되었습니다.");
//            return "redirect:/product?no=" + pno;
//        }

        // 로그인한 사용자 정보가 없는 경우
        if (id == null) {
            return ResponseEntity.badRequest().body("로그인 후 이용해주세요.");
        }

        BusinessUserVO businessUserVO = businessService.getBusinessById(id);
        System.out.println("사업자 정보:"+businessUserVO);
        // 사업자 정보가 없는 경우
        if (businessUserVO == null) {
            return ResponseEntity.badRequest().body("사업자만 이용 가능합니다.");
        }
        WishlistVO wishlistVO = new WishlistVO();
        wishlistVO.setPno(vo.getPno());
        wishlistVO.setB_id(id);
        wishlistVO.setW_date(new Date());
        System.out.println("WISHLISTVO:" + wishlistVO);
        wishlistService.addWishlist(wishlistVO);

        return   new ResponseEntity("찜 목록에 추가되었습니다.", HttpStatus.OK);
    }
    @GetMapping("/wishlist/delete")
    public ResponseEntity<String> deleteWishlist(int pno, HttpSession session) {
        String id = (String) session.getAttribute("id");
        System.out.println("찜 삭제 컨트롤러에 pno 불러오나?:"+pno);
        // 로그인한 사용자 정보가 없는 경우
        if (id == null) {
            return new ResponseEntity("로그인 후 이용해 주세요.", HttpStatus.OK);
        }

        wishlistService.getWishlistByPno(pno);
        wishlistService.deleteWishlist(pno);
        System.out.println("삭제 성공");

        // 찜 목록에서 해당 상품 삭제
        System.out.println(pno);
        System.out.println("WISHLISTVO:" + pno);
        return new ResponseEntity("찜 목록에서 삭제되었습니다.", HttpStatus.OK);
    }


}