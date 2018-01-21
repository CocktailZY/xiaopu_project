package com.zy.action;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;

import com.zy.dao.ICustomerDao;
import com.zy.dao.IRoleDao;
import com.zy.dao.IUserDao;
import com.zy.model.Customer;
import com.zy.model.Users;

@Namespace("/customer")
@ParentPackage("struts-default")
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
public class CustomerAction {
	private Customer customer;
	private Users user;
	private ICustomerDao customerDAO;
	private IUserDao userDAO;
	private IRoleDao roleDAO;
	public Customer getCustomer() {
		return customer;
	}
	
	public Users getUser() {
		return user;
	}

	public void setUser(Users user) {
		this.user = user;
	}


	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	@Resource(name="CustomerDao")
	public void setCustomerDAO(ICustomerDao customerDAO) {
		this.customerDAO = customerDAO;
	}
	@Resource(name="UserDao")
	public void setUserDAO(IUserDao userDAO) {
		this.userDAO = userDAO;
	}
	@Resource(name="RoleDao")
	public void setRoleDAO(IRoleDao roleDAO) {
		this.roleDAO = roleDAO;
	}
	//action 注解
	/**
	 * 保存一个客户信息，并把对应用户的信息保存
	 * @return
	 */
	@Action(value="customerAction_add",results={
			@Result(name="add",type="redirectAction",location="customerAction_list.action")
	})
	public String add(){
		customerDAO.save(customer);
		Users user=new Users();
		user.setUsername(customer.getName());
		user.setPassword("123456");
		
		user.setOtherId(customer.getId());
		user.setRole(roleDAO.get(6));//给用户的角色设置为客户
		userDAO.save(user);
		return "add";
	}
	
	@Action(value="customerAction_list",results={
			@Result(name="list",location="/view/customer/customerlist.jsp"),
			@Result(name="cus",location="../good/list.action?dto.status=1",type="redirectAction")
	})
	public String list(){
		Users user = (Users)ServletActionContext.getRequest().getSession().getAttribute("login_user");
		List<Customer> list=customerDAO.list(null);
		ServletActionContext.getRequest().setAttribute("list", list);
		if(user.getRole().getId()==6){
			return "cus";
		}
			
		return "list";
	}
	
	
	/**
	 * 删除一个客户的信息
	 * @return
	 */
	@Action(value="customerAction_delete", results={
			@Result(name="delete",type="redirectAction",location="customerAction_list.action")
	})
	public String delete(){
		String customerid=ServletActionContext.getRequest().getParameter("customerid");
		customerDAO.delete(customerDAO.get(Integer.parseInt(customerid)));
		return "delete";
	}
	
	
	
	/**
	 * 修改一个客户的信息
	 * @return
	 */
	@Action(value="customerAction_update", results={
			@Result(name="update",type="redirectAction",location="customerAction_list.action")
	})
	public String update(){
		Users user1 =(Users) ServletActionContext.getRequest().getSession().getAttribute("login_user");
		String password = user.getPassword();
		user1.setPassword(password);
		userDAO.update(user1);
		customerDAO.update(customer);
		return "update";
	}
	
	@Action(value="customerAction_edit", results={
			@Result(name="edit",location="/view/customer/updatecustomer.jsp")
	})
	public String edit(){
		String customerid=ServletActionContext.getRequest().getParameter("customerid");
		ServletActionContext.getRequest().setAttribute("customer", customerDAO.get(Integer.parseInt(customerid)));
		return "edit";
	}
	
}
