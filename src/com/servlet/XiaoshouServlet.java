package com.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.AllBean;
import com.util.Constant;
import com.util.InsertUpdateDelBean;

@SuppressWarnings("serial")
public class XiaoshouServlet extends HttpServlet {
 
	/**
	 * Constructor of the object.
	 */
	public XiaoshouServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); 
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=gb2312");
		request.setCharacterEncoding("gb2312");
		
		String method=request.getParameter("method");
		String str=null;
		InsertUpdateDelBean ib = new InsertUpdateDelBean();
		if (method != null && method.equals("insert")) {
			String xiaoshoutype = request.getParameter("xiaoshouType");
			//String chukuNo = request.getParameter("chukuNo");
			String xiaoshouNo = new Constant().getId().trim();
			String xiaoshouriqi = request.getParameter("xiaoshouriqi").trim();
			String kehu = request.getParameter("kehu");
			String lianxiren = request.getParameter("lianxiren");
			//String bumen = request.getParameter("bumen");
			String jingshouren = request.getParameter("jingshouren");
			String goodsNo = request.getParameter("goodsNo");
			String goodsName =new AllBean().getgoods(goodsNo).get(2).toString();
			String goodsGuige =new AllBean().getgoods(goodsNo).get(3).toString();
			String goodsPinpai = new AllBean().getgoods(goodsNo).get(6).toString();
			String goodsNum = request.getParameter("goodsNum");
			String xiaoshouPrice = request.getParameter("xiaoshouPrice");
			String goodsPrice = new AllBean().getgoods(goodsNo).get(10).toString();
			String goodsTotal =String.valueOf(Integer.valueOf(goodsNum)*(Float.valueOf(xiaoshouPrice)));
			String beizhu = request.getParameter("beizhu");
			String cangku = request.getParameter("cangku"); 
			str = "/xiaoshou_list.jsp";
			//更新库存量
			String updatekucun="update t_goods set num=num-"+goodsNum+ " where id='"+goodsNo+"'";
			String sql = "insert t_xiaoshou(xiaoshoutype,xiaoshouNo,xiaoshouriqi,kehu,cangku,jingshouren,goodsNo,goodsName,goodsGuige,goodsPinpai,goodsNum,goodsPrice,xiaoshouPrice,goodsTotal,beizhu)values ('"+xiaoshoutype+"','"+xiaoshouNo+"','"+xiaoshouriqi+"','"+kehu+"','"+cangku+"','"+jingshouren+"','"+goodsNo+"','"+goodsName+"','"+goodsGuige+"','"+goodsPinpai+"','"+goodsNum+"','"+goodsPrice+"','"+xiaoshouPrice+"','"+goodsTotal+"','"+beizhu+"')";
			System.out.println(sql);
			int flag = ib.insertANDupdateANDdel(sql);
			if(flag == -1){
				request.setAttribute("message", "重复！");
			}else{
				ib.insertANDupdateANDdel(updatekucun);
				System.out.println(updatekucun);
				request.setAttribute("message", "恭喜您，成功售出！售出数量为"+goodsNum);
			}
		}else if (method != null && method.equals("delete")) {
			String idString=request.getParameter("id"); 
			str = "/xiaoshou_list.jsp";
			String sql = "delete from t_xiaoshou where id ='"+idString+"'";
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
