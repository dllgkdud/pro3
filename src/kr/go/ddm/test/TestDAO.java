package kr.go.ddm.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.ddm.model.Maria;

public class TestDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql ="";
	
	public TestDTO testDataOne(String name) {
		TestDTO dto = new TestDTO();
		try {	
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TEST_SELECT_ONE);
			pstmt.setString(1, name);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//매핑(Mapping)
				dto.setName(rs.getString("name"));
				dto.setPoint(rs.getInt("point"));
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
		return dto;
	}
	
	public ArrayList<TestDTO> testDataAll() {
		ArrayList<TestDTO> list = null;
		try {	
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.TEST_SELECT_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//매핑(Mapping)
				TestDTO dto = new TestDTO();
				dto.setName(rs.getString("name"));
				dto.setPoint(rs.getInt("point"));
				list.add(dto);
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
		return list;
	}
}
