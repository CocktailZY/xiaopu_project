package com.a2.ssm.service;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.a2.ssm.model.Product;
import com.a2.ssm.model.ProductType;


/**
 * @author zy
 * ProductService
 */
public interface ProductService {

	public List<Product> list(@Param("cxpName")String pName, @Param("cxpSpecial") Integer pSpecial,@Param("cxpNew") Integer pNew,@Param("xTime") String xTime,@Param("yTime") String yTime);
	public List<Product> cxlist(HashMap<String,Object> map);
	public List<Product> listPage(HashMap<String,Object> map);
	
	/**
	 * <p>方法功能描述：通过id查询产品的list</p>
	 * @方法作者：sun
	 * @创建时间：2018-9-5 下午2:00:59
	 * @参数：@param id
	 * @参数：@id
	 * @返回类型：List<Product>   
	 * @throws
	 */
	public Product getById(int id);
	public void update(Product dto);
	public void delete(int id);
	public void save(Product dto);
	public List<Product> getAllProductByPage(Integer rowStart,Integer pageSize,String pName);
	public Integer getMaxId();
	public List<Product> getByPid(int id);
	public List <Product> list();
	
	
}
