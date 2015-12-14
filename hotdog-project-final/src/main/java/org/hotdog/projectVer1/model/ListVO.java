package org.hotdog.projectVer1.model;


import java.util.List;
import java.util.Map;

/**
 * 게시물 리스트 정보와 페이징 정보를 가지고 있는 클래스 
 * @author inst
 *
 */
public class ListVO {
	private List<BoardVO> list;
	private PagingBean pagingBean;
	private String word;
	private String category;
	private Map<Object, Object> map;
	public ListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ListVO(List<BoardVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public ListVO(List<BoardVO> list, PagingBean pagingBean,
			Map<Object, Object> map) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
		this.map = map;
	}
	public List<BoardVO> getList() {
		return list;
	}
	public void setList(List<BoardVO> list) {
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
	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean
				+ ", word=" + word + ", category=" + category + ", map=" + map
				+ "]";
	}
	
	
	
}










