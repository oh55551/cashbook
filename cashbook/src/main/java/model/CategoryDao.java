package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import dto.*;

public class CategoryDao {
	public ArrayList<HashMap<String,Object>> selectCategoryList() throws ClassNotFoundException, SQLException{
		ArrayList<HashMap<String, Object>> list = new ArrayList<>();
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cashbook","root","java1234");
		PreparedStatement stmt = null;
		String sql = "select * FROM category ORDER BY createdate DESC";
		stmt=conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        while (rs.next()) {
        	HashMap<String,Object> c = new HashMap<String, Object>();
        	c.put("category_no", rs.getInt("category_no"));
        	c.put("kind", rs.getString("kind"));
        	c.put("title", rs.getString("title"));
        	c.put("createdate", rs.getString("createdate"));
        	list.add(c);
        }
        return list;
	}
}
