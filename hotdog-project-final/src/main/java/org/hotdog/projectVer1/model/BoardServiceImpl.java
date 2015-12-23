package org.hotdog.projectVer1.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
@Service
public class BoardServiceImpl implements BoardService{
	@Resource
	private BoardDAO boardDAO;

	@Override
	public String posting(BoardVO vo, String type, ArrayList<String> fileName) {
			boardDAO.posting(vo, type);

		if(!fileName.isEmpty()){
			for(int i=0;i<fileName.size();i++){
				vo.setFileName(fileName.get(i));
				boardDAO.uploadFile(vo,type);
			}
		}
		return "notUpdate";
	}

	@Override
	public void updatePosting(BoardVO vo, String type, ArrayList<String> fileName) {
		boardDAO.updatePosting(vo, type);
		if(!fileName.isEmpty()){
			for(int i=0;i<fileName.size();i++){
				vo.setFileName(fileName.get(i));
			}
		}
	}

	@Override
	public void deletePosting(String no, String type) {
		boardDAO.deletePosting(no, type);
		
	}



	@Override
	public void hits(BoardVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void fileUpload(BoardVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public BoardVO showContent(int no, String type) {
		boardDAO.hits(no, type);
		return boardDAO.showContent(no, type);
	}
	
	@Override
	public BoardVO showContentNoHit(int no, String type) {
		BoardVO vo = boardDAO.showContent(no, type);
		ArrayList<String> fileName = boardDAO.searchFileName(no, type);
		vo.setFileNameList(fileName);
		return vo;
	}

	@Override
	public ListVO getPostingList(String pageNo, String type) {
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		List<BoardVO> list= boardDAO.getPostingList(pageNo, type);
		for(int i=0;i<list.size();i++){
			if(list.get(i).getBoardContent() != null && list.get(i).getBoardContent().contains("data:image")){
				list.get(i).setFileName(list.get(i).getBoardContent().substring(list.get(i).getBoardContent().indexOf("data:image"), list.get(i).getBoardContent().indexOf("\">")));
			}
		}
		int total=boardDAO.totalContent(type);
		PagingBean paging=new PagingBean(total,Integer.parseInt(pageNo));
		ListVO lvo= new ListVO(list,paging);

		return lvo;
	}

	@Override
	public ListVO searchPosting(String pageNo, String category,String word,String type) {
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		List<BoardVO> list= null;
		int total=0;
		if(category.equals("title")){
			list = boardDAO.searchPostingByTitle(pageNo, word, type);
			total=boardDAO.totalContentBySearchingTitle(type,word);
		}else if(category.equals("content")){
			list = boardDAO.searchPostingByContent(pageNo, word, type);
			total=boardDAO.totalContentBySearchingContent(type,word);
		}else{
			list = boardDAO.searchPostingByNickName(pageNo, word, type);
			total=boardDAO.totalContentBySearchingNickName(type,word);
		}
		PagingBean paging=new PagingBean(total,Integer.parseInt(pageNo));
		for(int i=0;i<list.size();i++){
			System.out.println(list.get(i));
			if(list.get(i).getBoardContent().contains("data:image")){
				list.get(i).setFileName(list.get(i).getBoardContent().substring(list.get(i).getBoardContent().indexOf("data:image"), list.get(i).getBoardContent().indexOf("\">")));
			}
		}
		ListVO lvo= new ListVO(list,paging);
		return lvo;
	}

	@Override
	public Map<String, Object> showPostingListById(String memberId,String pageNoOfAbandoned,String pageNoOfAdoption,String pageNoOfCommunity,String pageNoOfPetInfo,String pageNoOfPetPicture) {
		if(pageNoOfAbandoned==null||pageNoOfAbandoned=="") 
			pageNoOfAbandoned="1";
		if(pageNoOfAdoption==null||pageNoOfAdoption=="") 
			pageNoOfAdoption="1";
		if(pageNoOfCommunity==null||pageNoOfCommunity=="") 
			pageNoOfCommunity="1";
		if(pageNoOfPetInfo==null||pageNoOfPetInfo=="") 
			pageNoOfPetInfo="1";
		if(pageNoOfPetPicture==null||pageNoOfPetPicture=="") 
			pageNoOfPetPicture="1";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_abandoned", boardDAO.showPostingListByIdFromAbandoned(pageNoOfAbandoned, memberId));
		map.put("board_abandoned_paging", new PagingBeanOfMyPage(boardDAO.totalContentByIdFromAbandoned(memberId),Integer.parseInt(pageNoOfAbandoned)));
		map.put("board_adoption", boardDAO.showPostingListByIdFromAdoption(pageNoOfAdoption, memberId));
		map.put("board_adoption_paging", new PagingBeanOfMyPage(boardDAO.totalContentByIdFromAdoption(memberId),Integer.parseInt(pageNoOfAdoption)));
		map.put("board_community", boardDAO.showPostingListByIdFromPetInfo(pageNoOfCommunity, memberId));
		map.put("board_community_paging", new PagingBeanOfMyPage(boardDAO.totalContentByIdFromPetInfo(memberId),Integer.parseInt(pageNoOfCommunity)));
		map.put("board_petInfo", boardDAO.showPostingListByIdFromCommunity(pageNoOfPetInfo, memberId));
		map.put("board_petInfo_paging", new PagingBeanOfMyPage(boardDAO.totalContentByIdFromCommunity(memberId),Integer.parseInt(pageNoOfPetInfo)));
		map.put("board_petPicture", boardDAO.showPostingListByIdFromPetPicture(pageNoOfPetPicture, memberId));
		map.put("board_petPicture_paging", new PagingBeanOfMyPage(boardDAO.totalContentByIdFromPetPicture(memberId),Integer.parseInt(pageNoOfPetPicture)));
		return map;
	}


	@Override
	public int searchBoardNumber(String type) {
		return boardDAO.searchBoardNumber(type);
	}

	@Override
	public Map<String, Object> scrape(BoardVO vo, String type) {
		BoardVO isScrape = boardDAO.isScrape(vo,type);
		Map<String, Object> map = new HashMap<String, Object>();
		if(isScrape != null){
			map.put("isScrape", "exist");
			return map; 
		}else{
			boardDAO.insertScrape(vo,type);
			map.put("isScrape", "notExist");
			map.put("board_abandoned", boardDAO.getAllScrapeFromAbandoned("1",vo.getMemberVO().getMemberId()));
			map.put("board_adoption", boardDAO.getAllScrapeFromAdoption("1",vo.getMemberVO().getMemberId()));
			map.put("board_petInfo", boardDAO.getAllScrapeFromPetInfo("1",vo.getMemberVO().getMemberId()));
			return map;
		}
	}

	@Override
	public Map<String, Object> showMyScrapeList(String memberId,String pageNoOfAbandoned,String pageNoOfAdoption,String pageNoOfPetInfo) {
		if(pageNoOfAbandoned==null||pageNoOfAbandoned=="") 
			pageNoOfAbandoned="1";
		if(pageNoOfAdoption==null||pageNoOfAdoption=="") 
			pageNoOfAdoption="1";
		if(pageNoOfPetInfo==null||pageNoOfPetInfo=="") 
			pageNoOfPetInfo="1";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_abandoned", boardDAO.getAllScrapeFromAbandoned(pageNoOfAbandoned,memberId));
		map.put("board_abandoned_paging", new PagingBeanOfMyPage(boardDAO.totalPostingScrapedByIdFromAbandoned(memberId),Integer.parseInt(pageNoOfAbandoned)));
		map.put("board_adoption", boardDAO.getAllScrapeFromAdoption(pageNoOfAdoption,memberId));
		map.put("board_adoption_paging", new PagingBeanOfMyPage(boardDAO.totalPostingScrapedByIdFromAdoption(memberId),Integer.parseInt(pageNoOfAdoption)));
		map.put("board_petInfo", boardDAO.getAllScrapeFromPetInfo(pageNoOfPetInfo,memberId));
		map.put("board_petInfo_paging", new PagingBeanOfMyPage(boardDAO.totalPostingScrapedByIdFromPetInfo(memberId),Integer.parseInt(pageNoOfPetInfo)));
		return map;
	}


	
	//댓글 관련
	@Override
	public String postingComment(CommentVO vo,String type) {
		  boardDAO.postingComment(vo, type);
		  return "notUpdate";
	}

	@Override
	public void updateComment(CommentVO vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteComment(int commentNumber,String type) {
		 boardDAO.deleteComment(commentNumber, type);
	}
	public List<CommentVO> commentList(int commentBoardNumber, String type) {
		return boardDAO.commentList(commentBoardNumber, type);
	}

	@Override
	public CommentVO selectOneChat(int commentNumber, String type) {
		return boardDAO.selectOneChat(commentNumber, type);
	}



	@Override
	public void insertReContent(CommentVO vo, String type) {
		boardDAO.insertReContent(vo, type);
	}

	/*
	 *	최근 게시물 5
	 * @see org.hotdog.projectVer1.model.BoardService#latestPosting(java.lang.String)
	 */
	@Override
	public ListVO latestPosting(String pageNo,String type) {
		if(pageNo==null || pageNo=="")
			pageNo="1";
		List<BoardVO> list=boardDAO.latestPosting(pageNo,type);
		int total=boardDAO.totalContent(type);
		PagingBean paging = new PagingBean(total,Integer.parseInt(pageNo));
		ListVO lvo=new ListVO(list,paging);
			
		return lvo; 
	}

	@Override
	public ListVO latestcommunityPosting(String pageNo, String type) {
		if(pageNo==null || pageNo=="")
			pageNo="1";
		List<BoardVO> list=boardDAO.latestcommunityPosting(pageNo,type);
		int total=boardDAO.totalContent(type);
		PagingBean paging = new PagingBean(total,Integer.parseInt(pageNo));
		ListVO lvo=new ListVO(list,paging);
			
		return lvo; 
	}

	@Override
	public ListVO latestnoticePosting(String pageNo, String type) {
		if(pageNo==null || pageNo=="")
			pageNo="1";
		List<BoardVO> list=boardDAO.latestnoticePosting(pageNo,type);
		int total=boardDAO.totalContent(type);
		PagingBean paging = new PagingBean(total,Integer.parseInt(pageNo));
		ListVO lvo=new ListVO(list,paging);
			
		return lvo; 
	}

	@Override
	public ListVO latestepetinfoPosting(String pageNo, String type) {
		if(pageNo==null || pageNo=="")
			pageNo="1";
		List<BoardVO> list=boardDAO.latestepetinfoPosting(pageNo,type);
		int total=boardDAO.totalContent(type);
		PagingBean paging = new PagingBean(total,Integer.parseInt(pageNo));
		ListVO lvo=new ListVO(list,paging);
			
		return lvo; 
	}

	@Override
	public int replyShapeCondition(CommentVO cvo, String type) {
		return boardDAO.replyShapeCondition(cvo, type);
	}

	@Override
	public int getCountOfComment(String memberNickName) {
		int countOfComment = 0;
		countOfComment += boardDAO.getCountOfAbandonedComment(memberNickName);
		countOfComment += boardDAO.getCountOfAdoptionComment(memberNickName);
		countOfComment += boardDAO.getCountOfCommunityComment(memberNickName);
		countOfComment += boardDAO.getCountOfPetInfoComment(memberNickName);
		countOfComment += boardDAO.getCountOfPetPictureComment(memberNickName);
		return countOfComment;
	}
	public int maxStepComment(CommentVO cvo, String type) {
		return boardDAO.maxStepComment(cvo,type);
	}

	@Override
	public void replyShape(CommentVO cvo, String type) {
		boardDAO.replyShape(cvo, type);
	}
	
	@Override
	public void replyShape1(CommentVO cvo, String type) {
		boardDAO.replyShape1(cvo, type);
	}

	@Override
	public ArrayList<BoardVO> latestPetPicturePosting() {
		ArrayList<BoardVO> list = boardDAO.latestPetPicturePosting();
		for(int i=0;i<list.size();i++){
			if(list.get(i).getBoardContent().contains("data:image")){
				list.get(i).setFileName(list.get(i).getBoardContent().substring(list.get(i).getBoardContent().indexOf("data:image"), list.get(i).getBoardContent().indexOf("\">")));
			}
		}
		return list;
	}

	@Override
	public Map<String, Object> getCommentListByNickName(String memberNickName,String pageNoOfAbandoned,String pageNoOfAdoption,String pageNoOfCommunity,String pageNoOfPetInfo,String pageNoOfPetPicture) {
		if(pageNoOfAbandoned==null||pageNoOfAbandoned=="") 
			pageNoOfAbandoned="1";
		if(pageNoOfAdoption==null||pageNoOfAdoption=="") 
			pageNoOfAdoption="1";
		if(pageNoOfCommunity==null||pageNoOfCommunity=="") 
			pageNoOfCommunity="1";
		if(pageNoOfPetInfo==null||pageNoOfPetInfo=="") 
			pageNoOfPetInfo="1";
		if(pageNoOfPetPicture==null||pageNoOfPetPicture=="") 
			pageNoOfPetPicture="1";
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_abandoned", boardDAO.getCommentListByNickNameFromAbandoned(pageNoOfAbandoned,memberNickName));
		map.put("board_abandoned_paging", new PagingBeanOfMyPage(boardDAO.totalPostingIncludedCommentFromAbandoned(memberNickName),Integer.parseInt(pageNoOfAbandoned)));
		map.put("board_adoption", boardDAO.getCommentListByNickNameFromAdoption(pageNoOfAdoption,memberNickName));
		map.put("board_adoption_paging", new PagingBeanOfMyPage(boardDAO.totalPostingIncludedCommentFromAdoption(memberNickName),Integer.parseInt(pageNoOfAdoption)));
		map.put("board_community", boardDAO.getCommentListByNickNameFromCommunity(pageNoOfCommunity,memberNickName));
		map.put("board_community_paging", new PagingBeanOfMyPage(boardDAO.totalPostingIncludedCommentFromCommunity(memberNickName),Integer.parseInt(pageNoOfCommunity)));
		map.put("board_petInfo", boardDAO.getCommentListByNickNameFromPetInfo(pageNoOfPetInfo,memberNickName));
		map.put("board_petInfo_paging", new PagingBeanOfMyPage(boardDAO.totalPostingIncludedCommentFromPetInfo(memberNickName),Integer.parseInt(pageNoOfPetInfo)));
		map.put("board_petPicture", boardDAO.getCommentListByNickNameFromPetPicture(pageNoOfPetPicture,memberNickName));
		map.put("board_petPicture_paging", new PagingBeanOfMyPage(boardDAO.totalPostingIncludedCommentFromPetPicture(memberNickName),Integer.parseInt(pageNoOfPetPicture)));
		return map;
	}
	//통합검색관련
	@Override
	public ListVO searchBoard(String word,String pageNo) {
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		int allNum=0;
		List<BoardVO> abandonedList=boardDAO.searchBoardAbandoned(word);
		int abandonedNum =abandonedList.size();
		List<BoardVO> adoptionList=boardDAO.searchBoardAdoption(word);
		int adoptionNum=adoptionList.size();
		List<BoardVO> communityList=boardDAO.searchBoardCommunity(word);
		int communityNum=communityList.size();
		List<BoardVO> noticeList=boardDAO.searchBoardNotice(word);
		int noticeNum=noticeList.size();
		List<BoardVO> petInfoList=boardDAO.searchBoardPetInfo(word);
		int petInfoNum=petInfoList.size();
		List<BoardVO> petPictureList=boardDAO.searchBoardPetPicture(word);
		int petPictureNum=petPictureList.size();
		List<BoardVO> qnAList=boardDAO.searchBoardQnA(word);
		int qnANum=qnAList.size();
		// 검색한 게시글 총 게시글
		allNum=abandonedNum+adoptionNum+communityNum+noticeNum+petInfoNum+petPictureNum+qnANum;
		// 검색한 게시글이 있는 게시판의 총수
		List<List<BoardVO>> allList=new ArrayList<List<BoardVO>>();	
		if(abandonedNum!=0){
			allList.add(abandonedList);
		}
		if(adoptionNum!=0){
			allList.add(adoptionList);
		}
		if(communityNum!=0){
			allList.add(communityList);
		}
		if(noticeNum!=0){
			allList.add(noticeList);
		}
		if(petInfoNum!=0){
			allList.add(petInfoList);
		}
		if(petPictureNum!=0){
			allList.add(petPictureList);
		}
		if(qnANum!=0){
			allList.add(qnAList);
		}
		Map<Object,Object> map= new HashMap<Object,Object>();
		map.put("abandonedList", abandonedList);
		map.put("adoptionList", adoptionList);
		map.put("communityList", communityList);
		map.put("noticeList", noticeList);
		map.put("petInfoList", petInfoList);
		map.put("petPictureList", petPictureList);
		map.put("qnAList", qnAList);
		map.put("allNum", allNum);
		map.put("word",word);
		map.put("allList",allList);
		List<BoardVO> list=boardDAO.searchBoardPaging(pageNo,word);
		map.put("list", list);
		PagingBean paging=new PagingBean(allNum,Integer.parseInt(pageNo));
		ListVO lvo= new ListVO(list,paging,map);
		return lvo;
	}
	//통합검색관련 후 세부 게시판 페이징
	@Override
	public ListVO searchBoardPosting(String type, String word, String pageNo) {
		if(pageNo==null||pageNo=="") 
			pageNo="1";
		List<BoardVO> list= null;
		int total=0;
			list = boardDAO.searchPostingByTitleOrContents(pageNo, word, type);
			total=boardDAO.totalContentBySearchingTitleOrContents(type,word);
		PagingBean paging=new PagingBean(total,Integer.parseInt(pageNo));
		ListVO lvo= new ListVO(list,paging);
		return lvo;
	
	}
	// Q&A게시판에 답글
	@Override
	public void reply(BoardVO vo, String type,ArrayList<String> fileName) {
		int ref = vo.getRef();
		int restep = vo.getRestep();
		int relevel = vo.getRelevel();
		boardDAO.updateRestep(ref, restep,type);
		vo.setRestep(restep+1);
		vo.setRelevel(relevel+1);
		System.out.println(vo);
		boardDAO.insertRefContent(vo,type);
		if(!fileName.isEmpty()){
			for(int i=0;i<fileName.size();i++){
				vo.setFileName(fileName.get(i));
				boardDAO.uploadFile(vo,type);
			}
		}
	}

	@Override
	public int totalContentById(String memberId) {
		int totalContentById = 0;
		totalContentById += boardDAO.totalContentByIdFromAbandoned(memberId);
		totalContentById += boardDAO.totalContentByIdFromAdoption(memberId);
		totalContentById += boardDAO.totalContentByIdFromCommunity(memberId);
		totalContentById += boardDAO.totalContentByIdFromPetInfo(memberId);
		totalContentById += boardDAO.totalContentByIdFromPetPicture(memberId);
		return totalContentById;
	}
	
	
}
