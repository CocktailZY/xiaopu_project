package com.servlet; 

import java.io.IOException;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.SelectBean;

@SuppressWarnings("serial")
public class LoginServlet extends HttpServlet {
 
	/**
	 * Constructor of the object.
	 */
	public LoginServlet() {
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
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		 String account=request.getParameter("account");
		 String pwd=request.getParameter("pwd");
		 //String type=request.getParameter("type");
		 String type="管理员";
	     //	System.out.println("account:"+account+"pwd:"+pwd+"type"+type);
		 String str = "";
		 String sql = "select * from t_admin where account='"+account+"' and pwd='"+pwd+"'";
		 String args[] = { "id", "account","pwd" };
	     SelectBean sb = new SelectBean();
	     ArrayList al = sb.select(args, sql);	
	     
		 
	     //教师
	     String sql2 = "select * from t_teacher where account='"+account+"' and pwd='"+pwd+"'";
		 String args2[] = { "id", "account","pwd","name" };
	     @SuppressWarnings("unused")
		 SelectBean sb2 = new SelectBean();
	     ArrayList al2 = sb2.select(args2, sql2);
	     
	     //学生
	     String sql3 = "select * from t_student where account='"+account+"' and pwd='"+pwd+"'";
		 String args3[] = { "id", "account","pwd","name","banji" };
	     @SuppressWarnings("unused")
		 SelectBean sb3 = new SelectBean();
	     ArrayList al3 = sb3.select(args3, sql3);
	     
	     String nowtimeString=DateFormat.getDateTimeInstance(DateFormat.LONG,DateFormat.LONG).format(new Date()).toString();
	     if(al.size()>0||al2.size()>0||al3.size()>0){
	    	  if(type.equals("管理员")&& al.size()>0){
	 	    	 HttpSession session = request.getSession();
	 	    	 session.setAttribute("id",al.get(0).toString());
	 	    	 session.setAttribute("role",type);
	 	    	 session.setAttribute("name", account);
	 	    	 str = "/index.jsp";
	 	    	 request.setAttribute("message", "管理员登陆成功！");
	 	    	 System.out.println(nowtimeString+account+"管理员登陆成功!");
	 	     }else if (type.equals("教师")&& al2.size()>0){
	 	    	 HttpSession session = request.getSession();
	 	    	 session.setAttribute("id",al2.get(0).toString());
	 	    	 session.setAttribute("role",type);
	 	    	 session.setAttribute("name", al2.get(3).toString());
	 	    	 str = "/index1.jsp";
	 	    	 request.setAttribute("message", "教师登陆成功！");
	 	    	 System.out.println(nowtimeString+account+"教师登陆成功!");
	 	     }else if (type.equals("学生")&& al3.size()>0){
	 	    	 HttpSession session = request.getSession();
	 	    	 session.setAttribute("id",al3.get(0).toString());
	 	    	 session.setAttribute("role",type);
	 	    	 session.setAttribute("name", al3.get(3).toString());
	 	    	 str = "/index2.jsp";
	 	    	 request.setAttribute("message", "学生登陆成功！");
	 	    	 System.out.println(nowtimeString+account+"学生登陆成功!");
	 	     } 
				
		}else{
	     
			str = "/login.jsp";
			request.setAttribute("message", "密码错误，请重新输入！");
	    
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
