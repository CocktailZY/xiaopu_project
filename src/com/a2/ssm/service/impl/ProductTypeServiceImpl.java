package com.a2.ssm.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.ProductTypeMapper;
import com.a2.ssm.model.ProductType;
import com.a2.ssm.service.ProductTypeService;

/**
 * <p>类名：ProductTypeServiceImpl</p>
 * <p>类功能描述：商品类型 Service层实现类</p>
 * @类作者：zy
 * @创建时间：2018-9-7 下午2:06:17
 * @小组：A2小组
 */
@Service
@Transactional
public class ProductTypeServiceImpl implements ProductTypeService {

	@Resource
	private ProductTypeMapper productTypeMapper;
	
	/**
	 * <p>方法功能描述：查询所有类型</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-7 下午2:06:47
	 * @参数：@return      
	 * @throws
	 */
	public List<ProductType> list(ProductType pt) {
		List<ProductType> list = productTypeMapper.list(pt);
		return list;
	}

	/**
	 * <p>方法功能描述：根据父类型id得到其子类型对象list</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-7 下午2:08:43
	 * @参数：@param dto 类型对象
	 * @参数：@return    
	 * @返回类型：List<ProductType>   
	 * @throws
	 */
	public List<ProductType> listChildType(ProductType dto){
		List<ProductType> list = productTypeMapper.listChildType(dto);
		return list;
	}
	
	/**
	 * <p>方法功能描述：根据类型id获取类型对象</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-7 下午2:11:09
	 * @参数：@param id 类型id
	 * @参数：@return      
	 * @throws
	 */
	public ProductType getById(int id) {

		ProductType proType = productTypeMapper.getById(id);
		return proType;

	}

	/**
	 * <p>方法功能描述：根据类型对象id更新类型信息</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-7 下午2:11:33
	 * @参数：@param dto 类型对象     
	 * @throws
	 */
	public void update(ProductType dto) {
		productTypeMapper.update(dto);
	}

	/**
	 * <p>方法功能描述：删除类型</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-7 下午2:12:03
	 * @参数：@param id 类型id     
	 * @throws
	 */
	public void delete(int id) {
		productTypeMapper.delete(id);
	}

	/**
	 * <p>方法功能描述：新增一个商品类型</p>
	 * @方法作者：zy
	 * @创建时间：2018-9-7 下午2:13:20
	 * @参数：@param dto  商品对象    
	 * @throws
	 */
	public void save(ProductType dto) {
		productTypeMapper.save(dto);
	}

	public List<ProductType> listByPid(int pid) {
		List<ProductType> list = productTypeMapper.listByPid(pid);
		return list;
	}

	public List<ProductType> listBottomType() {
		List<ProductType> list = productTypeMapper.listBottomType();
		return list;
	}

	
	/**
	 * <p>方法功能描述：</p>
	 * @方法作者：lds
	 * @创建时间：2018-9-7 下午2:08:43
	 * @参数：@param dto 类型对象
	 * @参数：@return    
	 * @返回类型：List<ProductType>   
	 * @throws
	 */
	public List<ProductType> listParentType() {
		List<ProductType> list = productTypeMapper.listParentType();
		return list;
	}

	
}
