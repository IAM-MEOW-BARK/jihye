package kr.co.dong.catdog;

import java.util.List;
import java.util.Map;

public interface CatDogDAO {
	
	public List<ProductDTO> mainlist(Map<String, Object> param);
    
    // 카트
    public String addOrder(OrderDTO orderDTO) throws Exception;
    public void addOrderItems(List<OrderItemDTO> orderItems) throws Exception;
   
   // 정보 확인
   public OrderDetailDTO getOrderDetail(String order_code) throws Exception;
   
   // 마이페이지
    public List<MyDTO> getMyOrders(String user_id) throws Exception;
    
    public int isReview(ReviewDTO reviewDTO) throws Exception;
   
   public int regReview(ReviewDTO reviewDTO) throws Exception;
   
    // 최근 주문 내역 (최신 5개 등 제한)
	public List<OrderDTO> getRecentOrders(String user_id) throws Exception;

	// 상세 주문 내역
	public List<OrderDTO> getDetailOrders(String order_code) throws Exception;

	// 주문 총 결제액
	public int getTotalCost(String order_code) throws Exception;
   
	// 로그인
	public Map login(Map<String, Object> map);	
	
	// 회원가입
	public int create(MemberDTO meber) throws Exception;
	
	// 이메일 중복
	public MemberDTO getMemberByEmail(String user_id) throws Exception;
	
	// 회원 정보 찾기 (아이디)
	public int findId(String name, int phone_num) throws Exception;
	
	// 회원 정보 찾기 (비밀번호)
	public int findPw(String user_id, String name, int phone_num) throws Exception;
	
	//제품 캐러셀 리스트 출력
	public List <ProductDTO> list();
	
	// 메인페이지 찜한 상품
	public List<String> getUserWish(String user_id) throws Exception;
		
	// 찜하기 추가
    public int addWish(String user_id, int product_code) throws Exception;

    // 찜하기 삭제
    public int deleteWish(WishDTO wishDTO) throws Exception;
    
    /*장바구니 보류*/    
    // 장바구니 추가
 	public int addCart(CartDTO cartDTO) throws Exception;

 	// 장바구니 삭제
 	public int deleteCart(CartDTO cartDTO) throws Exception;
 	
 	//장바구니 수량 변경
 	public int updateCartQuantity(CartDTO cartDTO) throws Exception;
    
    // 찜한 상품 리스트 조회
    public List<ProductDTO> getWish(String user_id) throws Exception;
    
    // 회원 정보 수정
    public int updateProfile(MemberDTO memberDTO);
    
    // 회원 탈퇴
    public int deleteUser(String user_id);
    
    // 장바구니 정보
    public List<CartDTO> getCartInfo(String user_id) throws Exception;
    
    // 장바구니 상품 정보
    public List<CartDTO> getCartItem(String user_id) throws Exception;
    
    // 장바구니 총 가격
 	public int getCartCost(String user_id) throws Exception;


    // 전체 주문 내역
    public List<OrdersDTO> getAllOrders(String user_id, String order_code) throws Exception;

    // 주문 내역 상세 표시
    public OrdersDTO getOrderDetail(int order_code) throws Exception;
    
    public List<OrderItemDetailDTO> getOrderItemDetail(String order_code) throws Exception;
    
    /*관리자*/
    // 전체 상품 관리 리스트
    public List <ProductDTO> getTotalProduct();
    
    // 상품 등록
    public int addProduct(ProductDTO productDTO);
    
    // 상품 수정
    public int updateProduct(ProductDTO productDTO);
    
    // 상품 삭제
    public int deleteProduct(int product_id);
    
    // 전체 회원 리스트
    public List <MemberDTO> getTotalMember();
    
    // 회원 삭제 위에 deleteUser 참고
    
    // 결제 skip 2차
    
    // 상품 상세정보
    public ProductDTO productDetail(int product_code);
    public List<ReviewDTO> getReview(int product_code);
    public List<QnaDTO> getQna(int product_code);
    public int product_reviewTotal(int product_code);
    public int product_qnaTotal(int product_code);
    
    // 현재 수량 조회
    int getCartQuantity(CartDTO cartDTO) throws Exception;
    
    
    
    // 카테고리별 리스트
    //public List<ProductDTO> categoryList(int start, int pageSize, int product_category, int product_code);
   
  	public List <ProductDTO> categoryList(int start, int pageSize, int product_category);
  	public int categoryTotalPost(int product_category);
  	
    // NOTICE 게시판 리스트
    public List<NoticeDTO> noticeList(int start, int pageSize);
    public int noticeTotalPost();
    
    // REVIEW 게시판 리스트
    public List<ReviewDTO> reviewList(int start, int pageSize);
    public int reviewTotalPost();
    
    // Q&A 게시판 리스트
    public List<QnaDTO> qnaList(int start, int pageSize);
    public int qnaTotalPost();
    
    // FAQ 게시판 리스트
    public List<FaqDTO> faqList(int start, int pageSize);
    public int faqTotalPost();
    
    // FAQ 구분 리스트
    public List<FaqDTO> faqListDivision(int start, int pageSize, int faq_division);
    public int faqTotalPostDivision(int faq_division);
    
    // 공지사항 상세보기, 조회수
    public NoticeDTO noticeDetail(int notice_no);
    public int noticeUpdateReadCnt(int notice_no);
    
    // 리뷰 상세보기, 조회수
    public ReviewDTO reviewDetail(int review_no);
    public int reviewUpdateReadCnt(int review_no);
    
    // Q&A 상세 조회
    public QnaDTO qnaDetail(int qna_no);
    
    // FAQ 상세 조회
    public FaqDTO faqDetail(int faq_no);
    
    //공지사항 글 작성
    public int noticeRegister(NoticeDTO noticeDTO);
    
    //공지사항 글 수정
    public int noticeUpdate(NoticeDTO noticeDTO);
    
    // 공지사항 글 삭제
    public int noticeDelete(int notice_no);
    
    // Q&A 글 작성 
    public int qnaRegister(QnaDTO qnaDTO);
    
    // Q&A 글 수정
    public int qnaUpdate(QnaDTO qnaDTO);
    
    // Q&A 글 삭제
    public int qnaDelete(int qna_no);
    
    // Q&A 답변 조회
    public QnaDTO qnaReplyDetail(int qna_no);
    
    // Q&A 답변 작성
    public int qnaReply(QnaDTO qnaDTO);
    
    // Q&A 답변 수정
    public int qnaReplyUpdate(QnaDTO qnaDTO);
    
    // Q&A 답변 삭제
    public int qnaReplyDelete(int qna_no);
    
    // 상품 검색
    //public List<ProductDTO> productList(int start, int pageSize);
    public List<ProductDTO> productSearch(String keyword);
    public int productTotal();
    
    // FAQ 글 작성 
    public int faqRegister(FaqDTO faqDTO);
    
    // FAQ 글 수정
    public int faqUpdate(FaqDTO faqDTO);
    
    // FAQ 글 삭제
    public int faqDelete(int faq_no);

    
}
