package com.zy.action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.context.annotation.Scope;

import com.zy.dao.IGoodDao;
import com.zy.dao.IInventoryDao;
import com.zy.dao.IOrderTypeDao;
import com.zy.dao.IPurchaseDao;
import com.zy.dao.IUserDao;
import com.zy.model.Goods;
import com.zy.model.OrderType;
import com.zy.model.Purchase;
import com.zy.model.Role;
import com.zy.model.Users;
import com.zy.util.PageUtil;

@ParentPackage("struts-default")
@Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
@Namespace("/purchase")
public class PurchaseAction {
	private Purchase dto;
	private IPurchaseDao dao;
	private IInventoryDao inventoryDao;
	private IUserDao userDao;
	private IGoodDao goodDao;
	private IOrderTypeDao otDao;
	private OrderType orderTypeDto;

	private int page;

	public Purchase getDto() {
		return dto;
	}
	public void setDto(Purchase dto) {
		this.dto = dto;
	}
	
	public OrderType getOrderTypeDto() {
		return orderTypeDto;
	}
	public void setOrderTypeDto(OrderType orderTypeDto) {
		this.orderTypeDto = orderTypeDto;
	}
	@Resource(name="PurchaseDao")
	public void setDao(IPurchaseDao dao) {
		this.dao = dao;
	}
	@Resource(name="InventoryDao")
	public void setInventoryDao(IInventoryDao inventoryDao) {
		this.inventoryDao = inventoryDao;
	}
	@Resource(name="UserDao")
	public void setUserDao(IUserDao userDao) {
		this.userDao = userDao;
	}
	@Resource(name="GoodDao")
	public void setGoodDao(IGoodDao goodDao) {
		this.goodDao = goodDao;
	}
	@Resource(name="OrderTypeDao")
	public void setOtDao(IOrderTypeDao otDao) {
		this.otDao = otDao;
	}
	@Action(value="addcg",results={
			@Result(name="add",location="/view/order/cg.jsp")
	})
	public String addcg(){
		Users user =(Users)ServletActionContext.getRequest().getSession().getAttribute("login_user");
		if(user.getRole().getId()==4){
			ServletActionContext.getRequest().setAttribute("ulist", userDao.getByRoleId(2));
		}else{
			ServletActionContext.getRequest().setAttribute("ulist", userDao.getByRoleId(3));
		}
		
		ServletActionContext.getRequest().setAttribute("otlist", otDao.list(null));
		
		ServletActionContext.getRequest().setAttribute("kclist", inventoryDao.list(null));
		return "add";
	}
	@Action(value="add",results={
			@Result(name="add",type="redirectAction",location="list.action")
	})
	public String add(){
		//通过页面传递过来的name属性接收商品id并分割
		String commodityids=dto.getName();
		String ids[]=commodityids.split(",");
		//通过页面传递过来的num属性接收采购数量并分割
		String nums=dto.getNum();
		String nums1[]=nums.split(",");
		//声明一个采购单对象
		Purchase purchase1=null;
		//获取页面传递过来的user
		int userid=dto.getUser().getId();
		Users user=userDao.get(userid);
		//遍历存放商品id的数组
		
		f2:for(int i=0;i<ids.length;i++){
			//通过商品id把商品取出来
			Goods commodity=goodDao.get(Integer.parseInt(ids[i]));
			//新建一个采购单对象
			purchase1=new Purchase();
			//向采购单添加商品的时候如果该商品存在则加上数量 如果不存在则添加
			//这个list放的是这个采购员需要采购的商品
			List<Purchase> list=dao.listByUserId(userid);
			if(list.size()>0){
				//遍历该采购员要采购的商品
				for(int j=0;j<list.size();j++){
					//如果我要添加的商品的id与采购员要采购的商品id相同
					Purchase purchase=null;
					if(Integer.parseInt(ids[i])==(list.get(j).getGoods().getId())){
						purchase=list.get(j);
						purchase.setNum(String.valueOf(Integer.parseInt(list.get(j).getNum())+Integer.parseInt(nums1[i])));
						dao.update(purchase);
						continue f2;
					}
				}
				
			}
			purchase1.setGoods(commodity);
			purchase1.setNum(nums1[i]);
			purchase1.setUser(user);
			dao.save(purchase1);
		}
		return "add";
	}
	
	@Action(value="delete",results={
			@Result(name="delete",type="redirectAction",location="list.action")
	})
	public String delete(){
		dao.delete(dto);
		return "delete";
	}
	
	@Action(value="list",results={
			@Result(name="list",location="/view/order/cglist.jsp"),
			@Result(name="cgy",location="/view/order/plist.jsp")
			
	})
	public String list(){
		PageUtil pageModel = new PageUtil();
		if ((String) ServletActionContext.getRequest().getParameter("page") == null) {
			pageModel.setPage(1);
		} else {
			 page = Integer.parseInt((String) ServletActionContext.getRequest().getParameter("page"));
			if (page != 0) {
				pageModel.setPage(page);
			}
		}
		pageModel.setTotalCount(dao.count("select count(*) from Purchase")); // 数据总条数
		pageModel.setPageSize(5);// 设置页面显示最大 值
		pageModel.setNum(3); // 设置当前页的前后距离
		HttpServletRequest request = ServletActionContext.getRequest();
		List<Purchase> aboutList = (List<Purchase>) dao.listPage("from Purchase", page, 5);
		pageModel.setItems(aboutList);
		request.setAttribute("count", aboutList.size());// 放置在request中
		request.setAttribute("pageModel", pageModel);
		request.setAttribute("page", pageModel.getPage());
		
		if(aboutList.size()==0){
			int info = 0;
			ServletActionContext.getRequest().setAttribute("info", info);
		}else{
			int info = 1;
			ServletActionContext.getRequest().setAttribute("info", info);
		}
		
		Users user=(Users) ServletActionContext.getRequest().getSession().getAttribute("login_user");
		int roleId = user.getRole().getId();
		if(roleId == 2 || roleId == 3){
			List<Purchase> aboutList1 = (List<Purchase>) dao.listPage("from Purchase where user.id="+user.getId(), page, 5);
			pageModel.setItems(aboutList);
			request.setAttribute("count", aboutList1.size());// 放置在request中
			request.setAttribute("pageModel", pageModel);
			request.setAttribute("page", pageModel.getPage());
			
			if(aboutList1.size()==0){
				int info = 0;
				ServletActionContext.getRequest().setAttribute("info", info);
			}else{
				int info = 1;
				ServletActionContext.getRequest().setAttribute("info", info);
			}
			
			return "cgy";
		}
		return "list";
	}
	
	
	
}

