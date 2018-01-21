package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.InsertUpdateDelBean;

public class KehuServlet extends HttpServlet {
 
	/**
	 * Constructor of the object.
	 */
	public KehuServlet() {
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
			String kehuname = request.getParameter("kehuname");
			String kehutype = request.getParameter("kehutype");
			String dizhi = request.getParameter("dizhi");
			String lianxiren = request.getParameter("lianxiren");
			String tel1 = request.getParameter("tel1");
			String tel2 = request.getParameter("tel2");
			String chuanzhen = request.getParameter("chuanzhen");
			String email = request.getParameter("email");
			String beizhu = request.getParameter("beizhu");
			String iszaiyong = request.getParameter("iszaiyong"); 
			str = "/kehu_list.jsp";
			String sql = "insert into t_kehu(kehuname,kehutype,dizhi,lianxiren,tel1,tel2,chuanzhen,email,beizhu,iszaiyong)values ('"+kehuname+"','"+kehutype+"','"+dizhi+"','"+lianxiren+"','"+tel1+"','"+tel2+"','"+chuanzhen+"','"+email+"','"+beizhu+"','"+iszaiyong+"')";
			System.out.println(sql);
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				request.setAttribute("message", "重复！");
			}else{
				request.setAttribute("message", "操作成功！");
			}
		}else if (method != null && method.equals("delete")) {
			String idString=request.getParameter("id"); 
			str = "/kehu_list.jsp";
			String sql = "delete from t_kehu where id ='"+idString+"'";
			System.out.println(sql);
			@SuppressWarnings("unused")
			int flag = ib.insertANDupdateANDdel(sql);
		} else if (method != null && method.equals("update")) {
			String id=request.getParameter("id");
			String kehuname = request.getParameter("kehuname");
			String kehutype = request.getParameter("kehutype");
			String dizhi = request.getParameter("dizhi");
			String lianxiren = request.getParameter("lianxiren");
			String tel1 = request.getParameter("tel1");
			String tel2 = request.getParameter("tel2");
			String chuanzhen = request.getParameter("chuanzhen");
			String email = request.getParameter("email");
			String beizhu = request.getParameter("beizhu");
			String iszaiyong = request.getParameter("iszaiyong"); 
			str = "/kehu_list.jsp";
			String sql = "update t_kehu set kehuname='"+kehuname+"',kehutype='"+kehutype+"',dizhi='"+dizhi+"',lianxiren='"+lianxiren+"',tel1='"+tel1+"',tel2='"+tel2+"',chuanzhen='"+chuanzhen+"',email='"+email+"',beizhu='"+beizhu+"',iszaiyong='"+iszaiyong+"' where id="+id;
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
