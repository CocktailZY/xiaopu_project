package com.a2.ssm.controller;


import java.util.ArrayList;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import com.a2.ssm.model.Shop;
import com.a2.ssm.model.ShopType;
import com.a2.ssm.service.ShopService;
import com.a2.ssm.service.ShopTypeService;


/**
 * <p>类名：店铺管理</p>
 * <p>类功能描述：</p>
 * @类作者：任光启
 * @创建时间：2018-9-2 上午10:05:48
 * @小组：A2小组
 */
@Controller
@RequestMapping("/shop")
public class ShopController {

	@Autowired
	private ShopService shopService;
	private ShopType shopType;
	@Autowired
	private ShopTypeService shopTypeService;



	/**
	 * <p>方法功能描述：分类查询店铺的信息（通过三个list返回）</p>
	 * @方法作者：任光启
	 * @创建时间：2018-9-1 下午9:04:34
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("list")
	public ModelAndView allList(){
		ModelAndView mav = new ModelAndView();
		List<Shop> underlist = shopService.underList();
		List<Shop> seelist = shopService.seeList();
		List<Shop> applylist = shopService.applyList();
		mav.addObject("underlist", underlist);
		mav.addObject("seelist", seelist);
		mav.addObject("applylist", applylist);
		mav.setViewName("admin/shop/shop-management");
		return mav;
	}
	
	/**
	 * <p>方法功能描述：修改店铺的状态为观察期</p>
	 * @方法作者：任光启
	 * @创建时间：2018-9-2 上午10:43:56
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("updateToSee")
	public String updateToSee(Shop dto){
		shopService.updatetosee(dto);
		return "redirect:../shop/list.do";
	}
	

	
	/**
	 * <p>方法功能描述：</p>
	 * @方法作者：刘家昕
	 * @创建时间：2018-9-5 上午10:43:56
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("/addSell")
	public ModelAndView addSell(Shop dto,@RequestParam("Shoptype")String Shoptype ){
		ModelAndView mav = new ModelAndView();
		dto.setsState(0);
		if(Shoptype != null & !"".equals(Shoptype)){	
			dto.setsShoptypeid(Integer.parseInt(Shoptype));
		}
		shopService.addSell(dto);
		mav.setViewName("seller/success");
		return mav;
	}
		
	/**
	 * <p>方法功能描述：修改店铺状态为正常（其中包括通过店铺申请）</p>
	 * @方法作者：任光启
	 * @创建时间：2018-9-2 下午2:34:47
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("updateToNormal")
	public String updateToNormal(Shop dto){
		shopService.updateToNormal(dto);
		return "redirect:../shop/list.do";
	}
	
	/**
	 * <p>方法功能描述：修改店铺的状态为关闭</p>
	 * @方法作者：任光启
	 * @创建时间：2018-9-2 下午3:32:54
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("updateToClose")
	public String updateToClose(String sId){
		shopService.updateToClose(sId);
		return "redirect:../shop/list.do";
	}
	
	/**
	 * <p>方法功能描述：退回店铺的申请信息</p>
	 * @方法作者：任光启
	 * @创建时间：2018-9-5 上午9:36:35
	 * @参数：@param sId
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("deleteApply")
	public String deleteApply(Integer sId){
		shopService.deleteApply(sId);
		return "redirect:../shop/list.do";
	}
	
}
