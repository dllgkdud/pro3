package kr.go.ddm.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.ddm.dto.NoticeDTO;
import kr.go.ddm.dto.ReviewDTO;


public class ReviewDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql ="";
	
	public ArrayList<ReviewDTO> getReviewList() {
		ArrayList<ReviewDTO> revList = new ArrayList<ReviewDTO>();
		try {	
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.REVIEW_SELECT_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//매핑(Mapping)
				ReviewDTO dto = new ReviewDTO();
				dto.setNo(rs.getInt("no"));
				dto.setTourno(rs.getString("tourno"));				
				dto.setCate(rs.getString("cate"));
				dto.setId(rs.getString("id"));
				dto.setContent(rs.getString("content"));
				dto.setRate(rs.getDouble("rate"));
				dto.setImgURL(rs.getString("imgurl"));
				dto.setRegdate(rs.getString("regdate"));
				revList.add(dto);
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
		return revList;
	}

	public void addReview(ReviewDTO dto) {
		try {	
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.REVIEW_INSERT);
			pstmt.setString(1, dto.getCate());
			pstmt.setString(2, dto.getTourno());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getContent());
			pstmt.setDouble(5, dto.getRate());
			pstmt.setString(6, dto.getImgURL());
			pstmt.executeUpdate();

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
	}

	public int delReview(int no) {
		int cnt = 0;
		try {	
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.REVIEW_DELETE);
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
			e.printStackTrace();
		} finally {
			Maria.close(pstmt, con);
		}
		return cnt;
	}
}
