package kr.go.ddm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.ddm.dto.TourDTO;
import kr.go.ddm.model.TourDAO;


@WebServlet("/UpdateTourProCtrl.do")
public class UpdateTourProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//전달받은 데이터
		int no = Integer.parseInt(request.getParameter("no"));
		String cate = request.getParameter("cate");
		String tourno = request.getParameter("tourno");
		String place = request.getParameter("place");
		String comment1 = request.getParameter("comment1");
		String comment2 = request.getParameter("comment2");
		
		//데이터 저장
		TourDTO dto = new TourDTO();
		dto.setNo(no);
		dto.setCate(cate);
		dto.setTourno(tourno);
		dto.setPlace(place);
		dto.setComment1(comment1);
		dto.setComment2(comment2);
		
		TourDAO dao = new TourDAO();
		int cnt = dao.updateTour(dto);
        	
		//DAO 반환조건
		if(cnt>0) {
			response.sendRedirect("GetTourListCtrl.do");
		} else {
			response.sendRedirect("UpdateTourCtrl.do?no="+no);
		}
	}
}
