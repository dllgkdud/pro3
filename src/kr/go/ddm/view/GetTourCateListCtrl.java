package kr.go.ddm.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.ddm.dto.TourDTO;
import kr.go.ddm.model.TourDAO;


@WebServlet("/GetTourCateListCtrl.do")
public class GetTourCateListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//DAO에 저장(데이터 저장값 반환할 때)
		String cate = request.getParameter("cate");
		TourDAO dao = new TourDAO();
		ArrayList<TourDTO> tourList = dao.getTourCateList(cate);
		
		//DAO 데이터 디스패치
		request.setAttribute("list", tourList);
		request.setAttribute("cate", cate);
		
		RequestDispatcher view = request.getRequestDispatcher("./tour/tourCateList.jsp");
		view.forward(request, response);
	}
}
