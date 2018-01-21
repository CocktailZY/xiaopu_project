package com.zy.action;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

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
import com.zy.dao.ISellDao;
import com.zy.dao.ISellInfoDao;
import com.zy.model.Car;
import com.zy.model.Customer;
import com.zy.model.Goods;
import com.zy.model.Sell;
import com.zy.model.SellInfo;
import com.zy.model.Users;

/**
 * 销售单Action
 * @author lenovo
 *
 */
@Scope("prototype")
@ParentPackage("struts-default")
// 表示继承的父包
@Namespace(value = "/sell")
// 表示当前Action所在命名空间
public class SellAction {
	
	private final Logger log = Logger.getLogger(this.getClass());
	
	private Sell dto;
	private ISellDao dao;
	
	public Sell getDto() {
		return dto;
	}
	public void setDto(Sell dto) {
		this.dto = dto;
	}
	@Resource(name="SellDao")
	public void setDao(ISellDao dao) {
		this.dao = dao;
	}
	
	private IGoodDao goodDao;
	@Resource(name="GoodDao")
	public void setGoodDao(IGoodDao goodDao) {
		this.goodDao = goodDao;
	}
	
	private Car carDto;
	private ICarDao carDao;
	@Resource(name="CarDao")
	public void setCarDao(ICarDao carDao) {
		this.carDao = carDao;
	}
	
	public Car getCarDto() {
		return carDto;
	}
	public void setCarDto(Car carDto) {
		this.carDto = carDto;
	}

	private ICustomerDao cusDao;
	@Resource(name="CustomerDao")
	public void setCusDao(ICustomerDao cusDao) {
		this.cusDao = cusDao;
	}
	private ISellInfoDao sellinfoDao;
	@Resource(name="SellInfoDao")
	public void setSellinfoDao(ISellInfoDao sellinfoDao) {
		this.sellinfoDao = sellinfoDao;
	}
	
	
	
	@Action(value="addCar",results={
			@Result(name="add",location="/view/shopping/shopCar.jsp")
	})
	public String addCar(){
		log.info("SellAction.add------------------------------------start");
		try{
			Users user = (Users)ServletActionContext.getRequest().getSession().getAttribute("login_user");
			String[] goodIds = dto.getGoodsn().split(",");
			String[] nums = dto.getNums().split(",");
			
			Car car1 = null;
			
			int cusid = user.getOtherId();
			Customer cus = cusDao.get(cusid);
			
			f2:for(int i = 0 ;i<goodIds.length;i++){
				Goods goods = goodDao.get(Integer.parseInt(goodIds[i].trim()));//得到商品
				
				car1 = new Car();
				List<Car> list=carDao.listByCusId(cusid);
				
				if(list.size()>0){
					//遍历该采购员要采购的商品
					for(int j=0;j<list.size();j++){
						//如果我要添加的商品的id与采购员要采购的商品id相同
						Car car=null;
						if(Integer.parseInt(goodIds[i])==(list.get(j).getGoods().getId())){
							car=list.get(j);
							car.setNum(String.valueOf(Integer.parseInt(list.get(j).getNum())+Integer.parseInt(nums[i])));
							carDao.update(car);
							continue f2;
						}
					}
					
				}
				car1.setGoods(goods);
				car1.setNum(nums[i]);
				car1.setJprice(goods.getPrice());//得到售价
				car1.setSupplier(goods.getSupplier());
				car1.setCustomer(cus);
				carDao.save(car1);
				
			}
			ServletActionContext.getRequest().setAttribute("carlist", carDao.listByCusId(cusid));
			ServletActionContext.getRequest().setAttribute("customer", cusDao.get(cusid));
			log.info("SellAction.add------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("SellAction.add------------------------------------end");
		return "add";
	}
	
	
	@Action(value="save",results={
			@Result(name="success",location="list.action?flag=1",type="redirectAction")
	})
	public String save(){
		log.info("SellAction.save------------------------------------start");
		try{
			Users user = (Users)ServletActionContext.getRequest().getSession().getAttribute("login_user");
			Date date  = new Date();
			String sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
			
			if(dto.getId()==0){
				
				String ids =  dto.getGoodsn();
				String[] goodIds = ids.split(",");//商品id
				String ts = dto.getNums();
				String[] totals = ts.split(",");//小计
				String num = ServletActionContext.getRequest().getParameter("numm");
				String[] nums = num.split(",");//数量 
				String aprice = dto.getAllprice();//总计
				
				Sell sell = new Sell();
				sell.setCustomer(cusDao.get(user.getOtherId()));
				sell.setStatus(0);
				sell.setTime(sdf);
				sell.setUser(user);
				sell.setAllprice(aprice);//set总价
				dao.save(sell);
				
				SellInfo sellinfo = new SellInfo();
				
				for(int i=0;i<ids.length();i++){
					Goods goods = goodDao.get(Integer.parseInt(goodIds[i].trim()));//得到商品
					goods.setOnNum(goods.getOnNum()-Integer.parseInt(nums[i].trim()));
					goodDao.update(goods);//更新上架数量
					
					List<Car> list = carDao.list(null);
					for(int j = 0;j<list.size();j++){
						sellinfo.setSell(sell);
						
						Car car = new Car();
						car = list.get(j);
						sellinfo.setGoods(car.getGoods());
						sellinfo.setCount(Integer.parseInt(car.getNum()));
						sellinfo.setPrice(car.getJprice());
						sellinfo.setTotal(totals[i].trim());//set小计
						sellinfoDao.save(sellinfo);
						carDao.delete(car);//生成订单后清空购物车
					}
					
				}
				
			}else{
				dao.update(dto);
			}
			log.info("SellAction.save------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("SellAction.save------------------------------------end");
		return "success";
	}
	
	
	@Action(value="update",results={
			@Result(name="update",location="/view/orderType/update.jsp")
	})
	public String update(){
		log.info("SellAction.update------------------------------------start");
		try{
			ServletActionContext.getRequest().setAttribute("dto", dao.get(dto.getId()));
			log.info("SellAction.update------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("SellAction.update------------------------------------end");
		return "update";
	}
	
	@Action(value="delCar",results={
			@Result(name="success",location="/view/shopping/shopCar.jsp")
	})
	public String delCar(){
		log.info("SellAction.delete------------------------------------start");
		Users user = (Users)ServletActionContext.getRequest().getSession().getAttribute("login_user");
		try{
			carDao.delete(carDao.get(carDto.getId()));
			ServletActionContext.getRequest().setAttribute("carlist", carDao.listByCusId(user.getOtherId()));
			ServletActionContext.getRequest().setAttribute("customer", cusDao.get(user.getOtherId()));
			log.info("SellAction.delete------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("SellAction.delete------------------------------------end");
		return "success";
	}
	
	@Action(value="delete",results={
			@Result(name="success",location="list.action",type="redirectAction")
	})
	public String delete(){
		log.info("SellAction.delete------------------------------------start");
		
		try{
			dao.delete(dao.get(dto.getId()));
			log.info("SellAction.delete------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("SellAction.delete------------------------------------end");
		return "success";
	}
	@Action(value="deletecar",results={
			@Result(name="success",location="list.action?flag=2",type="redirectAction")
	})
	public String deletecar(){
		log.info("SellAction.delete------------------------------------start");
		
		try{
			Car car = carDao.get(carDto.getId());
			carDao.delete(car);
			log.info("SellAction.delete------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("SellAction.delete------------------------------------end");
		return "success";
	}
	
	@Action(value="list",results={
			@Result(name="sell",location="/view/shopping/sell_list.jsp"),
			@Result(name="listcar",location="/view/shopping/carlist.jsp")
	})
	public String list(){
		log.info("SellAction.list------------------------------------start");
		try{
			Users user = (Users)ServletActionContext.getRequest().getSession().getAttribute("login_user");
			String flag = ServletActionContext.getRequest().getParameter("flag");
			if("1".equals(flag)){
				ServletActionContext.getRequest().setAttribute("list",dao.listByCusId(user.getOtherId()));
				log.info("SellAction.list------------------------------------success");
				return "sell";
			}else{
				List<Car> list = carDao.listByCusId(user.getOtherId());
				double total = 0 ;
				String ids  = "";
				String nums = "";
				String numms = "";
				String purchs = "";
				for(int i = 0 ; i < list.size() ; i++){
					Car item = list.get(i);
					int num = Integer.parseInt(item.getNum());
					double price = Double.parseDouble(item.getJprice());
					total = total + (num * price);
					ids += item.getGoods().getId() + ",";
					nums += item.getNum() + ",";
					numms += (num * price) + ",";
					purchs += item.getId() + ",";
				}
				ServletActionContext.getRequest().setAttribute("list",list);
				ServletActionContext.getRequest().setAttribute("customer", cusDao.get(user.getOtherId()));
				ServletActionContext.getRequest().setAttribute("total",total);
				ServletActionContext.getRequest().setAttribute("ids",ids);
				ServletActionContext.getRequest().setAttribute("numms",numms);
				ServletActionContext.getRequest().setAttribute("nums",nums);
				ServletActionContext.getRequest().setAttribute("purchs",purchs);
				log.info("SellAction.list------------------------------------success");
				return "listcar";
			}
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("SellAction.list------------------------------------end");
		return "list";
	}
	
	@Action(value="listSellinfo",results={
			@Result(name="list",location="/view/shopping/sellinfo_list.jsp"),
	})
	public String listSellinfo(){
		log.info("SellAction.list------------------------------------start");
		try{
			Users user = (Users)ServletActionContext.getRequest().getSession().getAttribute("login_user");
				ServletActionContext.getRequest().setAttribute("list",sellinfoDao.listBySellId(dto.getId()));
				log.info("SellAction.list------------------------------------success");
		}catch(Exception e){
			log.warn(e.getMessage());
			}
		log.info("SellAction.list------------------------------------end");
		return "list";
	}

}
