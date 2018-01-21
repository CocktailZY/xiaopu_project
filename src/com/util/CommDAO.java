package com.util;



  
import java.net.UnknownHostException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

 



@SuppressWarnings("static-access")
public class CommDAO {

	Connection conn = new DBConn().getConn();

	

	// 完成数据库通用的查询一个对象
	public static Map<String, String> getMap(String sql, String... args) {
		Map<String, String> map = null;
		Connection conn = null;
		PreparedStatement pst = null;
		ResultSet rs = null;
		try {
			//conn = DBHelp.getConn();
			DBConn db=new DBConn();
			conn = db.getConn();
			pst = conn.prepareStatement(sql);
			if (args != null) {
				for (int i = 0; i < args.length; i++) {
					pst.setString(i + 1, args[i]);
				}
			}
			rs = pst.executeQuery();

			// 根据rs对象来得到表里面的具体信息
			ResultSetMetaData rsmd = rs.getMetaData();
			// 得到表有多少列
			int columnCount = rsmd.getColumnCount();
			// 获取列名，并保存在数组里面
			String[] columnnames = new String[columnCount];
			for (int i = 0; i < columnnames.length; i++) {
				columnnames[i] = rsmd.getColumnName(i + 1);
			}

			// 把数据封装到集合里面
			if (rs.next()) {
				map = new HashMap<String, String>();
				// 封装一条记录
				for (int i = 0; i < columnnames.length; i++) {
					map.put(columnnames[i], rs.getString(i + 1));
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}  
		return map;
	}
	 

	@SuppressWarnings("unchecked")
	public HashMap getMap(String id, String table) {
		List<HashMap> list = new ArrayList();
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery("select * from " + table
					+ " where id=" + id);
			ResultSetMetaData rsmd = rs.getMetaData();

			while (rs.next()) {
				HashMap map = new HashMap();
				int i = rsmd.getColumnCount();
				for (int j = 1; j <= i; j++) {
					if (!rsmd.getColumnName(j).equals("ID"))
						map.put(rsmd.getColumnName(j),
								rs.getString(j) == null ? "" : rs.getString(j));
					else
						map.put("id", rs.getString(j));
				}
				list.add(map);
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list.get(0);
	}

	
	
	public String ifExist(String teacher,String student){
		 
		String sql="select count(*) num from t_defen   where  teacher='"+teacher+"' and student='"+student+"'";
		String idString=null; 
		try {
			Statement st = conn.createStatement();
		    ResultSet rs = st.executeQuery(sql);
		    @SuppressWarnings("unused")
			ResultSetMetaData rsmd = rs.getMetaData();
		    while(rs.next())
		    {
		    	idString=rs.getString("num");
		    }
		    rs.close();
		    st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return idString;
	}
 
	
	 
	
	public String getRelaNameByName(String name){
		 
		String sql="select * from tadmin   where  name='"+name+"'";
		String idString=null; 
		try {
			Statement st = conn.createStatement();
		    ResultSet rs = st.executeQuery(sql);
		    @SuppressWarnings("unused")
			ResultSetMetaData rsmd = rs.getMetaData();
		    while(rs.next())
		    {
		    	idString=rs.getString("relaname");
		    }
		    rs.close();
		    st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return idString;
	}

	 
	public String getPicByName(String name){
		 
		String sql="select * from tfilm   where  name='"+name+"'";
		String idString=null; 
		try {
			Statement st = conn.createStatement();
		    ResultSet rs = st.executeQuery(sql);
		    @SuppressWarnings("unused")
			ResultSetMetaData rsmd = rs.getMetaData();
		    while(rs.next())
		    {
		    	idString=rs.getString("pic");
		    }
		    rs.close();
		    st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return idString;
	}
	 
	
 
	
	public String getDowntimesByName(String title){
		 
		String sql="select * from tfile   where  title='"+title+"'";
		String idString=null; 
		try {
			Statement st = conn.createStatement();
		    ResultSet rs = st.executeQuery(sql);
		    @SuppressWarnings("unused")
			ResultSetMetaData rsmd = rs.getMetaData();
		    while(rs.next())
		    {
		    	idString=rs.getString("tcishu");
		    }
		    rs.close();
		    st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return idString;
	}
	 
	 
	
	public int getInt(String sql) {
		int i = 0;
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				i = rs.getInt(1);
			}
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public double getDouble(String sql) {
		double i = 0;
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			if (rs.next()) {
				i = rs.getDouble(1);

			}
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public void commOper(String sql) {
		try {
			Statement st = conn.createStatement();
			st.execute(sql);
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void commOperSqls(ArrayList<String> sql) {

		try {
			conn.setAutoCommit(false);
			for (int i = 0; i < sql.size(); i++) {
				Statement st = conn.createStatement();
				System.out.println(sql.get(i));
				st.execute(sql.get(i));
				st.close();
			}
			conn.commit();
		} catch (SQLException e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.setAutoCommit(true);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}

 

	@SuppressWarnings("unchecked")
	public List<HashMap> select(String sql) {
		List<HashMap> list = new ArrayList();
		try {
			Statement st = conn.createStatement();
			ResultSet rs = st.executeQuery(sql);
			ResultSetMetaData rsmd = rs.getMetaData();

			while (rs.next()) {
				HashMap map = new HashMap();
				int i = rsmd.getColumnCount();
				for (int j = 1; j <= i; j++) {
					if (!rsmd.getColumnName(j).equals("ID"))
						map.put(rsmd.getColumnName(j),
								rs.getString(j) == null ? "" : rs.getString(j));
					else
						map.put("ID", rs.getString(j));
				}
				list.add(map);
			}
			rs.close();
			st.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public void close() {
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * 鎵ц锟??鏉℃煡璇ql,锟?? List<hashmap> 鐨勫舰寮忚繑鍥炴煡璇㈢殑璁板綍锛岃褰曟潯鏁帮紝鍜屼粠绗嚑鏉″紑濮嬶紝鐢卞弬鏁板喅瀹氾紝涓昏鐢ㄤ簬缈婚〉 pageno 椤电爜
	 * rowsize 姣忛〉鐨勬潯锟??
	 */
	@SuppressWarnings("unchecked")
	public List select(String sql, int pageno, int rowsize) {
		List<HashMap> list = new ArrayList<HashMap>();
		List<HashMap> mlist = new ArrayList<HashMap>();
		try {
			list = this.select(sql);
			int min = (pageno - 1) * rowsize;
			int max = pageno * rowsize;

			for (int i = 0; i < list.size(); i++) {

				if (!(i < min || i > (max - 1))) {
					mlist.add(list.get(i));
				}
			}
		} catch (RuntimeException re) {
			re.printStackTrace();
			throw re;
		}

		return mlist;
	}

	// 璇ユ柟娉曡繑鍥炰竴涓猼able 鐢ㄤ簬娴佸姩鍥剧墖
	@SuppressWarnings("unchecked")
	public String DynamicImage(String categoryid, int cut, int width, int height) {

		StringBuffer imgStr = new StringBuffer();
		StringBuffer thePics1 = new StringBuffer();
		StringBuffer theLinks1 = new StringBuffer();
		StringBuffer theTexts1 = new StringBuffer();

		imgStr
				.append("<div id=picViwer1 align=center></div><SCRIPT src='/zyglsys/js/dynamicImage.js' type=text/javascript></SCRIPT>\n<script language=JavaScript>\n");
		thePics1.append("var thePics1=\n'");
		theLinks1.append("var theLinks1='");
		theTexts1.append("var theTexts1='");

		List<HashMap> co = this
				.select(
						"select * from  news where title!='绯荤粺锟??浠嬭绠楁満璇剧▼绠＄悊绯荤粺' and  title!='姣曚笟璁捐鏍忕洰绠＄悊' order by id desc",
						1, 6);
		int j = 0;
		int i = co.size();
		for (HashMap b : co) {
			j++;
			@SuppressWarnings("unused")
			String id = b.get("id").toString();
			String title = b.get("title").toString();

			String url = "/zyglsys/upfile/" + b.get("picurl");

			String purl = "";

			if (j != i) {
				thePics1.append(url.replaceAll("\n", "") + "|");
				theLinks1.append(purl + "|");
				theTexts1.append(title + "|");
			}
			if (j == i) {
				thePics1.append(url.replaceAll("\n", ""));
				theLinks1.append("#");
				theTexts1.append(title);
			}

		}
		thePics1.append("';");

		theLinks1.append("';");
		theTexts1.append("';");
		imgStr.append(thePics1 + "\n");
		imgStr.append(theLinks1 + "\n");
		imgStr.append(theTexts1 + "\n");
		imgStr.append("\n setPic(thePics1,theLinks1,theTexts1," + width + ","
				+ height + ",'picViwer1');</script>");
		return imgStr.toString();
	}

	 

	 

	public static void main(String[] args) throws SQLException, UnknownHostException {
		
		
	}
}
