package com.a2.ssm.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.a2.ssm.model.General;
import com.a2.ssm.model.OrderDetail;
import com.a2.ssm.model.OrderInfo;
import com.a2.ssm.model.Product;
import com.a2.ssm.model.ProductSpecs;
import com.a2.ssm.model.Shop;
import com.a2.ssm.model.Specs;
import com.a2.ssm.model.TypeSpecs;
import com.a2.ssm.model.User;
import com.a2.ssm.service.OrderDetailService;
import com.a2.ssm.service.OrderInfoService;
import com.a2.ssm.service.ProductService;
import com.a2.ssm.service.ProductSpecsService;
import com.a2.ssm.service.ShopService;
import com.a2.ssm.service.SpecsService;
import com.a2.ssm.service.TypeSpecsService;
import com.a2.ssm.service.UserService;
import com.a2.ssm.util.Page;


/**
 * <p>类名：订单表类</p>
 * <p>类功能描述：该类里存放订单的基本信息</p>
 * @类作者：sun
 * @创建时间：2016-9-2 下午1:46:26
 * @小组：A2小组
 */
@Controller
@RequestMapping("/orderInfo")
public class OrderInfoController {

	@Autowired
	private OrderInfoService orderInfoService;
	@Autowired
	private OrderDetailService orderDetailService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ShopService shopService;
	@Autowired
	private UserService userService;
	@Autowired
	private ProductSpecsService productSpecsService;
	@Autowired
	private TypeSpecsService typeSpecsService;
	@Autowired
	private SpecsService specsService;
	
	/**
	 * <p>方法功能描述：验证用户是否登录</p>
	 * @方法作者：sun
	 * @创建时间：2016-9-2 下午2:00:33
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("orderInfoLogin")
	public ModelAndView orderInfo(HttpServletRequest request){
		User user=(User) request.getSession().getAttribute("loginUser");
		if(user==null){
			return new ModelAndView(new RedirectView("../login.jsp"));
		}
		return new ModelAndView(new RedirectView("../orderInfo/findOrderInfo.do"));
//		mav.setViewName("redirect:../orderInfo/findOrderInfo.do");
//		return mav;
	}
	
	/**
	 * <p>方法功能描述：按照用户ID查找历史记录</p>
	 * @方法作者：sun
	 * @创建时间：2016-9-2 下午1:46:15
	 * @参数：@return    
	 * @返回类型：void
	 * @throws
	 */
	@RequestMapping("findOrderInfo")
	public ModelAndView findOrderInfo(HttpServletRequest request){
		ModelAndView mav=new ModelAndView();
		List <General> order=new ArrayList<General>();
		List<Shop> shopList2=new ArrayList<Shop>();
		/*List<OrderDetail> orderDetailList = null;
		List<Shop> shopList = null;
		List<Product> productList = null;*/
		User user=(User) request.getSession().getAttribute("loginUser");
		General general=null;
		//String[] aa={};
		//Set<String> set = new HashSet();
		int id=user.getuId();
		//查询订单的集合
		List<OrderInfo> orderinfoList=(List<OrderInfo>) orderInfoService.getById(id);
		//aa=new String[orderinfoList.size()];
		
		for(int i=0;i<orderinfoList.size();i++){
			general=new General();
			general.setOrderInfo(orderinfoList.get(i));
			//订单ID
			int id2=orderinfoList.get(i).getoId();
			int id3=orderinfoList.get(i).getoShopid();
/*			for(int h=0;h<orderinfoList.size();h++){
				//店铺ID
				int id3=orderinfoList.get(h).getoShopid();
				aa[h]=id3+"";
			}
			for(int hh=0;hh<aa.length;hh++){
				set.add(aa[i]);
			}
			String[] arrayResult = (String[]) set.toArray(new String[set.size()]);  */

			//查询订单详情的集合
			List<OrderDetail> orderDetailList =orderDetailService.getById(id2);
			for(int j=0;j<orderDetailList.size();j++){
				general.setOrderDetail(orderDetailList.get(j));
			}
			//查询店铺的集合
			Shop shop= shopService.getById(id3);
			general.setShop(shop);
			if(shopList2.size()!=0){
				for(int hh = 0; hh<shopList2.size();hh++){
					int shopId = shopList2.get(hh).getsId();
					if(id3 != shopId){
						shopList2.add(shop);
					}
				}
			}else{
				shopList2.add(shop);
			}
/*			for(int he=0;he<arrayResult.length;he++){
				Shop shop= shopService.getById(Integer.parseInt(arrayResult[he]));
				general.setShop(shop);
				shopList2.add(shop);
			}*/

			for (int m = 0; m < orderDetailList.size(); m++) {
				//产品ID
				int id4=orderDetailList.get(m).getOdProductid();
				//查询产品的集合
				List<Product> productList=productService.getByPid(id4);
				general.setProduct(productList.get(m));
			}
			order.add(general);
		}
			/*shopList2=shopService.getByUid(user.getuId());*/
/*			mav.addObject("orderDetailList", orderDetailList);
			mav.addObject("shopList", shopList);
			mav.addObject("productList", productList);*/
			mav.addObject("order", order);
			mav.addObject("shopList2", shopList2);
			mav.setViewName("order/order");
			return mav;
	}
	
	/**
	 * <p>方法功能描述：利用前台的ajax传要删除的订单ID，对订单的状态修改实现逻辑删除</p>
	 * @方法作者：sun
	 * @创建时间：2016-9-5 上午10:53:49
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("deleteOrderInfo")
	public ModelAndView deleteOrderInfo(HttpServletRequest request){
		int oId=(Integer) request.getAttribute("id");
		OrderInfo dto=new OrderInfo();
		dto.setoId(oId);
		orderInfoService.update(dto);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("order/order");
		return mav;
	}
	
	/**
	 * <p>方法功能描述：提交订单-添加数据库</p>
	 * @方法作者：sun
	 * @创建时间：2016-9-6 上午10:43:02
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("addOrder")
	public ModelAndView addOrder(){
		
		return null;
	}
	@RequestMapping("maijiaorderList")
	public String  maijiaorderList(ModelMap modelMap,
			@RequestParam(value="zheshiid",required=false) String oid,
			@RequestParam(value="zhuangtai",required=false)String zhuangtai,
			@RequestParam(value="pageNum",required = false) String pageNum){
		if(oid!= null && !"".equals(oid)){
			OrderInfo dto = orderInfoService.getByOId(Integer.parseInt(oid));
			dto.setoId(Integer.parseInt(oid));
			dto.setoState(1);
			orderInfoService.updateorder(dto);
			
		}
		//测试数据。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("oShopid", 1);
		if(zhuangtai != null && !"".equals(zhuangtai)){
			map.put("oState", Integer.parseInt(zhuangtai));
			
		}
		int pageNumStr = 1;
		if (pageNum != null && !"".equals(pageNum)) {
			pageNumStr = Integer.parseInt(pageNum);
		}
		List<OrderInfo> orderInfos = orderInfoService.cxListShopId(map);
		Page page = new Page(orderInfos.size(),pageNumStr, 5);
		map.put("rowStart", page.getRowStart());
		map.put("pageSize", page.getPageSize());
		List<OrderInfo> orderInfoss = orderInfoService.cxListShopIdPage(map);
		//测试数据。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
		Shop shop = shopService.getById(1);
		modelMap.put("shop", shop);
		modelMap.put("orderInfos",orderInfos);
		modelMap.put("begin", page.getRowStart());
		if(pageNumStr == page.getPageCount()){
			modelMap.put("end", orderInfos.size()-1);
			
		}else{
			modelMap.put("end", page.getRowStart()+4);
			
		}
		//List<OrderInfo> orderInfos2 = new ArrayList<OrderInfo>();
		List<User> users = new ArrayList<User>();
		for(int i=0;i<orderInfoss.size();i++){
			User user = userService.getById(orderInfoss.get(i).getoUserid());
			users.add(user);
		}
		modelMap.put("users", users);
		modelMap.put("page", page);
		modelMap.put("zhuangtai", zhuangtai);
		return "/order/maijiaorder";
		
	}
	@RequestMapping("maijiaorderListPart")
	public String maijiaorderListPart(ModelMap modelMap,
			@RequestParam(value="partid",required=false) String partid){
		List<OrderDetail> orderDetails = orderDetailService.getByOrderId(Integer.parseInt(partid));
		modelMap.put("end", orderDetails.size());
		modelMap.put("partid", Integer.parseInt(partid));
		modelMap.put("orderDetails", orderDetails);
		List<Product> products = new ArrayList<Product>();
		List<TypeSpecs> typeSpecss = new ArrayList<TypeSpecs>();
		List<Specs> specss = new ArrayList<Specs>();
		for(int i=0;i<orderDetails.size();i++){
			Product product = productService.getById(orderDetails.get(i).getOdProductid());
			products.add(product);
			ProductSpecs productSpecs2 = productSpecsService.getById(orderDetails.get(i).getPsId());
			TypeSpecs typeSpecs = typeSpecsService.getById(productSpecs2.getTsId());
			Specs specs = specsService.getById(productSpecs2.getSpId());
			typeSpecss.add(typeSpecs);
			specss.add(specs);
		}
		modelMap.put("products", products);
		modelMap.put("typeSpecss", typeSpecss);
		modelMap.put("specss", specss);
		
		return "/order/maijiaorderPart";
	}
}
