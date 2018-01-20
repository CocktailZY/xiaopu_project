package com.a2.ssm.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.a2.ssm.mapper.ProductMapper;
import com.a2.ssm.mapper.ProductTypeMapper;
import com.a2.ssm.model.Product;
import com.a2.ssm.model.ProductType;
import com.a2.ssm.service.ProductService;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

	@Resource
	private ProductMapper productMapper;
	@Resource
	private ProductTypeMapper productTypeMapper;
	
	


	public List<Product> getByPid(int id) {
		return productMapper.getByPid(id);
		
	}



	public Product getById(int id) {
		return productMapper.getById(id);
	}

	public void update(Product dto) {
		productMapper.update(dto);

	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

	public void save(Product dto) {
		
		productMapper.save(dto);

	}


	public Integer getMaxId() {
		// TODO Auto-generated method stub
		return productMapper.getMaxId();
	}

	public List<Product> list(@Param("cxpName")String p_Name, @Param("cxpSpecial") Integer pSpecial,
			@Param("cxpNew")Integer pNew,@Param("xTime") String xTime,@Param("yTime") String yTime) {
		// TODO Auto-generated method stub
		return productMapper.list(null, pSpecial, pNew, xTime, yTime);
	}

	public List<Product> listPage(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		return productMapper.listPage(map);
	}

	public List<Product> cxlist(HashMap<String,Object> map) {
		// TODO Auto-generated method stub
		return productMapper.cxlist(map);
	}



	public List<Product> getAllProductByPage(Integer rowStart,
			Integer pageSize, String pName) {
		return productMapper.getAllProductByPage(rowStart, pageSize, pName);
	}



	public List<Product> list() {
		return productMapper.list();
	}
	
	
	
	

}
