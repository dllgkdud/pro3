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

import kr.go.ddm.dto.TourDTO;
import kr.go.ddm.model.TourDAO;
import net.sf.json.JSONObject;


@WebServlet("/CateLoadCtrl.do")
public class CateLoadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		
		//전달받은 데이터
		String cate = request.getParameter("cate");
		System.out.println("카테고리: "+cate);
		TourDAO dao = new TourDAO();
		
		//DTO에 저장(데이터 저장값 반환할 때)
		ArrayList<TourDTO> result = dao.getTourCateList(cate);
		
		PrintWriter out = response.getWriter();
		HashMap<String,Object> map = new HashMap<String, Object>();
		map.put("result", result);
		
		//JSONObject
		JSONObject json = new JSONObject();
		json.putAll(map);
		out.println(json.toString());
	}

}
