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

import com.a2.ssm.model.ProductType;
import com.a2.ssm.model.Specs;
import com.a2.ssm.model.TypeSpecs;
import com.a2.ssm.service.ProductTypeService;
import com.a2.ssm.service.SpecsService;
import com.a2.ssm.service.TypeSpecsService;


@Controller
@RequestMapping("/typeSpecs")
public class TypeSpecsController {

	@Autowired
	private TypeSpecsService typeSpecsService;
	@Autowired
	private ProductTypeService productTypeService;
	@Autowired
	private SpecsService specsService;
	
	/**
	 * <p>方法功能描述：显示所有childid为0的底层菜单</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-9 下午3:20:07
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("list")
	public ModelAndView list(){
		ModelAndView mav = new ModelAndView();
		List<ProductType> list = productTypeService.listBottomType();//所有底层类型，childid=0的类型
		mav.addObject("list", list);
		mav.setViewName("admin/typeSpecs/childTypelist");
		return mav;
	}
	/**
	 * <p>方法功能描述：根据当前商品类型id查询所有该类型的规格</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-9 下午6:30:46
	 * @参数：@param typeSpecs 类型规格对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("listSpecs")
	public ModelAndView listSpecs(TypeSpecs typeSpecs){
		ModelAndView mav = new ModelAndView();
		List<TypeSpecs> list = typeSpecsService.list(typeSpecs);
		
		mav.addObject("productType", productTypeService.getById(typeSpecs.getTsProducttypeid()));
		mav.addObject("list", list);
		mav.setViewName("admin/typeSpecs/specslist");
		return mav;
	}
	
	/**
	 * <p>方法功能描述：AJAX查询所有childid为0的底层类型</p>
	 * @方法作者：lenovo
	 * @创建时间：2016-9-11 下午7:17:06
	 * @参数：@param response
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("typelist")
	public String typelist(HttpServletResponse response) {
		List<ProductType> typelist = productTypeService.listBottomType();//所有底层类型，childid=0的类型
		JSONArray json = new JSONArray();
		JSONObject jo = new JSONObject();

		for (ProductType specs : typelist) {
			jo.put("ptId", specs.getPtId());
			jo.put("ptName", specs.getPtName());
			json.add(jo);
		}
		PrintWriter out;
		try {
			response.setContentType("application/json;charset=UTF-8");
			out = response.getWriter();
			out.write(json.toString());
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * <p>方法功能描述：查询该规格详情</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-11 下午8:08:17
	 * @参数：@param typeSpecs 类型规格对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("findSpecs")
	public ModelAndView findSpecs(TypeSpecs typeSpecs){
		ModelAndView mav = new ModelAndView();
		
		Specs sp = new Specs();
		sp.setTsId(typeSpecs.getTsId());
		List<Specs> list = specsService.list(sp);
		
		mav.addObject("list", list);
		mav.addObject("typeSpecs", typeSpecsService.getById(typeSpecs.getTsId()));
		mav.setViewName("admin/typeSpecs/specsInfolist");
		return mav;
	}
	/**
	 * <p>方法功能描述：增加前取出所有类型规格</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-11 下午9:40:02
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("addSpecs")
	public ModelAndView addSpecs(){
		ModelAndView mav = new ModelAndView();
		List<ProductType> list = productTypeService.listBottomType();//所有底层类型，childid=0的类型
		mav.addObject("list", list);
		mav.setViewName("admin/typeSpecs/addSpecs");
		return mav;
	}
	
	/**
	 * <p>方法功能描述：给类型增加规格</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-9 下午3:34:54
	 * @参数：@param typeSpecs 类型规格对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("save")
	public ModelAndView save(TypeSpecs typeSpecs){
		typeSpecsService.save(typeSpecs);
		return new ModelAndView(new RedirectView("../typeSpecs/listSpecs.do?tsProducttypeid="+typeSpecs.getTsProducttypeid()));
	}
	
	/**
	 * <p>方法功能描述：更新类型对应规格</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-9 下午3:48:18
	 * @参数：@param typeSpecs 类型规格对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("update")
	public ModelAndView update(TypeSpecs typeSpecs){
		typeSpecsService.update(typeSpecs);
		return new ModelAndView(new RedirectView("../typeSpecs/listSpecs.do?tsProducttypeid="+typeSpecs.getTsProducttypeid()));
	}
	
	/**
	 * <p>方法功能描述：删除该规格</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-9 下午3:50:28
	 * @参数：@param typeSpecs 类型规格对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("delete")
	public ModelAndView delete(TypeSpecs typeSpecs){
		
		Specs sp = new Specs();
		sp.setTsId(typeSpecs.getTsId());
		List<Specs> slist = specsService.list(sp);
		for(int i = 0 ; i<slist.size(); i++){
			specsService.delete(slist.get(i).getSpId());
		}
		
		typeSpecsService.delete(typeSpecs.getTsId());
		return new ModelAndView(new RedirectView("../typeSpecs/listSpecs.do?tsProducttypeid="+typeSpecs.getTsProducttypeid()));
	}
	/**
	 * <p>方法功能描述：增加规格详情项</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-11 下午10:29:41
	 * @参数：@param specs 规格详情对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("saveSpecs")
	public ModelAndView saveSpecs(Specs specs){
		specsService.save(specs);
		return new ModelAndView(new RedirectView("../typeSpecs/findSpecs.do?tsId="+specs.getTsId()));
	}
	
	/**
	 * <p>方法功能描述：删除规格详情</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-12 上午9:18:25
	 * @参数：@param specs 规格详情对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("deleteSpecs")
	public ModelAndView deleteSpecs(Specs specs){
		specsService.delete(specs.getSpId());
		return new ModelAndView(new RedirectView("../typeSpecs/findSpecs.do?tsId="+specs.getTsId()));
	}
	
	/**
	 * <p>方法功能描述：更新规格详情</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-12 上午9:51:03
	 * @参数：@param specs 规格详情对象
	 * @参数：@return    
	 * @返回类型：ModelAndView   
	 * @throws
	 */
	@RequestMapping("updateSpecs")
	public ModelAndView updateSpecs(Specs specs){
		specsService.update(specs);
		return new ModelAndView(new RedirectView("../typeSpecs/findSpecs.do?tsId="+specs.getTsId()));
	}
	
}
