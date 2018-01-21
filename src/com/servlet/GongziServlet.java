package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.AllBean;
import com.util.InsertUpdateDelBean;

public class GongziServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public GongziServlet() {
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
			String userid = request.getParameter("userid");
			String name=new AllBean().getUser(userid).get(2).toString();
			String bumen=new AllBean().getUser(userid).get(8).toString();
			String riqi = request.getParameter("riqi");
			String num = request.getParameter("num");
			str = "/gongzi_list.jsp";
			String sql = "insert into t_gongzi(name,bumen,riqi,num) values('"+name+"','"+bumen+"','"+riqi+"','"+num+"')";
			System.out.println(sql);
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				request.setAttribute("message", "重复！");
			}else{
				request.setAttribute("message", "操作成功！");
			}
		}else if (method != null && method.equals("delete")) {
			String idString=request.getParameter("id"); 
			str = "/admin_list.jsp";
			String sql = "delete from t_admin where id ='"+idString+"'";
			System.out.println(sql);
			@SuppressWarnings("unused")
			int flag = ib.insertANDupdateANDdel(sql);
		}else if (method != null && method.equals("update")) {
			String idString=request.getParameter("id"); 
			String account = request.getParameter("account");
			String pwd = request.getParameter("pwd");
			str = "/admin_list.jsp";
			String sql = "update t_admin set account='"+account+"',pwd='"+pwd+"' where id="+idString;
			System.out.println(sql);
			request.setAttribute("message", account+"资料修改成功！");
			int flag = ib.insertANDupdateANDdel(sql);
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
