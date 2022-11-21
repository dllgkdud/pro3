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


@WebServlet("/ReplyQnaProCtrl.do")
public class ReplyQnaProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//전달받은 데이터
		int parno = Integer.parseInt(request.getParameter("parno"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		String sec = request.getParameter("sec");
		int lev = Integer.parseInt(request.getParameter("lev"));
		
		//DTO에 저장
		QnaDTO dto = new QnaDTO();
		dto.setTitle(title);
		dto.setContent(content);
		dto.setId(id);
		dto.setLev(lev);
		dto.setSec(sec);
		dto.setParno(parno);
		
		//DAO에 저장
		QnaDAO dao = new QnaDAO();
		int cnt = dao.addReply(dto);
		
		//반환조건
		if(cnt>0){
			response.sendRedirect("GetQnaListCtrl.do");
		} else {
			response.sendRedirect("ReplyQnaCtrl.do?no="+parno);
		}
	}

}
