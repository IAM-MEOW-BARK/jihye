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
	public List<ProductDTO> productDetail() {
		// TODO Auto-generated method stub
		return catDogDAO.productDetail();
	}

	@Override
	public List<NoticeDTO> noticeList(int start, int pageSize) {
		// TODO Auto-generated method stub
		return catDogDAO.noticeList(start, pageSize);
	}

	@Override
	public List<ReviewDTO> reviewList(int start, int pageSize) {
		// TODO Auto-generated method stub
		return catDogDAO.reviewList(start, pageSize);
	}

	@Override
	public List<QnaDTO> qnaList(int start, int pageSize) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaList(start, pageSize);
	}
	
	@Override
	public List<FaqDTO> faqList(int start, int pageSize) {
		// TODO Auto-generated method stub
		return catDogDAO.faqList(start, pageSize);
	}
	@Override
	public int noticeTotalPost() {
		// TODO Auto-generated method stub
		return catDogDAO.noticeTotalPost();
	}
	@Override
	public int reviewTotalPost() {
		// TODO Auto-generated method stub
		return catDogDAO.reviewTotalPost();
	}

	@Override
	public int qnaTotalPost() {
		// TODO Auto-generated method stub
		return catDogDAO.qnaTotalPost();
	}

	@Override
	public int faqTotalPost() {
		// TODO Auto-generated method stub
		return catDogDAO.faqTotalPost();
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
	public QnaDTO qnaDetail(int qna_no) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaDetail(qna_no);
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
	public List<FaqDTO> faqListDivision(int start, int pageSize, int faq_division) {
		// TODO Auto-generated method stub
		return catDogDAO.faqListDivision(start, pageSize, faq_division);
	}

	@Override
	public int faqTotalPostDivision(int faq_division) {
		// TODO Auto-generated method stub
		return catDogDAO.faqTotalPostDivision(faq_division);
	}


}
