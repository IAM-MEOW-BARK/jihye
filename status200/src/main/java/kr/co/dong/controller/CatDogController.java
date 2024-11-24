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
import kr.co.dong.catdog.QnaDTO;
import kr.co.dong.catdog.ReviewDTO;


@Controller
public class CatDogController {
	
	@Inject
	CatDogService catDogService;
	
	@RequestMapping(value="productDetail", method = RequestMethod.GET)
	public ModelAndView productDetail() {
		ModelAndView productMav = new ModelAndView();
		
		List<ProductDTO> productDetail = catDogService.productDetail();
		productMav.addObject("productDetail", productDetail);
		productMav.setViewName("productDetail");
		return productMav;
	}
	
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public ModelAndView noticeList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
	                               @RequestParam(value = "pageListNum", defaultValue = "1") int pageListNum) {
	    int pageSize = 10; // 한 페이지당 게시글 수
	    int pageListSize = 10; // 한 번에 표시할 페이지 수
	    
	    // 전체 게시글 수
	    int totalPost = catDogService.noticeTotalPost();
	    int totalPage = (int) Math.ceil((double) totalPost / pageSize);

	    // 현재 페이지에서 가져올 데이터의 시작 인덱스 계산
	    int start = (pageNum - 1) * pageSize;
	    
	    // 현재 페이지 번호 목록의 시작과 끝
	    int startPage = (pageListNum - 1) * pageListSize + 1;
	    int endPage = Math.min(startPage + pageListSize - 1, totalPage);

	    ModelAndView mav = new ModelAndView();
	    mav.addObject("noticeList", catDogService.noticeList(start, pageSize)); // 게시글 목록
	    mav.addObject("totalPage", totalPage); // 전체 페이지 수
	    mav.addObject("currentPage", pageNum); // 현재 페이지 번호
	    mav.addObject("pageListNum", pageListNum);
	    mav.addObject("startPage", startPage); // 페이지 네비게이션 시작
	    mav.addObject("endPage", endPage); // 페이지 네비게이션 끝
	    mav.setViewName("noticeList");
	    return mav;
	}
	
	@RequestMapping(value = "reviewList", method = RequestMethod.GET)
	public ModelAndView reviewList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
								   @RequestParam(value = "pageListNum", defaultValue = "1") int pageListNum) {
		
		int pageSize = 10; // 한 페이지당 게시글 수
	    int pageListSize = 10; // 한 번에 표시할 페이지 수
	    
	    // 전체 게시글 수
	    int totalPost = catDogService.reviewTotalPost();
	    int totalPage = (int) Math.ceil((double) totalPost / pageSize);

	    // 현재 페이지에서 가져올 데이터의 시작 인덱스 계산
	    int start = (pageNum - 1) * pageSize;
	    
	    // 현재 페이지 번호 목록의 시작과 끝
	    int startPage = (pageListNum - 1) * pageListSize + 1;
	    int endPage = Math.min(startPage + pageListSize - 1, totalPage);

	    ModelAndView mav = new ModelAndView();
	    mav.addObject("reviewList", catDogService.reviewList(start, pageSize)); // 게시글 목록
	    mav.addObject("totalPage", totalPage); // 전체 페이지 수
	    mav.addObject("currentPage", pageNum); // 현재 페이지 번호
	    mav.addObject("pageListNum", pageListNum);
	    mav.addObject("startPage", startPage); // 페이지 네비게이션 시작
	    mav.addObject("endPage", endPage); // 페이지 네비게이션 끝
	    mav.setViewName("reviewList");
	    return mav;
	}
	
	@RequestMapping(value="qnaList", method = RequestMethod.GET)
	public ModelAndView qnaList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
							    @RequestParam(value = "pageListNum", defaultValue = "1") int pageListNum) {
				
		int pageSize = 10; // 한 페이지당 게시글 수
		int pageListSize = 10; // 한 번에 표시할 페이지 수
		
		// 전체 게시글 수
		int totalPost = catDogService.qnaTotalPost();
		int totalPage = (int) Math.ceil((double) totalPost / pageSize);
		
		// 현재 페이지에서 가져올 데이터의 시작 인덱스 계산
		int start = (pageNum - 1) * pageSize;
		
		// 현재 페이지 번호 목록의 시작과 끝
		int startPage = (pageListNum - 1) * pageListSize + 1;
		int endPage = Math.min(startPage + pageListSize - 1, totalPage);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("qnaList", catDogService.qnaList(start, pageSize)); // 게시글 목록
		mav.addObject("totalPage", totalPage); // 전체 페이지 수
		mav.addObject("currentPage", pageNum); // 현재 페이지 번호
		mav.addObject("pageListNum", pageListNum);
		mav.addObject("startPage", startPage); // 페이지 네비게이션 시작
		mav.addObject("endPage", endPage); // 페이지 네비게이션 끝
		mav.setViewName("qnaList");
		return mav;
	}
	
	@RequestMapping(value="faqList", method = RequestMethod.GET)
	public ModelAndView faqList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
							    @RequestParam(value = "pageListNum", defaultValue = "1") int pageListNum) {
				
		int pageSize = 10; // 한 페이지당 게시글 수
	    int pageListSize = 10; // 한 번에 표시할 페이지 수
	    
	    // 전체 게시글 수
	    int totalPost = catDogService.faqTotalPost();
	    int totalPage = (int) Math.ceil((double) totalPost / pageSize);

	    // 현재 페이지에서 가져올 데이터의 시작 인덱스 계산
	    int start = (pageNum - 1) * pageSize;
	    
	    // 현재 페이지 번호 목록의 시작과 끝
	    int startPage = (pageListNum - 1) * pageListSize + 1;
	    int endPage = Math.min(startPage + pageListSize - 1, totalPage);

	    ModelAndView mav = new ModelAndView();
	    mav.addObject("faqList", catDogService.faqList(start, pageSize)); // 게시글 목록
	    mav.addObject("totalPage", totalPage); // 전체 페이지 수
	    mav.addObject("currentPage", pageNum); // 현재 페이지 번호
	    mav.addObject("pageListNum", pageListNum);
	    mav.addObject("startPage", startPage); // 페이지 네비게이션 시작
	    mav.addObject("endPage", endPage); // 페이지 네비게이션 끝
	    mav.setViewName("faqList");
	    return mav;
	}
		
	@RequestMapping(value="noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(@RequestParam("notice_no") int notice_no, Model model) {
		NoticeDTO noticeDTO = catDogService.noticeDetail(notice_no);
		catDogService.noticeUpdateReadCnt(notice_no);
		model.addAttribute("noticeDetail", noticeDTO);
		
		return "noticeDetail";
	}
	
	@RequestMapping(value="reviewDetail", method = RequestMethod.GET)
	public String reviewDetail(@RequestParam("review_no") int review_no, Model model) {
		ReviewDTO reviewDTO = catDogService.reviewDetail(review_no);
		catDogService.reviewUpdateReadCnt(review_no);
		model.addAttribute("reviewDetail", reviewDTO);
		
		return "reviewDetail";
	}
	
	@RequestMapping(value="qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(@RequestParam("qna_no") int qna_no, Model model) {
		QnaDTO qnaDTO = catDogService.qnaDetail(qna_no);
		model.addAttribute("qnaDetail", qnaDTO);
		
		return "qnaDetail";
	}
	
	
	@RequestMapping(value="noticeRegister", method = RequestMethod.GET)
	public String noticeRegister() {
		return "noticeRegister";
	}
	
	@RequestMapping(value="noticeRegister", method = RequestMethod.POST)
	public String noticeRegister(NoticeDTO noticeDTO, HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catDogService.noticeRegister(noticeDTO);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","추가에 성공하였습니다.");	//세션저장
		}
		return "redirect:noticeList";
	}	

	@RequestMapping(value="noticeUpdate", method = RequestMethod.GET)
	public String noticeUpdate(@RequestParam("notice_no") int notice_no, Model model) {
		NoticeDTO notice = catDogService.noticeDetail(notice_no);
		model.addAttribute("notice", notice);
		return "noticeUpdate";
	}
	
	@RequestMapping(value="noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdate(NoticeDTO noticeDTO, RedirectAttributes attr,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catDogService.noticeUpdate(noticeDTO);
		
		if(r>0) {
			attr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
			return "redirect:noticeList";
		}
		return "redirect:update?notice_no=" + noticeDTO.getNotice_no();
	}
		
	@RequestMapping(value="noticeDelete", method = RequestMethod.GET)
	public String noticeDelete(@RequestParam("notice_no") int notice_no, RedirectAttributes rttr){
		int r = catDogService.noticeDelete(notice_no);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","글삭제에 성공하였습니다.");
			return "redirect:noticeList";
		}
		return "redirect:detail?notice_no=" + notice_no;
	}
	
	@RequestMapping(value="qnaRegister", method = RequestMethod.GET)
	public String qnaRegister() {
		return "qnaRegister";
	}
	
	@RequestMapping(value="qnaRegister", method = RequestMethod.POST)
	public String qnaRegister(QnaDTO qnaDTO, HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catDogService.qnaRegister(qnaDTO);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","추가에 성공하였습니다.");	//세션저장
		}
		return "redirect:qnaList";
	}	

	@RequestMapping(value="qnaUpdate", method = RequestMethod.GET)
	public String qnaUpdate(@RequestParam("qna_no") int qna_no, Model model) {
		QnaDTO qna = catDogService.qnaDetail(qna_no);
		model.addAttribute("qna", qna);
		return "qnaUpdate";
	}
	
	@RequestMapping(value="catdog/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(QnaDTO qnaDTO, RedirectAttributes attr,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catDogService.qnaUpdate(qnaDTO);
		
		if(r>0) {
			attr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
			return "redirect:qnaList";
		}
		return "redirect:update?qna_no=" + qnaDTO.getQna_no();
	}
		
	@RequestMapping(value="qnaDelete", method = RequestMethod.GET)
	public String qnaDelete(@RequestParam("qna_no") int qna_no, RedirectAttributes rttr){
		int r = catDogService.qnaDelete(qna_no);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","글삭제에 성공하였습니다.");
			return "redirect:qnaList";
		}
		return "redirect:detail?qna_no=" + qna_no;
	}
	

}