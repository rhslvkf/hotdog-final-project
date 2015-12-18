package org.hotdog.projectVer1.model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;



public interface BoardService {
	public abstract String posting(BoardVO vo,String type, ArrayList<String> fileName);

	public abstract void updatePosting(BoardVO vo, String type, ArrayList<String> nameList);

	public abstract void deletePosting(String no, String type);

	public abstract void hits(BoardVO vo);

	public abstract void fileUpload(BoardVO vo);

	public abstract BoardVO showContent(int no, String type);
	
	public abstract BoardVO showContentNoHit(int no, String type);
	
	public abstract ListVO getPostingList(String pageNo, String type);

	public abstract ListVO searchPosting(String pageNo,String category, String word,String type);

	public abstract Map<String, Object> showPostingListById(String memberId,String pageNoOfAbandoned,String pageNoOfAdoption,String pageNoOfCommunity,String pageNoOfPetInfo,String pageNoOfPetPicture);
	
	

	public abstract int searchBoardNumber(String type);

	public abstract Map<String, Object> scrape(BoardVO vo, String type);

	public abstract Map<String, Object> showMyScrapeList(String memberId,String pageNoOfAbandoned,String pageNoOfAdoption,String pageNoOfPetInfo);
	
	
	//댓글 관련

	public abstract String postingComment(CommentVO vo, String type);

	public abstract List<CommentVO>commentList(int commentNumber,String type);
	
	public abstract void updateComment(CommentVO vo);

	public abstract void deleteComment(int commentNumber,String type);
	
	public abstract CommentVO selectOneChat(int commentNumber,String type);
	
	public abstract void replyShape(CommentVO cvo,String type);
	
	public abstract void replyShape1(CommentVO cvo, String type);
	
	public abstract void insertReContent(CommentVO vo, String type);

	/*
	 * 최근 게시물 5개
	 */
	public abstract Object latestPosting(String pageNo,String type);
	public abstract ListVO latestcommunityPosting(String pageNo, String type);
	public abstract ListVO latestnoticePosting(String pageNo, String type);
	public abstract ListVO latestepetinfoPosting(String pageNo, String type);
	
	public abstract int replyShapeCondition(CommentVO cvo,String type);

	public abstract int getCountOfComment(String memberNickName);
	
	public abstract int maxStepComment(CommentVO cvo, String type);

	public abstract ArrayList<BoardVO> latestPetPicturePosting();

	public abstract Map<String, Object> getCommentListByNickName(
			String memberNickName,String pageNoOfAbandoned,String pageNoOfAdoption,String pageNoOfCommunity,String pageNoOfPetInfo,String pageNoOfPetPicture);
	
	// 통합검색
	public abstract ListVO searchBoard(String word, String pageNo);
	public abstract ListVO searchBoardPosting(String type, String word,
			String pageNo);
	// Q&A 게시판에 댓글달기
	public abstract void reply(BoardVO vo, String type,ArrayList<String> fileName);
	
	public abstract int totalContentById(String memberId);

}
