package kr.go.ddm.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Maria {
	public static final String DRIVER="org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://127.0.0.1:3308/government?serverTimezone=Asia/Seoul";
	public static final String USER = "root";
	public static final String PW = "1234";
	
	public static final String NOTICE_SELECT_ALL = "select * from notice order by regdate desc";
	public static final String NOTICE_SELECT_ONE = "select * from notice where no=?";
	public static final String NOTICE_UPDATE_VISITED = "update notice set visited=visited+1 where no=?";
	public static final String NOTICE_INSERT = "insert into notice(title, content) values(?, ?)";
	public static final String NOTICE_UPDATE = "update notice set title=?, content=? where no=?";
	public static final String NOTICE_DELETE = "delete from notice where no=?";
	
	public static final String USER_JOIN = "insert into user(id, pw, name, birth, email, tel, addr) values(?, ?, ?, ?, ?, ?, ?)";
	public static final String USER_LOGIN = "select * from user where id=? and pw=?";
	public static final String USER_ID_CHECK = "select * from user where id=?";
	public static final String USER_UPDATE_VISITED = "update user set visited=visited+1 where id=?";
	public static final String USER_SELECT_ALL = "select * from user order by regdate desc";
	public static final String USER_SELECT_ONE = "select * from user where id=?";
	public static final String USER_UPDATE = "update user set pw=?, name=?, tel=?, birth=?, email=?, addr=? where id=?";
	
	public static final String TEST_SELECT_ONE = "select * from test where name=?";
	public static final String TEST_SELECT_ALL = "select * from test";
	
	public static final String LOAD_LAST_NO = "select no from tour order by no desc limit 1";
	public static final String TOUR_INSERT = "insert into tour(tourno, cate, place, comment1, comment2) values(?, ?, ?, ?, ?)";
	public static final String TOUR_SELECT_ALL = "select * from tour";	
	public static final String TOUR_SELECT_ONE = "select * from tour where no=?";
	public static final String PIC_SELECT_ONE = "select * from pic where tourno=? order by pos asc limit 1";
	public static final String FILE_INSERT = "insert into pic(tourno, picname, pos) values(?, ?, ?)";
	public static final String JSON_SELECT = "select * from pic where tourno=?";
	public static final String TOUR_SELECT_CATE = "select a.no, a.tourno, a.cate, a.place, a.comment1, a.comment2, b.picName, b.pos from tour a inner join pic b on a.tourno=b.tourno where a.cate=? and b.pos=1";
	public static final String TOUR_DELETE = "delete from user where no=?";
	
	public static final String TOUR_SELECT_PLACE = "select * from tour where place like CONCAT('%',?,'%')";	//'%'+?+'%' | CONCAT('%',?,'%')
	public static final String TOUR_SELECT_COMMENT = "select * from tour where comment2 like ?";
	public static final String TOUR_REVIEW_PLCAE = "select * from tour where tourno=?";
	
	public static final String QNA_SELECT_ALL = "select * from qna order by parno desc, no, lev asc";
	public static final String QNA_SELECT_ONE = "select * from qna where no=?";	
	public static final String QNA_UPDATE_VISITED = "update qna set visited=visited+1 where no=?";
	public static final String QNA_INSERT = "insert into qna(title, content, id, lev, sec) values(?, ?, ?, ?, ?)";
	public static final String QNA_SELECT_UP = "select no from qna order by regdate desc limit 1";
	public static final String QNA_UPDATE_INSERT = "update qna set parno=no where lev = 0 and no=?";
	public static final String QNA_DELETE = "delete from qna where no=?";
	public static final String QNA_DELETE_ALL = "delete from qna where parno=?";
	public static final String QNA_UPDATE = "update qna set title=?, content=?, id=?, sec=?, lev=? where no=?";
	public static final String QNA_INSERT_REPLY = "insert into qna(title, content, id, lev, parno, sec) values (?,?,?,?,?,?)";
	
	public static final String REVIEW_SELECT_ALL = "select * from review order by regdate desc";
	public static final String REVIEW_SELECT_ONE = "select * from review where no=?";
	public static final String REVIEW_INSERT = "insert into review(tourno, cate, id, content, rate, imgURL) values (?,?,?,?,?,?)";
	public static final String REVIEW_UPDATE = "update review set content=?, rate=? where id=? and no=?";
	public static final String REVIEW_DELETE = "delete from review where no=?";
	
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName(DRIVER);
		Connection con = DriverManager.getConnection(URL, USER, PW);
		return con;
	}
	
	//close() 오버라이딩(sql 실행상황에 따라 다르게 적용)
	public static void close(PreparedStatement pstmt, Connection con) {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	public static void close(ResultSet rs, PreparedStatement pstmt, Connection con) {
		if(rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
