package kr.co.dong.catdog;

import java.util.List;
import java.util.Map;


public interface CatDogService {
	// 로그인
	public Map login(Map<String, Object> map);
	
	// 회원가입
	public int create(MemberDTO meber) throws Exception;
	
	// 상품 등록
    public int addProduct(ProductDTO productDTO) throws Exception;
	
	
	
	
	
	// 상품 상세정보
    public ProductDTO productDetail(int product_code);
    
    // 카테고리별 리스트
   	public List <ProductDTO> categoryList(int start, int pageSize);
   	public int categoryTotalPost();
    
    // 공지사항 게시판 리스트
    public List<NoticeDTO> noticeList(int start, int pageSize);
    public int noticeTotalPost();
    
    // 리뷰 게시판 리스트
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
    
    // 공지사항 상세보기
    public NoticeDTO noticeDetail(int notice_no);
    public int noticeUpdateReadCnt(int notice_no);
    
    // 리뷰 상세보기
    public ReviewDTO reviewDetail(int review_no);
    public int reviewUpdateReadCnt(int review_no);
    
    // Q&A 상세보기
    public QnaDTO qnaDetail(int qna_no);
    
    // 공지사항 글 작성 
    public int noticeRegister(NoticeDTO noticeDTO);
    
    // 공지사항 글 수정
    public int noticeUpdate(NoticeDTO noticeDTO);
    
    // 공지사항 글 삭제
    public int noticeDelete(int notice_no);
    
    // Q&A 글 작성 
    public int qnaRegister(QnaDTO qnaDTO);
    
    // Q&A 글 수정
    public int qnaUpdate(QnaDTO qnaDTO);
    
    // Q&A 글 삭제
    public int qnaDelete(int qna_no);
    
    // 상품 검색
    public List<ProductDTO> productSearch(String keyword);
    
    // FAQ 글 작성 
    public int faqRegister(FaqDTO faqDTO);
    
    // FAQ 글 수정
    
    
    // FAQ 글 삭제
    
}
