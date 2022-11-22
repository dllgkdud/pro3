package kr.go.ddm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.go.ddm.dto.PicDTO;
import kr.go.ddm.dto.ReviewDTO;
import kr.go.ddm.dto.TourDTO;
import kr.go.ddm.model.ReviewDAO;
import kr.go.ddm.model.TourDAO;


@WebServlet("/AddReviewCtrl.do")
public class AddReviewCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//전달받은 데이터
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("sid");
		
		String tourno = request.getParameter("tourno");
		String cate = request.getParameter("cate");
		String content = request.getParameter("content");
		Double star = Double.parseDouble(request.getParameter("star"));
		
		//외부데이터 추가
		TourDAO picture = new TourDAO();
		PicDTO pic = picture.getPic(tourno);
		TourDTO tour = picture.getPlace(tourno); 
		
		String imgURL = pic.getPicname();
		
		//DTO에 저장(데이터 저장값 반환할 때)
		ReviewDTO dto = new ReviewDTO();
		dto.setTourno(tourno);
		dto.setCate(cate);
		dto.setId(id);
		dto.setContent(content);
		dto.setStar(star);
		dto.setImgURL(imgURL);
		
		//DAO에 저장(데이터)
		ReviewDAO dao = new ReviewDAO();
		dto.setPlace(tour.getPlace());
		dao.addReview(dto);
		
		//반환조건
		response.sendRedirect("GetReviewListCtrl.do");
	}

}
