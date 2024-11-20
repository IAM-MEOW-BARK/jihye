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
	public List<ProductGroupDTO> productDetail() {
		// TODO Auto-generated method stub
		return catDogDAO.productDetail();
	}

	@Override
	public List<BoardDTO> boardList() {
		// TODO Auto-generated method stub
		return catDogDAO.boardList();
	}

	@Override
	public List<ReviewDTO> reviewList() {
		// TODO Auto-generated method stub
		return catDogDAO.reviewList();
	}

	@Override
	public List<QADTO> qnaList() {
		// TODO Auto-generated method stub
		return catDogDAO.qnaList();
	}

	@Override
	public BoardDTO boardDetail(int board_no) {
		// TODO Auto-generated method stub
		return catDogDAO.boardDetail(board_no);
	}

	@Override
	public ReviewDTO reviewDetail(int review_no) {
		// TODO Auto-generated method stub
		return catDogDAO.reviewDetail(review_no);
	}

	@Override
	public QADTO qnaDetail(int qa_no) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaDetail(qa_no);
	}

	@Override
	public int qnaRegister(QADTO qaDTO) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaRegister(qaDTO);
	}

	@Override
	public int qnaUpdate(QADTO qaDTO) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaUpdate(qaDTO);
	}

	@Override
	public int qnaDelete(int qa_no) {
		// TODO Auto-generated method stub
		return catDogDAO.qnaDelete(qa_no);
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
