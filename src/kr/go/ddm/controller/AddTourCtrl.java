package kr.go.ddm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.ddm.dto.TourDTO;
import kr.go.ddm.model.TourDAO;


@WebServlet("/AddTourCtrl.do")
public class AddTourCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//전달받은 데이터
		String cate = request.getParameter("cate");
		String tourno = request.getParameter("tourno");
		String place = request.getParameter("place");
		String comment1 = request.getParameter("comment1");
		String comment2 = request.getParameter("comment2");
		
		//DTO에 저장(데이터)
		TourDTO dto = new TourDTO();
		dto.setCate(cate);
		dto.setTourno(tourno);
		dto.setPlace(place);
		dto.setComment1(comment1);
		dto.setComment2(comment2);
		
		//DAO에 저장(데이터 저장값 반환할 때)
		TourDAO dao = new TourDAO();
		int cnt = dao.addTour(dto);
		
		//DAO 반환조건
		if(cnt>0) {
			response.sendRedirect("GetTourListCtrl.do");
		} else {
			response.sendRedirect("./tour/addTour.jsp");
		}
	}
}
