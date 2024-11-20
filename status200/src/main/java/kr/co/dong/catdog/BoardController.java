package kr.co.dong.catdog;

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



@Controller
public class BoardController {
	
	@Inject
	CatDogService catdogService;
	

	@RequestMapping(value="catdog/boardList", method = RequestMethod.GET)
	public ModelAndView boardList() {
		ModelAndView mav = new ModelAndView();
		
		List<BoardDTO> boardList = catdogService.boardList();
		mav.addObject("boardList", boardList);
		mav.setViewName("boardList");
		return mav;
	}
	
	@RequestMapping(value="catdog/reviewList", method = RequestMethod.GET)
	public ModelAndView reviewList() {
		ModelAndView mav = new ModelAndView();
		
		List<ReviewDTO> reviewList = catdogService.reviewList();
		mav.addObject("reviewList", reviewList);
		mav.setViewName("reviewList");
		return mav;
	}
	
	@RequestMapping(value="catdog/qnaList", method = RequestMethod.GET)
	public ModelAndView qnaList() {
		ModelAndView mav = new ModelAndView();
		
		List<QADTO> qnaList = catdogService.qnaList();
		mav.addObject("qnaList", qnaList);
		mav.setViewName("qnaList");
		return mav;
	}
	
	@RequestMapping(value="catdog/noticeDetail", method = RequestMethod.GET)
	public String boardDetail(@RequestParam("board_no") int board_no, Model model) {
		BoardDTO boardDTO = catdogService.boardDetail(board_no);
		catdogService.boardUpdateReadCnt(board_no);
		model.addAttribute("boardDetail", boardDTO);
		
		return "noticeDetail";
	}
	
	@RequestMapping(value="catdog/reviewDetail", method = RequestMethod.GET)
	public String reviewDetail(@RequestParam("review_no") int review_no, Model model) {
		ReviewDTO reviewDTO = catdogService.reviewDetail(review_no);
		catdogService.reviewUpdateReadCnt(review_no);
		model.addAttribute("reviewDetail", reviewDTO);
		
		return "reviewDetail";
	}
	
	@RequestMapping(value="catdog/qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(@RequestParam("qa_no") int qa_no, Model model) {
		QADTO qaDTO = catdogService.qnaDetail(qa_no);
		model.addAttribute("qnaDetail", qaDTO);
		
		return "qnaDetail";
	}
	
	
	@RequestMapping(value="catdog/qnaRegister", method = RequestMethod.GET)
	public String qnaRegister() {
		return "qnaRegister";
	}
	
	@RequestMapping(value="catdog/qnaRegister", method = RequestMethod.POST)
	public String qnaRegister(QADTO qaDTO, HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catdogService.qnaRegister(qaDTO);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","추가에 성공하였습니다.");	//세션저장
		}
		return "redirect:qnaList";
	}	
	
	@RequestMapping(value="catdog/qnaUpdate", method = RequestMethod.GET)
	public String qnaUpdate(@RequestParam("qa_no") int qa_no, Model model) {
		QADTO qna = catdogService.qnaDetail(qa_no);
		model.addAttribute("qna", qna);
		return "qndUpdate";
	}
	
	@RequestMapping(value="catdog/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(QADTO qaDTO, RedirectAttributes attr,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catdogService.qnaUpdate(qaDTO);
		
		if(r>0) {
			attr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
			return "redirect:qnaList";
		}
		return "redirect:update?bno=" + qaDTO.getQa_no();
	}
		
	@RequestMapping(value="catdog/qnaDelete", method = RequestMethod.GET)
	public String qnaDelete(@RequestParam("qa_no") int qa_no, RedirectAttributes rttr){
		int r = catdogService.qnaDelete(qa_no);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","글삭제에 성공하였습니다.");
			return "redirect:qnaList";
		}
		return "redirect:detail?bno=" + qa_no;
	}
	

}