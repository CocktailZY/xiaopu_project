package com.a2.ssm.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.a2.ssm.model.Cart;
import com.a2.ssm.model.General;
import com.a2.ssm.model.Product;
import com.a2.ssm.model.Shop;
import com.a2.ssm.model.Specs;
import com.a2.ssm.model.User;
import com.a2.ssm.service.CartService;
import com.a2.ssm.service.ProductService;
import com.a2.ssm.service.ShopService;
import com.a2.ssm.service.SpecsService;



@Controller
@RequestMapping("/cart")
public class CartController{

	@Autowired
	private CartService cartService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ShopService shopService;
	@Autowired
	private SpecsService specsService;
	/**
	 * 
	 * <p>购物车验证是否登录：</p>
	 * @方法作者：sun
	 * @创建时间：2016-8-30 下午4:19:34
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */

	@RequestMapping("cartLogin")
	public String cart(HttpServletRequest request){
		User user=(User) request.getSession().getAttribute("loginUser");

		if(user!=null){
			return "redirect:../cart/findAllCart.do";
		}
		return "redirect:../login.jsp";
	}
	/**
	 * 
	 * <p>创建购物车：</p>
	 * @方法作者：sun
	 * @创建时间：2016-8-30 下午4:19:34
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("addCart")
	public String addCart(HttpServletRequest request){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		String time=sdf.format(new Date());
		//session接受前面传递管来的cart对象
		User user=(User) request.getSession().getAttribute("loginUser");
		//获得产品的ID
		//String pid=request.getParameter("pid");
		 int id =user.getuId();
		//int id=cart.getcUserid();
		List<Cart> cartList=(List<Cart>) cartService.getById(id);
		if(cartList.size()>0){
			for (int i = 0; i < cartList.size(); i++) {
				if(cartList.get(i).getcProductid().equals(1)){
					Cart cart = cartList.get(i);
					String num=cart.getcNum();
					int sum=Integer.parseInt(num)+1;
					String num1 = String.valueOf(sum);
					cart.setcNum(num1);
					cartService.update(cart);
					return "redirect:/view/shop/cart.jsp";
				}
			}
		}else{
			Cart cart=new Cart();
			cart.setcProductid(2);
			cart.setcNum("10");
			cart.setcUserid(2);
			cart.setcCreatetime(time);
			cartService.save(cart);
			return "redirect:/view/shop/cart.jsp";
		}
		return null;
	}
	
	/**
	 * 
	 * <p>方法描述：删除用户对应产品编号的购物车信息</p>
	 * @方法作者：sun
	 * @创建时间：2016-8-30 下午4:19:34
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("deleteCart")
	public String deleteCart(HttpServletRequest request){
		String cid=request.getParameter("cid");
		cartService.delete(Integer.parseInt(cid));
		return "redirect:/cart/findAllCart.do";
	}
	
	/**
	 * 
	 * <p>添加产品数量：</p>
	 * @方法作者：sun
	 * @创建时间：2016-8-30 下午4:19:34
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("addCartNum")
	public String addCartNum(){
		//通过用户	ID查购物车列表
		//通过产品id遍历刚出来的购物车列表
		//别忘了算钱 没上限 哇哈哈！！
		int userid=1;
		int pid=1;
		 List<Cart>  cartList=cartService.getById(userid);
		 for (int i = 0; i < cartList.size(); i++) {
			int pid2= cartList.get(i).getcProductid();
			if(pid2==pid){
				int num=Integer.parseInt(cartList.get(i).getcNum());
				int sum=num+1;
				Cart cart=cartList.get(i);
				cart.setcNum(String.valueOf(sum));
				cartService.update(cart);
			} 
		}
		 return "redirect:/view/shop/card.jsp";
	}
	
	/**
	 * 
	 * <p>减去产品数量：</p>
	 * @方法作者：sun
	 * @创建时间：2016-8-30 下午4:19:34
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("deleteCartNum")
	public String deleteCartNum(){
		int userid=1;
		int pid=1;
		 List<Cart>  cartList=cartService.getById(userid);
		 for (int i = 0; i < cartList.size(); i++) {
			int pid2= cartList.get(i).getcProductid();
			if(pid2==pid){
				int num=Integer.parseInt(cartList.get(i).getcNum());
				int sum=num-1;
				if(sum<0){
					sum=0;
					Cart cart=cartList.get(i);
					cart.setcNum(String.valueOf(sum));
					cartService.update(cart);
				}else{
					Cart cart=cartList.get(i);
					cart.setcNum(String.valueOf(sum));
					cartService.update(cart);
				}
			} 
		}
		 return "redirect:/view/shop/card.jsp";
	}
	
	/**
	 * <p>方法功能描述：查看某个用户的购物车列表</p>
	 * @方法作者：sun
	 * @创建时间：2016-9-2 上午9:03:11
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("findAllCart")
	public ModelAndView findAllCart(HttpServletRequest request){
		User user=(User) request.getSession().getAttribute("loginUser");
		General general=null;
		List<General> generalList=new ArrayList<General>();
		int id=user.getuId();
		List<Cart> cartList=cartService.getById(id);
		
		//如果该用户返回的list是空，就去cartnull页面
		if(cartList.size()==0){
			return new ModelAndView(new RedirectView("../view/shop/cartnull.jsp"));
		}
		for(int i=0;i<cartList.size();i++){
			general =new General();
			general.setCart(cartList.get(i));
			int pid=cartList.get(i).getcProductid();
			List<Product> productList =productService.getByPid(pid);
			List<Specs> specsList=specsService.getBySpId(pid);
			for (int ii = 0; ii < specsList.size(); ii++) {
				general.setSpecs(specsList.get(ii));
			}
			for(int j=0;j<productList.size();j++){
				general.setProduct(productList.get(j));
				int sid=productList.get(j).getpShopid();
				List<Shop> shopList=shopService.getBySid(sid);
				for (int k = 0; k < shopList.size(); k++) {
					general.setShop(shopList.get(k));
				}
			}
			generalList.add(general);
		}
		ModelAndView mav=new ModelAndView();
		mav.addObject("generalList", generalList);
		mav.setViewName("shop/card");
		return mav;
	}
}
