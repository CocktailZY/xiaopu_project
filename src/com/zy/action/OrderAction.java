package com.zy.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.springframework.context.annotation.Scope;

import com.zy.dao.ICarDao;
import com.zy.dao.ICustomerDao;
import com.zy.dao.IGoodDao;
import com.zy.dao.IGoodToSupplier;
import com.zy.dao.IInventoryDao;
import com.zy.dao.IOrderDao;
import com.zy.dao.IOrderTypeDao;
import com.zy.dao.IOrderinfoDao;
import com.zy.dao.IPurchaseDao;
import com.zy.dao.ISupplierDao;
import com.zy.model.Car;
import com.zy.model.GoodToSupplier;
import com.zy.model.Goods;
import com.zy.model.Inventory;
import com.zy.model.Order;
import com.zy.model.OrderType;
import com.zy.model.Orderinfo;
import com.zy.model.Purchase;
import com.zy.model.Supplier;
import com.zy.model.Users;
import com.zy.util.PageUtil;

@Scope("prototype")
@ParentPackage("struts-default")
//表示继承的父包
@Namespace(value = "/order")
//表示当前Action所在命名空间
public class OrderAction{
	
	private Order dto;
	private IOrderDao dao;
	
	private IGoodDao goodDao;
	
	private Supplier supDto;
	private ISupplierDao supDao;
	
	private IGoodToSupplier gtsDao;

	private IOrderTypeDao orderTypeDao;
	private Orderinfo orderinfoDto;
	private IOrderinfoDao orderinfoDao;
	
	private IPurchaseDao purDao;
	
	private Inventory ivnDto;
	private IInventoryDao ivnDao;
	
	private ICarDao carDao;
	
	private ICustomerDao cusDao;
	
	private int page;
	private final Logger log = Logger.getLogger(this.getClass());
	
	public Order getDto() {
		return dto;
	}
	public void setDto(Order dto) {
		this.dto = dto;
	}

	
	public Inventory getIvnDto() {
		return ivnDto;
	}
	public void setIvnDto(Inventory ivnDto) {
		this.ivnDto = ivnDto;
	}
	public Supplier getSupDto() {
		return supDto;
	}
	public void setSupDto(Supplier supDto) {
		this.supDto = supDto;
	}
	
	public Orderinfo getOrderinfoDto() {
		return orderinfoDto;
	}
	public void setOrderinfoDto(Orderinfo orderinfoDto) {
		this.orderinfoDto = orderinfoDto;
	}
	
	@Resource(name="OrderDao")
	public void setDao(IOrderDao dao) {
		this.dao = dao;
	}
	@Resource(name="GoodDao")	
	public void setGoodDao(IGoodDao goodDao) {
		this.goodDao = goodDao;
	}
	@Resource(name="SupplierDao")
	public void setSupDao(ISupplierDao supDao) {
		this.supDao = supDao;
	}
	@Resource(name="GoodToSupplierDao")
	public void setGtsDao(IGoodToSupplier gtsDao) {
		this.gtsDao = gtsDao;
	}
	@Resource(name="OrderTypeDao")
	public void setOrderTypeDao(IOrderTypeDao orderTypeDao) {
		this.orderTypeDao = orderTypeDao;
	}
	@Resource(name="OrderinfoDao")
	public void setOrderinfoDao(IOrderinfoDao orderinfoDao) {
		this.orderinfoDao = orderinfoDao;
	}
	@Resource(name="PurchaseDao")
	public void setPurDao(IPurchaseDao purDao) {
		this.purDao = purDao;
	}
	@Resource(name="InventoryDao")
	public void setIvnDao(IInventoryDao ivnDao) {
		this.ivnDao = ivnDao;
	}
	@Resource(name="CarDao")
	public void setCarDao(ICarDao carDao) {
		this.carDao = carDao;
	}
	@Resource(name="CustomerDao")
	public void setCusDao(ICustomerDao cusDao) {
		this.cusDao = cusDao;
	}
	//	/**
//	 * 增加订单信息
//	 * @return
//	 */
//	@Action(value="add",results={
//			@Result(name="add",location="/view/order/add.jsp")
//	})
//	public String add(){
//		log.info("OrderAction.add----------strat---------");
//		try {
//			ServletActionContext.getRequest().setAttribute("suplist",supDao.list(null));
//			log.info("OrderAction.add----------success---------");
//		} catch (Exception e) {
//			log.warn(e.getMessage());
//		}
//		log.info("OrderAction.add----------end---------");
//		return "add";	
//	}
	/**
	 * 进入修改页面
	 * @return
	 */
	@Action(value="update",results={
			@Result(name="user_update",location="/view/order/update.jsp")
	})
	public String update() {
		log.info("OrderAction.update----------strat---------");
		try {
//			ServletActionContext.getRequest().setAttribute("list",roleDao.list(null));
//			ServletActionContext.getRequest().setAttribute("dto",userDao.get(dto.getId()));
			log.info("OrderAction.update----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("OrderAction.update----------end---------");
		return "user_update";
	}
	/**
	 * 保存采购信息
	 * @return
	 */
	@Action(value="save",results={
			@Result(name="success",location="list.action",type="redirectAction"),
			@Result(name="car",location="../purchase/list.action",type="redirectAction")
	})
	public String save() {
		log.info("OrderAction.save----------strat---------");
//		dto.setRole(roleDao.get(dto.getRole().getId()));
		Users user=(Users) ServletActionContext.getRequest().getSession().getAttribute("login_user");
		String goodId = ServletActionContext.getRequest().getParameter("qqq");//获取商品id
		String supId = ServletActionContext.getRequest().getParameter("aaa");//获取供货商信息
		
		try {
			if (dto.getId() == 0) {
				String ids[] = dto.getCount().split(",");//数量
				String jp[] = orderinfoDto.getJprice().split(",");//进价
				String sups[] = supId.split(",");//供货商id
				for (int i = 0; i < ids.length; i++) {
					if (ids[i] != null && !ids.equals("")) {
						Car car = new Car();
						Goods good = goodDao.get(Integer.parseInt(goodId));
						good.setSupplier(supDao.get(Integer.parseInt(sups[i])));
						//这里需要判断购物车中是否有
						car.setGoods(good);
						car.setNum(ids[i]);
						car.setJprice(jp[i]);
						car.setSupplier(good.getSupplier());
						car.setCustomer(cusDao.get(user.getOtherId()));
						carDao.save(car);
						
						
					}
				}
				Purchase pur =purDao.getByGUId(Integer.parseInt(goodId),user.getId()); 
				purDao.delete(pur);
				return "car";
				
			}else{
				dao.update(dto);
			}
			ServletActionContext.getRequest().setAttribute("dto",dto);
			log.info("OrderAction.save----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
			ServletActionContext.getRequest().setAttribute("mes","新增或修改失败");
		}
		log.info("OrderAction.save----------end---------");
		return "success";
	}
	
	/**
	 * 保存订单信息
	 * @return
	 */
	@Action(value="saveOrder",results={
			@Result(name="success",location="list.action",type="redirectAction"),
	})
	public String saveOrder() {
		log.info("OrderAction.save----------strat---------");
//		dto.setRole(roleDao.get(dto.getRole().getId()));
		Order order = new Order();
		Date date = new Date();
		OrderType gt = orderTypeDao.get(dto.getOrderType().getId());
		String sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		Users user=(Users) ServletActionContext.getRequest().getSession().getAttribute("login_user");
		
		
		Orderinfo orderinfo = new Orderinfo();
		
		try {
			if (dto.getId() == 0) {
				order.setOrderTime(sdf);
				order.setOrderType(gt);
				order.setStatus(0);
				order.setUser(user);
				dao.save(order);
				
				List<Car> list = carDao.list(null);
				for(int i = 0;i<list.size();i++){
					orderinfo.setOrder(order);
					
					
					Car car = new Car();
					car = list.get(i);
					orderinfo.setGoods(car.getGoods());
					orderinfo.setCount(car.getNum());
					orderinfo.setJprice(car.getJprice());
					orderinfo.setSupplier(car.getSupplier());
					orderinfoDao.save(orderinfo);
					carDao.delete(car);//生成订单后清空购物车
				}
				
				
			}else{
				dao.update(dto);
			}
			log.info("OrderAction.save----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
			ServletActionContext.getRequest().setAttribute("mes","新增或修改失败");
		}
		log.info("OrderAction.save----------end---------");
		return "success";
	}
	
	/**
	 * 保存订单信息
	 * @return
	 */
	@Action(value="saveOrderOut",results={
			@Result(name="success",location="list.action",type="redirectAction"),
	})
	public String saveOrderOut() {
		log.info("OrderAction.save----------strat---------");
//		dto.setRole(roleDao.get(dto.getRole().getId()));
		String[] goodIds = dto.getName().split(",");//取出商品编号
		String[] counts = dto.getNum().split(",");//取出数量
		String[] prices = ivnDto.getJprice().split(",");//设置商品售价，取出进价
		
		Order order = new Order();
		Date date = new Date();
		OrderType gt = orderTypeDao.get(2);//出库单
		String sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
		Users user=(Users) ServletActionContext.getRequest().getSession().getAttribute("login_user");
		
		
		Orderinfo orderinfo = new Orderinfo();
		
		try {
			if (dto.getId() == 0) {
				order.setOrderTime(sdf);
				order.setOrderType(gt);
				order.setStatus(0);
				order.setUser(user);
				dao.save(order);//添加订单
				
				for(int i=0;i<goodIds.length;i++){
					orderinfo.setOrder(order);
					
					Goods goods = goodDao.get(Integer.parseInt(goodIds[i].trim()));
					orderinfo.setGoods(goods);
					orderinfo.setCount(counts[i].trim());
					orderinfo.setJprice(prices[i].trim());
					
					GoodToSupplier gts = gtsDao.getByPG(orderinfo.getJprice(), orderinfo.getGoods().getId());
					Supplier sup = supDao.get(gts.getSupplier().getId());
					orderinfo.setSupplier(sup);
					orderinfoDao.save(orderinfo);
				}
				
			}else{
				dao.update(dto);
			}
			ServletActionContext.getRequest().setAttribute("dto",dto);
			log.info("OrderAction.save----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
			ServletActionContext.getRequest().setAttribute("mes","新增或修改失败");
		}
		log.info("OrderAction.save----------end---------");
		return "success";
	}
	
	
	/**
	 * 删除用户信息
	 * @return
	 */
	@Action(value="delete",results={
			@Result(name="success",location="list.action",type="redirectAction")
	})
	public String delete() {
		log.info("OrderAction.delete----------strat---------");
		try {
			
			dao.delete(dao.get(dto.getId()));
			
			log.info("OrderAction.delete----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
			ServletActionContext.getRequest().setAttribute("mes","删除失败");
		}
		log.info("OrderAction.delete----------end---------");
		return "success";
	}

	/**
	 * 查询所有
	 * @param dto
	 * @return
	 */
	@Action(value="list",results={
			@Result(name="list",location="/view/order/list.jsp")
	})
	public String list() {
		log.info("OrderAction.list----------strat---------");
		try {
			
			Users user = (Users)ServletActionContext.getRequest().getSession().getAttribute("login_user");
			PageUtil pageModel = new PageUtil();
			if ((String) ServletActionContext.getRequest().getParameter("page") == null) {
				pageModel.setPage(1);
			} else {
				 page = Integer.parseInt((String) ServletActionContext.getRequest().getParameter("page"));
				if (page != 0) {
					pageModel.setPage(page);
				}
			}
			
			if(user.getRole().getId()!=2 && user.getRole().getId()!=3){
				pageModel.setTotalCount(dao.count("select count(*) from Order g where g.orderType.id="+dto.getOrderType().getId())); // 数据总条数
				pageModel.setPageSize(5);// 设置页面显示最大 值
				pageModel.setNum(3); // 设置当前页的前后距离
				HttpServletRequest request = ServletActionContext.getRequest();
				List<Order> aboutList = (List<Order>) dao.listPage("from Order g where g.orderType.id='"+dto.getOrderType().getId()+"'", page, 5);
				pageModel.setItems(aboutList);
				request.setAttribute("count", aboutList.size());// 放置在request中
				request.setAttribute("pageModel", pageModel);
				request.setAttribute("page", pageModel.getPage());
			}else{
				if(user.getRole().getId()==2){
					pageModel.setTotalCount(dao.count("select count(*) from Order g where g.orderType.id=1")); // 数据总条数
					pageModel.setPageSize(5);// 设置页面显示最大 值
					pageModel.setNum(3); // 设置当前页的前后距离
					HttpServletRequest request = ServletActionContext.getRequest();
					List<Order> aboutList = (List<Order>) dao.listPage("from Order g where g.orderType.id=1 and user.id="+user.getId(), page, 5);
					pageModel.setItems(aboutList);
					request.setAttribute("count", aboutList.size());// 放置在request中
					request.setAttribute("pageModel", pageModel);
					request.setAttribute("page", pageModel.getPage());
				}else{
					if(user.getRole().getId()==3){
						pageModel.setTotalCount(dao.count("select count(*) from Order g where g.orderType.id=2")); // 数据总条数
						pageModel.setPageSize(5);// 设置页面显示最大 值
						pageModel.setNum(3); // 设置当前页的前后距离
						HttpServletRequest request = ServletActionContext.getRequest();
						List<Order> aboutList = (List<Order>) dao.listPage("from Order g where g.orderType.id=2 and user.id="+user.getId(), page, 5);
						pageModel.setItems(aboutList);
						request.setAttribute("count", aboutList.size());// 放置在request中
						request.setAttribute("pageModel", pageModel);
						request.setAttribute("page", pageModel.getPage());
						
					}
				}
				
			}
//			ServletActionContext.getRequest().getSession().setAttribute("orderType", dto.getOrderType().getId());
			log.info("OrderAction.list----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("OrderAction.list----------end---------");
		return "list";
	}
	
//	/**
//	 * 按类型查询所有
//	 * @param dto
//	 * @return
//	 */
//	@Action(value="listd",results={
//			@Result(name="list",location="/view/order/list.jsp")
//	})
//	public String listd() {
//		log.info("OrderAction.list----------strat---------");
//		try {
//			
//			Users user = (Users)ServletActionContext.getRequest().getSession().getAttribute("login_user");
//			if(user.getRole().getId()==2){
//				ServletActionContext.getRequest().setAttribute("list",dao.listByType(1));
//			}else{
//				ServletActionContext.getRequest().setAttribute("list",dao.listByType(2));
//			}
////			ServletActionContext.getRequest().getSession().setAttribute("orderType", dto.getOrderType().getId());
//			log.info("OrderAction.list----------success---------");
//		} catch (Exception e) {
//			log.warn(e.getMessage());
//		}
//		log.info("OrderAction.list----------end---------");
//		return "list";
//	}
	
	/**
	 * 根据id查询订单详情
	 * @return
	 */
	@Action(value="listOrderId",results={
			@Result(name="list",location="/view/order/orderinfolist.jsp")
	})
	public String listOrderId(){
		log.info("OrderAction.list----------strat---------");
		try {
			PageUtil pageModel = new PageUtil();
			if ((String) ServletActionContext.getRequest().getParameter("page") == null) {
				pageModel.setPage(1);
			} else {
				 page = Integer.parseInt((String) ServletActionContext.getRequest().getParameter("page"));
				if (page != 0) {
					pageModel.setPage(page);
				}
			}
			pageModel.setTotalCount(orderinfoDao.count("select count(*) from Orderinfo g where g.order.id="+dto.getId())); // 数据总条数
			pageModel.setPageSize(5);// 设置页面显示最大 值
			pageModel.setNum(3); // 设置当前页的前后距离
			HttpServletRequest request = ServletActionContext.getRequest();
			List<Orderinfo> aboutList = (List<Orderinfo>) orderinfoDao.listPage("from Orderinfo g where g.order.id="+dto.getId(), page, 5);
			pageModel.setItems(aboutList);
			request.setAttribute("count", aboutList.size());// 放置在request中
			request.setAttribute("pageModel", pageModel);
			request.setAttribute("page", pageModel.getPage());
			
			ServletActionContext.getRequest().setAttribute("orderdto",dao.get(dto.getId()));
			
			
			
			
			log.info("OrderAction.list----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("OrderAction.list----------end---------");
		return "list";
	}
	
	
	/**
	 * 修改订单状态
	 * @return
	 */
	@Action(value="qxsj",results={
			@Result(name="qxsj",location="/view/order/list.jsp")
	})
	public String qxsj(){
		log.info("GoodsAction.list----------strat---------");
		
		try {
			int id1 = Integer.parseInt(dto.getCount().split(",")[0]);// 获取id
			Order g = dao.get(id1);//根据订单编号取出订单
			String[] goodIds = orderinfoDto.getGoods().getGoodsn().split(",");//取出商品编号
			String[] counts = orderinfoDto.getCount().split(",");//取出数量
			String[] prices = dto.getPrice().split(",");//设置商品售价，取出进价
			if(g.getStatus()==0){
				g.setStatus(1);//修改订单状态
				int id =g.getOrderType().getId();
				if(id == 1){//类型为入库单
					for(int i = 0; i < goodIds.length; i++){
						int goodId = Integer.parseInt(goodIds[i].trim());//将商品id转为int类型
						if(goodIds[i] != null && !goodIds.equals("")){
							Goods good = goodDao.get(goodId);//根据id取出商品
							Inventory ivn = ivnDao.listByGoodId(goodId, 1);//根据商品id得到库存，这里默认仓库为1号仓库
							String num = String.valueOf(Integer.parseInt(ivn.getNum())+Integer.parseInt(counts[i].trim()));
							ivn.setNum(num);//设置数量
							ivn.setJprice(prices[i].trim());//设置进价
							ivnDao.update(ivn);
						}
					}
				}else{//订单类型为出库单
					for(int i = 0; i < goodIds.length; i++){
						int goodId = Integer.parseInt(goodIds[i].trim());//将商品id转为int类型
						if(goodIds[i] != null && !goodIds.equals("")){
							Goods good = goodDao.get(goodId);//根据id取出商品
							Inventory ivn = ivnDao.listByGoodId(goodId, 1);//根据商品id得到库存，这里默认仓库为1号仓库
							String num = String.valueOf(Integer.parseInt(ivn.getNum())-Integer.parseInt(counts[i].trim()));
							ivn.setNum(num);//设置数量
							
							ivnDao.update(ivn);
							//库存数量减少的同时商品表中该商品的数量增加但不修改状态
							
							good.setOnNum(good.getOnNum()+Integer.parseInt(counts[i].trim()));//上架数量增加
							good.setPrice(String.valueOf(Double.valueOf(ivn.getJprice())*1.5));//售价是进价的1.5倍
							goodDao.update(good);
						}
					}
					
				}
			}
			dao.update(g);
			String orderTypeId= dto.getOrderTime();//获取订单类型
			int tid = Integer.parseInt(orderTypeId.split(",")[0]);
			PageUtil pageModel = new PageUtil();
			if ((String) ServletActionContext.getRequest().getParameter("page") == null) {
				pageModel.setPage(1);
			} else {
				 page = Integer.parseInt((String) ServletActionContext.getRequest().getParameter("page"));
				if (page != 0) {
					pageModel.setPage(page);
				}
			}
			pageModel.setTotalCount(dao.count("select count(*) from Order g where g.orderType.id="+dto.getOrderType().getId())); // 数据总条数
			pageModel.setPageSize(5);// 设置页面显示最大 值
			pageModel.setNum(3); // 设置当前页的前后距离
			HttpServletRequest request = ServletActionContext.getRequest();
			List<Order> aboutList = (List<Order>) dao.listPage("from Order g where g.orderType.id='"+dto.getOrderType().getId()+"'", page, 5);
			pageModel.setItems(aboutList);
			request.setAttribute("count", aboutList.size());// 放置在request中
			request.setAttribute("pageModel", pageModel);
			request.setAttribute("page", pageModel.getPage());
			
			log.info("GoodsAction.list----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GoodsAction.list----------end---------");
		return "qxsj";
	}
	
	/**
	 * 修改订单状态
	 * @return
	 *//*
	@Action(value="qxsjq",results={
			@Result(name="qxsjq",location="/view/order/list.jsp")
	})
	public String qxsjq(){
		log.info("GoodsAction.list----------strat---------");
		
		try {
			int id1 = Integer.parseInt(dto.getCount().split(",")[0]);// 获取id
			Order g = dao.get(id1);//根据订单编号取出订单
			String[] goodIds = dto.getName().split(",");//取出商品编号
			String[] counts = dto.getNum().split(",");//取出数量
			String[] prices = ivnDto.getJprice().split(",");//设置商品售价，取出进价
			if(g.getStatus()==0){
				g.setStatus(1);//修改订单状态
				int id =g.getOrderType().getId();
				if(id == 1){//类型为入库单
					for(int i = 0; i < goodIds.length; i++){
						int goodId = Integer.parseInt(goodIds[i].trim());//将商品id转为int类型
						if(goodIds[i] != null && !goodIds.equals("")){
							Goods good = goodDao.get(goodId);//根据id取出商品
							Inventory ivn = ivnDao.listByGoodId(goodId, 1);//根据商品id得到库存，这里默认仓库为1号仓库
							String num = String.valueOf(Integer.parseInt(ivn.getNum())+Integer.parseInt(counts[i].trim()));
							ivn.setNum(num);//??????设置数量
							ivn.setJprice(prices[i].trim());//设置进价
							ivnDao.update(ivn);
						}
					}
				}else{//订单类型为出库单
					for(int i = 0; i < goodIds.length; i++){
						int goodId = Integer.parseInt(goodIds[i].trim());//将商品id转为int类型
						if(goodIds[i] != null && !goodIds.equals("")){
							Goods good = goodDao.get(goodId);//根据id取出商品
							Inventory ivn = ivnDao.listByGoodId(goodId, 1);//根据商品id得到库存，这里默认仓库为1号仓库
							String num = String.valueOf(Integer.parseInt(ivn.getNum())-Integer.parseInt(counts[i].trim()));
							ivn.setNum(num);//设置数量
							
							ivnDao.update(ivn);
							//库存数量减少的同时商品表中该商品的数量增加但不修改状态
							
							good.setOnNum(good.getOnNum()+Integer.parseInt(counts[i].trim()));//上架数量增加
							good.setPrice(Double.valueOf(ivnDto.getJprice())*1.5);//售价是进价的1.5倍
							goodDao.update(good);
						}
					}
					
				}
			}
			dao.update(g);
			String orderTypeId= dto.getOrderTime();//获取订单类型
			int tid = Integer.parseInt(orderTypeId.split(",")[0]);
			ServletActionContext.getRequest().setAttribute("list",dao.listByType(tid));
			
			log.info("GoodsAction.list----------success---------");
		} catch (Exception e) {
			log.warn(e.getMessage());
		}
		log.info("GoodsAction.list----------end---------");
		return "qxsjq";
	}*/
	

}
