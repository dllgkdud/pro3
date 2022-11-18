package kr.go.ddm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.ddm.model.TourDAO;


@WebServlet("/DeleteTourCtrl.do")
public class DeleteTourCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//전달받은 데이터
		int no = Integer.parseInt(request.getParameter("no"));
		

		//DAO에 저장(데이터 저장값 반환할 때)
		TourDAO dao = new TourDAO();
		int cnt = dao.delTour(no);
		
		//DAO 반환조건
		if(cnt>0) {
			response.sendRedirect("GetTourListCtrl.do");
		} else {
			response.sendRedirect("GetTourDetailCtrl.do?no="+no);
		}
	}
}

