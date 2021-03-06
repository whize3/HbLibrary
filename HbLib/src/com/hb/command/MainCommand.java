package com.hb.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hb.mybatis.BookVO;
import com.hb.mybatis.Book_rankVO;
import com.hb.mybatis.Dao;
import com.hb.mybatis.NoticeVO;
import com.hb.mybatis.QnaVO;
import com.hb.mybatis.Studyroom_ReserveVO;
import com.hb.mybatis.YulVO;

public class MainCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		Dao dao = new Dao();
		//공지사항 리스트
		List<NoticeVO> notice = dao.getNoticeList();
		
		//QNA 리스트
		List<QnaVO> qna = dao.getQnaList();
		
		//열람실현황
		List<YulVO> yulvo = dao.getYul();
		int cnt1 = 0,cnt2 =0,cnt3 =0,cnt4 =0,cnt5 =0,cnt6 = 0;
		for (YulVO k : yulvo) {
			if(k.getY_location().equals("1")){
				cnt1++;
				if(k.getY_state().equals("1")){
					cnt2++;
				}
			}
		}for (YulVO k : yulvo) {
			if(k.getY_location().equals("2")){
				cnt3++;
				if(k.getY_state().equals("1")){
					cnt4++;
				}
			}
		}
		for (YulVO k : yulvo) {
			if(k.getY_location().equals("3")){
				cnt5++;
				if(k.getY_state().equals("1")){
					cnt6++;
				}
			}
		}
						
		Map<String, Integer> map = new HashMap<>();
		map.put("cnt1", cnt1);
		map.put("cnt2", cnt2);
		map.put("cnt3", cnt3);
		map.put("cnt4", cnt4);
		map.put("cnt5", cnt5);
		map.put("cnt6", cnt6);
		
		//스터디룸 현황
		int studyroom1=0;
		int studyroom2=0;
		int studyroom3=0;
		
		List<Studyroom_ReserveVO> studyroom = dao.getStudyroomState();
		for (Studyroom_ReserveVO k : studyroom) {
			String floor = k.getS_num().substring(0,1);
			if(floor.equals("1")){
				studyroom1++;
			}else if(floor.equals("2")){
				studyroom2++;
			}else if(floor.equals("3")){
				studyroom3++;
			}
		}
		
		// 신규도서 리스트
		List<BookVO> newbook = dao.getNewBook();
		
		// 인기도서 리스트
		List<Book_rankVO> hotbook = dao.ranking();
		
		request.setAttribute("studyroom1", studyroom1);
		request.setAttribute("studyroom2", studyroom2);
		request.setAttribute("studyroom3", studyroom3);
		request.setAttribute("newbook", newbook);
		request.setAttribute("hotbook", hotbook);
		request.setAttribute("qna", qna);
		request.setAttribute("map", map);
		request.setAttribute("notice", notice);
		return "main.jsp";
	}
}