package kr.co.dong.catdog;

import java.util.List;
import java.util.Map;


public interface CatDogService {
	// 로그인
	public Map login(Map<String, Object> map);
	
	// 회원가입
	public int create(MemberDTO meber) throws Exception;
	
	
	
	
	
	
	
	// 상품 상세정보
    public List<ProductDTO> productDetail();
    
    // 카테고리별 리스트
    
    // 공지사항 게시판 리스트
    public List<NoticeDTO> boardList();
    
    // 리뷰 게시판 리스트
    public List<ReviewDTO> reviewList();
    
    // Q&A 게시판 리스트
    public List<QNADTO> qnaList();
    
    // 공지사항 상세보기
    public NoticeDTO boardDetail(int board_no);
    public int boardUpdateReadCnt(int board_no);
    
    // 리뷰 상세보기
    public ReviewDTO reviewDetail(int review_no);
    public int reviewUpdateReadCnt(int review_no);
    
    // Q&A 상세보기
    public QNADTO qnaDetail(int qna_no);
    
    // Q&A 글 작성 
    public int qnaRegister(QNADTO qnaDTO);
    
    // Q&A 글 수정
    public int qnaUpdate(QNADTO qnaDTO);
    
    // Q&A 글 삭제
    public int qnaDelete(int qna_no);
}
