package kr.go.ddm.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.ddm.dto.UserDTO;
import kr.go.ddm.model.UserDAO;


@WebServlet("/AddUserCtrl.do")
public class AddUserCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//전달받은 데이터
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		String addr = request.getParameter("addr");
		
		//DTO에 저장(데이터)
		UserDTO dto = new UserDTO();
		dto.setId(id);
		dto.setPw(pw);
		dto.setName(name);
		dto.setTel(tel);
		dto.setBirth(birth);
		dto.setEmail(email);
		dto.setAddr(addr);
		
		//DAO에 저장(데이터 저장값 반환할 때)
		UserDAO dao = new UserDAO();
		int cnt = dao.addUser();
		
		//DAO 반환조건
		if(cnt>0) {
			response.sendRedirect("/");
		} else {
			response.sendRedirect("./WEB-INF/user/addUser.jsp");
		}
	}

}
