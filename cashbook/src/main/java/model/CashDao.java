package model;

import java.sql.*;
import java.util.*;
import dto.*;

public class CashDao {

	
	public HashMap<Integer, ArrayList<HashMap<String, Object>>> selectCashListMonth(int year, int month) throws ClassNotFoundException, SQLException{
		HashMap<Integer, ArrayList<HashMap<String,Object>>> list = new HashMap<>();
		//Integer : 날짜(날짜별로 묶기위해 또한번 hashMap)
		//ArrayList : 그 날짜안의 cash데이터들(hashmap으로 만들어낸 cash들이 여러개있을수있으니)
		//HashMap : cash 하나의 정보
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook","root","java1234");
		String sql = "SELECT "
				+ "c.cash_no, "
				+ "c.category_no, "
				+ "c.cash_date, "
				+ "c.amount, "
				+ "c.memo, "
				+ "c.color, "
				+ "ct.title, "
				+ "ct.kind, "
				+ "ct.createdate "
				+ "FROM cash c "
				+ "INNER JOIN category ct "
				+ "ON c.category_no = ct.category_no WHERE YEAR(cash_date) = ? AND MONTH(cash_date) = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, year);
	    stmt.setInt(2, month+1);
		rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> c = new HashMap<String, Object>();
			c.put("cash_no", rs.getInt("cash_no"));
			c.put("category_no", rs.getInt("category_no"));
			c.put("cash_date", rs.getString("cash_date"));
			c.put("amount", rs.getInt("amount"));
			c.put("memo", rs.getString("memo"));
			c.put("color", rs.getString("color"));
			c.put("category_title", rs.getString("title"));
			c.put("category_kind", rs.getString("kind"));
			int day = Integer.parseInt(rs.getString("cash_date").substring(8, 10));
			list.computeIfAbsent(day, k -> new ArrayList<>()).add(c);
		}
		conn.close();
		return list;
	}
	
	public ArrayList<HashMap<String, Object>> selectCashList(int cash_no) throws ClassNotFoundException, SQLException{
		ArrayList<HashMap<String,Object>> list = new ArrayList<>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM cash where cash_no=?";
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook","root","java1234");
		stmt = conn.prepareStatement(sql);
		stmt.setInt(1, cash_no);
		rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> c = new HashMap<String, Object>();
			c.put("category_no", rs.getInt("category_no"));
			c.put("cash_date", rs.getString("cash_date"));
			c.put("amount", rs.getInt("amount"));
			c.put("memo", rs.getString("memo"));
			c.put("color", rs.getString("color"));
			c.put("createdate", rs.getString("createdate"));
			c.put("updatedate", rs.getString("updatedate"));
			list.add(c);
		}
		conn.close();
		return list;
	}
}
