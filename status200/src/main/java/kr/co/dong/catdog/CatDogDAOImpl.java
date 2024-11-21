package kr.co.dong.catdog;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class CatDogDAOImpl implements CatDogDAO{
	
	@Inject SqlSession sqlSession;	
	
	private static final String namespace ="kr.co.dong.boardMapper";

	@Override
	public Map login(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace + ".login", map);
	}

	@Override
	public int create(MemberDTO meber) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace + ".sign-up", meber);
	}

	@Override
	public MemberDTO getMemberByEmail(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int findId(String name, int phone_num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int findPw(String user_id, String name, int phone_num) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductDTO> list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addWish(String user_id, int product_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int removeWish(String user_id, int product_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int addCart(CartDTO cartDTO) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCart(int product_id) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ProductDTO> getWish(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateProfile(MemberDTO memberDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteUser(String user_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<OrderDTO> getRecentOrders(String user_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<OrderDTO> getAllOrders(String user_id, String order_code) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public OrderDTO getOrderDetail(int order_code) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductDTO> getTotalProduct() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int addProduct(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateProduct(ProductDTO productDTO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteProduct(int product_id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<MemberDTO> getTotalMember() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<ProductGroupDTO> productDetail() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".productDetail");
	}

	@Override
	public List<NoticeDTO> boardList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".boardList");
	}

	
	@Override
	public List<ReviewDTO> reviewList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".reviewList");
	}

	@Override
	public List<QADTO> qnaList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList(namespace+".qnaList");
	}

	@Override
	public NoticeDTO boardDetail(int board_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".boardDetail", board_no);
	}

	@Override
	public ReviewDTO reviewDetail(int review_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".reviewDetail", review_no);
	}

	@Override
	public QADTO qnaDetail(int qa_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne(namespace+".qnaDetail", qa_no);
	}

	@Override
	public int qnaRegister(QADTO qaDTO) {
		// TODO Auto-generated method stub
		return sqlSession.insert(namespace+".qnaRegister", qaDTO);
	}

	@Override
	public int qnaUpdate(QADTO qaDTO) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".qnaUpdate", qaDTO);
	}

	@Override
	public int qnaDelete(int qa_no) {
		// TODO Auto-generated method stub
		return sqlSession.delete(namespace+".qnaDelete", qa_no);
	}

	@Override
	public int boardUpdateReadCnt(int board_no) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".boardUpdateReadCnt", board_no);
	}

	@Override
	public int reviewUpdateReadCnt(int review_no) {
		// TODO Auto-generated method stub
		return sqlSession.update(namespace+".reviewUpdateReadCnt", review_no);
	}

}
