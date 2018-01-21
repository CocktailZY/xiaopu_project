﻿package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.AllBean;
import com.util.Constant;
import com.util.InsertUpdateDelBean;

public class ChukuServlet extends HttpServlet {
 
	/**
	 * Constructor of the object.
	 */
	public ChukuServlet() {
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
			String chukutype = request.getParameter("chukuType");
			//String chukuNo = request.getParameter("chukuNo");
			String chukuNo = new Constant().getId().trim();
			String chukuriqi = request.getParameter("chukuriqi").trim();
			String kehu = request.getParameter("kehu");
			String lianxiren = request.getParameter("lianxiren");
			//String bumen = request.getParameter("bumen");
			String jingshouren = request.getParameter("jingshouren");
			String gongsNo = request.getParameter("gongsNo");
			String goodsName =new AllBean().getgoods(gongsNo).get(2).toString();
			String goodsGuige =new AllBean().getgoods(gongsNo).get(3).toString();
			String goodsPinpai = new AllBean().getgoods(gongsNo).get(6).toString();
			String goodsNum = request.getParameter("goodsNum");
			String goodsPrice = new AllBean().getgoods(gongsNo).get(10).toString();
			String goodsTotal =String.valueOf(Integer.valueOf(goodsNum)*(Float.valueOf(goodsPrice)));
			String beizhu = request.getParameter("beizhu");
			String cangku = request.getParameter("cangku"); 
			str = "/chuku_list.jsp";
			//更新库存量
			String updatekucun="update t_goods set num=num-"+goodsNum+ " where id='"+gongsNo+"'";
			String sql = "insert t_chuku(chukutype,chukuNo,chukuriqi,kehu,cangku,jingshouren,goodsNo,goodsName,goodsGuige,goodsPinpai,goodsNum,goodsPrice,goodsTotal,beizhu)values ('"+chukutype+"','"+chukuNo+"','"+chukuriqi+"','"+kehu+"','"+cangku+"','"+jingshouren+"','"+gongsNo+"','"+goodsName+"','"+goodsGuige+"','"+goodsPinpai+"','"+goodsNum+"','"+goodsPrice+"','"+goodsTotal+"','"+beizhu+"')";
			System.out.println(sql);
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				request.setAttribute("message", "重复！");
			}else{
				ib.insertANDupdateANDdel(updatekucun);
				System.out.println(updatekucun);
				request.setAttribute("message", "恭喜您，成功出库！出库数量为"+goodsNum);
			}
		}else if (method != null && method.equals("delete")) {
			String idString=request.getParameter("id"); 
			str = "/chuku_list.jsp";
			String sql = "delete from t_chuku where id ='"+idString+"'";
			System.out.println(sql);
			@SuppressWarnings("unused")
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
