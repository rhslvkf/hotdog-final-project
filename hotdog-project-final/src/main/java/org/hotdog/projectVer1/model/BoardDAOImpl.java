package org.hotdog.projectVer1.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;













import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	@Override
	public void posting(BoardVO vo, String type) {
		sqlSessionTemplate.insert(type+".posting", vo);
	}

	@Override
	public void updatePosting(BoardVO vo, String type) {
		sqlSessionTemplate.update(type+".updatePosting", vo);
	}

	@Override
	public void deletePosting(String no, String type) {
		sqlSessionTemplate.delete(type+".deletePosting", no);
	}


	@Override
	public void hits(int no, String type) {
		sqlSessionTemplate.update(type+".hits",no);
	}


	@Override
	public void fileUpload(BoardVO vo) {

	}

	@Override
	public BoardVO showContent(int no, String type) {
		return sqlSessionTemplate.selectOne(type+".showContent", no);
	}
	@Override
	public List<BoardVO> getPostingList(String pageNo, String type) {
		List<BoardVO> list = sqlSessionTemplate.selectList(type+".getPostingList", pageNo);
		return list;
	}

	@Override
	public List<BoardVO> searchPostingByNickName(String pageNo, String word,String type) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pageNo", pageNo);
		map.put("word", word);
		List<BoardVO> list = sqlSessionTemplate.selectList(type+".searchPostingByNickName",map);
		return list;
	}

	@Override
	public List<BoardVO> searchPostingByTitle(String pageNo, String word, String type) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pageNo", pageNo);
		map.put("word", word);
		return sqlSessionTemplate.selectList(type+".searchPostingByTitle",map);
	}

	@Override
	public List<BoardVO> searchPostingByContent(String pageNo, String word, String type) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pageNo", pageNo);
		map.put("word", word);
		List<BoardVO> list = sqlSessionTemplate.selectList(type+".searchPostingByContent",map);
		return list;
	}

	@Override
	public void scrape(MemberVO mvo, BoardVO bvo) {

	}

	@Override
	public int totalContent(String type) {
		return sqlSessionTemplate.selectOne(type+".totalContent");
	}

	@Override
	public int totalContentBySearchingTitle(String type, String word) {
		
		return sqlSessionTemplate.selectOne(type+".totalContentBySearchingTitle",word);
	}

	@Override
	public int totalContentBySearchingContent(String type, String word) {
		return sqlSessionTemplate.selectOne(type+".totalContentBySearchingContent",word);

	}

	@Override
	public int totalContentBySearchingNickName(String type, String word) {
		return sqlSessionTemplate.selectOne(type+".totalContentBySearchingNickName",word);

	}

	@Override
	public List<BoardVO> showPostingListByIdFromAbandoned(String pageNo, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("memberId", memberId);
		return sqlSessionTemplate.selectList("board_abandoned.showPostingListById",map);
	}

	@Override
	public List<BoardVO> showPostingListByIdFromAdoption(String pageNo, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("memberId", memberId);
		return sqlSessionTemplate.selectList("board_adoption.showPostingListById",map);
	}

	@Override
	public List<BoardVO> showPostingListByIdFromPetInfo(String pageNo, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("memberId", memberId);
		return sqlSessionTemplate.selectList("board_petInfo.showPostingListById",map);
	}

	@Override
	public List<BoardVO> showPostingListByIdFromCommunity(String pageNo, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("memberId", memberId);
		return sqlSessionTemplate.selectList("board_community.showPostingListById",map);
	}

	@Override
	public List<BoardVO> showPostingListByIdFromPetPicture(String pageNo, String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pageNo", pageNo);
		map.put("memberId", memberId);
		return sqlSessionTemplate.selectList("board_petPicture.showPostingListById",map);
	}

	@Override
	public int searchBoardNumber(String type) {
		BoardVO vo = sqlSessionTemplate.selectOne(type+".searchBoardNumber");
		return vo.getBoardNumber();
	}

	@Override
	public void uploadFile(BoardVO vo, String type) {
		sqlSessionTemplate.insert(type+".uploadFile", vo);
	}

	@Override
	public ArrayList<String> searchFileName(int no, String type) {
		List<String> list = sqlSessionTemplate.selectList(type+".searchFileName",no);
		return (ArrayList<String>) list;
	}

	@Override
	public BoardVO isScrape(BoardVO vo, String type) {
		return sqlSessionTemplate.selectOne(type+".isScrape",vo);
	}

	@Override
	public void insertScrape(BoardVO vo, String type) {
		sqlSessionTemplate.insert(type+".insertScrape",vo);
	}

	@Override
	public Object getAllScrapeFromAbandoned(String memberId) {
		return sqlSessionTemplate.selectList("board_abandoned.getAllScrapeFromAbandoned",memberId);
	}

	@Override
	public Object getAllScrapeFromAdoption(String memberId) {
		return sqlSessionTemplate.selectList("board_adoption.getAllScrapeFromAdoption",memberId);
	}

	@Override
	public Object getAllScrapeFromPetInfo(String memberId) {
		return sqlSessionTemplate.selectList("board_petInfo.getAllScrapeFromPetInfo",memberId);
	}
	
	
	//댓글 관련

	@Override
	public void postingComment(CommentVO cvo,String type) {
		System.out.println("바로직전"+cvo);
		sqlSessionTemplate.insert(type+".postingComment",cvo);
	}
	
	public List<CommentVO> commentList(int commentBoardNumber, String type){
	
		List<CommentVO> cvo=sqlSessionTemplate.selectList(type+".commentList",commentBoardNumber);
		for(int i = 0 ; i<cvo.size();i++){
			if(cvo.get(i).getCommentIndent()!=0){
				
			}
		}
		return cvo;
	}
	

	
	@Override
	public void updateComment(CommentVO vo) {

	}

	@Override
	public void deleteComment(int commentNumber,String type) {
			sqlSessionTemplate.delete(type+".deleteComment",commentNumber);
	}

	@Override
	public CommentVO selectOneChat(int commentNumber,String type) {
		System.out.println("selectOne전");
		CommentVO vo =sqlSessionTemplate.selectOne(type+".selectOneChat",commentNumber);
		System.out.println("결과값"+vo);
		return vo;
	}



	@Override
	public void insertReContent(CommentVO vo, String type) {
		sqlSessionTemplate.insert(type+".insertReContent",vo);
	}

	@Override
	public int getCountOfAbandonedComment(String memberNickName) {
		return sqlSessionTemplate.selectOne("board_abandoned.getCountOfAbandonedComment",memberNickName);
	}

	@Override
	public int getCountOfAdoptionComment(String memberNickName) {
		return sqlSessionTemplate.selectOne("board_adoption.getCountOfAdoptionComment",memberNickName);
	}

	@Override
	public int getCountOfCommunityComment(String memberNickName) {
		return sqlSessionTemplate.selectOne("board_community.getCountOfCommunityComment",memberNickName);
	}

	@Override
	public int getCountOfPetInfoComment(String memberNickName) {
		return sqlSessionTemplate.selectOne("board_petInfo.getCountOfPetInfoComment",memberNickName);
	}

	@Override
	public int getCountOfPetPictureComment(String memberNickName) {
		return sqlSessionTemplate.selectOne("board_petPicture.getCountOfPetPictureComment",memberNickName);
	}
	/*
	 * 최근게시물 5개 
	 * (non-Javadoc)
	 * @see org.hotdog.projectVer1.model.BoardDAO#latestcommunityPosting(java.lang.String, java.lang.String)
	 */
	@Override
	public List<BoardVO> latestPosting(String pageNo, String type) {
		return sqlSessionTemplate.selectList(type+".latestPosting",pageNo);
	}

	@Override
	public List<BoardVO> latestcommunityPosting(String pageNo, String type) {
		return sqlSessionTemplate.selectList(type+".latestcommunityPosting",pageNo);
	}

	@Override
	public List<BoardVO> latestnoticePosting(String pageNo, String type) {
		return sqlSessionTemplate.selectList(type+".latestnoticePosting",pageNo);
	}

	@Override
	public List<BoardVO> latestepetinfoPosting(String pageNo, String type) {
		return sqlSessionTemplate.selectList(type+".latestepetinfoPosting",pageNo);
	}

	
	
	
	@Override
	public int replyShapeCondition(CommentVO cvo, String type) {
		return sqlSessionTemplate.selectOne(type+".replyShapeCondition",cvo);
	}

	@Override
	public int maxStepComment(CommentVO cvo, String type) {
		return sqlSessionTemplate.selectOne(type+".maxStepComment",cvo);
	}
	
	@Override
	public void replyShape(CommentVO cvo, String type) {
		System.out.println(cvo);
		 sqlSessionTemplate.update(type+".replyShape",cvo);
		
	}

	@Override
	public void replyShape1(CommentVO cvo, String type) {
		sqlSessionTemplate.update(type+".replyShape1",cvo);
		
	}

	@Override
	public ArrayList<BoardVO> latestPetPicturePosting() {
		List<BoardVO> list = sqlSessionTemplate.selectList("board_petPicture.latestPetPicturePosting");
		return (ArrayList<BoardVO>) list;
	}

	@Override
	public Object getCommentListByNickNameFromAbandoned(String memberNickName) {
		return sqlSessionTemplate.selectList("board_abandoned.getCommentListByNickNameFromAbandoned",memberNickName);
	}

	@Override
	public Object getCommentListByNickNameFromAdoption(String memberNickName) {
		return sqlSessionTemplate.selectList("board_adoption.getCommentListByNickNameFromAdoption",memberNickName);
	}

	@Override
	public Object getCommentListByNickNameFromCommunity(String memberNickName) {
		return sqlSessionTemplate.selectList("board_community.getCommentListByNickNameFromCommunity",memberNickName);
	}

	@Override
	public Object getCommentListByNickNameFromPetInfo(String memberNickName) {
		return sqlSessionTemplate.selectList("board_petInfo.getCommentListByNickNameFromPetInfo",memberNickName);
	}

	@Override
	public Object getCommentListByNickNameFromPetPicture(String memberNickName) {
		return sqlSessionTemplate.selectList("board_petPicture.getCommentListByNickNameFromPetPicture",memberNickName);
	}
	
	// 통합 검색 관련
	@Override
	public List<BoardVO> searchBoardAbandoned(String word) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("word1", word);
		map.put("word2", word);
		return sqlSessionTemplate.selectList("board_abandoned.searchBoard", map);
	}

	@Override
	public List<BoardVO> searchBoardAdoption(String word) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("word1", word);
		map.put("word2", word);
		return sqlSessionTemplate.selectList("board_adoption.searchBoard", map);
	}

	@Override
	public List<BoardVO> searchBoardCommunity(String word) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("word1", word);
		map.put("word2", word);
		return sqlSessionTemplate.selectList("board_community.searchBoard", map);
	}

	@Override
	public List<BoardVO> searchBoardNotice(String word) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("word1", word);
		map.put("word2", word);
		return sqlSessionTemplate.selectList("board_notice.searchBoard", map);
	}

	@Override
	public List<BoardVO> searchBoardPetInfo(String word) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("word1", word);
		map.put("word2", word);
		return sqlSessionTemplate.selectList("board_petInfo.searchBoard", map);
	}

	@Override
	public List<BoardVO> searchBoardPetPicture(String word) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("word1", word);
		map.put("word2", word);
		return sqlSessionTemplate.selectList("board_petPicture.searchBoard", map);
	}

	@Override
	public List<BoardVO> searchBoardQnA(String word) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("word1", word);
		map.put("word2", word);
		return sqlSessionTemplate.selectList("board_QnA.searchBoard", map);
	}

	@Override
	public List<BoardVO> searchPostingByTitleOrContents(String pageNo,
			String word, String type) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("pageNo", pageNo);
		map.put("word1", word);
		map.put("word2", word);
		List<BoardVO> list = sqlSessionTemplate.selectList(type+".searchPostingByTitleOrContents",map);
		return list;
	}

	@Override
	public int totalContentBySearchingTitleOrContents(String type, String word) {
		Map<String,String> map=new HashMap<String, String>();
		map.put("word1", word);
		map.put("word2", word);
		return sqlSessionTemplate.selectOne(type+".totalContentBySearchingTitleOrContents",map);
	}

	//통합검색페이징	
	@Override
	public List<BoardVO> searchBoardPaging(String pageNo, String word) {
		Map<String,String> map =new HashMap<String, String>();
		map.put("pageNo", pageNo);
		map.put("word1", word);
		map.put("word2", word);
		List<BoardVO> list= sqlSessionTemplate.selectList("searchBoard.searchBoardPaging", map);
		return list;
	}
	// Q&A 답글 관련 메서드
	@Override
	public void updateRestep(int ref, int restep, String type) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("ref", ref);
		map.put("restep", restep);
		sqlSessionTemplate.update(type+".updateRestep", map);	
		
	}

	@Override
	public void insertRefContent(BoardVO vo, String type) {
		sqlSessionTemplate.insert(type+".writeReply", vo);	
		
	}

	@Override
	public int totalContentByIdFromAbandoned(String memberId) {
		return sqlSessionTemplate.selectOne("board_abandoned.totalContentByIdFromAbandoned",memberId);
	}

	@Override
	public int totalContentByIdFromAdoption(String memberId) {
		return sqlSessionTemplate.selectOne("board_adoption.totalContentByIdFromAdoption",memberId);
	}

	@Override
	public int totalContentByIdFromPetInfo(String memberId) {
		return sqlSessionTemplate.selectOne("board_petInfo.totalContentByIdFromPetInfo",memberId);
	}

	@Override
	public int totalContentByIdFromCommunity(String memberId) {
		return sqlSessionTemplate.selectOne("board_community.totalContentByIdFromCommunity",memberId);
	}

	@Override
	public int totalContentByIdFromPetPicture(String memberId) {
		return sqlSessionTemplate.selectOne("board_petPicture.totalContentByIdFromPetPicture",memberId);
	}
	
}
