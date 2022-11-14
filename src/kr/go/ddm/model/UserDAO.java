package kr.go.ddm.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kr.go.ddm.dto.NoticeDTO;
import kr.go.ddm.dto.UserDTO;

public class UserDAO {
	private Connection con = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	String sql ="";
	
	public ArrayList<UserDTO> getUserList() {
		ArrayList<UserDTO> userList = new ArrayList<UserDTO>();
		try {	
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.NOTICE_SELECT_ALL);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				//매핑(Mapping)
				UserDTO dto = new UserDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email"));
				dto.setAddr(rs.getString("addr"));
				userList.add(dto);
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
		return userList;
	}
	
	public int addUser() {
		int cnt = 0;
		try {	
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.USER_JOIN);
			cnt = pstmt.executeUpdate();
			
			if(rs.next()) {
				//매핑(Mapping)
				UserDTO dto = new UserDTO();
				dto.setId(rs.getString("id"));
				dto.setPw(rs.getString("pw"));
				dto.setName(rs.getString("name"));
				dto.setTel(rs.getString("tel"));
				dto.setBirth(rs.getString("birth"));
				dto.setEmail(rs.getString("email"));
				dto.setAddr(rs.getString("addr"));				
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
			Maria.close(pstmt, con);
		}
		return cnt;
	}

	public int idCheckPro(String id) {
		int cnt = 0;
		try {	
			con = Maria.getConnection();
			pstmt = con.prepareStatement(Maria.USER_ID_CHECK);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//매핑(Mapping)
				cnt = cnt +1;
			} else {
				cnt = 0;
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
		return cnt;
	}
}
