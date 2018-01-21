package com.util;

import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Properties;

public class DBConn { 

 /*   private static final String DRIVER = "com.mysql.jdbc.Driver";
 	private static final String URL = "jdbc:mysql://localhost:3306/xuanke?useUnicode=true&amp;characterEncoding=utf-8&amp;useOldAliasMetadataBehavior=true";
 	private static final String USERNAME = "root";
 	private static final String PASSWORD = "mysql";
	*/
 
	private static Connection conn;
	private Statement stmt;
	private ResultSet rs;
	public DBConn() {
	}

	public static synchronized Connection getConn() {
		try {
			Properties properties = new Properties();
			properties.load(DBConn.class.getClassLoader().getResourceAsStream("jdbc.properties"));
			String driver = properties.getProperty("jdbc.driverClassName");
			String url = properties.getProperty("jdbc.url");
			String username = properties.getProperty("jdbc.username");
			String password = properties.getProperty("jdbc.password");
			Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
			 //conn = DriverManager.getConnection("jdbc:microsoft:sqlserver://localhost:1433;databasename=zuoyetijiao","sa","think");
	           
		} catch (Exception e) {
		}
		return conn;
	}

	public void init(Connection conn) {
		try {
			stmt = conn.createStatement();
		} catch (Exception e) {
		}
	}

	public void close() {
		try {
			if (rs != null)
				rs.close();
		} catch (Exception e) {
		}
		try {
			if (stmt != null)
				stmt.close();
		} catch (Exception e) {
		}
		try {
			if (conn != null)
				conn.close();
		} catch (Exception e) {
		}
	}

	public int select(String sql) {
//		int k = -10;
//		init(getConn());
//		try {
//			k = 0;
//			rs = stmt.executeQuery(sql);
//			if (rs.next())
//				k++;
//		} catch (Exception e) {
//			k = -1;
//			close();
//		}
//		close();
//		return k;
		
		
		int k = -10;
		init(getConn());
 	try {
 		 
 		rs = stmt.executeQuery(sql);
 		 
 		} catch (Exception e) {
 			k = -1;
 		}
  		close();
 		return k;
	}

	public int update(String sql) {
// 		int k = -10;
//		init(getConn());
// 	try {
// 			k = 0;
// 		k = stmt.executeUpdate(sql);
// 			if (rs.next())
// 				k++;
// 		} catch (Exception e) {
// 			k = -1;
// 		}
//  		close();
// 		return k;
//	 
		
 		
 		int k = -10;
		init(getConn());
 	try {
 		 
 		k = stmt.executeUpdate(sql);
 		 
 		} catch (Exception e) {
 			k = -1;
 		}
  		close();
 		return k;
 		
		
	}

	public static void main(String[] args) throws SQLException {
	  Connection con=DBConn.getConn();
	  Statement st=con.createStatement();
	  ResultSet rs = st.executeQuery("select * from t_admin");
	  while(rs.next()){
		  System.out.println(rs.getString("pwd"));
	  }
	  
		
	}
	
	public String getDate(){
		return new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
	}

	public String chStr(String str) {
		String temp2;
		byte temp[] = null;
		try {
			temp = str.getBytes("ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		temp2 = new String(temp);
		return temp2;
	}

	public ResultSet query(String sql) {
		init(getConn());
		try {
			rs = stmt.executeQuery(sql);
		} catch (Exception e) {
		}
		return rs;
	}
}
