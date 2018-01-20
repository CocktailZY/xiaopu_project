package com.a2.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
import com.a2.ssm.model.Bulletion;
import com.a2.ssm.service.BulletionService;

/**
 * <p>类名：公告管理的controller</p>
 * <p>类功能描述：接收页面的请求，并将结果返回到相应的页面</p>
 * @类作者：任光启
 * @创建时间：2016-9-7 下午2:14:59
 * @小组：A2小组
 */
@Controller
@RequestMapping("/bulletion")
public class BulletionController {

	@Autowired
	private BulletionService bulletionService;
	
	/**
	 * <p>方法功能描述：查询所有的、店铺的和商城的公告信息</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-5 下午2:39:14
	 * @参数：@return    
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("list")
	public ModelAndView BulletionList(){
		ModelAndView mav = new ModelAndView();
		List<Bulletion> allList = bulletionService.allList();
		List<Bulletion> mallList = bulletionService.mallList();
		List<Bulletion> shopList = bulletionService.shopList();
		mav.addObject("allList", allList);
		mav.addObject("mallList", mallList);
		mav.addObject("shopList", shopList);
		mav.setViewName("admin/bulletion/bulletion-management");
		return mav;
	}
	
	/**
	 * <p>方法功能描述：修改公告的状态为已发布（2）</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-6 上午9:44:27
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("updateToRelease")
	public String updateToRelease(Bulletion dto){
		bulletionService.updateToRelease(dto);
		return "redirect:../bulletion/list.do";
	}

	/**
	 * <p>方法功能描述：修改公告的状态为删除状态（3）</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-6 上午11:11:09
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("updateToDelete")
	public String updateToDelete(Bulletion dto){
		bulletionService.updateToDelete(dto);
		return "redirect:../bulletion/list.do";
	}
	
	/**
	 * <p>方法功能描述：后台修改商城公告信息</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-6 下午2:53:28
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：String  
	 * @throws
	 */
	@RequestMapping("updateMall")
	public String updateMall(Bulletion dto){
		bulletionService.updateMall(dto);
		return "redirect:../bulletion/list.do";
	}
	
	/**
	 * <p>方法功能描述：添加商城公告</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-6 下午5:13:00
	 * @参数：@param dto
	 * @参数：@return    
	 * @返回类型：ModelAndView
	 * @throws
	 */
	@RequestMapping("addMall")
	public ModelAndView addMall(Bulletion dto){
		bulletionService.addMall(dto);
		return new ModelAndView(new RedirectView("../bulletion/list.do"));
	}
	
	/**
	 * <p>方法功能描述：删除未发布过的公告</p>
	 * @方法作者：任光启
	 * @创建时间：2016-9-7 下午2:13:19
	 * @参数：@param buId
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("deleteBulletion")
	public String deleteBulletion(Integer buId){
		bulletionService.deleteBulletion(buId);
		return "redirect:../bulletion/list.do";
	}
	
	/*-------------------------------lx----------------------------------------*/
	/**
	 * @throws IOException 
	 * <p>方法功能描述：利用ajax回调卖家的公告</p>
	 * @方法作者：lx
	 * @创建时间：2016-9-8 下午4:31:10
	 * @参数：    
	 * @返回类型：void   
	 * @throws
	 */
	@RequestMapping("bulletionListByShop")
	public void bulletionListByShop(HttpServletResponse response) throws IOException{
		Bulletion bull = new Bulletion();
		//设置公告类型为店铺（1）
		bull.setBuCategory(1);
		//设置公告状态为互动中（2）
		bull.setBuState(2);
		List<Bulletion> list = bulletionService.list(bull);
		response.setContentType("text/html;charset=UTF-8");
		JSONArray jsArray = new JSONArray();
		JSONObject jo = new JSONObject();
		for(Bulletion bulletion : list){
			jo.put("buId", bulletion.getBuId());
			jo.put("buContent", bulletion.getBuContent());
			jo.put("buShopId", bulletion.getBuShopId());
			jsArray.add(jo);
		}
		PrintWriter out = response.getWriter();
		out.write(jsArray.toString());
		out.flush();
		out.close();
	}
	
	@RequestMapping("bulletionListByMall")
	public void bulletionListByMall(HttpServletResponse response) throws IOException{
		Bulletion bull = new Bulletion();
		//设置公告类型为店铺（1）
		bull.setBuCategory(0);
		//设置公告状态为互动中（2）
		bull.setBuState(2);
		List<Bulletion> list = bulletionService.list(bull);
		for(int i=0;i<list.size();i++){
			System.out.println("====="+list.get(i).toString());
		}
		response.setContentType("text/html;charset=UTF-8");
		JSONArray jsArray = new JSONArray();
		JSONObject jo = new JSONObject();
		for(Bulletion bulletion : list){
			//将内容拆解
			String[] bulls = bulletion.getBuContent().split("@");
			//计数，算bulls中有几条公告
			int i = 0;
			for(int j=0;j<bulls.length;j++){
				i++;
			}
			jo.put("bulls", bulls);
			jo.put("count", i);
			//设置非空且唯一的id，是为了在页面中把他设置为div的id
			jo.put("buId", bulletion.getBuId());
			jsArray.add(jo);
		}
		PrintWriter out = response.getWriter();
		out.write(jsArray.toString());
		out.flush();
		out.close();
	}
	

}
