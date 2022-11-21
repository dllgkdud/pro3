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


@WebServlet("/UpdateQnaProCtrl.do")
public class UpdateQnaProCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	String sql = "";
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//전달받은 데이터
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String id = request.getParameter("id");
		String sec = request.getParameter("sec");
		int lev = Integer.parseInt(request.getParameter("lev"));
		
		//DTO에 저장(데이터)
		QnaDTO dto = new QnaDTO();
		dto.setNo(no);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setId(id);
		dto.setSec(sec);
		dto.setLev(lev);
		
		//DAO에 저장
		QnaDAO dao = new QnaDAO();
		int cnt = dao.updateQna(dto);
		
		//포워딩
		if(cnt>0){
			response.sendRedirect("GetQnaListCtrl.do");
		} else {
			response.sendRedirect("GetQnaDetailCtrl.do?no="+no);
		}
	}

}
