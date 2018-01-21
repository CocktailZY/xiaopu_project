package com.util;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class InsertUpdateDelBean {
	 
	Connection conn = null;
	Statement st = null;
	ResultSet rs = null;
	
	public int insertANDupdateANDdel(String sql){
		int temp = 0;
		conn = DBConn.getConn();
		
		try {
			st = conn.createStatement();
			temp = st.executeUpdate(sql);
		} catch (SQLException e) {
			// TODO 自动生成 catch 块
			e.printStackTrace();
			temp = -1;
		} 
		
		return temp;
	}

}
