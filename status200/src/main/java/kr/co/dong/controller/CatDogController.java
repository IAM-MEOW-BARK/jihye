package kr.co.dong.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.catdog.CatDogService;
import kr.co.dong.catdog.FaqDTO;
import kr.co.dong.catdog.NoticeDTO;
import kr.co.dong.catdog.ProductDTO;
import kr.co.dong.catdog.QnaDTO;
import kr.co.dong.catdog.ReviewDTO;
import kr.co.dong.catdog.WishDTO;


@Controller
public class CatDogController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController1.class);
	
	@Inject
	CatDogService catDogService;
	
	
	@GetMapping(value = "/catdog-login")
	public String catdogLogin() {
		return "catdog-login";
	}
	
		// 로그인
		@RequestMapping(value = "/catdog-login", method = RequestMethod.POST)
		public String login(@RequestParam Map<String, Object> map, HttpServletRequest request, HttpServletResponse response,
				HttpSession session) throws Exception {
			request.setCharacterEncoding("UTF-8");

			Map user = catDogService.login(map);
			
			Integer userStatus = (Integer) user.get("user_status");
			
			if (user == null || userStatus == 1) {
				logger.info("실패");
				return "redirect:catdog-login"; // prefix suffix 이용해서 이동
			} else {
				logger.info("성공");
				session.setAttribute("user", user);
				// QNA 작성: 지혜 추가
				session.setAttribute("user_id", user.get("user_id"));
				

				Integer userAuth = (Integer) user.get("user_auth");

				if (userAuth == 1) {
					logger.info("관리자 계정으로 로그인");
					return "redirect:/catdog-user-list-admin";
				} else if (userAuth == 0) {
					logger.info("일반 사용자 계정으로 로그인");
					return "redirect:/catdog-main";
				} else {
					logger.warn("알 수 없는 USER_AUTH 값: " + userAuth);
					return "redirect:/catdog-login";
				}
			}
		}
		
		// 로그아웃
		@GetMapping(value = "/catdog-logout")
		public String logout(HttpServletRequest request, HttpServletResponse response, HttpSession session, RedirectAttributes rttr) {
		    // 1. 세션 무효화
		    if (session != null) {
		        session.invalidate(); // 서버 세션 삭제
		    }

		    // 2. 클라이언트 JSESSIONID 쿠키 삭제
		    // 직접 Set-Cookie 헤더를 통해 HttpOnly 포함
		    Cookie cookie = new Cookie("JSESSIONID", null); // 쿠키 값 null
		    cookie.setPath("/"); // 경로 설정
		    cookie.setMaxAge(0); // 즉시 만료
		    response.addCookie(cookie); // 기본 쿠키 설정 추가
		    
		    // HttpOnly 속성을 명시적으로 추가
		    response.addHeader("Set-Cookie", "JSESSIONID=; Path=/; HttpOnly; Max-Age=0");

		    // 3. 로그아웃 메시지 추가
		    rttr.addFlashAttribute("msg", "로그아웃 성공"); // 사용자 알림 메시지 추가

		    // 4. 홈으로 리다이렉트
		    return "redirect:/";
		}
   
	
    @PostMapping("/addWish")
	@ResponseBody
	public Map<String, String> addWish(@RequestParam("product_code") int productCode, HttpSession session) {
	    Map<String, String> response = new HashMap<String, String>();
	    Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("user");
	    String userId = userMap != null ? (String) userMap.get("user_id") : null;

	    if (userId == null) {
	        response.put("message", "로그인 후 이용해주세요.");
	        return response;
	    }

	    try {
	        catDogService.addWish(userId, productCode);
	        response.put("message", "찜하기가 추가되었습니다.");
	    } catch (Exception e) {
	        response.put("message", "찜하기 추가 중 오류가 발생했습니다.");
	    }
	    return response;
	}

	@PostMapping("/deleteWish")
	@ResponseBody
	public Map<String, String> deleteWish(@RequestParam("product_code") int productCode, HttpSession session) {
	    Map<String, String> response = new HashMap<String, String>();
	    Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("user");
	    String userId = userMap != null ? (String) userMap.get("user_id") : null;

	    if (userId == null) {
	        response.put("message", "로그인 후 이용해주세요.");
	        return response;
	    }

	    try {
	        WishDTO wishDTO = new WishDTO();
	        wishDTO.setUser_id(userId);
	        wishDTO.setProduct_code(productCode);
	        catDogService.deleteWish(wishDTO);
	        response.put("message", "찜하기가 삭제되었습니다.");
	    } catch (Exception e) {
	        response.put("message", "찜하기 삭제 중 오류가 발생했습니다.");
	    }
	    return response;
	}
   
   
   
   
   

   
   
	// 상품 상세페이지
	@RequestMapping(value="/productDetail", method = RequestMethod.GET)
	public String productDetail(@RequestParam("product_code") int product_code, Model model) {
		 // 1. 상품 상세 정보 가져오기
	    ProductDTO productDTO = catDogService.productDetail(product_code);

	    // 2. 리뷰 리스트 가져오기 (최신 5개)
	    List<ReviewDTO> getReview = catDogService.getReview(product_code);
	    // 3. Q&A 리스트 가져오기 (최신 5개)
	    List<QnaDTO> getQna = catDogService.getQna(product_code);
	    // 4. 상품 코드에 해당하는 게시글 개수 가져오기
	    int product_reviewTotal = catDogService.product_reviewTotal(product_code);
	    int product_qnaTotal = catDogService.product_qnaTotal(product_code);
	   
	    model.addAttribute("productDetail", productDTO);
	    model.addAttribute("getReview", getReview);
	    model.addAttribute("getQna", getQna);
	    model.addAttribute("product_reviewTotal", product_reviewTotal);
	    model.addAttribute("product_qnaTotal", product_qnaTotal);

		return "/productDetail";
	}
	
   // 카테고리 리스트
   @RequestMapping(value = "categoryList", method = RequestMethod.GET)
   public ModelAndView categoryList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
		   							@RequestParam(value = "pageListNum", defaultValue = "1") int pageListNum) {
	   	int pageSize = 10; // 한 페이지당 게시글 수
	    int pageListSize = 10; // 한 번에 표시할 페이지 수
	    
	    // 전체 게시글 수
	    int totalPost = catDogService.categoryTotalPost();
	    int totalPage = (int) Math.ceil((double) totalPost / pageSize);

	    // 현재 페이지에서 가져올 데이터의 시작 인덱스 계산
	    int start = (pageNum - 1) * pageSize;
	    
	    // 현재 페이지 번호 목록의 시작과 끝
	    int startPage = (pageListNum - 1) * pageListSize + 1;
	    int endPage = Math.min(startPage + pageListSize - 1, totalPage);

	    ModelAndView mav = new ModelAndView();
	    mav.addObject("categoryList", catDogService.categoryList(start, pageSize)); // 게시글 목록
	    mav.addObject("totalPage", totalPage); // 전체 페이지 수
	    mav.addObject("currentPage", pageNum); // 현재 페이지 번호
	    mav.addObject("pageListNum", pageListNum); // 1~10, 11~20 ...
	    mav.addObject("startPage", startPage); // 페이지 네비게이션 시작
	    mav.addObject("endPage", endPage); // 페이지 네비게이션 끝
	    mav.setViewName("categoryList");
	    return mav;
   }
   
	// 공지사항 리스트
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
	    mav.addObject("pageListNum", pageListNum); // 1~10, 11~20 ...
	    mav.addObject("startPage", startPage); // 페이지 네비게이션 시작
	    mav.addObject("endPage", endPage); // 페이지 네비게이션 끝
	    mav.setViewName("noticeList");
	    return mav;
	}
	
	// 리뷰 리스트
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
	
	// Q&A 리스트
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
	
	// FAQ 리스트
	@RequestMapping(value = "faqList", method = RequestMethod.GET)
	public ModelAndView faqList(
	    @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
	    @RequestParam(value = "pageListNum", defaultValue = "1") int pageListNum,
	    @RequestParam(value = "faq_division", required = false) Integer faq_division // 구분값 추가
	) {
	    int pageSize = 10; // 한 페이지당 게시글 수
	    int pageListSize = 10; // 한 번에 표시할 페이지 수
	    
	    int totalPost;
	    List<FaqDTO> faqList;

	    if (faq_division == null) {
	        // 전체 게시글 수 및 리스트 가져오기
	        totalPost = catDogService.faqTotalPost();
	        faqList = catDogService.faqList((pageNum - 1) * pageSize, pageSize);
	    } else {
	        // 특정 구분에 해당하는 게시글 수 및 리스트 가져오기
	        totalPost = catDogService.faqTotalPostDivision(faq_division);
	        faqList = catDogService.faqListDivision((pageNum - 1) * pageSize, pageSize, faq_division);
	    }

	    // 총 페이지 계산
	    int totalPage = (int) Math.ceil((double) totalPost / pageSize);

	    // 현재 페이지 번호 목록의 시작과 끝
	    int startPage = (pageListNum - 1) * pageListSize + 1;
	    int endPage = Math.min(startPage + pageListSize - 1, totalPage);

	    ModelAndView mav = new ModelAndView();
	    mav.addObject("faqList", faqList); // 게시글 목록
	    mav.addObject("totalPage", totalPage); // 전체 페이지 수
	    mav.addObject("currentPage", pageNum); // 현재 페이지 번호
	    mav.addObject("pageListNum", pageListNum); // 현재 페이지 리스트 번호
	    mav.addObject("startPage", startPage); // 페이지 네비게이션 시작
	    mav.addObject("endPage", endPage); // 페이지 네비게이션 끝
	    mav.addObject("selectedDivision", faq_division); // 선택된 구분값
	    mav.setViewName("faqList");
	    return mav;
	}
	
	// 공지사항 상세조회
	@RequestMapping(value="noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(@RequestParam("notice_no") int notice_no, Model model) {
		NoticeDTO noticeDTO = catDogService.noticeDetail(notice_no);
		catDogService.noticeUpdateReadCnt(notice_no);
		model.addAttribute("noticeDetail", noticeDTO);
		
		return "noticeDetail";
	}
	
	@RequestMapping(value = "backToList", method = RequestMethod.GET)
	   public String backToList(@RequestParam("notice_no") int notice_no, Model model) {
	      
			int totalPost = catDogService.noticeTotalPost();
	      
	      int no = totalPost - notice_no + 1;
	     
	      int pageSize = 10;        // 해당 게시판을 호출할 때 사용한 pageSize
	      int pageListSize = 10;   // 해당 게시판을 호출할 때 사용한 pageListSize
	      
	    
	      int pageNUM = (no/pageSize) + 1;
	      int pageListNUM = (no/(pageSize*pageListSize)) + 1;
	      
	      return "redirect:noticeList?pageNUM=" + pageNUM + "&pageListNUM=" + pageListNUM;
   }
	
    //공지사항 현재 페이지로 이동
//	@RequestMapping(value="noticeDetail", method = RequestMethod.GET)
//	public String noticeDetail(@RequestParam("notice_no") int notice_no,
//							   @RequestParam("pageNum") int pageNum,
//							   @RequestParam("pageListNum") int pageListNum, Model model) {
//		
//		catDogService.noticeUpdateReadCnt(notice_no);
//		NoticeDTO noticeDTO = catDogService.noticeDetail(notice_no);
//		model.addAttribute("noticeDetail", noticeDTO);
//		model.addAttribute("pageNum", pageNum);
//	    model.addAttribute("pageListNum", pageListNum);
//		
//		return "noticeDetail";
//	}

	
	// 리뷰 상세조회
	@RequestMapping(value="reviewDetail", method = RequestMethod.GET)
	public String reviewDetail(@RequestParam("review_no") int review_no, Model model) {
		ReviewDTO reviewDTO = catDogService.reviewDetail(review_no);
		catDogService.reviewUpdateReadCnt(review_no);
		model.addAttribute("reviewDetail", reviewDTO);
		
		return "reviewDetail";
	}
	
	// Q&A 상세조회
	@RequestMapping(value="qnaDetail", method = RequestMethod.GET)
	public String qnaDetail(@RequestParam("qna_no") int qna_no, Model model) {
		QnaDTO qnaDTO = catDogService.qnaDetail(qna_no);
		model.addAttribute("qnaDetail", qnaDTO);
		
		return "qnaDetail";
	}
	
	// 공지사항 작성
	@RequestMapping(value="/noticeRegister", method = RequestMethod.GET)
	public String noticeRegister() {
		return "/noticeRegister";
	}
	
	@RequestMapping(value="/noticeRegister", method = RequestMethod.POST)
	public String noticeRegister(NoticeDTO noticeDTO, HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catDogService.noticeRegister(noticeDTO);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","추가에 성공하였습니다.");	//세션저장
		}
		return "redirect:/noticeList";
	}	
	
	// 공지사항 수정
	@RequestMapping(value="/noticeUpdate", method = RequestMethod.GET)
	public String noticeUpdate(@RequestParam("notice_no") int notice_no, Model model) {
		NoticeDTO noticeDTO = catDogService.noticeDetail(notice_no);
		model.addAttribute("noticeUpdate", noticeDTO);
		
		return "/noticeUpdate";
	}
	
	@RequestMapping(value="/noticeUpdate", method = RequestMethod.POST)
	public String noticeUpdate(NoticeDTO noticeDTO, RedirectAttributes attr,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catDogService.noticeUpdate(noticeDTO);
		
		if(r>0) {
			attr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
			return "redirect:noticeList";
		}
		return "redirect:/noticeUpdate?notice_no=" + noticeDTO.getNotice_no();
	}
	
	// 공지사항 삭제
	@RequestMapping(value="/noticeDelete", method = RequestMethod.GET)
	public String noticeDelete(@RequestParam("notice_no") int notice_no, RedirectAttributes rttr){
		int r = catDogService.noticeDelete(notice_no);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","글삭제에 성공하였습니다.");
			return "redirect:noticeList";
		}
		return "redirect:/noticeDetail?notice_no=" + notice_no;
	}
	
	// Q&A 작성
	@RequestMapping(value="qnaRegister", method = RequestMethod.GET)
	public String qnaRegister() {
		return "qnaRegister";
	}
	
	@RequestMapping(value="qnaRegister", method = RequestMethod.POST)
	public String qnaRegister(QnaDTO qnaDTO, HttpServletRequest request, HttpSession session, RedirectAttributes rttr) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		Map<String, Object> user = (Map) session.getAttribute("user");
	     String user_id = (String) user.get("user_id");
	      
		//String user_id = (String) session.getAttribute("user_id"); // 세션에서 user_id 가져오기
		qnaDTO.setUser_id(user_id); // QnaDTO에 user_id 설정
		
		int r = catDogService.qnaRegister(qnaDTO);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","추가에 성공하였습니다.");	//세션저장
		}
		return "redirect:qnaList";
	}	

	// Q&A 수정
	@RequestMapping(value="qnaUpdate", method = RequestMethod.GET)
	public String qnaUpdate(@RequestParam("qna_no") int qna_no, Model model) {
		QnaDTO qnaDTO = catDogService.qnaDetail(qna_no);
		
		
		model.addAttribute("qnaUpdate", qnaDTO);
		return "qnaUpdate";
	}
	
	@RequestMapping(value="qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(QnaDTO qnaDTO, RedirectAttributes attr,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catDogService.qnaUpdate(qnaDTO);
		
		if(r>0) {
			attr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
			return "redirect:qnaList";
		}
		return "redirect:qnaUpdate?qna_no=" + qnaDTO.getQna_no();
	}
	
	// Q&A 삭제
	@RequestMapping(value="qnaDelete", method = RequestMethod.GET)
	public String qnaDelete(@RequestParam("qna_no") int qna_no, RedirectAttributes rttr){
		int r = catDogService.qnaDelete(qna_no);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","글삭제에 성공하였습니다.");
			return "redirect:qnaList";
		}
		return "redirect:qnaDetail?qna_no=" + qna_no;
	}
	
	// 상품 검색
	@RequestMapping(value="productSearch", method = RequestMethod.GET)
    public String productSearch(@RequestParam String keyword, Model model) {
		
        List<ProductDTO> productSearch = catDogService.productSearch(keyword);
        model.addAttribute("keyword", keyword);
        model.addAttribute("productSearch", productSearch);
        return "productSearch"; 
	}
	
	// 상품 검색 - 리스트 / 검색 분리
//	@RequestMapping(value="productList", method = RequestMethod.GET)
//	public ModelAndView productList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
//							    @RequestParam(value = "pageListNum", defaultValue = "1") int pageListNum) {
//		
//		
//		int pageSize = 10; // 한 페이지당 게시글 수
//		int pageListSize = 10; // 한 번에 표시할 페이지 수
//		
//		//List<ProductDTO> productSearch = catDogService.productSearch(pageListSize, pageSize, keyword);
//				
//		// 전체 게시글 수
//		int totalPost = catDogService.productTotal();
//		int totalPage = (int) Math.ceil((double) totalPost / pageSize);
//		
//		// 현재 페이지에서 가져올 데이터의 시작 인덱스 계산
//		int start = (pageNum - 1) * pageSize;
//		
//		// 현재 페이지 번호 목록의 시작과 끝
//		int startPage = (pageListNum - 1) * pageListSize + 1;
//		int endPage = Math.min(startPage + pageListSize - 1, totalPage);
//		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("productList", catDogService.productList(start, pageSize));
//		//mav.addObject("productSearch", productSearch); // 게시글 목록
//		mav.addObject("totalPage", totalPage); // 전체 페이지 수
//		mav.addObject("currentPage", pageNum); // 현재 페이지 번호
//		mav.addObject("pageListNum", pageListNum);
//		mav.addObject("startPage", startPage); // 페이지 네비게이션 시작
//		mav.addObject("endPage", endPage); // 페이지 네비게이션 끝
//		
//		mav.setViewName("productList");
//		return mav;
//	}
	
	// 상품 리스트
//	@RequestMapping(value = "productSearch", method = RequestMethod.GET)
//	public ModelAndView productSearch(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
//							    @RequestParam(value = "pageListNum", defaultValue = "1") int pageListNum,
//							    @RequestParam(value = "keyword") String keyword) {
//		
//	    int pageSize = 10; // 한 페이지당 게시글 수
//	    int pageListSize = 10; // 한 번에 표시할 페이지 수
//	    
//	    int totalPost = catDogService.productTotal();
//	    List<ProductDTO> productList = catDogService.productList((pageNum - 1) * pageSize, pageSize);
//	    List<ProductDTO> productSearch = catDogService.productSearch(keyword);
//	    
//	    // 총 페이지 계산
//	    int totalPage = (int) Math.ceil((double) totalPost / pageSize);
//
//	    // 현재 페이지 번호 목록의 시작과 끝
//	    int startPage = (pageListNum - 1) * pageListSize + 1;
//	    int endPage = Math.min(startPage + pageListSize - 1, totalPage);
//
//	    ModelAndView mav = new ModelAndView();
//	    mav.addObject("productList", productList); // 게시글 목록
//	    mav.addObject("productSearch", productSearch);
//	    mav.addObject("totalPage", totalPage); // 전체 페이지 수
//	    mav.addObject("currentPage", pageNum); // 현재 페이지 번호
//	    mav.addObject("pageListNum", pageListNum); // 현재 페이지 리스트 번호
//	    mav.addObject("startPage", startPage); // 페이지 네비게이션 시작
//	    mav.addObject("endPage", endPage); // 페이지 네비게이션 끝
//	    mav.addObject("keyword", keyword); // 선택된 구분값
//	    mav.setViewName("productSearch");
//	    return mav;
//	}
	
	// FAQ 작성
	@RequestMapping(value="faqRegister", method = RequestMethod.GET)
	public String faqRegister() {
		return "faqRegister";
	}
	
	@RequestMapping(value="faqRegister", method = RequestMethod.POST)
	public String faqRegister(FaqDTO faqDTO, HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catDogService.faqRegister(faqDTO);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","추가에 성공하였습니다.");
		}
		return "redirect:faqList";
	}	
	

	// FAQ 수정
	
	// FAQ 삭제

}