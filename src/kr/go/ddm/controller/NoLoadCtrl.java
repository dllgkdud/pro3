package kr.go.ddm.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.ddm.model.TourDAO;

import org.json.JSONObject;


@WebServlet("/NoLoadCtrl.do")
public class NoLoadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//DAO에 저장(데이터 저장값 반환할 때)
		TourDAO dao = new TourDAO();
		int firstNo = dao.loadLastNo();
		String no = "";
		
		//DAO 반환조건
		if(firstNo<10) {
			no = "000"+firstNo;
		}  else if(firstNo<100) {
			no = "00"+firstNo;
		} else if(firstNo<1000) {
			no = "0"+firstNo;
		} else {
			no = ""+firstNo;
		}
		JSONObject json = new JSONObject();
		json.put("no", no);
		PrintWriter out = response.getWriter();
		out.println(json.toString());
	}
}
