package org.hotdog.projectVer1.model;

import java.util.List;
import java.util.Map;

/**
 * 게시물 리스트 정보와 페이징 정보를 가지고 있는 클래스
 * 
 * @author inst
 *
 */
public class MemberListVO {
	private List<MemberVO> list;
	private PagingBean pagingBean;
	private String word;
	private String category;
	private Map<Object, Object> map;

	public MemberListVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public MemberListVO(List<MemberVO> list, PagingBean pagingBean,
			Map<Object, Object> map) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
		this.map = map;
	}

	public MemberListVO(List<MemberVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<MemberVO> getList() {
		return list;
	}

	public void setList(List<MemberVO> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Map<Object, Object> getMap() {
		return map;
	}

	public void setMap(Map<Object, Object> map) {
		this.map = map;
	}

}
