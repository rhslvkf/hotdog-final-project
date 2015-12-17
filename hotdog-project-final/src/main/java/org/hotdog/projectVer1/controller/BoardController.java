package org.hotdog.projectVer1.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hotdog.projectVer1.model.BoardService;
import org.hotdog.projectVer1.model.BoardVO;
import org.hotdog.projectVer1.model.CommentVO;
import org.hotdog.projectVer1.model.FileVO;
import org.hotdog.projectVer1.model.ListVO;
import org.hotdog.projectVer1.model.MemberVO;
import org.hotdog.projectVer1.model.MessageService;
import org.hotdog.projectVer1.model.MessageVO;
import org.hotdog.projectVer1.model.PetService;
import org.hotdog.projectVer1.model.PetVO;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BoardController {
	@Resource
	private BoardService boardService;
	@Resource
	private PetService petService;
	@Resource(name = "uploadPath")
	private String path;

	
	
	@RequestMapping("home.do")
	public ModelAndView home(String certification, String password, String register, String update, String login,String deleteVO, String updateGrade) {
		ArrayList<BoardVO> list = boardService.latestPetPicturePosting();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("certification", certification);
		map.put("password", password);
		map.put("register", register);
		map.put("update", update);
		map.put("login", login);
		map.put("deleteVO",deleteVO);
		map.put("updateGrade", updateGrade);
		map.put("petPictureList", list);
		return new ModelAndView("home", "result", map);
	}
	/*
	 * poisting intercepter 적용
	 */
	@RequestMapping(value = "auth_posting.do", method = RequestMethod.POST)
	public ModelAndView posting(HttpServletRequest request, BoardVO vo,String type, FileVO fvo, PetVO petVO) {
		HttpSession session = request.getSession(false);
		vo.setPetVO(petVO);
		
		if(session!=null){
			MemberVO mvo = (MemberVO) session.getAttribute("loginVo");
			if(mvo!=null){
				vo.setMemberVO(mvo);
			}

		}

		//파일 업로드
		List<MultipartFile> list = fvo.getFile();
		ArrayList<String> nameList = new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			if(!list.get(i).getOriginalFilename().equals("")){
				String oriFileName = list.get(i).getOriginalFilename();
				String fileName = UUID.randomUUID().toString().replace("-", "")+oriFileName.substring(oriFileName.lastIndexOf("."));
				try {
					list.get(i).transferTo(new File(path+fileName));
					nameList.add(fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

		String updateGrade = boardService.posting(vo,type,nameList);
		return new ModelAndView("redirect:showContentNoHit.do?no="+vo.getBoardNumber()+"&type="+type+"&updateGrade="+updateGrade);
	}
	
	@RequestMapping("{viewId}.do")
	public String showTilesView(@PathVariable String viewId) {
		return viewId;
	}

	public ModelAndView deleteCommentByAdmin(CommentVO vo) {
		return null;
	}
	/*
	 * listwirte intercepter 적용
	 */
	
	@RequestMapping("auth_write.do")
	public ModelAndView write(String type){
		return new ModelAndView(type+"_posting");
	}

	/*
	 * update intercepter 적용
	 */
	@RequestMapping("auth_updatePosting.do")
	public ModelAndView updatePosting(HttpServletRequest request,BoardVO vo, String type, FileVO fvo,PetVO petVO) {
		HttpSession session = request.getSession(false);
		vo.setPetVO(petVO);
		
		
		if(session!=null){
			MemberVO mvo = (MemberVO) session.getAttribute("loginVo");
			if(mvo!=null){
				vo.setMemberVO(mvo);
			}
		}
		//파일 업로드
		List<MultipartFile> list = fvo.getFile();
		ArrayList<String> nameList = new ArrayList<String>();
		for(int i=0;i<list.size();i++){
			if(!list.get(i).getOriginalFilename().equals("")){
				String oriFileName = list.get(i).getOriginalFilename();
				String fileName = UUID.randomUUID().toString().replace("-", "")+oriFileName.substring(oriFileName.lastIndexOf("."));
				try {
					list.get(i).transferTo(new File(path+fileName));
					nameList.add(fileName);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		boardService.updatePosting(vo, type, nameList);
		return new ModelAndView("redirect:showContentNoHit.do?no="+vo.getBoardNumber()+"&type="+type);
	}
	
	@RequestMapping("updateView.do")
	public ModelAndView updateView(int no, String type) {
		return new ModelAndView(type+"_update", "bvo",boardService.showContentNoHit(no, type));
	}
	
	/*
	 * delete intercepter 적용
	 */
	@RequestMapping("auth_deletePosting.do")
	public ModelAndView deletePosting(String no, String type) {
		boardService.deletePosting(no, type);
		return new ModelAndView("redirect:getPostingList.do?type="+type);
	}
	

	public ModelAndView updateComment(CommentVO vo) {
		return null;
	}

	public ModelAndView deleteComment(CommentVO vo) {
		return null;
	}

	public ModelAndView hits(BoardVO vo) {
		return null;
	}

	public ModelAndView fileUpload(BoardVO vo) {
		return null;
	}
	
	/*
	 * 상세 게시글보기
	 */
	@RequestMapping("showContent.do")
	public ModelAndView showContent(int no, String type) {
		boardService.showContent(no, type);
		return new ModelAndView("redirect:showContentNoHit.do?no="+no+"&type="+type);
	}
	
	@RequestMapping("showContentNoHit.do")
	public ModelAndView showContentNoHit(int no, String type, String updateGrade) {
		BoardVO vo = boardService.showContentNoHit(no, type);

		vo.getMemberVO().setUpdateGrade(updateGrade);
		return new ModelAndView(type+"_showcontent", "bvo",	vo);
	}

	@RequestMapping("getPostingList.do")
	public ModelAndView getPostingList(String pageNo, String type) {
		return new ModelAndView(type+"_postingList", "lvo",boardService.getPostingList(pageNo, type));
	}
	
	@RequestMapping("searchPosting.do")
	public ModelAndView searchPosting(String pageNo,String word,String category,String type) {
		ListVO lvo = boardService.searchPosting(pageNo,category, word, type);
		lvo.setWord(word);
		lvo.setCategory(category);
		return new ModelAndView(type+"_search","lvo",lvo);
	}

	public ModelAndView scrape(BoardVO vo) {
		return null;
	}

	public ModelAndView registerPet(PetVO vo) {
		return null;
	}

	public ModelAndView updatePet(PetVO vo) {
		return null;
	}
	/*
	 * 회원의 쓴 전 게시물 보기
	 */
	@ResponseBody
	@RequestMapping("showPostingList.do")
	public Map<String, Object> showPostingList(String pageNo, String memberId){
		return boardService.showPostingListById(pageNo, memberId);
	}
	
	/*
	 * 최근 게시물 5개 보여주는 메서드
	 * 유기견 정보 게시판
	 */
	@ResponseBody
	@RequestMapping("latestPosting.do")
	public ListVO latestPosting(String pageNo,String type){
		return (ListVO) boardService.latestPosting(pageNo,type);
	}
	/*
	 * 최근 게시물
	 * 자유게시판 
	 */
	@ResponseBody
	@RequestMapping("latestcommunityPosting.do")
	public ListVO latestcommunityPosting(String pageNo,String type){
		return (ListVO) boardService.latestcommunityPosting(pageNo,type);
	}
	/*
	 * 최근 공지사항 게시판 
	 */
	@ResponseBody
	@RequestMapping("latestnoticePosting.do")
	public ListVO latestnoticePosting(String pageNo,String type){
		return (ListVO) boardService.latestnoticePosting(pageNo,type);
	}
	/*
	 * 최근 애견정보 게시판
	 */
	@ResponseBody
	@RequestMapping("latestepetinfoPosting.do")
	public ListVO latestadoptionPosting(String pageNo,String type){
		return (ListVO) boardService.latestepetinfoPosting(pageNo,type);
	}
	
	
	//게시글 스크랩
	@ResponseBody
	@RequestMapping("scrape.do")
	public Map<String, Object> scrape(int no, String type, HttpServletRequest request) {
		BoardVO bvo = new BoardVO();
		bvo.setBoardNumber(no);
		bvo.setMemberVO((MemberVO)request.getSession().getAttribute("loginVo"));
		Map<String, Object> scrapeList = boardService.scrape(bvo, type);
		return scrapeList;
	}
	//스크랩한 게시글 로딩
	@ResponseBody
	@RequestMapping("showMyScrapeList.do")
	public Map<String, Object> showMyScrapeList(String memberId) {
		return boardService.showMyScrapeList(memberId);
	}
	//회원의 댓글 로딩
	@ResponseBody
	@RequestMapping("getCommentListByNickName.do")
	public Map<String, Object> getCommentListByNickName(String memberNickName) {
		return boardService.getCommentListByNickName(memberNickName);
	}
	
	/*
	 * 댓글 관련 Controller
	 */
	//첫 댓글 작성
	@ResponseBody
	@RequestMapping("postingComment.do")
	public Map<String, Object> postingComment(CommentVO cvo,String type,  String PcommentContent) throws IOException {
		cvo.setCommentContent(PcommentContent);
		String updateGrade = boardService.postingComment(cvo,type);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cno", cvo.getCommentNumber());
		map.put("updateGrade", updateGrade);
		return map;
	}

	//댓글 리스트


	@ResponseBody
	@RequestMapping("commentList.do")
	public List<CommentVO> commentList(int commentBoardNumber,String type) throws IOException {	
		List<CommentVO> cvo=boardService.commentList(commentBoardNumber, type);
		return cvo;
	}


	
	//댓글에 댓글 작성
	@ResponseBody
	@RequestMapping("commentReply.do")
	public List<CommentVO> commentReply(CommentVO vo,String type) throws IOException {	
		System.out.println("selectOneChat전!");
		CommentVO cvo=boardService.selectOneChat(vo.getCommentGroup(),type);
		System.out.println("부모의 것"+cvo);
		vo.setCommentGroup(cvo.getCommentGroup());
		vo.setCommentStep(cvo.getCommentStep());
		vo.setCommentIndent(cvo.getCommentIndent());
		
		int number=boardService.replyShapeCondition(cvo, type);
		if(number!=0){
			int maxstep=boardService.maxStepComment(cvo,type);
			vo.setCommentStep(maxstep+1);
			vo.setCommentIndent(cvo.getCommentIndent()+1);
			boardService.insertReContent(vo, type);
			boardService.replyShape(vo, type);
		}else if(number==0){
			vo.setCommentStep(cvo.getCommentStep()+1);
			vo.setCommentIndent(cvo.getCommentIndent()+1);
			boardService.insertReContent(vo, type);
			boardService.replyShape1(vo, type);
		}
		
		List<CommentVO> lvo=boardService.commentList(vo.getCommentBoardNumber(), type);
		return lvo;
		

	}
	

	//댓글 삭제
	@RequestMapping("deleteComment.do")
	public void deleteComment(HttpServletResponse response,int commentNumber,String type) throws IOException {	
		boardService.deleteComment(commentNumber,type);
	}
	
	//댓글 수 얻어오기
	@ResponseBody
	@RequestMapping("getCountOfComment.do")
	public int getCountOfComment(String memberNickName) throws IOException {	
		return boardService.getCountOfComment(memberNickName);
	}
	
	 //화면 검색창에서 글+제목을 동시에 검색하는 메서드 
	 
	@RequestMapping("searchBoard.do")
	public ModelAndView searchBoard(String word,String pageNo){
		ListVO lvo=boardService.searchBoard(word,pageNo);
		//Map<Object,Object> map=boardService.searchBoard(word);
		System.out.println(lvo);
		return new ModelAndView("function_searchBoard","lvo",lvo);
	}
	@RequestMapping("searchBoardPosting.do")
	public ModelAndView searchBoardPosting(String type,String word,String pageNo){
		ListVO lvo=boardService.searchBoardPosting(type,word,pageNo);
		lvo.setWord(word);
		//System.out.println(word);
		return new ModelAndView(type+"_searchingList","lvo",lvo);
	}
	//Q&A에 댓글뷰 보여주는 메서드
	@RequestMapping("replyView.do")
	public ModelAndView replyView(int no,String type) {		
		return new ModelAndView(type+"_replyForm","bvo",
				boardService.showContentNoHit(no,type));
	}
	
	// Q&A에 댓글다는 메서드
	@RequestMapping(value = "reply.do", method = RequestMethod.POST)
	public ModelAndView reply(HttpServletRequest request, BoardVO vo,String type, FileVO fvo){
		
		//게시판 등록
		HttpSession session = request.getSession(false);
		if(session!=null){
			MemberVO mvo = (MemberVO) session.getAttribute("loginVo");
			if(mvo!=null){
				vo.setMemberVO(mvo);
			  }
		   }
		
		//파일 업로드
				List<MultipartFile> list = fvo.getFile();
				ArrayList<String> nameList = new ArrayList<String>();
				for(int i=0;i<list.size();i++){
					if(!list.get(i).getOriginalFilename().equals("")){
						String oriFileName = list.get(i).getOriginalFilename();
						String fileName = UUID.randomUUID().toString().replace("-", "")+oriFileName.substring(oriFileName.lastIndexOf("."));
						try {
							list.get(i).transferTo(new File(path+fileName));
							nameList.add(fileName);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
				}
		
		
		
		boardService.reply(vo, type,nameList);		
		System.out.println(vo);
		return new ModelAndView("redirect:showContentNoHit.do?no="+vo.getBoardNumber()+"&type="+type);
	}
	
	
}
