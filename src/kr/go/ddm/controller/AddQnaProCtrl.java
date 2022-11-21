package kr.go.ddm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.ddm.dto.QnaDTO;
import kr.go.ddm.model.QnaDAO;


@WebServlet("/AddQnaProCtrl.do")
public class AddQnaProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//전달받은 데이터
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		String sec = request.getParameter("sec");
		int lev = Integer.parseInt(request.getParameter("lev"));

		
		//DTO에 저장(데이터)
		QnaDTO dto = new QnaDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setId(id);
		dto.setLev(lev);
		dto.setSec(sec);
		
		//DAO에 저장(데이터 저장값 반환할 때)
		QnaDAO dao = new QnaDAO();
		int cnt = dao.addQna(dto);
		
		//DAO 반환조건
		if(cnt>0) {
			response.sendRedirect("GetQnaListCtrl.do");
		} else {
			response.sendRedirect("./qna/qnaWrite.jsp");
		}
	}

}
