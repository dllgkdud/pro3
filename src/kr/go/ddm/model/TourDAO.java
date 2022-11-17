package kr.go.ddm.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.crypto.util.AES256;

import kr.go.ddm.dto.PicDTO;
import kr.go.ddm.dto.TourDTO;

public class TourDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	//마지막 번호 확인
	public int loadLastNo(){
		int no = 0;
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.LOAD_LAST_NO);
			rs = pstmt.executeQuery();
			if(rs.next()){ 
				no = rs.getInt("no") + 1;	
			} else { 
				no = 1;	
			}
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩에 실패했습니다.");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문이 정상적으로 처리되지 않았습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("잘못된 연산 및 요청으로 목록을 불러오지 못했습니다.");
			e.printStackTrace();
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return no;
	}
	
	//투어등록
	public int addTour(TourDTO dto) {
		int cnt = 0;
		try {	
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TOUR_INSERT);
			pstmt.setString(1, dto.getTourno());
			pstmt.setString(2, dto.getCate());
			pstmt.setString(3, dto.getPlace());
			pstmt.setString(4, dto.getComment1());
			pstmt.setString(5, dto.getComment2());			
			cnt = pstmt.executeUpdate();			
			
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩에 실패했습니다.");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문이 정상적으로 처리되지 않았습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("잘못된 연산 및 요청으로 목록을 불러오지 못했습니다.");
			e.printStackTrace();
		} finally {
			Maria.close(pstmt, con);
		}
		return cnt;
	}
	
	//파일등록
	public int fileUpload(PicDTO dto) {
		int cnt = 0;
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.FILE_INSERT);
			pstmt.setString(1, dto.getTourno());
			pstmt.setString(2, dto.getPicname());
			pstmt.setInt(3, dto.getPos());
			cnt = pstmt.executeUpdate();
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩에 실패했습니다.");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문이 정상적으로 처리되지 않았습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("잘못된 연산 및 요청으로 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(pstmt, con);
		}
		return cnt;
	}
	
	//이미지리스트
	public ArrayList<PicDTO> JSONPicList(String tourno) {
		ArrayList<PicDTO> picList = new ArrayList<PicDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.JSON_SELECT);
			pstmt.setString(1, tourno);
			rs = pstmt.executeQuery();
			while(rs.next()){
				PicDTO pic = new PicDTO();
				pic.setNo(rs.getInt("no"));
				pic.setTourno(rs.getString("tourno"));
				pic.setPicname(rs.getString("picname"));
				pic.setPos(rs.getInt("pos"));
				picList.add(pic);
			}
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩에 실패했습니다.");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문이 정상적으로 처리되지 않았습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("잘못된 연산 및 요청으로 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return picList;
	}

	//투어리스트
	public ArrayList<TourDTO> getTourList() {
		ArrayList<TourDTO> tourList = new ArrayList<TourDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TOUR_SELECT_ALL);
			rs = pstmt.executeQuery();
			while(rs.next()){
				TourDTO tour = new TourDTO();
				tour.setNo(rs.getString("no"));
				tour.setTourno(rs.getString("tourno"));
				tour.setCate(rs.getString("cate"));
				tour.setPlace(rs.getString("place"));
				tourList.add(tour);
			}
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩에 실패했습니다.");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문이 정상적으로 처리되지 않았습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("잘못된 연산 및 요청으로 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return tourList;
	}

	//투어 카테고리리스트
	public ArrayList<TourDTO> getTourCateList(String cate) {
		ArrayList<TourDTO> tourList = new ArrayList<TourDTO>();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TOUR_SELECT_CATE);
			pstmt.setString(1, cate);
			rs = pstmt.executeQuery();
			while(rs.next()){
				TourDTO tour = new TourDTO();
				tour.setNo(rs.getString("no"));
				tour.setTourno(rs.getString("tourno"));
				tour.setCate(rs.getString("cate"));
				tour.setPlace(rs.getString("place"));
				tour.setImgURL(rs.getString("picname"));
				tour.setComment1(rs.getString("comment1"));
				tour.setComment2(rs.getString("comment2"));
				tourList.add(tour);
			}
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩에 실패했습니다.");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문이 정상적으로 처리되지 않았습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("잘못된 연산 및 요청으로 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return tourList;
	}

	public TourDTO getTour(int no) {
		TourDTO tour = new TourDTO();
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TOUR_SELECT_ONE);
			pstmt.setInt(1, no);
			rs = pstmt.executeQuery();
			while(rs.next()){
				tour.setNo(rs.getString("no"));
				tour.setTourno(rs.getString("tourno"));
				tour.setCate(rs.getString("cate"));
				tour.setPlace(rs.getString("place"));
				tour.setComment1(rs.getString("comment1"));
				tour.setComment2(rs.getString("comment2"));
			}
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩에 실패했습니다.");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문이 정상적으로 처리되지 않았습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("잘못된 연산 및 요청으로 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return tour;
	}

	public int delTour(int no) {
		int cnt = 0;
		try {
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TOUR_DELETE);
			pstmt.setInt(1, no);
			cnt = pstmt.executeUpdate();
			
		} catch(ClassNotFoundException e) {
			System.out.println("드라이버 로딩에 실패했습니다.");
			e.printStackTrace();
		} catch(SQLException e) {
			System.out.println("SQL구문이 정상적으로 처리되지 않았습니다.");
			e.printStackTrace();
		} catch(Exception e) {
			System.out.println("잘못된 연산 및 요청으로 목록을 불러오지 못했습니다.");
		} finally {
			Maria.close(rs, pstmt, con);
		}
		return cnt;
	}
}