package org.hotdog.projectVer1.model;

import java.util.ArrayList;
import java.util.List;



public interface BoardDAO {

	public abstract void posting(BoardVO vo, String type);
	

	public abstract void updatePosting(BoardVO vo, String type);

	public abstract void deletePosting(String no, String type);
	
	public abstract void updateComment(CommentVO vo);



	public abstract void hits(int no, String type);

	public abstract void fileUpload(BoardVO vo);

	public abstract BoardVO showContent(int no, String type);

	public abstract List<BoardVO> getPostingList(String pageNo, String type);

	public abstract List<BoardVO> searchPostingByNickName(String pageNo, String word, String type);

	public abstract List<BoardVO> searchPostingByTitle(String pageNo, String word, String type);

	public abstract List<BoardVO> searchPostingByContent(String pageNo, String word, String type);
	
	public  int totalContent(String type);

	public abstract void scrape(MemberVO mvo, BoardVO bvo);

	public abstract int totalContentBySearchingTitle(String type, String word);

	public abstract int totalContentBySearchingContent(String type, String word);

	public abstract int totalContentBySearchingNickName(String type, String word);

	public abstract List<BoardVO> showPostingListByIdFromAbandoned(
			String pageNo, String memberId);

	public abstract List<BoardVO> showPostingListByIdFromAdoption(
			String pageNo, String memberId);

	public abstract List<BoardVO> showPostingListByIdFromPetInfo(String pageNo, String memberId);

	public abstract List<BoardVO> showPostingListByIdFromCommunity(
			String pageNo, String memberId);

	public abstract List<BoardVO> showPostingListByIdFromPetPicture(
			String pageNo, String memberId);


	public abstract int searchBoardNumber(String type);

	public abstract void uploadFile(BoardVO vo, String type);

	public abstract ArrayList<String> searchFileName(int no, String type);

	public abstract BoardVO isScrape(BoardVO vo, String type);

	public abstract void insertScrape(BoardVO vo, String type);

	public abstract Object getAllScrapeFromAbandoned(String pageNo,String memberId);

	public abstract Object getAllScrapeFromAdoption(String pageNo,String memberId);

	public abstract Object getAllScrapeFromPetInfo(String pageNo,String memberId);

	
	//댓글 관련
	public abstract void postingComment(CommentVO vo,String type);

	public abstract List<CommentVO> commentList(int commentList, String type);
	
	public abstract void deleteComment(int commentNumber,String type);
	
	public abstract CommentVO selectOneChat(int commentNumber,String type);
	
	
	
	public abstract void insertReContent(CommentVO vo,String type);

	public abstract int getCountOfAbandonedComment(String memberNickName);

	public abstract int getCountOfAdoptionComment(String memberNickName);

	public abstract int getCountOfCommunityComment(String memberNickName);

	public abstract int getCountOfPetInfoComment(String memberNickName);

	public abstract int getCountOfPetPictureComment(String memberNickName);
	//최근 게시물 5개
	public abstract List<BoardVO> latestPosting(String pageNo,String type);
	public abstract List<BoardVO> latestcommunityPosting(String pageNo,String type);
	public abstract List<BoardVO> latestnoticePosting(String pageNo, String type);
	public abstract List<BoardVO> latestepetinfoPosting(String pageNo,	String type);
	
	
	
	
	public abstract int replyShapeCondition(CommentVO cvo,String type);

	public abstract int maxStepComment(CommentVO cvo, String type);

	public abstract void replyShape(CommentVO cvo,String type);
	public abstract void replyShape1(CommentVO cvo, String type);

	public abstract ArrayList<BoardVO> latestPetPicturePosting();

	public abstract Object getCommentListByNickNameFromAbandoned(
			String pageNo,String memberNickName);

	public abstract Object getCommentListByNickNameFromAdoption(
			String pageNo,String memberNickName);

	public abstract Object getCommentListByNickNameFromCommunity(
			String pageNo,String memberNickName);

	public abstract Object getCommentListByNickNameFromPetInfo(
			String pageNo,String memberNickName);

	public abstract Object getCommentListByNickNameFromPetPicture(
			String pageNo,String memberNickName);
	
	// 통합 검색관련
	public abstract List<BoardVO> searchBoardAbandoned(String word);

	public abstract List<BoardVO> searchBoardAdoption(String word);

	public abstract List<BoardVO> searchBoardCommunity(String word);

	public abstract List<BoardVO> searchBoardNotice(String word);

	public abstract List<BoardVO> searchBoardPetInfo(String word);

	public abstract List<BoardVO> searchBoardPetPicture(String word);

	public abstract List<BoardVO> searchBoardQnA(String word);

	public abstract List<BoardVO> searchPostingByTitleOrContents(String pageNo,
			String word, String type);

	public abstract int totalContentBySearchingTitleOrContents(String type,
			String word);
	
	// 통합 검색 페이징
	public abstract List<BoardVO> searchBoardPaging(String pageNo, String word);
	
	// Q&A 답글
	public abstract void updateRestep(int ref, int restep, String type);

	public abstract void insertRefContent(BoardVO vo, String type);


	public abstract int totalContentByIdFromAbandoned(String memberId);


	public abstract int totalContentByIdFromAdoption(String memberId);


	public abstract int totalContentByIdFromPetInfo(String memberId);


	public abstract int totalContentByIdFromCommunity(String memberId);


	public abstract int totalContentByIdFromPetPicture(String memberId);


	public abstract int totalPostingIncludedCommentFromAbandoned(
			String memberNickName);


	public abstract int totalPostingIncludedCommentFromAdoption(String memberNickName);


	public abstract int totalPostingIncludedCommentFromCommunity(
			String memberNickName);


	public abstract int totalPostingIncludedCommentFromPetInfo(String memberNickName);


	public abstract int totalPostingIncludedCommentFromPetPicture(
			String memberNickName);


	public abstract int totalPostingScrapedByIdFromAbandoned(String memberId);


	public abstract int totalPostingScrapedByIdFromAdoption(String memberId);


	public abstract int totalPostingScrapedByIdFromPetInfo(String memberId);
	

}
