package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.ProductSpecs;


/**
 * <p>类名：ProductSpecsService</p>
 * <p>类功能描述：商品规格关系Service层接口</p>：
 * @类作者：zy
 * @创建时间：2016-9-12 上午10:48:12
 * @小组：A2小组
 */
public interface ProductSpecsService {

	/**
	 * <p>方法功能描述：查询全部ProductSpecs</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-12 上午10:48:10
	 * @参数：@return    
	 * @返回类型：List<ProductSpecs>   
	 * @throws
	 */
	public List<ProductSpecs> list();
	/**
	 * <p>方法功能描述：根据id查询ProductSpecs</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-12 上午10:48:55
	 * @参数：@param id 关系id
	 * @参数：@return    
	 * @返回类型：ProductSpecs   
	 * @throws
	 */
	public ProductSpecs getById(int id);
	public List<ProductSpecs> getByProductId(int id);
	/**
	 * <p>方法功能描述：更新ProductSpecs信息</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-12 上午10:50:12
	 * @参数：@param dto    
	 * @返回类型：void   
	 * @throws
	 */
	public void update(ProductSpecs dto);
	/**
	 * <p>方法功能描述：删除ProductSpecs信息</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-12 上午10:50:23
	 * @参数：@param id  关系id  
	 * @返回类型：void   
	 * @throws
	 */
	public void delete(int id);
	/**
	 * <p>方法功能描述：新增ProductSpecs</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-12 上午10:50:42
	 * @参数：@param dto  关系对象  
	 * @返回类型：void   
	 * @throws
	 */
	public void save(ProductSpecs dto);
	/**
	 * <p>方法功能描述：根据商品id查询关系信息</p>
	 * @方法作者：zy
	 * @创建时间：2016-9-12 上午10:50:55
	 * @参数：@param id 关系id
	 * @参数：@return    
	 * @返回类型：List<ProductSpecs>   
	 * @throws
	 */
	public List<ProductSpecs> getByPId(int id);

	
}
