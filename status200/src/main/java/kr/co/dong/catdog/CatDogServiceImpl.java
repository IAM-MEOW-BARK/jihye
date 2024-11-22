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
	public List<NoticeDTO> boardList() {
		// TODO Auto-generated method stub
		System.out.println("boardList() 호출됨");
		return catDogDAO.boardList();
	}

	@Override
	public List<ReviewDTO> reviewList() {
		// TODO Auto-generated method stub
		return catDogDAO.reviewList();
	}

	@Override
	public List<QNADTO> qnaList() {
		// TODO Auto-generated method stub
		return catDogDAO.qnaList();
	}

	@Override
	public NoticeDTO boardDetail(int board_no) {
		// TODO Auto-generated method stub
		return catDogDAO.boardDetail(board_no);
	}

	@Override
	public ReviewDTO reviewDetail(int review_no) {
		// TODO Auto-generated method stub
		return catDogDAO.reviewDetail(review_no);
	}

	@Override
	public QNADTO qnaDetail(int qna_no) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaDetail(qna_no);
	}

	@Override
	public int qnaRegister(QNADTO qnaDTO) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaRegister(qnaDTO);
	}

	@Override
	public int qnaUpdate(QNADTO qnaDTO) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaUpdate(qnaDTO);
	}

	@Override
	public int qnaDelete(int qna_no) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaDelete(qna_no);
	}

	@Override
	public int boardUpdateReadCnt(int board_no) {
		// TODO Auto-generated method stub
		return catDogDAO.boardUpdateReadCnt(board_no);
	}

	@Override
	public int reviewUpdateReadCnt(int review_no) {
		// TODO Auto-generated method stub
		return catDogDAO.reviewUpdateReadCnt(review_no);
	}

}
