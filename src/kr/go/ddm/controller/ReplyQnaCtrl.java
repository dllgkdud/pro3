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


@WebServlet("/ReplyQnaCtrl.do")
public class ReplyQnaCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//전달받은 데이터
		int no = Integer.parseInt(request.getParameter("no"));
		
		//DTO,DAO에서 데이터 호출
		QnaDAO dao = new QnaDAO();
		QnaDTO qna = dao.getQna(no);
		
		request.setAttribute("qna", qna);
		
		//포워딩
		RequestDispatcher view = request.getRequestDispatcher("./qna/replyQna.jsp");
		view.forward(request, response);
	}

}
