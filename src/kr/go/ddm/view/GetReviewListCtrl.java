package kr.go.ddm.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.ddm.dto.ReviewDTO;
import kr.go.ddm.model.ReviewDAO;


@WebServlet("/GetReviewListCtrl.do")
public class GetReviewListCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//DAO에서 목록  호출
		ReviewDAO dao = new ReviewDAO();
		ArrayList<ReviewDTO> revList = dao.getReviewList();
		
		//DAO 데이터 저장
		request.setAttribute("list", revList);
		
		//저장 후 디스패치
		RequestDispatcher view = request.getRequestDispatcher("/review/reviewList.jsp");
		view.forward(request, response);
	}

}
