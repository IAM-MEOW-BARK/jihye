package kr.co.dong.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.dong.catdog.CartDTO;
import kr.co.dong.catdog.CatDogService;
import kr.co.dong.catdog.FaqDTO;
import kr.co.dong.catdog.NoticeDTO;
import kr.co.dong.catdog.OrderDTO;
import kr.co.dong.catdog.OrderDetailDTO;
import kr.co.dong.catdog.OrderItemDTO;
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
	
		// 전체 상품 출력
	   @GetMapping(value = "/home")
	   public ModelAndView list(HttpSession session) {
	      ModelAndView mav = new ModelAndView();
	      // 세션에서 사용자 ID 가져오기
	      Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("user");
	      String user_id = userMap != null ? (String) userMap.get("user_id") : null;

	      // 파라미터 맵 구성
	      Map<String, Object> param = new HashMap<String, Object>();
	      param.put("user_id", user_id);

//	      // 카테고리별 상품 목록 조회
//	      param.put("product_category", 1);
//	      List<ProductDTO> list01 = catDogService.mainlist(param);
//	      param.put("product_category", 2);
//	      List<ProductDTO> list02 = catDogService.mainlist(param);
//	      param.put("product_category", 3);
//	      List<ProductDTO> list03 = catDogService.mainlist(param);
//	      param.put("product_category", 4);
//	      List<ProductDTO> list04 = catDogService.mainlist(param);
//	      param.put("product_category", 5);
//	      List<ProductDTO> list05 = catDogService.mainlist(param);
//
//	      // 뷰에 데이터 추가
//	      mav.addObject("list01", list01);
//	      mav.addObject("list02", list02);
//	      mav.addObject("list03", list03);
//	      mav.addObject("list04", list04);
//	      mav.addObject("list05", list05);

	      mav.setViewName("home");
	      return mav;
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
   
		@GetMapping("/cart")
		   public String cart(HttpSession session, Model model) throws Exception {
		      Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
		      if (user == null) {
		         return "redirect:/catdog-login";
		      }
		      String userId = (String) user.get("user_id");
		      model.addAttribute("user_name", user.get("name"));
		      model.addAttribute("user_id", userId);

		      List<CartDTO> cartInfo = catDogService.getCartInfo(userId);
		      if(cartInfo.isEmpty()) {
		         model.addAttribute("isCartEmpty", true);
		      } else {
		      model.addAttribute("isCartEmpty", false);
		      model.addAttribute("cartInfo", cartInfo);
		      System.out.println("cartInfo = " + cartInfo);
		      session.setAttribute("cartInfo", cartInfo); // post할 세션
		      model.addAttribute("cartCost", catDogService.getCartCost(userId));
		      }
		      
		      return "cart";
		   }

		   @PostMapping("/cart")
		   public String processOrder(HttpSession session, HttpServletRequest request, RedirectAttributes rttr, Model model)
		         throws Exception {
		      Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
		      if (user == null) {
		         return "redirect:/catdog-login";
		      }
		      String userId = (String) user.get("user_id");
		      model.addAttribute("user_name", user.get("name"));
		      model.addAttribute("user_id", userId);

		      OrderDTO orderDTO = new OrderDTO();

		      orderDTO.setUser_id_fk(userId);
		      orderDTO.setPayment_status(0);
		      String orderCode = catDogService.addOrder(orderDTO);
		      orderDTO.setOrder_code(orderCode);

		      List<CartDTO> cartItems = catDogService.getCartInfo(userId);

		      List<OrderItemDTO> orderItems = new ArrayList<>();
		      for (CartDTO cartItem : cartItems) {
		         OrderItemDTO orderItem = new OrderItemDTO();
		         orderItem.setOrder_code(orderCode);
		         orderItem.setProduct_code(cartItem.getProduct_code());
		         orderItem.setProduct_name(cartItem.getProduct_name());
		         orderItem.setThumbnail_img(cartItem.getThumbnail_img());
		         orderItem.setProduct_price(cartItem.getProduct_price());
		         orderItem.setCart_quantity(cartItem.getCart_quantity());
		         orderItem.setOrder_quantity(cartItem.getCart_quantity());
		         orderItem.setTotal_price(cartItem.getCart_quantity() * cartItem.getProduct_price());
		         orderItems.add(orderItem);
		      }
		      catDogService.addOrderItems(orderItems);

		      model.addAttribute("orderDTO", orderDTO);
		      model.addAttribute("orderItems", orderItems);

		      System.out.println("~~~~~~~~ orderDTO ~~~~~~~ = " + orderDTO);
		      System.out.println("~~~~~~~~ orderItems ~~~~~~~ = " + orderItems);

		      OrderDetailDTO orderInfo = catDogService.getOrderDetail(orderCode);
		      System.out.println("~~~~~~~~ orderInfo ~~~~~~~ = " + orderInfo);
		      model.addAttribute("orderInfo", orderInfo);

		      int totalCost = catDogService.getTotalCost(orderCode);
		      model.addAttribute("totalCost", totalCost);

		      System.out.println("  💛💛💛💛💛💛💛💛💛💛 orderDTO: " + orderDTO);
		      System.out.println("  💛💛💛💛💛💛💛💛💛💛 OrderItems: " + orderItems);
		      System.out.println("  💛💛💛💛💛💛💛💛💛💛 totalCost: " + totalCost);

		      return "/catdog-payment";
		   }
		   
		   @PostMapping("/cart/update")
		   public String updateCartQuantity(CartDTO cartDTO) throws Exception {

		      System.out.println("업데이트 아직인겨 = " + cartDTO);
		      System.out.println("업데이트 아직이여 = " + cartDTO.getCart_quantity());
		      catDogService.updateCartQuantity(cartDTO);
		      System.out.println("업데이트 눌럿슈 = " + cartDTO);
		      System.out.println("업데이트 햇슈 = " + cartDTO.getCart_quantity());
		      return "redirect:/cart";
		   }
		   
		   @PostMapping("/cart/delete")
		   @ResponseBody
		   public String deleteCart(CartDTO cartDTO) throws Exception {
		      System.out.println("뭐 가져온겨???????? " + cartDTO);
		      int result = catDogService.deleteCart(cartDTO);
		      return result > 0 ? "success" : "failure";
		   }
	
		
			@PostMapping(value = "/addCart")
			public String addToCart(@ModelAttribute CartDTO cartDTO, HttpSession session, RedirectAttributes redirectAttributes) {
			    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");

			    // 로그인 여부 확인
			    if (user == null || user.get("user_id") == null) {
			        redirectAttributes.addFlashAttribute("error", "로그인이 필요합니다.");
			        return "redirect:/catdog-login";
			    }

			    // 세션에서 사용자 ID 가져오기
			    String userId = (String) user.get("user_id");
			    cartDTO.setUser_id(userId); // CartDTO에 사용자 ID 설정

			    try {
			        // 장바구니 추가
			        catDogService.addCart(cartDTO);
			        redirectAttributes.addFlashAttribute("message", "장바구니에 추가되었습니다.");
			    } catch (Exception e) {
			        e.printStackTrace();
			        redirectAttributes.addFlashAttribute("error", "장바구니 추가 중 오류가 발생했습니다.");
			    }
			    return "redirect:/cart";
			}


		
		
		
//	@GetMapping("/cart")
//	public String cart(@RequestParam("user_id") String user_id, HttpSession session, Model model) throws Exception {
//		Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
//		if (user == null) {
//			return "redirect:/catdog-login";
//		}
//		model.addAttribute("user_name", user.get("name"));
//		model.addAttribute("user_id", user.get("user_id"));
//
//		List<CartDTO> cartInfo = catDogService.getCartInfo(user_id);
//		model.addAttribute("cartInfo", cartInfo);
//		System.out.println("cartInfo = " + cartInfo);
//
//		return "cart";
//	}
//	
//	@PostMapping("/cart")
//	@ResponseBody
//	public Map<String, String> addCart(CartDTO cartDTO, HttpServletRequest request, HttpSession session) {
//		 	Map<String, String> response = new HashMap<String, String>();
//		    Map<String, Object> userMap = (Map<String, Object>) session.getAttribute("user");
//		    String userId = userMap != null ? (String) userMap.get("user_id") : null;
//		    
//		    if (userId == null) {
//		        return "redirect:/catdog-login";
//		    }
//
//		   
//		}
//	}

	
//   
//	@PostMapping("/cart")
//	public String addToCart(@RequestParam("product_id") int productId,
//	                        @RequestParam("quantity") int quantity,
//	                        HttpSession session,
//	                        RedirectAttributes redirectAttributes) {
//	    // 세션에서 사용자 정보 가져오기
//	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
//	    if (user == null) {
//	        return "redirect:/catdog-login";
//	    }
//
//	    String userId = (String) user.get("user_id");
//
//	    // CartDTO 생성 및 저장
//	    CartDTO cart = new CartDTO();
//	    cart.setUser_id(userId);
//	    cart.setProduct_id(productId);
//	    cart.setQuantity(quantity);
//
//	    // 저장 로직 호출 (서비스 레이어)
//	    boolean success = catDogService.addToCart(cart);
//
//	    // 결과 메시지 설정
//	    if (success) {
//	        redirectAttributes.addFlashAttribute("message", "상품이 장바구니에 추가되었습니다.");
//	    } else {
//	        redirectAttributes.addFlashAttribute("message", "장바구니 추가에 실패했습니다.");
//	    }
//
//	    return "redirect:/cart";
//	}
	

//	@PostMapping("/cart")
//	public String cart(CartDTO cartDTO, OrdersDTO orderDTO, OrderItemDTO orderItemDTO, HttpServletRequest request, RedirectAttributes rttr) throws Exception {
//		request.setCharacterEncoding("UTF-8");
//		logger.info("카트 내용 : " + cartDTO);
//		int o = catDogService.addOrder(orderDTO);
//		
//		if (o>0) {
//			rttr.addFlashAttribute("msg", "주문 추가 성공");
//		}
//		
//		
//		return "catdog-payment";
//	}
   
			// 상품 상세페이지
			@RequestMapping(value="/productDetail", method = RequestMethod.GET)
			public String productDetail(@RequestParam("product_code") int product_code, Model model) {
				
				// 배송 예정일
				Calendar calendar = Calendar.getInstance();	
				int hour = calendar.get(Calendar.HOUR_OF_DAY);
				
				if (hour < 15) {
					calendar.add(Calendar.DATE, 1);
				} else {
					calendar.add(Calendar.DATE, 2);
				}
				
				Date delivery = calendar.getTime();
				SimpleDateFormat dateFormat = new SimpleDateFormat("MM월 dd일(E)"); // 날짜와 요일 형식

				String deliveryDate = dateFormat.format(delivery);
				   
				// 1. 상품 상세 정보
			    ProductDTO productDTO = catDogService.productDetail(product_code);

			    // 2. 리뷰 리스트 (최신 5개)
			    List<ReviewDTO> getReview = catDogService.getReview(product_code);
			    // 3. Q&A 리스트 (최신 5개)
			    List<QnaDTO> getQna = catDogService.getQna(product_code);
			    // 4. 상품 코드에 해당하는 게시글 개수 가져오기
			    int product_reviewTotal = catDogService.product_reviewTotal(product_code);
			    int product_qnaTotal = catDogService.product_qnaTotal(product_code);
			   
			    model.addAttribute("productDetail", productDTO);
			    model.addAttribute("getReview", getReview);
			    model.addAttribute("getQna", getQna);
			    model.addAttribute("product_reviewTotal", product_reviewTotal);
			    model.addAttribute("product_qnaTotal", product_qnaTotal);
			    model.addAttribute("deliveryDate", deliveryDate);
				return "/productDetail";
			}
		
		@RequestMapping(value = "/categoryList", method = RequestMethod.GET)
		public String categoryList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
						        @RequestParam(value = "pageListNum", defaultValue = "1") int pageListNum,
						        @RequestParam(value = "product_category") int product_category, Model model) {

		    int pageSize = 12;
		    int pageListSize = 10;

		    int totalPost = catDogService.categoryTotalPost(product_category);
		    int totalPage = (int) Math.ceil((double) totalPost / pageSize);
		    int start = (pageNum - 1) * pageSize;
		    int startPage = (pageListNum - 1) * pageListSize + 1;
		    int endPage = Math.min(startPage + pageListSize - 1, totalPage);

		    System.out.println("totalPost: " + totalPost);
		    System.out.println("totalPage: " + totalPage);
		    System.out.println("start: " + start);
		    System.out.println("pageSize: " + pageSize);
		    
		    List<ProductDTO> categoryList = catDogService.categoryList(start, pageSize, product_category);

		    System.out.println("categoryList in Controller: " + categoryList);
		    
		    model.addAttribute("totalPage", totalPage);
		    model.addAttribute("currentPage", pageNum);
		    model.addAttribute("pageListNum", pageListNum);
		    model.addAttribute("startPage", startPage);
		    model.addAttribute("endPage", endPage);
		    model.addAttribute("productCategory", product_category);
		    model.addAttribute("categoryList", categoryList);

		    return "categoryList";
			}

//	// 카테고리 리스트
//	   @RequestMapping(value = "categoryList", method = RequestMethod.GET)
//	   public ModelAndView categoryList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
//			   							@RequestParam(value = "pageListNum", defaultValue = "1") int pageListNum) {
//		   
//		   
//		   	int pageSize = 10; // 한 페이지당 게시글 수
//		    int pageListSize = 10; // 한 번에 표시할 페이지 수
//		    
//		    // 전체 게시글 수
//		    int totalPost = catDogService.categoryTotalPost();
//		    int totalPage = (int) Math.ceil((double) totalPost / pageSize);
//
//		    // 현재 페이지에서 가져올 데이터의 시작 인덱스 계산
//		    int start = (pageNum - 1) * pageSize;
//		    
//		    // 현재 페이지 번호 목록의 시작과 끝
//		    int startPage = (pageListNum - 1) * pageListSize + 1;
//		    int endPage = Math.min(startPage + pageListSize - 1, totㅇalPage);
//
//		    ModelAndView mav = new ModelAndView();
//		    mav.addObject("categoryList", catDogService.categoryList(start, pageSize)); // 게시글 목록
//		    mav.addObject("totalPage", totalPage); // 전체 페이지 수
//		    mav.addObject("currentPage", pageNum); // 현재 페이지 번호
//		    mav.addObject("pageListNum", pageListNum); // 1~10, 11~20 ...
//		    mav.addObject("startPage", startPage); // 페이지 네비게이션 시작
//		    mav.addObject("endPage", endPage); // 페이지 네비게이션 끝
//		    
//		    mav.setViewName("categoryList");
//		    return mav;
//	   }
   
	// 공지사항 리스트
	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public ModelAndView noticeList(@RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
	                               @RequestParam(value = "pageListNum", defaultValue = "1") int pageListNum, HttpSession session) {
	
			int pageSize = 10; // 한 페이지당 게시글 수
		    int pageListSize = 10; // 한 번에 표시할 페이지 수
		    
		    // 세션에서 사용자 정보 가져오기
	        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
	        int user_auth = (user != null && user.get("user_auth") != null) ? (int) user.get("user_auth") : 0;
	
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
		    mav.addObject("user_auth", user_auth); // 사용자 권한
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
							    @RequestParam(value = "pageListNum", defaultValue = "1") int pageListNum, HttpSession session) {
				
		int pageSize = 10; // 한 페이지당 게시글 수
		int pageListSize = 10; // 한 번에 표시할 페이지 수
		
		// 세션에서 사용자 정보 가져오기
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int user_auth = (user != null && user.get("user_auth") != null) ? (int) user.get("user_auth") : 0;
		
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
		mav.addObject("user_auth", user_auth);
		mav.setViewName("qnaList");
		return mav;
	}
	
	// FAQ 리스트
	@RequestMapping(value = "faqList", method = RequestMethod.GET)
	public ModelAndView faqList(
	    @RequestParam(value = "pageNum", defaultValue = "1") int pageNum,
	    @RequestParam(value = "pageListNum", defaultValue = "1") int pageListNum,
	    @RequestParam(value = "faq_division", required = false) Integer faq_division, HttpSession session) {
	    int pageSize = 10; // 한 페이지당 게시글 수
	    int pageListSize = 10; // 한 번에 표시할 페이지 수
	    
	    // 세션에서 사용자 정보 가져오기
        Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
        int user_auth = (user != null && user.get("user_auth") != null) ? (int) user.get("user_auth") : 0;
        
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
	    mav.addObject("selectedDivision", faq_division);
	    mav.addObject("user_auth", user_auth);
	    mav.setViewName("faqList");
	    return mav;
	}
	
	// 공지사항 상세조회
	@RequestMapping(value="/noticeDetail", method = RequestMethod.GET)
	public String noticeDetail(@RequestParam("notice_no") int notice_no, Model model, HttpSession session) {
		NoticeDTO noticeDTO = catDogService.noticeDetail(notice_no);
		catDogService.noticeUpdateReadCnt(notice_no);
		model.addAttribute("noticeDetail", noticeDTO);
		
		// 세션에서 사용자 권한 가져오기
	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
	    int user_auth = (user != null && user.get("user_auth") != null) ? (int) user.get("user_auth") : 0;

	    model.addAttribute("noticeDetail", noticeDTO);
	    model.addAttribute("user_auth", user_auth);
		
		return "/noticeDetail";
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
	@RequestMapping(value="/reviewDetail", method = RequestMethod.GET)
	public String reviewDetail(@RequestParam("review_no") int review_no, Model model) {
		ReviewDTO reviewDTO = catDogService.reviewDetail(review_no);
		catDogService.reviewUpdateReadCnt(review_no);
		model.addAttribute("reviewDetail", reviewDTO);
		
		return "/reviewDetail";
	}
	
//	@RequestMapping(value = "/qnaDetail", method = RequestMethod.GET)
//	public String qnaDetail(
//	    @RequestParam(value = "qna_no", required = true) int qna_no,
//	    @RequestParam(value = "qna_pwd", required = false) String qna_pwd,
//	    RedirectAttributes rttr, HttpSession session, Model model) {
//
//	    // Q&A 데이터 가져오기
//	    QnaDTO qnaDTO = catDogService.qnaDetail(qna_no, qna_pwd);
//	    if (qnaDTO == null) {
//	        rttr.addFlashAttribute("error", "Q&A 정보를 찾을 수 없습니다.");
//	        return "redirect:/qnaList";
//	    }
//
//	    // 사용자 권한 확인
//	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
//	    int user_auth = (user != null && user.get("user_auth") != null) ? (int) user.get("user_auth") : 0;
//
//	    // 비밀글 접근 권한 확인
//	    if (qnaDTO.getQna_secret() == 1 && user_auth != 1) {
//	        if (qna_pwd == null || !qna_pwd.equals(qnaDTO.getQna_pwd())) {
//	            rttr.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
//	            return "redirect:/qnaList";
//	        }
//	    }
//
//	    // Q&A 상세 데이터 전달
//	    model.addAttribute("qnaDetail", qnaDTO);
//	    model.addAttribute("user_auth", user_auth);
//	    return "/qnaDetail";
//	} 
	
	
//	@RequestMapping(value = "/qnaDetail", method = RequestMethod.GET)
//	public String qnaDetail(
//	    @RequestParam(value = "qna_no", required = false) String qna_no,
//	    @RequestParam(value = "qna_pwd", required = false) String qna_pwd,
//	    HttpSession session, Model model, RedirectAttributes rttr) {
//
//	    // Q&A 번호가 비어 있는 경우 처리
//	    if (qna_no == null || qna_no.trim().isEmpty()) {
//	        rttr.addFlashAttribute("error", "유효하지 않은 Q&A 번호입니다.");
//	        return "redirect:/qnaList";
//	    }
//
//	    // Q&A 번호를 정수로 변환
//	    int qnaNo;
//	    try {
//	        qnaNo = Integer.parseInt(qna_no);
//	    } catch (NumberFormatException e) {
//	        rttr.addFlashAttribute("error", "Q&A 번호 형식이 잘못되었습니다.");
//	        return "redirect:/qnaList";
//	    }
//
//	    // Q&A 정보 조회
//	    QnaDTO qnaDTO = catDogService.qnaDetail(qnaNo);
//	    if (qnaDTO == null) {
//	        rttr.addFlashAttribute("error", "Q&A 정보를 찾을 수 없습니다.");
//	        return "redirect:/qnaList";
//	    }
//
//	    // 비밀번호 확인
//	    if (qnaDTO.getQna_secret() == 1 && !qnaDTO.getQna_pwd().equals(qna_pwd)) {
//	        rttr.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
//	        return "redirect:/qnaList";
//	    }
//	    
//	    
//	    model.addAttribute("qnaDetail", qnaDTO);
//	    return "/qnaDetail";
//	}
//
//	@RequestMapping(value = "/qnaDetail", method = RequestMethod.POST)
//	public String qnaDetail(
//	    @RequestParam("qna_no") int qna_no,
//	    @RequestParam("qna_pwd") String qna_pwd,
//	    HttpSession session, Model model, RedirectAttributes rttr) {
//
//	    // Q&A 정보 조회
//	    QnaDTO qnaDTO = catDogService.qnaDetail(qna_no);
//	    if (qnaDTO == null) {
//	        rttr.addFlashAttribute("error", "Q&A 정보를 찾을 수 없습니다.");
//	        return "redirect:/qnaList";
//	    }
//
//	    // 비밀번호 확인
//	    if (qnaDTO.getQna_secret() == 1 && !qnaDTO.getQna_pwd().equals(qna_pwd)) {
//	        rttr.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
//	        return "redirect:/qnaList";
//	    }
//
//	    model.addAttribute("qnaDetail", qnaDTO);
//	    return "/qnaDetail";
//	}
//
//	
	
	@RequestMapping(value = "/qnaDetail", method = RequestMethod.GET)
	public String qnaDetailGet(
	    @RequestParam("qna_no") int qna_no,
	    HttpSession session, Model model, RedirectAttributes rttr) {

	    // Q&A 정보 조회
	    QnaDTO qnaDTO = catDogService.qnaDetail(qna_no);
	    if (qnaDTO == null) {
	        rttr.addFlashAttribute("error", "Q&A 정보를 찾을 수 없습니다.");
	        return "redirect:/qnaList";
	    }

	    // 사용자 권한 확인
	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
	    int userAuth = (user != null && user.get("user_auth") != null) ? (int) user.get("user_auth") : 0;

	    // 비밀 글 접근 제한 (일반 회원만 제한)
	    if (qnaDTO.getQna_secret() == 1 && userAuth != 1) { // 관리자 제외
	        rttr.addFlashAttribute("error", "비밀글은 비밀번호 입력이 필요합니다.");
	        return "redirect:/qnaList";
	    }

	    model.addAttribute("qnaDetail", qnaDTO);
	    return "/qnaDetail";
	}


	@RequestMapping(value = "/qnaDetail", method = RequestMethod.POST)
	public String qnaDetailPost(
	    @RequestParam("qna_no") int qna_no,
	    @RequestParam("qna_pwd") String qna_pwd,
	    HttpSession session, Model model, RedirectAttributes rttr) {

	    QnaDTO qnaDTO = catDogService.qnaDetail(qna_no);
	    if (qnaDTO == null) {
	        rttr.addFlashAttribute("error", "Q&A 정보를 찾을 수 없습니다.");
	        return "redirect:/qnaList";
	    }

	    // 사용자 권한 확인
	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
	    int userAuth = (user != null && user.get("user_auth") != null) ? (int) user.get("user_auth") : 0;

	    // 관리자 접근 시 비밀번호 확인 건너뜀
	    if (qnaDTO.getQna_secret() == 1 && userAuth != 1) {
	        if (!qna_pwd.equals(qnaDTO.getQna_pwd())) {
	            rttr.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
	            return "redirect:/qnaList";
	        }
	    }

	    model.addAttribute("qnaDetail", qnaDTO);
	    return "/qnaDetail";
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
		@RequestMapping(value="/qnaRegister", method = RequestMethod.GET)
		public String qnaRegister(HttpSession session, RedirectAttributes rttr) {
		    // 세션에서 사용자 정보 가져오기
		    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
		    if (user == null) {
		        rttr.addFlashAttribute("error", "로그인이 필요합니다.");
		        return "redirect:/catdog-login"; // 로그인 페이지로 리다이렉트
		    }

		    return "/qnaRegister"; // 로그인된 사용자라면 작성 페이지로 이동
		}
		
		@RequestMapping(value = "/qnaRegister", method = RequestMethod.POST)
		public String qnaRegister(
		        QnaDTO qnaDTO, 
		        HttpServletRequest request, 
		        HttpSession session, 
		        RedirectAttributes rttr) throws Exception {

		    request.setCharacterEncoding("UTF-8"); // 요청 인코딩 설정

		    // 세션에서 사용자 정보 가져오기
		    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
		    if (user == null) {
		        rttr.addFlashAttribute("error", "로그인이 필요합니다.");
		        return "redirect:/catdog-login"; // 로그인 페이지로 리다이렉트
		    }

		    // user_id 설정
		    String userId = (String) user.get("user_id");
		    qnaDTO.setUser_id(userId);

		    // 비밀글 여부에 따른 비밀번호 처리
		    if (qnaDTO.getQna_secret() == 0) { 
		        qnaDTO.setQna_pwd(null); // 공개글인 경우 비밀번호 제거
		    }

		    // Q&A 등록 처리
		    int result = catDogService.qnaRegister(qnaDTO);

		    // 등록 성공 여부 확인 및 메시지 설정
		    if (result > 0) {
		        rttr.addFlashAttribute("msg", "문의글이 성공적으로 등록되었습니다.");
		    } else {
		        rttr.addFlashAttribute("msg", "문의글 등록에 실패하였습니다.");
		    }

		    // Q&A 리스트 페이지로 리다이렉트
		    return "redirect:/qnaList";
		}


	// Q&A 수정
	@RequestMapping(value="/qnaUpdate", method = RequestMethod.GET)
	public String qnaUpdate(@RequestParam("qna_no") int qna_no, Model model) {
		QnaDTO qnaDTO = catDogService.qnaDetail(qna_no);
		
		
		model.addAttribute("qnaUpdate", qnaDTO);
		return "/qnaUpdate";
	}
	
	@RequestMapping(value="/qnaUpdate", method = RequestMethod.POST)
	public String qnaUpdate(QnaDTO qnaDTO, RedirectAttributes attr,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catDogService.qnaUpdate(qnaDTO);
		
		if(r>0) {
			attr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
			return "redirect:/qnaDetail?qna_no=" + qnaDTO.getQna_no();
		}
		return "redirect:/qnaUpdate?qna_no=" + qnaDTO.getQna_no();
	}
	
	// Q&A 삭제
	@RequestMapping(value="/qnaDelete", method = RequestMethod.GET)
	public String qnaDelete(@RequestParam("qna_no") int qna_no, RedirectAttributes rttr){
		int r = catDogService.qnaDelete(qna_no);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","글삭제에 성공하였습니다.");
			return "redirect:qnaList";
		}
		return "redirect:/qnaDetail?qna_no=" + qna_no;
	}
	
	@RequestMapping(value = "/qnaReplyDetail", method = RequestMethod.GET)
	public String qnaReplyDetail(
	    @RequestParam("qna_no") int qna_no,
	    HttpSession session,
	    RedirectAttributes rttr,
	    Model model) {

	    // Q&A 데이터 가져오기
	    QnaDTO qnaDTO = catDogService.qnaReplyDetail(qna_no);
	    if (qnaDTO == null) {
	        rttr.addFlashAttribute("error", "Q&A 정보를 찾을 수 없습니다.");
	        return "redirect:/qnaList";
	    }

	    // 사용자 권한 확인
	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
	    int user_auth = (user != null && user.get("user_auth") != null) ? (int) user.get("user_auth") : 0;

	    // 비밀 답변글 접근 처리
	    if (qnaDTO.getQna_secret() == 1) { // 비밀글일 경우
	        if (user_auth != 1) { // 관리자가 아닌 경우 비밀번호 확인 필요
	            Boolean hasAccess = (Boolean) session.getAttribute("qnaAccess_" + qna_no);
	            if (hasAccess == null || !hasAccess) {
	                rttr.addFlashAttribute("error", "비밀글은 비밀번호 입력이 필요합니다.");
	                return "redirect:/qnaList"; // 비밀번호 입력이 필요한 경우
	            }
	        }
	    }

	    // 공개글일 경우 비밀번호 확인 없이 접근 가능
	    model.addAttribute("qnaReplyDetail", qnaDTO);
	    model.addAttribute("user_auth", user_auth);
	    return "/qnaReplyDetail";
	}
	
	@RequestMapping(value = "/qnaReplyDetail", method = RequestMethod.POST)
	public String qnaReplyDetailPost(
	    @RequestParam("qna_no") int qna_no,
	    @RequestParam("qna_pwd") String qna_pwd,
	    HttpSession session, Model model, RedirectAttributes rttr) {

	    QnaDTO qnaDTO = catDogService.qnaReplyDetail(qna_no);
	    if (qnaDTO == null) {
	        rttr.addFlashAttribute("error", "Q&A 정보를 찾을 수 없습니다.");
	        return "redirect:/qnaList";
	    }

	    // 사용자 권한 확인
	    Map<String, Object> user = (Map<String, Object>) session.getAttribute("user");
	    int userAuth = (user != null && user.get("user_auth") != null) ? (int) user.get("user_auth") : 0;

	    // 관리자 접근 시 비밀번호 확인 건너뜀
	    if (qnaDTO.getQna_secret() == 1 && userAuth != 1) {
	        if (!qna_pwd.equals(qnaDTO.getQna_pwd())) {
	            rttr.addFlashAttribute("error", "비밀번호가 일치하지 않습니다.");
	            return "redirect:/qnaList";
	        }
	    }

	    model.addAttribute("qnaReplyDetail", qnaDTO);
	    return "/qnaReplyDetail";
	}

	// Q&A 답변 작성
	@RequestMapping(value="/qnaReply", method = RequestMethod.GET)
	public String qnaReply(@RequestParam("qna_no") int qna_no, Model model) {
		QnaDTO qnaDTO = catDogService.qnaDetail(qna_no);
		
		model.addAttribute("qnaReply", qnaDTO);
		return "/qnaReply";
	}
	
	@RequestMapping(value="/qnaReply", method = RequestMethod.POST)
	public String qnaReply(QnaDTO qnaDTO, RedirectAttributes attr, HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catDogService.qnaReply(qnaDTO);
		
		if(r>0) {
			attr.addFlashAttribute("msg", "답변이 작성되었습니다.");
			return "redirect:/qnaDetail?qna_no=" + qnaDTO.getQna_no();
		}
		return "redirect:/qnaReply?qna_no=" + qnaDTO.getQna_no();
	}
	
	// Q&A 답변 수정
	@RequestMapping(value="/qnaReplyUpdate", method = RequestMethod.GET)
	public String qnaReplyUpdate(@RequestParam("qna_no") int qna_no, Model model) {
		QnaDTO qnaDTO = catDogService.qnaDetail(qna_no);
		
		
		model.addAttribute("qnaReplyUpdate", qnaDTO);
		return "/qnaReplyUpdate";
	}
	
	@RequestMapping(value="/qnaReplyUpdate", method = RequestMethod.POST)
	public String qnaReplyUpdate(QnaDTO qnaDTO, RedirectAttributes attr,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catDogService.qnaReplyUpdate(qnaDTO);
		
		if(r>0) {
			attr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
			return "redirect:/qnaDetail?qna_no=" + qnaDTO.getQna_no();
		}
		return "redirect:/qnaUpdate?qna_no=" + qnaDTO.getQna_no();
	}
	
	// Q&A 답변 삭제
	@RequestMapping(value = "/qnaReplyDelete", method = RequestMethod.GET)
	public String qnaReplyClear(@RequestParam("qna_no") int qna_no, RedirectAttributes redirectAttributes) {
	    try {
	        catDogService.qnaReplyDelete(qna_no);
	        redirectAttributes.addFlashAttribute("msg", "Q&A 답변이 삭제되었습니다.");
	    } catch (Exception e) {
	        e.printStackTrace();
	        redirectAttributes.addFlashAttribute("error", "답변 삭제 중 오류가 발생했습니다.");
	    }
	    return "redirect:/qnaList";
	}
	
//	@RequestMapping(value="/qnaDelete", method = RequestMethod.GET)
//	public String qnaDelete(@RequestParam("qna_no") int qna_no, RedirectAttributes rttr){
//		int r = catDogService.qnaDelete(qna_no);
//		
//		if(r>0) {
//			rttr.addFlashAttribute("msg","글삭제에 성공하였습니다.");
//			return "redirect:qnaList";
//		}
//		return "redirect:/qnaDetail?qna_no=" + qna_no;
//	}
	
	// 상품 검색
	@RequestMapping(value="/productSearch", method = RequestMethod.GET)
    public String productSearch(@RequestParam String keyword, Model model) {
		
        List<ProductDTO> productSearch = catDogService.productSearch(keyword);
        model.addAttribute("keyword", keyword);
        model.addAttribute("productSearch", productSearch);
        return "/productSearch"; 
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
	@RequestMapping(value="/faqRegister", method = RequestMethod.GET)
	public String faqRegister() {
		return "/faqRegister";
	}
	
	@RequestMapping(value="/faqRegister", method = RequestMethod.POST)
	public String faqRegister(FaqDTO faqDTO, HttpServletRequest request,RedirectAttributes rttr) throws Exception {
		request.setCharacterEncoding("UTF-8");
		
		int r = catDogService.faqRegister(faqDTO);
		
		if(r>0) {
			rttr.addFlashAttribute("msg","추가에 성공하였습니다.");
		}
		return "redirect:/faqList";
	}	
	

	// FAQ 수정
	@RequestMapping(value = "/faqUpdate", method = RequestMethod.GET)
	public String faqUpdate(@RequestParam("faq_no") int faq_no, Model model) {
	    // FAQ 번호에 해당하는 데이터를 가져옴
	    FaqDTO faqDTO = catDogService.faqDetail(faq_no);
	    model.addAttribute("faqUpdate", faqDTO);
	    return "/faqUpdate"; // 수정 폼으로 이동
	}
	
	@RequestMapping(value = "/faqUpdate", method = RequestMethod.POST)
	public String faqUpdate(FaqDTO faqDTO, RedirectAttributes attr,HttpServletRequest request) throws Exception {
		request.setCharacterEncoding("UTF-8");
		// 수정 실행
	    int r = catDogService.faqUpdate(faqDTO);
	    
	    if (r > 0) {
	        attr.addFlashAttribute("msg", "FAQ가 성공적으로 수정되었습니다.");
	    } else {
	        attr.addFlashAttribute("msg", "FAQ 수정에 실패하였습니다.");
	    }
	    return "redirect:/faqList"; // 수정 후 FAQ 리스트로 이동
	}
	
//	@RequestMapping(value="/qnaUpdate", method = RequestMethod.POST)
//	public String qnaUpdate(QnaDTO qnaDTO, RedirectAttributes attr,HttpServletRequest request) throws Exception {
//		request.setCharacterEncoding("UTF-8");
//		
//		int r = catDogService.qnaUpdate(qnaDTO);
//		
//		if(r>0) {
//			attr.addFlashAttribute("msg", "수정에 성공 하였습니다.");
//			return "redirect:/qnaList";
//		}
//		return "redirect:/qnaUpdate?qna_no=" + qnaDTO.getQna_no();
//	}
	
	// FAQ 삭제
	@RequestMapping(value = "/faqDelete", method = RequestMethod.POST)
	public String faqDelete(@RequestParam("faq_no") int faq_no, RedirectAttributes redirectAttributes) {
	    // 삭제 실행
	    int result = catDogService.faqDelete(faq_no);
	    if (result > 0) {
	        redirectAttributes.addFlashAttribute("message", "FAQ가 성공적으로 삭제되었습니다.");
	    } else {
	        redirectAttributes.addFlashAttribute("message", "FAQ 삭제에 실패하였습니다.");
	    }
	    return "redirect:/faqList"; // 삭제 후 FAQ 리스트로 이동
	}
	
} 