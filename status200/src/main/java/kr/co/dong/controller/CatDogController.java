package kr.co.dong.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.catdog.CatDogService;
import kr.co.dong.catdog.NoticeDTO;
import kr.co.dong.catdog.ProductDTO;
import kr.co.dong.catdog.QNADTO;
import kr.co.dong.catdog.ReviewDTO;


@Controller
public class CatDogController {
	
	@Inject
	CatDogService catdogService;
	
	@RequestMapping(value="productDetail", method = RequestMethod.GET)
	public ModelAndView productDetail() {
		ModelAndView productMav = new ModelAndView();
		
		List<ProductDTO> productDetail = catdogService.productDetail();
		productMav.addObject("productDetail", productDetail);
		productMav.setViewName("productDetail");
		return productMav;
	}
	
	@RequestMapping(value="boardList", method = RequestMethod.GET)
	public ModelAndView boardList() {
		ModelAndView boardMav = new ModelAndView();
		
		List<NoticeDTO> boardList = catdogService.boardList();
		boardMav.addObject("boardList", boardList);
		boardMav.setViewName("boardList");
		return boardMav;
	}
	
	@RequestMapping(value="reviewList", method = RequestMethod.GET)
	public ModelAndView reviewList() {
		ModelAndView reviewMav = new ModelAndView();
		
		List<ReviewDTO> reviewList = catdogService.reviewList();
		reviewMav.addObject("reviewList", reviewList);
		reviewMav.setViewName("reviewList");
		return reviewMav;
	}
	
	@RequestMapping(value="qnaList", method = RequestMethod.GET)
	public ModelAndView qnaList() {
		ModelAndView qnaMav = new ModelAndView();

		List<QNADTO> qnaList = catdogService.qnaList();
		qnaMav.addObject("qnaList", qnaList);
		qnaMav.setViewName("qnaList");
		return qnaMav;
	}
		
	@RequestMapping(value="boardDetail", method = RequestMethod.GET)
	public String boardDetail(@RequestParam("board_no") int board_no, Model model) {
		NoticeDTO noticeDTO = catdogService.boardDetail(board_no);
		catdogService.boardUpdateReadCnt(board_no);
		model.addAttribute("boardDetail", noticeDTO);
		
		return "boardDetail";
	}
	
	@RequestMapping(value="reviewDetail", method = RequestMethod.GET)
	public String reviewDetail(@RequestParam("review_no") int review_no, Model model) {
		ReviewDTO reviewDTO = catdogService.reviewDetail(review_no);
		catdogService.reviewUpdateReadCnt(review_no);
		model.addAttribute("reviewDetail", reviewDTO);
		
		return "reviewDetail";
	}
	
	@RequestMapping(value="qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(@RequestParam("qna_no") int qna_no, Model model) {
		QNADTO qnaDTO = catdogService.qnaDetail(qna_no);
		model.addAttribute("qnaDetail", qnaDTO);
		
		return "qnaDetail";
	}
	
	
	@RequestMapping(value="qnaRegister", method = RequestMethod.GET)
	public String qnaRegister() {
		return "qnaRegister";
	}
	
	@RequestMapping(value="qnaRegister", method = RequestMethod.POST)
	public String qnaRegister(QNADTO qnaDTO, HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catdogService.qnaRegister(qnaDTO);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","추가에 성공하였습니다.");	//세션저장
		}
		return "redirect:qnaList";
	}	
	
	@RequestMapping(value="qnaUpdate", method = RequestMethod.GET)
	public String qnaUpdate(@RequestParam("qna_no") int qna_no, Model model) {
		QNADTO qna = catdogService.qnaDetail(qna_no);
		model.addAttribute("qna", qna);
		return "qnaUpdate";
	}
	
	@RequestMapping(value="catdog/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(QNADTO qnaDTO, RedirectAttributes attr,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catdogService.qnaUpdate(qnaDTO);
		
		if(r>0) {
			attr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
			return "redirect:qnaList";
		}
		return "redirect:update?qna_no=" + qnaDTO.getQna_no();
	}
		
	@RequestMapping(value="qnaDelete", method = RequestMethod.GET)
	public String qnaDelete(@RequestParam("qna_no") int qna_no, RedirectAttributes rttr){
		int r = catdogService.qnaDelete(qna_no);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","글삭제에 성공하였습니다.");
			return "redirect:qnaList";
		}
		return "redirect:detail?qna_no=" + qna_no;
	}
	

}