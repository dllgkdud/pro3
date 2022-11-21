package kr.go.ddm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.ddm.model.QnaDAO;


@WebServlet("/DeleteQnaCtrl.do")
public class DeleteQnaCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//전달받은 데이터
		int no = Integer.parseInt(request.getParameter("no"));
		int parno = Integer.parseInt(request.getParameter("parno"));
		

		//DAO에 저장(데이터 저장값 반환할 때)
		QnaDAO dao = new QnaDAO();
		int cnt = dao.delQna(no, parno);
		
		//DAO 반환조건
		if(cnt>0) {
			response.sendRedirect("GetQnaListCtrl.do");
		} else {
			response.sendRedirect("GetQnaDetailCtrl.do?no="+no);
		}
	}
}

