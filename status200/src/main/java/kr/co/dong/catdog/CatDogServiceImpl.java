package kr.co.dong.catdog;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


@Service
public class CatDogServiceImpl implements CatDogService {
	
	@Inject
	private CatDogDAO catDogDAO;
	
	@Override
	public Map login(Map<String, Object>map) {
		// TODO Auto-generated method stub
		return catDogDAO.login(map);
	}

	@Override
	public int create(MemberDTO meber) throws Exception {
		// TODO Auto-generated method stub
		return catDogDAO.create(meber);
	}
	
	@Override
	public int addProduct(ProductDTO productDTO) throws Exception {
		// TODO Auto-generated method stub
		return catDogDAO.addProduct(productDTO);
	}
	@Override
	public List<String> getUserWish(String user_id) throws Exception {
		return catDogDAO.getUserWish(user_id);
	}
	@Override
	public int addWish(String user_id, int product_code) throws Exception {
		// TODO Auto-generated method stub
		return catDogDAO.addWish(user_id, product_code);
	}
	@Override
	public int deleteWish(WishDTO wishDTO) throws Exception {
		// TODO Auto-generated method stub
		return catDogDAO.deleteWish(wishDTO);
	}

	@Override
	public List<CartDTO> getCartInfo(String user_id) throws Exception {
		return catDogDAO.getCartInfo(user_id);
	}
	
	@Override
	public List<CartDTO> getCartItem(String user_id) throws Exception {
		return catDogDAO.getCartItem(user_id);
	}
	
	
	
	
	

	@Override
	public int addCart(CartDTO cartDTO) throws Exception {
		// TODO Auto-generated method stub
		return catDogDAO.addCart(cartDTO);
	}
	@Override
	public ProductDTO productDetail(int product_code) {
		// TODO Auto-generated method stub
		return catDogDAO.productDetail(product_code);
	}
	@Override
	public List<ReviewDTO> getReview(int product_code) {
		// TODO Auto-generated method stub
		return catDogDAO.getReview(product_code);
	}

	@Override
	public List<QnaDTO> getQna(int product_code) {
		// TODO Auto-generated method stub
		return catDogDAO.getQna(product_code);
	}
	@Override
	public int product_reviewTotal(int product_code) {
		// TODO Auto-generated method stub
		return catDogDAO.product_reviewTotal(product_code);
	}
	@Override
	public int product_qnaTotal(int product_code) {
		// TODO Auto-generated method stub
		return catDogDAO.product_qnaTotal(product_code);
	}
	@Override
	public List<ProductDTO> categoryList(int start, int pageSize, int product_category) {
		// TODO Auto-generated method stub
		return catDogDAO.categoryList(start, pageSize, product_category);
	}
	@Override
	public int categoryTotalPost(int product_category) {
		// TODO Auto-generated method stub
		return catDogDAO.categoryTotalPost(product_category);
	}
	@Override
	public List<NoticeDTO> noticeList(int start, int pageSize) {
		// TODO Auto-generated method stub
		return catDogDAO.noticeList(start, pageSize);
	}
	@Override
	public int noticeTotalPost() {
		// TODO Auto-generated method stub
		return catDogDAO.noticeTotalPost();
	}
	@Override
	public List<ReviewDTO> reviewList(int start, int pageSize) {
		// TODO Auto-generated method stub
		return catDogDAO.reviewList(start, pageSize);
	}
	@Override
	public int reviewTotalPost() {
		// TODO Auto-generated method stub
		return catDogDAO.reviewTotalPost();
	}
	@Override
	public List<QnaDTO> qnaList(int start, int pageSize) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaList(start, pageSize);
	}
	@Override
	public int qnaTotalPost() {
		// TODO Auto-generated method stub
		return catDogDAO.qnaTotalPost();
	}
	@Override
	public List<FaqDTO> faqList(int start, int pageSize) {
		// TODO Auto-generated method stub
		return catDogDAO.faqList(start, pageSize);
	}
	@Override
	public int faqTotalPost() {
		// TODO Auto-generated method stub
		return catDogDAO.faqTotalPost();
	}
	@Override
	public List<FaqDTO> faqListDivision(int start, int pageSize, int faq_division) {
		// TODO Auto-generated method stub
		return catDogDAO.faqListDivision(start, pageSize, faq_division);
	}
	@Override
	public int faqTotalPostDivision(int faq_division) {
		// TODO Auto-generated method stub
		return catDogDAO.faqTotalPostDivision(faq_division);
	}
	
	@Override
	public NoticeDTO noticeDetail(int notice_no) {
		// TODO Auto-generated method stub
		return catDogDAO.noticeDetail(notice_no);
	}
	@Override
	public ReviewDTO reviewDetail(int review_no) {
		// TODO Auto-generated method stub
		return catDogDAO.reviewDetail(review_no);
	}
	@Override
	public QnaDTO qnaDetail(int qna_no, String qna_pwd) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaDetail(qna_no, qna_pwd);
	}
	@Override
	public FaqDTO faqDetail(int faq_no) {
		// TODO Auto-generated method stub
		return catDogDAO.faqDetail(faq_no);
	}
	@Override
	public int noticeRegister(NoticeDTO noticeDTO) {
		// TODO Auto-generated method stub
		return catDogDAO.noticeRegister(noticeDTO);
	}
	@Override
	public int noticeUpdate(NoticeDTO noticeDTO) {
		// TODO Auto-generated method stub
		return catDogDAO.noticeUpdate(noticeDTO);
	}
	@Override
	public int noticeDelete(int notice_no) {
		// TODO Auto-generated method stub
		return catDogDAO.noticeDelete(notice_no);
	}
	@Override
	public int qnaRegister(QnaDTO qnaDTO) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaRegister(qnaDTO);
	}
	@Override
	public int qnaUpdate(QnaDTO qnaDTO) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaUpdate(qnaDTO);
	}
	@Override
	public int qnaDelete(int qna_no) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaDelete(qna_no);
	}
	@Override
	public int qnaReply(QnaDTO qnaDTO) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaReply(qnaDTO);
	}
	@Override
	public int qnaReplyUpdate(QnaDTO qnaDTO) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaReplyUpdate(qnaDTO);
	}

	@Override
	public int qnaReplyDelete(int qna_no) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaReplyDelete(qna_no);
	}
//	@Override
//	public List<ProductDTO> productList(int start, int pageSize) {
//		// TODO Auto-generated method stub
//		return catDogDAO.productList(start, pageSize);
//	}
	@Override
	public List<ProductDTO> productSearch(String keyword) {
		// TODO Auto-generated method stub
		return catDogDAO.productSearch(keyword);
	}
	@Override
	public int productTotal() {
		// TODO Auto-generated method stub
		return catDogDAO.productTotal();
	}
	@Override
	public int faqRegister(FaqDTO faqDTO) {
		// TODO Auto-generated method stub
		return catDogDAO.faqRegister(faqDTO);
	}
	@Override
	public int noticeUpdateReadCnt(int notice_no) {
		// TODO Auto-generated method stub
		return catDogDAO.noticeUpdateReadCnt(notice_no);
	}
	@Override
	public int reviewUpdateReadCnt(int review_no) {
		// TODO Auto-generated method stub
		return catDogDAO.reviewUpdateReadCnt(review_no);
	}


	@Override
	public int faqUpdate(FaqDTO faqDTO) {
		// TODO Auto-generated method stub
		return catDogDAO.faqUpdate(faqDTO);
	}

	@Override
	public int faqDelete(int faq_no) {
		// TODO Auto-generated method stub
		return catDogDAO.faqDelete(faq_no);
	}
	
}
