package kr.go.ddm.view;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;
import kr.go.ddm.dto.TourDTO;
import kr.go.ddm.model.TourDAO;


@WebServlet("/MenuCtrl.do")
public class MenuCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8"); 
		
		//DAO에서 목록 호출/반환
		TourDAO dao = new TourDAO();
		ArrayList<TourDTO> data = dao.JSONPlaceList();
		
		PrintWriter out = response.getWriter();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("data", data);
		
		//JSON Object
		JSONObject json = new JSONObject();
		json.putAll(map);
		out.println(json.toString());
	}
}
