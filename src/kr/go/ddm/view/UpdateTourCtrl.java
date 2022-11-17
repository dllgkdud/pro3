package kr.go.ddm.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.ddm.dto.PicDTO;
import kr.go.ddm.dto.TourDTO;
import kr.go.ddm.model.TourDAO;


@WebServlet("/UpdateTourCtrl.do")
public class UpdateTourCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		//DAO에서 목록 호출/반환
		int no = Integer.parseInt(request.getParameter("no"));
		
		TourDAO dao = new TourDAO();
		TourDTO dto = dao.getTour(no);
		ArrayList<PicDTO> picList = dao.JSONPicList(dto.getTourno());
		
		//DAO에서 받은 데이터 view로 디스패치
		request.setAttribute("dto", dto);
		request.setAttribute("list", picList);
		
		RequestDispatcher view = request.getRequestDispatcher("./tour/updateTour.jsp");
		view.forward(request, response);
	}

}
