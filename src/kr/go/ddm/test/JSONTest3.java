package kr.go.ddm.test;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
//import net.sf.JSON.*;

@WebServlet("/JSONTest3.do")
public class JSONTest3 extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
				
		//JSON object - 아무 형태나 전부 보낼 수 있다.
		TestDAO dao = new TestDAO();
		ArrayList<TestDTO> list = dao.testDataAll();
		
		JSONObject json = new JSONObject();
		json.put("list", list);
		PrintWriter out = response.getWriter();
		out.println(json.toString());
	}
}
