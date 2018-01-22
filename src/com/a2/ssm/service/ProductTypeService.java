package com.a2.ssm.service;

import java.util.List;

import com.a2.ssm.model.ProductType;


/**
 * <p>类名：ProductTypeService</p>
 * <p>类功能描述：商品类型Service层接口</p>
 * @类作者：zy
 * @创建时间：2018-9-7 下午2:14:06
 * @小组：A2小组
 */
public interface ProductTypeService {

	/**
	 * <p>方法功能描述：查询所有商品类型</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-7 下午2:19:47
	 * @参数：@return    
	 * @返回类型：List<ProductType>   
	 * @throws
	 */
	public List<ProductType> list(ProductType dto);
	/**
	 * <p>方法功能描述：根据父类型id获取其子类型</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-7 下午2:20:04
	 * @参数：@param dto 类型对象
	 * @参数：@return    
	 * @返回类型：List<ProductType>   
	 * @throws
	 */
	public List<ProductType> listChildType(ProductType dto);
	/**
	 * <p>方法功能描述：取出所有底层类型</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-9 下午6:51:02
	 * @参数：@return    
	 * @返回类型：List<ProductType>   
	 * @throws
	 */
	public List<ProductType> listBottomType();
	/**
	 * <p>方法功能描述：根据类型id查询类型</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-7 下午2:20:34
	 * @参数：@param id 类型id
	 * @参数：@return    
	 * @返回类型：ProductType   
	 * @throws
	 */
	public ProductType getById(int id);
	/**
	 * <p>方法功能描述：更新类型信息</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-7 下午2:21:25
	 * @参数：@param dto 类型对象  
	 * @返回类型：void   
	 * @throws
	 */
	public void update(ProductType dto);
	/**
	 * <p>方法功能描述：删除类型</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-7 下午2:22:56
	 * @参数：@param id 类型id   
	 * @返回类型：void   
	 * @throws
	 */
	public void delete(int id);
	/**
	 * <p>方法功能描述：新增类型</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-7 下午2:23:11
	 * @参数：@param dto 类型对象   
	 * @返回类型：void   
	 * @throws
	 */
	public void save(ProductType dto);
	
	/**
	 * <p>方法功能描述：判断该类型的父类型是否有其他子类型</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-8 下午3:42:04
	 * @参数：@param pid 该类型父id
	 * @参数：@return    
	 * @返回类型：List<ProductType>   
	 * @throws
	 */
	public List<ProductType> listByPid(int pid);
	
	
	/**
	 * <p>方法功能描述：根据父类型id获取父类型</p>
	 * @方法作者：lds
	 * @创建时间：2018-9-7 下午2:20:04
	 * @参数：@param dto 类型对象
	 * @参数：@return    
	 * @返回类型：List<ProductType>   
	 * @throws
	 */
	public List<ProductType> listParentType();
	
	
	
	
}
