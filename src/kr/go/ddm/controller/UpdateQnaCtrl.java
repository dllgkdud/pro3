package kr.go.ddm.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.ddm.dto.QnaDTO;
import kr.go.ddm.model.QnaDAO;


@WebServlet("/UpdateQnaCtrl.do")
public class UpdateQnaCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String sql = "";
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//전달받은 데이터
		int no = Integer.parseInt(request.getParameter("no"));
		
		//DTO에 저장(데이터)
		QnaDAO dao = new QnaDAO();
		QnaDTO qna = dao.getQna(no);
		
		//데이터베이스를 vo에 저장
		request.setAttribute("vo", qna);
		
		//포워딩
		RequestDispatcher view = request.getRequestDispatcher("./qna/updateQna.jsp");
		view.forward(request, response);
	}

}
