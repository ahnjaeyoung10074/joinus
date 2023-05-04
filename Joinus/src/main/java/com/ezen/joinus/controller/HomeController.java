package com.ezen.joinus.controller;



import com.ezen.joinus.service.BoardService;
import com.ezen.joinus.service.ProductService;
import com.ezen.joinus.vo.PagingVO;
import com.ezen.joinus.vo.ProductVO;
import lombok.Setter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class HomeController {
    @Setter(onMethod_=@Autowired)
    private BoardService boardService;
    @Setter(onMethod_=@Autowired)
    private ProductService productService;

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
    public String read(@ModelAttribute("ProductVO") ProductVO vo, Model model, @RequestParam("pno") int pno) {
            ProductVO productVO = productService.getProductContents(pno);
            model.addAttribute("productVO", productVO);

        return "/board/read";
    }
}
//simple bit