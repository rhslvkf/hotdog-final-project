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

		System.out.println(vo);
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
				boardDAO.uploadFile(vo,type);
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
		ListVO lvo= new ListVO(list,paging);
		return lvo;
	}

	@Override
	public Map<String, List<BoardVO>> showPostingListById(String memberId) {
		Map<String, List<BoardVO>> map = new HashMap<String, List<BoardVO>>();
		map.put("board_abandoned", boardDAO.showPostingListByIdFromAbandoned(memberId));
		map.put("board_adoption", boardDAO.showPostingListByIdFromAdoption(memberId));
		map.put("board_petInfo", boardDAO.showPostingListByIdFromPetInfo(memberId));
		map.put("board_community", boardDAO.showPostingListByIdFromCommunity(memberId));
		map.put("board_petPicture", boardDAO.showPostingListByIdFromPetPicture(memberId));
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
			map.put("board_abandoned", boardDAO.getAllScrapeFromAbandoned(vo.getMemberVO().getMemberId()));
			map.put("board_adoption", boardDAO.getAllScrapeFromAdoption(vo.getMemberVO().getMemberId()));
			map.put("board_petInfo", boardDAO.getAllScrapeFromPetInfo(vo.getMemberVO().getMemberId()));
			return map;
		}
	}

	@Override
	public Map<String, Object> showMyScrapeList(String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_abandoned", boardDAO.getAllScrapeFromAbandoned(memberId));
		map.put("board_adoption", boardDAO.getAllScrapeFromAdoption(memberId));
		map.put("board_petInfo", boardDAO.getAllScrapeFromPetInfo(memberId));
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
			list.get(i).setFileName(list.get(i).getBoardContent().substring(list.get(i).getBoardContent().indexOf("data:image"), list.get(i).getBoardContent().indexOf(">")-1));
		}
		return list;
	}

	@Override
	public Map<String, Object> getCommentListByNickName(String memberNickName) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_abandoned", boardDAO.getCommentListByNickNameFromAbandoned(memberNickName));
		map.put("board_adoption", boardDAO.getCommentListByNickNameFromAdoption(memberNickName));
		map.put("board_community", boardDAO.getCommentListByNickNameFromCommunity(memberNickName));
		map.put("board_petInfo", boardDAO.getCommentListByNickNameFromPetInfo(memberNickName));
		map.put("board_petPicture", boardDAO.getCommentListByNickNameFromPetPicture(memberNickName));
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
	
	
}
