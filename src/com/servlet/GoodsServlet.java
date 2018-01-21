package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.Constant;
import com.util.InsertUpdateDelBean;

public class GoodsServlet extends HttpServlet {
 
	/**
	 * Constructor of the object.
	 */
	public GoodsServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
		
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=gb2312");
		request.setCharacterEncoding("gb2312");
		
		String method=request.getParameter("method");
		String str=null;
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		if (method != null && method.equals("insert")) {
			//String goodNo = request.getParameter("goodNo");
			String goodNo=new Constant().getId();
			String name = request.getParameter("name");
			String guige = request.getParameter("guige");
			String gongyingshang = request.getParameter("gongyingshang");
			String yanse = request.getParameter("yanse");
			String pinpai = request.getParameter("pinpai");
			String type = request.getParameter("type");
			String weizhi = request.getParameter("weizhi");
			String num = request.getParameter("num");
			String price=request.getParameter("price");
			String danwei=request.getParameter("danwei");
			str = "/goods_list.jsp";
			String sql = "insert into t_goods(goodNo,name,guige,gongyingshang,yanse,pinpai,type,weizhi,num,price,danwei)values ('"+goodNo+"','"+name+"','"+guige+"','"+gongyingshang+"','"+yanse+"','"+pinpai+"','"+type+"','"+weizhi+"','"+num+"','"+price+"','"+danwei+"')";
			System.out.println(sql);
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				request.setAttribute("message", "重复！");
			}else{
				request.setAttribute("message", "操作成功！");
			}
		}else if (method != null && method.equals("delete")) {
			String idString=request.getParameter("id"); 
			str = "/goods_list.jsp";
			String sql = "delete from t_goods where id ='"+idString+"'";
			System.out.println(sql);
			@SuppressWarnings("unused")
			int flag = ib.insertANDupdateANDdel(sql);
		} else if (method != null && method.equals("update")) {
			String id=request.getParameter("id");
			String goodNo=new Constant().getId();
			//String goodNo = request.getParameter("goodNo");
			String name = request.getParameter("name");
			String guige = request.getParameter("guige");
			String gongyingshang = request.getParameter("gongyingshang");
			String yanse = request.getParameter("yanse");
			String pinpai = request.getParameter("pinpai");
			String type = request.getParameter("type");
			String weizhi = request.getParameter("weizhi");
			String num = request.getParameter("num");
			String price=request.getParameter("price");
			String danwei=request.getParameter("danwei");
			str = "/goods_list.jsp";
			String sql = "update t_goods set goodNo='"+goodNo+"',name='"+name+"',guige='"+guige+"',gongyingshang='"+gongyingshang+"',yanse='"+yanse+"',pinpai='"+pinpai+"',type='"+type+"',weizhi='"+weizhi+"',num='"+num+"',price='"+price+"',danwei='"+danwei+"' where id="+id;
			System.out.println(sql);
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				request.setAttribute("message", "重复！");
			}else{
				request.setAttribute("message", "操作成功！");
			}
		}
		
		
		request.getRequestDispatcher(str).forward(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
