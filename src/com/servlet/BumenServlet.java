﻿package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.InsertUpdateDelBean;
 
public class BumenServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public BumenServlet() {
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
			String bumen = request.getParameter("bumen");
			str = "/bumen_list.jsp";
			String sql = "insert into t_bumen(bumen) values('"+bumen+"')";
			System.out.println(sql);
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				request.setAttribute("message", "重复！");
			}else{
				request.setAttribute("message", "操作成功！");
			}
		}else if (method != null && method.equals("delete")) {
			String idString=request.getParameter("id"); 
			str = "/bumen_list.jsp";
			String sql = "delete from t_bumen where id ='"+idString+"'";
			System.out.println(sql);
			@SuppressWarnings("unused")
			int flag = ib.insertANDupdateANDdel(sql);
		} else if (method != null && method.equals("update")) {
			String id=request.getParameter("id");
			String bumen = request.getParameter("bumen");
			str = "/bumen_list.jsp";
			String sql = "update t_bumen set bumen='"+bumen+"' where id="+id;
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
