package kr.go.ddm.view;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.ddm.dto.QnaDTO;
import kr.go.ddm.model.QnaDAO;


@WebServlet("/GetQnaDetailCtrl.do")
public class GetQnaDetailCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//전역변수
		int no = Integer.parseInt(request.getParameter("no"));
		
		//DAO 데이터 저장
		QnaDAO dao = new QnaDAO();
		QnaDTO vo = dao.getQna(no);
		
		request.setAttribute("vo", vo);
		
		//포워딩
		RequestDispatcher view = request.getRequestDispatcher("./qna/qnaDetail.jsp");
		view.forward(request, response);
	}
}
