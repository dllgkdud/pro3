package kr.go.ddm.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.go.ddm.dto.PicDTO;
import kr.go.ddm.model.TourDAO;

//import org.json.JSONObject;
import net.sf.json.JSONObject;

import com.oreilly.servlet.MultipartRequest;


@WebServlet("/ImgUploadCtrl.do")
public class ImgUploadCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//UTF-8
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//전달받은 데이터
		int maxSize = 10*1024*1024;
		
		//개발자 디렉토리
		String saveFolder = "D:/lhy/pro01/pro3/webapps/upload/";
		//서버 디렉토리
		String uploadPath = request.getRealPath("/upload/");
		
		//DAO에 저장(데이터 저장값 반환할 때)
		TourDAO dao = new TourDAO(); 
		PicDTO dto = new PicDTO();
		try {
			//서버 디렉토리에 파일 업로드
			//MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8");
			
			int pos = Integer.parseInt(multi.getParameter("pos"));
			String tourno = multi.getParameter("tourno");
				
			Enumeration files=multi.getFileNames();
			String file1 =(String) files.nextElement();
			String fileName1=multi.getFilesystemName(file1);
			String imageURL = uploadPath + fileName1;
			
			try {
				//개발자 컴퓨터에 파일 업로드
				File imgURL = new File(imageURL);
				String extension = imageURL.substring(imageURL.lastIndexOf(".")+1); // 확장자
				
				BufferedImage image = ImageIO.read(imgURL);
				File file = new File(saveFolder + fileName1);
				if(!file.exists()) {		// 해당 경로의 폴더가 존재하지 않을 경우
					file.mkdirs(); 			// 해당 경로의 폴더 생성
				}
				// image를 file로 업로드
				ImageIO.write(image, extension, file); 
				System.out.println("이미지 업로드가 완료되었습니다.");
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			dto.setPicname(fileName1);
			dto.setPos(pos);
			dto.setTourno(tourno);
			
			//DAO 반환조건
			int cnt = dao.fileUpload(dto);
			if(cnt>0) {
				System.out.println("업로드 성공");
				System.out.println(fileName1);
				System.out.println(imageURL);
			} else {
				System.out.println("업로드 실패");
				response.sendRedirect("./tour/imgUpload.jsp?no="+pos+"&tourno="+tourno);
			}
			
			PrintWriter out = response.getWriter();
			TourDAO tour = new TourDAO();
			ArrayList<PicDTO> picList = tour.JSONPicList(tourno);
			
			HashMap<String,Object> map = new HashMap<String, Object>();
			map.put("picList", picList);
			
			JSONObject json = new JSONObject();
			json.putAll(map);
			out.println(json);
			
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
