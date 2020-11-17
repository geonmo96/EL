package testBoard;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BoardDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String id = "jsp";
	private String pw = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public BoardDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public int getTotalPage() {
		String sql = "select count(*) from paging";
		int totalPage = 0;
		try {
			con = DriverManager.getConnection(url, id, pw);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				totalPage = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totalPage;
	}
	
	public void count(String num) {
		String sql = "update paging set count= count+1 where num = ?";
		try {
			con = DriverManager.getConnection(url, id, pw);
			ps = con.prepareStatement(sql);
			ps.setInt(1, Integer.parseInt(num));
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<BoardDTO> list(String totalPage) {
		int page = Integer.parseInt(totalPage);
		ArrayList<BoardDTO> listDto = new ArrayList<BoardDTO>();
		//String sql = "select * from paging";
		String sql = 
				"select B.* from ("
				+ "  select rownum rn, A.* from ("
				+ "    select * from paging order by num desc)A)B "
				+ " where rn between ? and ?";
		try {
			con = DriverManager.getConnection(url, id, pw);
			ps = con.prepareStatement(sql);
			ps.setInt(1, page*3-2);
			ps.setInt(2, page*3);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardDTO dto = new BoardDTO();
				dto.setNum(rs.getInt("num"));
				dto.setTitle(rs.getString("title"));
				dto.setPdate(rs.getString("pdate"));
				dto.setCount(rs.getInt("count"));
				listDto.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listDto;
	}
	
	public void insert(BoardDTO dto) {
		try {
			con = DriverManager.getConnection(url, id, pw);
			String sql = "insert into paging(num, title, pdate, count) values(test_num.nextval,?,sysdate,0)";
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getTitle());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			con.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
