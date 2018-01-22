package com.a2.ssm.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.util.JSONUtils;

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
@RequestMapping("/productType")
public class ProductTypeController {

	@Autowired
	private ProductTypeService productTypeService;
	@Autowired
	private TypeSpecsService typeSpecsService;
	@Autowired
	private SpecsService specsService;

	/**
	 * <p> 方法功能描述：查询全部商品类型 </p>
	 * 
	 * @方法作者：zy @创建时间：2018-9-7 上午10:18:48 @参数：@return @返回类型：ModelAndView @throws
	 */
	@RequestMapping("list")
	public ModelAndView list(ProductType pt) {
		ModelAndView mav = new ModelAndView();
		List<ProductType> list = productTypeService.list(pt);
		mav.addObject("list", list);
		mav.setViewName("admin/shop/productTypelist");
		return mav;
	}

	/**
	 * <p> 方法功能描述：Ajax查出所有类型 </p>
	 * 
	 * @方法作者：zy @创建时间：2018-9-7 下午4:47:06 @参数：@param pt 类型对象 @参数：@param
	 * response @参数：@return @返回类型：String @throws
	 */
	@RequestMapping("index")
	public String index(HttpServletResponse response) {
		ProductType pt = new ProductType();
		pt.setType(1);
		List<ProductType> flist = productTypeService.list(pt);

		JSONArray json = new JSONArray();// 存完整数据
		for (ProductType specs : flist) {
			ProductType ptp = new ProductType();
			JSONObject jo = new JSONObject();
			jo.put("id", specs.getPtId());
			jo.put("ptName", specs.getPtName());
			jo.put("pId", specs.getParentid());
			jo.put("cId", specs.getChildid());
			jo.put("pType", specs.getType());
			ptp.setPtId(specs.getPtId());
			if (specs.getChildid() == 1) {
				JSONArray jsonc = new JSONArray();// 存子数据
				for (ProductType sec : productTypeService.listChildType(ptp)) {
					
					JSONObject josec = new JSONObject();
					josec.put("id", sec.getPtId());
					josec.put("ptName", sec.getPtName());
					josec.put("pId", sec.getParentid());
					josec.put("cId", sec.getChildid());
					josec.put("pType", sec.getType());
					ProductType pts = new ProductType();
					pts.setPtId(sec.getPtId());
					if (specs.getChildid() == 1) {
						JSONArray jsont = new JSONArray();// 存子数据
						for (ProductType thr : productTypeService.listChildType(pts)) {
							JSONObject joset = new JSONObject();
							joset.put("id", thr.getPtId());
							joset.put("ptName", thr.getPtName());
							joset.put("pId", thr.getParentid());
							joset.put("cId", thr.getChildid());
							joset.put("pType", thr.getType());
							jsont.add(joset);
						}
						josec.put("childs", jsont.toString());
					}
					jsonc.add(josec);
				}
				jo.put("childs", jsonc.toString());
			}
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
	 * <p> 方法功能描述：根据父类型id查询二级类型 </p>
	 * 
	 * @方法作者：zy @创建时间：2018-9-7 上午11:30:00 @参数：@param proType 类型对象 @参数：@param
	 * response @参数：@return @返回类型：String @throws
	 */
	@RequestMapping("childTypelist")
	public String childTypelist(ProductType proType, HttpServletResponse response) {
		List<ProductType> childlist = productTypeService.listChildType(proType);// 根据父类型id得到其子类型
		JSONArray json = new JSONArray();
		JSONObject jo = new JSONObject();

		for (ProductType specs : childlist) {
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
	 * <p> 方法功能描述：Ajax查出所有上级类型 </p>
	 * 
	 * @方法作者：zy @创建时间：2018-9-7 下午4:47:06 @参数：@param pt 类型对象 @参数：@param
	 * response @参数：@return @返回类型：String @throws
	 */
	@RequestMapping("listFType")
	public String listFType(ProductType pt, HttpServletResponse response) {
		List<ProductType> flist = new ArrayList<ProductType>();
		if (pt.getType() == 2) {
			pt.setType(1);
		} else {
			if (pt.getType() == 3) {
				pt.setType(2);
			}
		}
		flist = productTypeService.list(pt);

		JSONArray json = new JSONArray();
		JSONObject jo = new JSONObject();

		for (ProductType specs : flist) {
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
	 * <p> 方法功能描述：Ajax查询所有二级类型 </p>
	 * 
	 * @方法作者：zy @创建时间：2018-9-7 下午4:50:36 @参数：@param
	 * response @参数：@return @返回类型：String @throws
	 */
	@RequestMapping("listSecond")
	public String listSecond(ProductType pt, HttpServletResponse response) {
		List<ProductType> flist = productTypeService.list(pt);
		JSONArray json = new JSONArray();
		JSONObject jo = new JSONObject();

		for (ProductType specs : flist) {
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
	 * <p> 方法功能描述：新增商品类型 </p>
	 * 
	 * @方法作者：zy @创建时间：2018-9-7 下午7:20:18 @参数：@param pt 类型对象 @参数：@param
	 * req @参数：@return @返回类型：ModelAndView @throws
	 */
	@RequestMapping("save")
	public ModelAndView save(ProductType pt) {

		ProductType dto = productTypeService.getById(pt.getParentid());// 查询该对象是否有父类型
		if (dto != null) {
			dto.setChildid(1);// 如果有将父类型childid改为1
			productTypeService.update(dto);
		}
		productTypeService.save(pt);
		return new ModelAndView(new RedirectView("../productType/list.do"));
	}

	/**
	 * <p> 方法功能描述：更新类型信息 </p>
	 * 
	 * @方法作者：zy @创建时间：2018-9-7 下午7:23:00 @参数：@param pt
	 * 类型对象 @参数：@return @返回类型：ModelAndView @throws
	 */
	@RequestMapping("update")
	public ModelAndView update(ProductType pt) {

		// 判断其父类型有无其他子类型，如果没有则将其原有父类型childid置为0
		ProductType npt = productTypeService.getById(pt.getPtId());
		List<ProductType> ptlist = productTypeService.listByPid(npt.getParentid());
		if (ptlist.size() == 1) {
			ProductType p = productTypeService.getById(npt.getParentid());
			p.setChildid(0);
			productTypeService.update(p);
		}
		// 把修改后的父类型childid置为1
		ProductType dto = productTypeService.getById(pt.getParentid());// 取出其父类型
		dto.setChildid(1);
		productTypeService.update(dto);

		// 更行当前新对象的父id
		productTypeService.update(pt);
		return new ModelAndView(new RedirectView("../productType/list.do"));
	}

	@RequestMapping("delete")
	public ModelAndView delete(ProductType pt) {
		// 判断其父类型有无其他子类型，如果没有则将其原有父类型childid置为0
		List<ProductType> ptlist = productTypeService.listByPid(pt.getParentid());
		if (ptlist.size() == 1) {
			ProductType p = productTypeService.getById(pt.getParentid());
			p.setChildid(0);
			productTypeService.update(p);
		}

		// 删除该类型关联的规格及规格详情
		TypeSpecs ts = new TypeSpecs();
		ts.setTsProducttypeid(pt.getType());
		List<TypeSpecs> tslist = typeSpecsService.list(ts);
		for (int i = 0; i < tslist.size(); i++) {
			TypeSpecs typespecs = tslist.get(i);
			Specs s = new Specs();
			s.setTsId(typespecs.getTsId());
			List<Specs> slist = specsService.list(s);
			for (int j = 0; j < slist.size(); j++) {
				specsService.delete(slist.get(j).getSpId());
			}
			typeSpecsService.delete(typespecs.getTsId());
		}

		productTypeService.delete(pt.getPtId());
		return new ModelAndView(new RedirectView("../productType/list.do"));
	}

}
