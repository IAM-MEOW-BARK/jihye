package kr.co.dong.catdog;

import java.util.List;
import java.util.Map;

public interface CatDogDAO {
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
	
	// 찜하기 추가
    public int addWish(String user_id, int product_id) throws Exception;

    // 찜하기 삭제
    public int removeWish(String user_id, int product_id) throws Exception;
    
    /*장바구니 보류*/    
    // 장바구니 추가
    public int addCart(CartDTO cartDTO) throws Exception;
    
    // 장바구니 삭제
    public int deleteCart(int product_id) throws Exception;
    
    // 찜한 상품 리스트 조회
    public List<ProductDTO> getWish(String user_id) throws Exception;
    
    // 회원 정보 수정
    public int updateProfile(MemberDTO memberDTO);
    
    // 회원 탈퇴
    public int deleteUser(String user_id);

    // 최근 주문 내역 (최신 5개 등 제한)
    public List<OrderDTO> getRecentOrders(String user_id) throws Exception;

    // 전체 주문 내역
    public List<OrderDTO> getAllOrders(String user_id, String order_code) throws Exception;

    // 주문 내역 상세 표시
    public OrderDTO getOrderDetail(int order_code) throws Exception;
    
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
    public List<ProductGroupDTO> productDetail();
    
    // 카테고리별 리스트
    
    // 공지사항 게시판 리스트
    public List<NoticeDTO> boardList();
    
    // 리뷰 게시판 리스트
    public List<ReviewDTO> reviewList();
    
    // Q&A 게시판 리스트
    public List<QADTO> qnaList();
    
    // 공지사항 상세보기, 조회수
    public NoticeDTO boardDetail(int board_no);
    public int boardUpdateReadCnt(int board_no);
    
    // 리뷰 상세보기, 조회수
    public ReviewDTO reviewDetail(int review_no);
    public int reviewUpdateReadCnt(int review_no);
    
    // Q&A 상세보기, 조회수
    public QADTO qnaDetail(int qa_no);
    
    // Q&A 글 작성 
    public int qnaRegister(QADTO qaDTO);
    
    // Q&A 글 수정
    public int qnaUpdate(QADTO qaDTO);
    
    // Q&A 글 삭제
    public int qnaDelete(int qa_no);
    
}
