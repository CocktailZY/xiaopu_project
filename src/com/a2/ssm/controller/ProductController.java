package com.a2.ssm.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.a2.ssm.model.Brand;
import com.a2.ssm.model.Comments;
import com.a2.ssm.model.General;
import com.a2.ssm.model.Images;
import com.a2.ssm.model.Product;
import com.a2.ssm.model.ProductSpecs;
import com.a2.ssm.model.ProductType;
import com.a2.ssm.model.Specs;
import com.a2.ssm.model.TypeSpecs;
import com.a2.ssm.model.User;
import com.a2.ssm.service.BrandService;
import com.a2.ssm.service.CommentsService;
import com.a2.ssm.service.ImagesService;
import com.a2.ssm.service.ProductService;
import com.a2.ssm.service.ProductSpecsService;
import com.a2.ssm.service.ProductTypeService;
import com.a2.ssm.service.SpecsService;
import com.a2.ssm.service.UserService;

import com.a2.ssm.service.TypeSpecsService;
import com.a2.ssm.util.CompareTime;
import com.a2.ssm.util.Page;


@Controller
@RequestMapping("/product")
public class ProductController {

	@Autowired
	private ProductService productService;
	@Autowired
	private ProductTypeService productTypeService;
	@Autowired
	private BrandService brandService;
	@Autowired
	private TypeSpecsService typeSpecsService;
	@Autowired
	private ProductSpecsService productSpecsService;
	@Autowired
	private ImagesService imagesService;
	@Autowired
	private CommentsService commentsService;
	@Autowired
	private UserService userService;
	@Autowired
	private SpecsService specsService;
	/**
	 * 
	 * <p>方法功能描述：商品添加到数据库</p>
	 * @方法作者：luchuan
	 * @创建时间：2018-9-2 上午9:12:30
	 * @参数：@throws Exception    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("productadd")
	public String addProduct(ModelMap modelMap, HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="uploadImg",required = false) MultipartFile[] file,
			@RequestParam(value="pName",required = false) String pName,
			@RequestParam(value="pTypeid",required = false) String[] pTypeid,
			//@RequestParam(value="bId",required = false) String bId,
			@RequestParam(value="tsId",required = false) String[] tsId,//规格
			@RequestParam(value="spId",required = false) String[] spId,//规格详情
			@RequestParam(value="psColor",required = false) String[] psColor,//颜色
			@RequestParam(value="spPrice",required = false) String[] spPrice,//单价
			@RequestParam(value="spNum",required = false) String[] spNum,//数量
			@RequestParam(value="pContent",required = false) String pContent) throws Exception{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Product product = new Product();
		//商品名
		product.setpName(pName);
		for(int i=0;i<pTypeid.length;i++){
			//商品类型ID
			product.setpTypeid(Integer.parseInt(pTypeid[i]));
		}
//		if(bId != null && !"".equals(bId)){
//			//商品品牌ID
//			product.setpBrandid(Integer.parseInt(bId));
//		}
		//商品描述
		product.setpContent(pContent);
		//获取当前时间并转换成String类型
		Date time = new Date();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = format.format(time);
		//上架时间
		product.setpOntime(date);
		//新品状态 1新品 0非新品
		product.setpNew(1);
		//特价状态 1特价 0非特价
		product.setpSpecial(0);
		//上架状态 1上架 0下架
		product.setpOnstate(1);
		//折扣状态 100%制
		product.setpDiscount("1.0");
		//店铺ID 添加的为测试数据
		product.setpShopid(1);
		productService.save(product);
		System.out.println("数组的长度======"+tsId.length);
		for(int i=0;i<tsId.length;i++){
			//商品_规格表
			ProductSpecs productSpecs = new ProductSpecs();
			//商品颜色
			productSpecs.setPsColor(psColor[i]);
			//商品对应规格单价
			productSpecs.setPsPrice(spPrice[i]);
			//商品对应规格数量
			productSpecs.setPsNum(spNum[i]);
			if(tsId != null && !"".equals(tsId)){
				//商品类型_规格ID
				productSpecs.setTsId(Integer.parseInt(tsId[i]));
			}
			if(spId != null && !"".equals(spId)){
				//商品规格ID
				productSpecs.setSpId(Integer.parseInt(spId[i]));
			}
			
			//商品ID  
			productSpecs.setpId(productService.getMaxId());
			productSpecsService.save(productSpecs);
		
		if(spId != null && !"".equals(spId)){
			//商品规格ID
			productSpecs.setSpId(Integer.parseInt(spId[i]));
		}
		
		//商品ID  添加的为测试数据
		productSpecs.setpId(1);
		productSpecsService.save(productSpecs);

		}	
		//图片上传
		String path = request.getSession().getServletContext().getRealPath("/fileUpload");
		int i = 0;
		List<String> list = new ArrayList<String>();
		Images images = new Images();
		String s="";
		while(i!=file.length){
				file[i].transferTo(new File(path + "/" + file[i].getOriginalFilename()));
				list.add(file[i].getOriginalFilename());
				s = file[i].getOriginalFilename();
				//图片路径
				images.setImAddress(s);
				//商品ID
				images.setpId(productService.getMaxId());
				
				imagesService.save(images);
				i++;
		}
	
		return "redirect:productList.do";
	}
	/**
	 * <p>方法功能描述：</p>
	 * @方法作者：lenovo
	 * @创建时间：2018-9-8 下午7:41:54
	 * @参数：@param map
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping(value="input", method=RequestMethod.GET)
	public String input(Map<String,Object> map){
		ProductType productType = new ProductType();
		productType.setType(1);
		map.put("productType", productTypeService.list(productType));
		
		map.put("product", new Product());
		
		return "/product/productadd";
	}
	/**
	 * 
	 * <p>方法功能描述：商品类型_商品品牌,商品类型_商品规格 的二级联动</p>
	 * @方法作者：luchuan
	 * @创建时间：2018-9-2 上午9:14:44
	 * @参数：@param request
	 * @参数：@param response
	 * @参数：@throws IOException    
	 * @返回类型：void   
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("selectProduct")
	public void selectProduct(
			HttpServletRequest request,HttpServletResponse response) throws IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String ptIds = request.getParameter("ptId");
		List<ProductType> productTypes = new ArrayList<ProductType>();
		int ptId=0;
		if(ptIds != null && !"".equals(ptIds)){
			ptId=Integer.parseInt(ptIds);
			
		}
		//查看该类型是否有子类型
		if(productTypeService.getById(ptId).getChildid()==1){
			ProductType dto = new ProductType();dto.setPtId(ptId);
			productTypes = productTypeService.listChildType(dto);
			JSONArray json = new JSONArray();JSONObject jo = new JSONObject();
			for (ProductType pt : productTypes) {
				jo.put("cptId",pt.getPtId());jo.put("cptName",pt.getPtName());jo.put("panduan", "YES");
				json.add(jo);
			}
			PrintWriter out = response.getWriter();
			out.write(json.toString());out.flush();out.close();
		}else{
			List<TypeSpecs> typeSpecsList = new ArrayList<TypeSpecs>();
			typeSpecsList = typeSpecsService.getByTypeId(ptId);
			JSONArray json = new JSONArray();JSONObject jo = new JSONObject();
			jo.put("panduan", "NO");json.add(jo);
			for (TypeSpecs typeSpecs : typeSpecsList) {
				jo.put("tsId",typeSpecs.getTsId());jo.put("tsTitle",typeSpecs.getTsTitle());
				jo.put("tsProducttypeid", typeSpecs.getTsProducttypeid());
				json.add(jo);
			}
			PrintWriter out = response.getWriter();
			out.write(json.toString());out.flush();out.close();
		}
	}
	/**
	 * 
	 * <p>方法功能描述：商品规格_商品规格详情 的二级联动</p>
	 * @方法作者：luchuan
	 * @创建时间：2018-9-2 上午9:16:32
	 * @参数：@param request
	 * @参数：@param response
	 * @参数：@throws IOException    
	 * @返回类型：void   
	 * @throws
	 */
	@ResponseBody
	@RequestMapping("selectProduct1")
	public void selectProduct1(
			HttpServletRequest request,HttpServletResponse response) throws IOException{
		//解决乱码问题
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String tsIds = request.getParameter("tsId");
		
		int tsId=0;
		if(tsIds != null && !"".equals(tsIds)){
			tsId=Integer.parseInt(tsIds);
			
		}
		
		List<Specs> specsList = specsService.getByTsId(tsId);
			
			JSONArray json = new JSONArray();
			JSONObject jo = new JSONObject();
			
			for(Specs specs : specsList){
				
				jo.put("spId", specs.getSpId());
				jo.put("spFications", specs.getSpFications());
				
				json.add(jo);
				
			}
			PrintWriter out = response.getWriter();
			out.write(json.toString());
			out.flush();
			out.close();
		
	}
	/**
	 * @throws ParseException 
	 * 
	 * <p>方法功能描述：卖家商品列表显示</p>
	 * @方法作者：luchuan
	 * @创建时间：2018-9-4 上午9:17:17
	 * @参数：@param modelMap
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("productList")
	public String productList(ModelMap modelMap, 
			@RequestParam(value="cxpName",required = false) String cxpName,//查询条件：商品名
			@RequestParam(value="cxptName",required = false) String cxptId,//查询条件：商品类型
			//@RequestParam(value="cxbrand",required = false) String cxbId,//查询条件：商品品牌
			@RequestParam(value="xTime",required = false) String xTime,//查询条件：时间前
			@RequestParam(value="yTime",required = false) String yTime,//查询条件：时间后
			@RequestParam(value="cxpSpecial",required = false) String cxpSpecial,//查询条件：特价商品
			@RequestParam(value="cxpNew",required = false) String cxpNew,//查询条件：新品
			@RequestParam(value="pageNum",required = false) String pageNum//分页：当前页
			) throws ParseException{
		if( cxptId == null || Integer.parseInt(cxptId) == 0 || "".equals(cxptId)){
			
		
		List<General> generals = new ArrayList<General>();
		List<Product> products,productList;
		ProductType productType;
		//Brand brand;
 		int pageNumStr = 1;
		if (pageNum != null && !"".equals(pageNum)) {
			pageNumStr = Integer.parseInt(pageNum);
		}
		if(cxpSpecial == null || "".equals(cxpSpecial)){
			cxpSpecial="404";
			
		}
		if(cxpNew == null || "".equals(cxpNew)){
			cxpNew="404";
			
		}
		if(cxptId == null || "0".equals(cxptId)){
			cxptId="0";
			
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pName", cxpName);
		map.put("pSpecial", Integer.parseInt(cxpSpecial));
		map.put("pNew", Integer.parseInt(cxpNew));
		map.put("xTime", xTime);
		map.put("yTime", yTime);
		map.put("ptId", Integer.parseInt(cxptId));
		//map.put("bId", Integer.parseInt(cxbId));
		productList = productService.cxlist(map);
		
		//传参:总记录数，当前页码数，每页显示条数
		Page page = new Page(productList.size(),pageNumStr,5);
		map.put("rowStart", page.getRowStart());
		map.put("pageSize", page.getPageSize());
		products = productService.listPage(map);
		
		//GregorianCalendar gc =new GregorianCalendar();
		//时间格式化
//		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		for(int i=0;i<products.size();i++){
			General general = new General();
			//获取该商品的上架时间
			String oldtime = products.get(i).getpOntime();
			Date time = new Date();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String newtime = format.format(time); 
//			gc.setTime(new Date());
//			gc.add(5,-7);
//			gc.set(gc.get(Calendar.YEAR),gc.get(Calendar.MONTH),gc.get(Calendar.DATE));
//			String newtime=format.format(gc.getTime());
//			//调用时间差方法
			CompareTime compareTime = new CompareTime();
			int x = compareTime.getBetweenDays(oldtime, newtime);
			//如果当前时间比上架时间多于7天，将新品状态改为0
			if(x>7){
				Product product = products.get(i);
				product.setpNew(0);
				productService.update(product);
			}
			//商品的对象
			general.setProduct(products.get(i));
			
			//根据商品表里的类型ID查找到对应的类型表对象
			productType = productTypeService.getById(products.get(i).getpTypeid());
			
			general.setProductType(productType);
			
			//根据商品表里的品牌ID查找到对应的品牌表对象
//			brand = brandService.getById(products.get(i).getpBrandid());
//			
//			general.setBrand(brand);
//			
			generals.add(general);
			
		}
		List<ProductType> productTypes = new ArrayList<ProductType>();
		//List<Brand> brands = new ArrayList<Brand>();
		ProductType pt = new ProductType();
		pt.setType(1);
		productTypes = productTypeService.list(pt);
		//brands = brandService.list();
		modelMap.put("productTypes", productTypes);
		//modelMap.put("brands", brands);
		//返回商品列表信息
		modelMap.put("generals", generals);
		//返回分页信息
		modelMap.put("page", page);
		//返回模糊查询的字段
		modelMap.put("cxpName", cxpName);
		modelMap.put("cxptId", cxptId);
		modelMap.put("xTime", xTime);
		modelMap.put("yTime", yTime);
		modelMap.put("cxpSpecial", cxpSpecial);
		modelMap.put("cxpNew", cxpNew);
		}else{
			ProductType productType = new ProductType();
			productType.setPtId(Integer.parseInt(cxptId));
			List<General> generalsee = new ArrayList<General>();
			int pageNumStr = 1;
			if (pageNum != null && !"".equals(pageNum)) {
				pageNumStr = Integer.parseInt(pageNum);
			}
			//查询该类型的所有child=0的子类型
			List<Product> products = search(productType);
			//后面卡克了。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
			Page page = new Page(products.size(),pageNumStr,5);
			
			modelMap.put("begin", page.getRowStart());
			if(pageNumStr == page.getPageCount()){
				modelMap.put("end", products.size()-1);
				
			}else{
				modelMap.put("end", page.getRowStart()+4);
				
			}
			
			
			
			for(int i=0;i<products.size();i++){
				General generalee = new General();
				ProductType productType2 = new ProductType();
				generalee.setProduct(products.get(i));
				productType2 = productTypeService.getById(products.get(i).getpTypeid());
				generalee.setProductType(productType2);
				generalsee.add(generalee);
				
			}
			List<ProductType> productTypes = new ArrayList<ProductType>();
			//List<Brand> brands = new ArrayList<Brand>();
			ProductType pt = new ProductType();
			pt.setType(1);
			productTypes = productTypeService.list(pt);
			//brands = brandService.list();
			modelMap.put("productTypes", productTypes);
			modelMap.put("generals", generalsee);
			modelMap.put("page", page);
			modelMap.put("cxptId", Integer.parseInt(cxptId));
			modelMap.put("cxpSpecial", 404);
			modelMap.put("cxpNew", 404);
			
		}

		return "/product/maijiaProductList";
	}
	/**
	 * 
	 * <p>方法功能描述：查询商品详情</p>
	 * @方法作者：luchuan
	 * @创建时间：2018-9-7 上午9:33:49
	 * @参数：@param modelMap
	 * @参数：@param pId
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("productpart")
	public String productpart(ModelMap modelMap,
			@RequestParam(value="pId",required = false) String pId){
		List<General> generals = new ArrayList<General>();
		List<General> guigeList = new ArrayList<General>();
		General general = new General();
		Product product = new Product();
		ProductType productType = new ProductType();
		//Brand brand = new Brand();
		List<ProductSpecs> productSpecsList = new ArrayList<ProductSpecs>();
		TypeSpecs typeSpecs = new TypeSpecs();
		Specs specs = new Specs();
		List<Images> imagesList = new ArrayList<Images>();
		//商品基本信息
		product = productService.getById(Integer.parseInt(pId));
		general.setProduct(product);
		
		
		productType = productTypeService.getById(product.getpTypeid());
		if(productType.getParentid() == 0){
			modelMap.put("leixing1", productType.getPtName());
			modelMap.put("leixing2", null);
			modelMap.put("leixing3", null);
			
		}else{
			
			if(productTypeService.getById(productType.getParentid()).getParentid() == 0){
				modelMap.put("leixing1", productType.getPtName());
				modelMap.put("leixing2", 
						productTypeService.getById(productType.getParentid()).getPtName());
				modelMap.put("leixing3", null);
				
			}else{
				int asd = productTypeService.getById(productType.getParentid()).getParentid();
				modelMap.put("leixing1", productType.getPtName());
				modelMap.put("leixing2", 
						productTypeService.getById(productType.getParentid()).getPtName());
				modelMap.put("leixing3",productTypeService.getById(asd).getPtName());
				
			}
			
		}
		//general.setProductType(productType);
		
		
		
		//brand = brandService.getById(product.getpBrandid());
		//general.setBrand(brand);
		generals.add(general);
		//商品规格信息
		productSpecsList = productSpecsService.getByPId(Integer.parseInt(pId));
		for(int i=0;i<productSpecsList.size();i++){
			General guige = new General();
			guige.setProductSpecs(productSpecsList.get(i));
			typeSpecs =typeSpecsService.getById(productSpecsList.get(i).getTsId());
			guige.setTypeSpecs(typeSpecs);
			
			specs = specsService.getById(productSpecsList.get(i).getSpId());
			guige.setSpecs(specs);
			guigeList.add(guige);
		}
		//商品图片信息
		imagesList = imagesService.getByPId(Integer.parseInt(pId));
		
		modelMap.put("generals", generals);
		modelMap.put("guigeList", guigeList);
		modelMap.put("imagesList", imagesList);
		return "/product/maijiaProductListPart";
	}
	/**
	 * 
	 * <p>方法功能描述：传参到商品修改页面</p>
	 * @方法作者：luchuan
	 * @创建时间：2018-9-7 上午9:34:23
	 * @参数：@param modelMap
	 * @参数：@param pId
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("productupdate")
	public String productupdate(ModelMap modelMap,
			@RequestParam(value="pId",required = false) String pId){
		
		List<General> generals = new ArrayList<General>();
		List<General> guigeList = new ArrayList<General>();
		General general = new General();
		Product product = new Product();
		ProductType productType = new ProductType();
		//Brand brand = new Brand();
		List<ProductSpecs> productSpecsList = new ArrayList<ProductSpecs>();   
		TypeSpecs typeSpecs = new TypeSpecs();
		Specs specs = new Specs();
		List<Images> imagesList = new ArrayList<Images>();
		//商品基本信息
		product = productService.getById(Integer.parseInt(pId));
		general.setProduct(product);
		
		
		//productType = productTypeService.getById(product.getpTypeid());
		//general.setProductType(productType);
		
		
		ProductType productType2 = new ProductType();
		productType2.setType(1);
		List<ProductType> productTypesss = new ArrayList<ProductType>();
		productTypesss = productTypeService.list(productType2);
		modelMap.put("productTypesss", productTypesss);
		
		
		
		ProductType whh = productTypeService.getById(product.getpTypeid());
		if(whh.getParentid() == 0){
			modelMap.put("leixing1", whh.getPtId());
			modelMap.put("leixing2", null);
			modelMap.put("leixing3", null);
			
		}else{
			
			if(productTypeService.getById(whh.getParentid()).getParentid() == 0){
				modelMap.put("leixing1", whh.getPtId());
				modelMap.put("leixing2", 
						productTypeService.getById(whh.getParentid()).getPtId());
				modelMap.put("leixing3", null);
				
			}else{
				int asd = productTypeService.getById(whh.getParentid()).getParentid();
				modelMap.put("leixing1", whh.getPtId());
				modelMap.put("leixing2", 
						productTypeService.getById(whh.getParentid()).getPtId());
				modelMap.put("leixing3",productTypeService.getById(asd).getPtId());
				
			}
			
		}
		generals.add(general);
		//商品规格信息
		productSpecsList = productSpecsService.getByPId(Integer.parseInt(pId));
		for(int i=0;i<productSpecsList.size();i++){
			General guige = new General();
			guige.setProductSpecs(productSpecsList.get(i));
			typeSpecs =typeSpecsService.getById(productSpecsList.get(i).getTsId());
			guige.setTypeSpecs(typeSpecs);
			
			specs = specsService.getById(productSpecsList.get(i).getSpId());
			guige.setSpecs(specs);
			guigeList.add(guige);
		}
		//商品图片信息
		imagesList = imagesService.getByPId(Integer.parseInt(pId));
		
		
		
		
		modelMap.put("generals", generals);
		modelMap.put("guigeList", guigeList);
		modelMap.put("imagesList", imagesList);
		modelMap.put("pId", pId);
		modelMap.put("productType", productTypeService.list(null));
		return "/product/productupdate";
	}
	/**
	 * 
	 * <p>方法功能描述：商品信息修改上传</p>
	 * @方法作者：luchuan
	 * @创建时间：2018-9-7 下午9:56:19
	 * @参数：@return
	 * @参数：@throws Exception    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("productupdateGo")
	public String productupdateGo(ModelMap modelMap, 
			HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="pId", required = false) String pId,//商品ID
			@RequestParam(value="pDiscount", required = false)String pDiscount,
			@RequestParam(value="imgId", required = false) String[] imgId,//图片ID
			@RequestParam(value="uploadImg", required = false) MultipartFile[] file,
			@RequestParam(value="pName", required = false) String pName,
			@RequestParam(value="pTypeid", required = false) String[] pTypeid,
			@RequestParam(value="bId", required = false) String bId,
			@RequestParam(value="guigeid", required = false) String[] psId,
			@RequestParam(value="tsId", required = false) String[] tsId,//规格
			@RequestParam(value="spId", required = false) String[] spId,//规格详情
			@RequestParam(value="psColor", required = false) String[] psColor,//颜色
			@RequestParam(value="spPrice", required = false) String[] spPrice,//单价
			@RequestParam(value="spNum", required = false) String[] spNum,//数量
			@RequestParam(value="pContent", required = false) String pContent) throws Exception{
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Product product = productService.getById(Integer.parseInt(pId));
		//商品ID
		if(pId != null && !"".equals(pId)){
			product.setpId(Integer.parseInt(pId));
			
		}
		//商品名
		product.setpName(pName);
		for(int i=0;i<pTypeid.length;i++){
			//商品类型ID
			product.setpTypeid(Integer.parseInt(pTypeid[i]));
		}
		//商品描述
		product.setpContent(pContent);
		if(pDiscount != null && !"1".equals(pDiscount)){
			//如果折扣不为1，修改特价状态为1
			product.setpSpecial(1);
			
		}

		//折扣状态 100%制
		product.setpDiscount(pDiscount);
		productService.update(product);
		for(int i=0;i<tsId.length;i++){
			//商品_规格表
			ProductSpecs productSpecs = productSpecsService.getById(Integer.parseInt(psId[i]));
			//商品_规格ID
			productSpecs.setpId(Integer.parseInt(psId[i]));
			//商品颜色
			productSpecs.setPsColor(psColor[i]);
			//商品对应规格单价
			productSpecs.setPsPrice(spPrice[i]);
			//商品对应规格数量
			productSpecs.setPsNum(spNum[i]);
			if(tsId != null && !"".equals(tsId)){
				//商品类型_规格ID
				productSpecs.setTsId(Integer.parseInt(tsId[i]));
			}
			if(spId != null && !"".equals(spId)){
				//商品规格ID
				productSpecs.setSpId(Integer.parseInt(spId[i]));
			}
			
			productSpecsService.update(productSpecs);
		}
		//图片上传
		if(file != null){
			String path = request.getSession().getServletContext().getRealPath("/fileUpload");
			int i = 0;
			
			String s="";
				while(i!=file.length){
					Images images = imagesService.getById(Integer.parseInt(imgId[i]));
					
					file[i].transferTo(new File(path + "/" + file[i].getOriginalFilename()));
					s = file[i].getOriginalFilename();
					images.setImId(Integer.parseInt(imgId[i]));
					//图片路径
					images.setImAddress(s);
					
					imagesService.update(images);
					i++;
			}
		}
		
		return "redirect:productList.do";
	}
	/**
	 * 
	 * <p>方法功能描述：逻辑删除商品</p>
	 * @方法作者：luchuan
	 * @创建时间：2018-9-8 下午3:07:37
	 * @参数：@param pId
	 * @参数：@return    
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("productdel")
	public String productdel(@RequestParam("pId") String pId){
		Product product = productService.getById(Integer.parseInt(pId));
		product.setpOnstate(0);
		productService.update(product);
		
		return "redirect:productList.do";
	}
	
	
	@RequestMapping("queryAll1")
	public String queryAll1(ModelMap map,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<General> generalList = new ArrayList<General>();
		List<Product> productList = productService.list();
		List<ProductSpecs> psList = new ArrayList<ProductSpecs>();
		List<ProductType> parentlist = productTypeService.listParentType();
		List<General> generalList1 = new ArrayList<General>();
		
		List<String> listp = new ArrayList<String>();
		listp.add("mobile");
		listp.add("laptop");
		listp.add("wheelchair");
		listp.add("home");
		listp.add("book");
		listp.add("gamepad");
		listp.add("shopping-basket");
		listp.add("medkit");
		listp.add("car");
		listp.add("cutlery");
		listp.add("futbol-o");
		listp.add("github-alt");
		listp.add("gift");
		listp.add("asterisk");
		
		List<String> listc = new ArrayList<String>();
		listc.add("wthree-btn");
		listc.add("wthree-btn wthree1");
		listc.add("wthree-btn wthree2");
		listc.add("wthree-btn wthree3");
		listc.add("wthree-btn wthree4");
		listc.add("wthree-btn wthree3");
		listc.add("wthree-btn");
		listc.add("wthree-btn wthree1");
		listc.add("wthree-btn wthree5");
		listc.add("wthree-btn wthree3");
		listc.add("wthree-btn wthree5");
		listc.add("wthree-btn wthree1");
		listc.add("wthree-btn wthree2");
		listc.add("wthree-btn");
		for(int i=0;i<parentlist.size();i++){
			if(parentlist.get(i).getParentid()==0){
				General general = new General();
				general.setProductType(parentlist.get(i));
				general.setPic(listp.get(i));
				general.setColor(listc.get(i));
				generalList1.add(general);
				
			}
			map.put("generalList1", generalList1);
		}
		
		for(int i=0;i<productList.size();i++){
			
				General general = new General();
				general.setProduct(productList.get(i));
				psList = productSpecsService.getByProductId(productList.get(i).getpId());
				general.setProductSpecs(psList.get(0));
				List<Images> imgList = new ArrayList<Images>();
				imgList =  imagesService.getByPId(productList.get(i).getpId());
				general.setImages(imgList.get(0));
				generalList.add(general);
				
				
				
			}
			
			for(int k = 0 ; k < listp.size() ; k++){
				
			}
				
				
				map.put("generalList", generalList);
				return "../index";
	}
	
	@RequestMapping("queryAll")
	public String queryAll(ModelMap map,HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		List<General> generalList1 = new ArrayList<General>();
		List<General> generalList2 = new ArrayList<General>();
		List<Product> productList = productService.list();
		List<ProductSpecs> psList = new ArrayList<ProductSpecs>();
		
		for(int i=0;i<productList.size();i++){
			if(productList.get(i).getpNew()==0){
				General general = new General();
				general.setProduct(productList.get(i));
				psList = productSpecsService.getByProductId(productList.get(i).getpId());
				general.setProductSpecs(psList.get(0));
				List<Images> imgList = new ArrayList<Images>();
				imgList =  imagesService.getByPId(productList.get(i).getpId());
				general.setImages(imgList.get(0));
				generalList1.add(general);
			}		
		}
		map.put("generalList1", generalList1);
		
		for(int i=0;i<productList.size();i++){
			if(productList.get(i).getpNew()==1){
				General general = new General();
				general.setProduct(productList.get(i));
				psList = productSpecsService.getByProductId(productList.get(i).getpId());
				general.setProductSpecs(psList.get(0));
				
				List<Images> imgList = new ArrayList<Images>();
				imgList =  imagesService.getByPId(productList.get(i).getpId());
				general.setImages(imgList.get(0));
				generalList2.add(general);
			
			}		
		}
				map.put("generalList2", generalList2);
	
		
				return "/product/products1";
	}
	/**
	 * 
	 * <p>方法功能描述：查询该类型的所有child为0的所有子类型</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-12 上午9:22:30
	 * @参数：@param pt
	 * @参数：@return    
	 * @返回类型：List<Product>   
	 * @throws
	 */
	@RequestMapping("search")
	public List<Product> search(ProductType pt) {

		List<Integer> idlist = new ArrayList<Integer>();
		List<Integer> nidlist = new ArrayList<Integer>();
		List<ProductType> secondlist = productTypeService.listChildType(pt);// 取出该一级类型的所有二级类型
		for (int i = 0; i < secondlist.size(); i++) {
			ProductType pt1 = secondlist.get(i);
			if (pt1.getChildid() == 0) {//判断二级类型的childid是否为0
				idlist.add(pt1.getPtId());
			}else{
				nidlist.add(pt1.getPtId());
				
			}
		}
		for(int i=0;i<nidlist.size();i++){
			ProductType productType = new ProductType();
			productType.setPtId(nidlist.get(i));
			List<ProductType> sanlist = productTypeService.listChildType(productType);
			for(int j=0;j<sanlist.size();j++){
				ProductType pt1 = sanlist.get(j);
				idlist.add(pt1.getPtId());
			}
		}
		
		
		List<Product> list = new ArrayList<Product>();
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("pName", null);
		map.put("pSpecial", 404);
		map.put("pNew", 404);
		map.put("xTime", null);
		map.put("yTime", null);
		map.put("ptId", 0);
		List<Product> plist = productService.cxlist(map);//取出所有商品
		for(int k = 0;k<plist.size();k++){
			Product p = plist.get(k);
			
			for(int h = 0;h<idlist.size();h++){//遍历idlist
				
				if(p.getpTypeid() == idlist.get(h)){//当商品类型id与idlist的值相等时，加入到list
					list.add(p);
				}
			}
		}
		
		return list;
	}
	/**
	 * 
	 * <p>方法功能描述：跳转商品评价页面</p>
	 * @方法作者：luchuan
	 * @创建时间：2018-9-12 下午7:04:37
	 * @参数：@return     
	 * @返回类型：String   
	 * @throws
	 */
	@RequestMapping("productevaluate")
	public String productevaluate(ModelMap modelMap,
			@RequestParam(value="xingji",required=false)String xingji,
			@RequestParam(value="xTime",required=false)String xTime,
			@RequestParam(value="yTime",required=false)String yTime,
			@RequestParam(value="pageNum",required=false)String pageNum,
			@RequestParam(value="zhezhezhe",required=false)String zghuifu,
			@RequestParam(value="zhangguihuifuid",required=false)String zhangguihuifuid){
		if(zhangguihuifuid != null && !"".equals(zhangguihuifuid)){
			Comments comments = commentsService.getById(Integer.parseInt(zhangguihuifuid));
			Comments dto = new Comments();
			
			if(zghuifu != null && !"".equals(zghuifu)){
				dto.setCommContent(zghuifu);
				dto.setCommProductid(comments.getCommProductid());
				dto.setCommStar(comments.getCommStar());
				Date time = new Date();
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				String date = format.format(time);
				dto.setCommTime(date);
				dto.setParentid(Integer.parseInt(zhangguihuifuid));
				dto.setsId(comments.getsId());
				//测试数据。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。
				dto.setCommUserid(404);
				commentsService.addhuifu(dto);
				
			}
		}
		
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ptId", 0);
		List<Product> productss = new ArrayList<Product>();
		int pageNumStr = 1;
		if (pageNum != null && !"".equals(pageNum)) {
			pageNumStr = Integer.parseInt(pageNum);
		}
		//模糊查询该店铺的所有评价并且parentid=0(测试数据。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。)
		map.put("sId", 1);
		if(xingji != null && !"-3".equals(xingji)){
			map.put("commStar", Integer.parseInt(xingji));
		}
		map.put("xTime", xTime);
		map.put("yTime", yTime);
		List<Comments> cList = commentsService.cxlistgetBySId(map);
		Page page = new Page(cList.size(),pageNumStr,5);
		map.put("rowStart", page.getRowStart());
		map.put("pageSize", page.getPageSize());
		List<Comments> commentsList = commentsService.cxlistgetBySIdPage(map);
		modelMap.put("commentsList", commentsList);
		modelMap.put("commentssize", commentsList.size());
		List<Comments> pingjiaList = new ArrayList<Comments>();
		List<Comments> zhuijiaList = new ArrayList<Comments>();
		List<Comments> huifuList = new ArrayList<Comments>();
		List<User> users = new ArrayList<User>();
		List<General> generals = new ArrayList<General>();
		for(int i=0;i<commentsList.size();i++){
			General general = new General();
			Product product = new Product();
			
			product = productService.getById(commentsList.get(i).getCommProductid());
			productss.add(product);
			modelMap.put("productss", productss);
				String content = commentsList.get(i).getCommContent();
				//获取随机码
				String suijima = content.substring(0, 8);
				//将开头的随机码截取掉
				String contentss = content.substring(8);
				String a[] = contentss.split(suijima);
				String pingjia;
				String zhuijia=null;
				//判断是否有追加评论
				if(a.length>1){
					//买家评价
					pingjia = a[0];
					//追加评论
					zhuijia = a[1];
					
				}else{
					pingjia = a[0];
				
				}
				Comments comments2 = new Comments();
				comments2.setCommContent(pingjia);
				Comments comments3 = new Comments();
				comments3.setCommContent(zhuijia);
				User user = new User();
				user = userService.getById(commentsList.get(i).getCommUserid());
				users.add(user);
				pingjiaList.add(comments2);
				zhuijiaList.add(comments3);
			
				
				Comments comments = commentsService.getByParentId(commentsList.get(i).getCommId());
				huifuList.add(comments);
				
			
		}
		modelMap.put("xTime", xTime);
		modelMap.put("yTime", yTime);
		modelMap.put("xingji", xingji);
		modelMap.put("pingjiaList", pingjiaList);
		modelMap.put("zhuijiaList", zhuijiaList);
		modelMap.put("huifuList", huifuList);
		modelMap.put("users", users);
		modelMap.put("page", page);
		return "product/pingjia";
	}


	
	@RequestMapping(value="/getAllProductByPage")
	public String getAllProductByPage(ModelMap modelMap,
			@RequestParam(value="Search",required=false) String cxpName,
			@RequestParam(value="pageNum",required=false) String pageNum) throws IOException{	
		 	List<Product> productList = productService.list();
		 	List<Product> products = productService.list();
			List<ProductSpecs> psList = new ArrayList<ProductSpecs>();
			List<General> generalList = new ArrayList<General>();
			int pageNumStr = 1;
			if (pageNum != null && !"".equals(pageNum)) {
				pageNumStr = Integer.parseInt(pageNum);
			}
			
		 HashMap<String,Object> map = new HashMap<String,Object>();
		 map.put("pName", cxpName);
		 map.put("ptId", 0);
		 productList = productService.cxlist(map);
		 Page page = new Page(productList.size(),pageNumStr, 4);
		 map.put("rowStart", page.getRowStart());
		 map.put("pageSize", page.getPageSize());
		 products = productService.listPage(map);
		 
		 for(int i=0;i<products.size();i++){
			
					General general = new General();
					general.setProduct(productList.get(i));
					psList = productSpecsService.getByProductId(productList.get(i).getpId());
					general.setProductSpecs(psList.get(0));
					
					List<Images> imgList = new ArrayList<Images>();
					imgList =  imagesService.getByPId(productList.get(i).getpId());
					general.setImages(imgList.get(0));
					generalList.add(general);
			 }
				    modelMap.put("generalList", generalList);
				    modelMap.put("page", page);
				    modelMap.put("Search", cxpName);
				    return "/product/products2";
	}
	
	
	
		@RequestMapping("typeSelect")
		public String typeSelect(ModelMap modelMap,
				@RequestParam(value="Search",required=false) String cxpName,
				@RequestParam(value="pageNum",required=false) String pageNum,
				HttpServletRequest request,HttpServletResponse response) throws IOException{	
			 	//List<Product> productList = productService.list();
			 	//List<Product> products = productService.list();
				List<ProductSpecs> psList = new ArrayList<ProductSpecs>();
				List<General> generalList = new ArrayList<General>();
				int pageNumStr = 1;
				if (pageNum != null && !"".equals(pageNum)) {
					pageNumStr = Integer.parseInt(pageNum);
				}
		
			 String id = request.getParameter("id");
			 modelMap.put("id", Integer.parseInt(id));
			
			 ProductType pt = new ProductType();
			 pt.setPtId(Integer.parseInt(id));
			 List<Product> products2 = search(pt);
			 Page page = new Page(products2.size(),pageNumStr, 4);
			 modelMap.put("begin", page.getRowStart());
			 if(pageNumStr == page.getPageCount()){
					modelMap.put("end", products2.size()-1);
					
				}else{
					modelMap.put("end", page.getRowStart()+3);
					
				}
			
			 for(int i=0;i<products2.size();i++){
				
						General general = new General();
						general.setProduct(products2.get(i));
						psList = productSpecsService.getByProductId(products2.get(i).getpId());
						general.setProductSpecs(psList.get(0));
						
						List<Images> imgList = new ArrayList<Images>();
						imgList =  imagesService.getByPId(products2.get(i).getpId());
						general.setImages(imgList.get(0));
						generalList.add(general);
				 }
					    modelMap.put("generalList", generalList);
					    modelMap.put("page", page);
					    modelMap.put("Search", cxpName);
					    return "/product/products3";
		}
	}

