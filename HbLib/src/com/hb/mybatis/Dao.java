package com.hb.mybatis;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

public class Dao {
	private static SqlSession ss;

	
	public Dao() {
		ss = DBService.getFactory().openSession(true);
	}

	// 도서 자료구입요청 받은 데이터 BOOKAPPLY에 삽입
	
	public void bookApply(Book_ApplyVO bavo){
		ss.insert("apply", bavo);
	}

	
	public List<BookVO> search(String booksearch, String keyword , String desearch) {
		Map<String, String> map = new HashMap<>();
		map.put("booksearch", booksearch);
		map.put("keyword",keyword);
		map.put("desearch", desearch);
		List<BookVO> list = ss.selectList("booklist",map);
		return list;
	}
	public List<Book_rankVO> ranking(){
		List<Book_rankVO> list = ss.selectList("ranking");
		System.out.println(list.size());
		return list;
		
	}
	


}

	//리스트생성

	

