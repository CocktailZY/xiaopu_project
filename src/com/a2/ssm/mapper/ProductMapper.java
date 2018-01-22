package com.a2.ssm.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.a2.ssm.model.Product;
import com.a2.ssm.model.ProductType;

public interface ProductMapper {
	public List<Product> list(@Param("cxpName")String pName, @Param("cxpSpecial") Integer pSpecial,@Param("cxpNew") Integer pNew,@Param("xTime") String xTime,@Param("yTime") String yTime);
	public List<Product> cxlist(HashMap<String,Object> map);
	public List<Product> listPage(HashMap<String,Object> map);
	public Product getById(int id);
	public void update(Product dto);
	public void delete(int id);
	public void save(Product dto);
	public List<Product> getAllProductByPage(Integer rowStart,Integer pageSize,String pName);
	public List<Product> getByPid(int id);
	public Integer getMaxId();
	public List<Product> list();
	
	/**
	 * <p>方法功能描述：根据类型id查询该类型下的商品</p>
	 * @方法作者：lds
	 * @创建时间：2018-9-7 下午2:20:04
	 * @参数：@param dto 类型对象
	 * @参数：@return    
	 * @返回类型：List<Product>   
	 * @throws
	 *//*
	public List<Product> listByTypeId(int id);*/
	


}
